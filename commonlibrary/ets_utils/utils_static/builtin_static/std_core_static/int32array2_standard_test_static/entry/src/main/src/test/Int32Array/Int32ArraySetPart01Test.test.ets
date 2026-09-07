'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySetPart01Test(): void {
  describe('Int32ArraySetPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArraySetPart01TestMindmapTest001
     * @tc.desc Verify set with two args set(0, 10) writes 10 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(0, 10);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArraySetPart01TestMindmapTest002
     * @tc.desc Verify set with two args set(length-1, val) writes at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(3, 77);
      expect(a.$_get(3)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArraySetPart01TestMindmapTest003
     * @tc.desc Verify set returns undefined after writing the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let r: void = a.set(0, 7);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArraySetPart01TestMindmapTest004
     * @tc.desc Verify consecutive set at same position keeps the last written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 11);
      a.set(0, 22);
      expect(a.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArraySetPart01TestMindmapTest005
     * @tc.desc Verify set at different indices does not interfere with each other (4 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(0, 10);
      a.set(1, 20);
      a.set(2, 30);
      a.set(3, 40);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
      expect(a.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArraySetPart01TestMindmapTest006
     * @tc.desc Verify insertPos=0 writes first element and other positions keep original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.set(0, 99);
      expect(a.$_get(0)).assertEqual(99);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArraySetPart01TestMindmapTest007
     * @tc.desc Verify insertPos=length-1 writes last element without affecting other positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.set(3, 88);
      expect(a.$_get(3)).assertEqual(88);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArraySetPart01TestMindmapTest008
     * @tc.desc Verify insertPos=1 writes at middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      a.set(1, 55);
      expect(a.$_get(1)).assertEqual(55);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArraySetPart01TestMindmapTest009
     * @tc.desc Verify Double.toInt(insertPos) variable writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let i: int = 2;
      a.set(i, 66);
      expect(a.$_get(2)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArraySetPart01TestMindmapTest010
     * @tc.desc Verify set at insertPos=-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArraySetPart01TestMindmapTest011
     * @tc.desc Verify set at insertPos=length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArraySetPart01TestMindmapTest012
     * @tc.desc Verify set at INT_MAX insertPos throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      try {
        a.set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArraySetPart01TestMindmapTest013
     * @tc.desc Verify single-element set with a negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3]);
      let a2: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a1.set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        a2.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArraySetPart01TestMindmapTest014
     * @tc.desc Verify set at index 0 on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      try {
        a.set(0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArraySetPart01TestMindmapTest015
     * @tc.desc Verify val=0 writes 0 and reads back 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArraySetPart01TestMindmapTest016
     * @tc.desc Verify val=INT_MAX (2147483647) writes and reads back the maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 2147483647);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArraySetPart01TestMindmapTest017
     * @tc.desc Verify val=INT_MIN (-2147483648) writes and reads back the minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, -2147483648);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArraySetPart01TestMindmapTest018
     * @tc.desc Verify val as a normal positive int variable writes consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: int = 42;
      a.set(0, v);
      expect(a.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArraySetPart01TestMindmapTest019
     * @tc.desc Verify val as a normal negative int variable writes consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: int = -99;
      a.set(0, v);
      expect(a.$_get(0)).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArraySetPart01TestMindmapTest020
     * @tc.desc Verify val=0 and val=-0 are equivalent (both write value 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.set(0, 0);
      a.set(1, -0);
      expect(a.$_get(0)).assertEqual(a.$_get(1));
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArraySetPart01TestMindmapTest021
     * @tc.desc Verify number overload with integer float 5.0 reads back as 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 5.0;
      a.set(0, v);
      expect(a.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArraySetPart01TestMindmapTest022
     * @tc.desc Verify Number.NaN via ToInt32 converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArraySetPart01TestMindmapTest023
     * @tc.desc Verify positive decimal 0.5 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 0.5);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArraySetPart01TestMindmapTest024
     * @tc.desc Verify negative decimal -0.9 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, -0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArraySetPart01TestMindmapTest025
     * @tc.desc Verify 3.7 truncates toward zero to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 3.7);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArraySetPart01TestMindmapTest026
     * @tc.desc Verify -3.7 truncates toward zero to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, -3.7);
      expect(a.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArraySetPart01TestMindmapTest027
     * @tc.desc Verify 2147483647.9 truncates toward zero to INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 2147483647.9);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArraySetPart01TestMindmapTest028
     * @tc.desc Verify 4294967296.0 (2^32) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 4294967296.0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArraySetPart01TestMindmapTest029
     * @tc.desc Verify 4294967297.0 (2^32+1) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 4294967297.0);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArraySetPart01TestMindmapTest030
     * @tc.desc Verify number overload with float variable passes through ToInt32 consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 3.7;
      a.set(0, v);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArraySetPart01TestMindmapTest031
     * @tc.desc Verify single-element set(insertPos, number) produces same result as $_set(index, number) for the same float input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(1);
      let a2: Int32Array = new Int32Array(1);
      let v: number = 2147483648.0;
      a1.set(0, v);
      a2.$_set(0, v);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArraySetPart01TestMindmapTest032
     * @tc.desc Verify single-element set and $_set handle Number.NaN input identically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(1);
      let a2: Int32Array = new Int32Array(1);
      a1.set(0, Number.NaN);
      a2.$_set(0, Number.NaN);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArraySetPart01TestMindmapTest033
     * @tc.desc Verify set does not change the length of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.set(2, 7);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArraySetPart01TestMindmapTest034
     * @tc.desc Verify set does not change byteLength of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let before: number = a.byteLength;
      a.set(1, 9);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArraySetPart01TestMindmapTest035
     * @tc.desc Verify new array initialized with all zeros, set only modifies the target position leaving others as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(2, 77);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(77);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArraySetPart01TestMindmapTest036
     * @tc.desc Verify after set, join reflects the written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.set(1, 7);
      expect(a.join(',')).assertEqual('0,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArraySetPart01TestMindmapTest037
     * @tc.desc Verify single-arg set(array) defaults offset=0 and writes all source elements from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(10, 20);
      a.set(src);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArraySetPart01TestMindmapTest038
     * @tc.desc Verify two-arg set(array, offset) writes source elements starting from the specified offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(1, 2);
      a.set(src, 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(2);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArraySetPart01TestMindmapTest039
     * @tc.desc Verify two-arg set with explicit offset=0 is equivalent to the single-arg version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(3);
      let a2: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(5, 6);
      a1.set(src);
      a2.set(src, 0);
      expect(a1.$_get(0)).assertEqual(5);
      expect(a1.$_get(1)).assertEqual(6);
      expect(a1.$_get(2)).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(5);
      expect(a2.$_get(1)).assertEqual(6);
      expect(a2.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArraySetPart01TestMindmapTest040
     * @tc.desc Verify set returns undefined after writing the source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let src: Int32Array = Int32Array.of(1, 2);
      let r: void = a.set(src);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArraySetPart01TestMindmapTest041
     * @tc.desc Verify source as single-element Int32Array writes only one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(42);
      a.set(src, 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(42);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArraySetPart01TestMindmapTest042
     * @tc.desc Verify source as multi-element Int32Array batch-writes elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(11, 22, 33);
      a.set(src);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(22);
      expect(a.$_get(2)).assertEqual(33);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArraySetPart01TestMindmapTest043
     * @tc.desc Verify source as empty Int32Array does not write, does not throw, target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let src: Int32Array = new Int32Array(0);
      a.set(src);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArraySetPart01TestMindmapTest044
     * @tc.desc Verify source as empty Int32Array even with nonzero offset does not throw and does not modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let src: Int32Array = new Int32Array(0);
      a.set(src, 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArraySetPart01TestMindmapTest045
     * @tc.desc Verify source Int32Array with boundary values INT_MAX, INT_MIN, -1, 0 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(2147483647, -2147483648, -1, 0);
      a.set(src);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(-2147483648);
      expect(a.$_get(2)).assertEqual(-1);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArraySetPart01TestMindmapTest046
     * @tc.desc Verify source Int32Array constructed via from with normal positive values writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.from([7, 8, 9]);
      a.set(src);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArraySetPart01TestMindmapTest047
     * @tc.desc Verify after batch set the source array is not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(1, 2);
      a.set(src, 1);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArraySetPart01TestMindmapTest048
     * @tc.desc Verify source Int32Array of the same length as target with offset=0 fully overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9]);
      let src: Int32Array = Int32Array.of(1, 2, 3);
      a.set(src);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArraySetPart01TestMindmapTest049
     * @tc.desc Verify offset=1 starts writing from the second position, first position keeps original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9, 9]);
      let src: Int32Array = Int32Array.of(1, 2);
      a.set(src, 1);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(2);
      expect(a.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArraySetPart01TestMindmapTest050
     * @tc.desc Verify offset = length - source.length writes exactly to the last positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(7, 8);
      a.set(src, 2);
      expect(a.$_get(2)).assertEqual(7);
      expect(a.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArraySetPart01TestMindmapTest051
     * @tc.desc Verify offset=0 overwrites from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9]);
      let src: Int32Array = Int32Array.of(1, 2);
      a.set(src, 0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArraySetPart01TestMindmapTest052
     * @tc.desc Verify Double.toInt(offset) variable produces correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(3, 4);
      let off: int = 2;
      a.set(src, off);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArraySetPart01TestMindmapTest053
     * @tc.desc Verify offset as negative value throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(1, 2);
      try {
        a.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArraySetPart01TestMindmapTest054
     * @tc.desc Verify source.length + offset > this.length throws RangeError (offset exceeds remaining space by 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(1, 2);
      try {
        a.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArraySetPart01TestMindmapTest055
     * @tc.desc Verify large positive offset out-of-bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(1);
      try {
        a.set(src, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArraySetPart01TestMindmapTest056
     * @tc.desc Verify deep negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(1, 2);
      try {
        a.set(src, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArraySetPart01TestMindmapTest057
     * @tc.desc Verify offset == length with non-empty source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(1);
      try {
        a.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArraySetPart01TestMindmapTest058
     * @tc.desc Verify after out-of-bounds error the target array is not partially written (assert original value at boundary position)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9]);
      let src: Int32Array = Int32Array.of(1, 2);
      try {
        a.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArraySetPart01TestMindmapTest059
     * @tc.desc Verify set(this) self-copy keeps original values unchanged (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.set(a);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArraySetPart01TestMindmapTest060
     * @tc.desc Verify set(this, offset) throws RangeError when source does not fit at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let a: Int32Array = Int32Array.of(1, 2, 3, 0, 0);
        a.set(a, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArraySetPart01TestMindmapTest061
     * @tc.desc Verify set with subarray(1) as shared buffer overlapping source produces correct data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = a.subarray(1);
      let b: Int32Array = new Int32Array(4);
      b.set(sub);
      expect(b.$_get(0)).assertEqual(20);
      expect(b.$_get(1)).assertEqual(30);
      expect(b.$_get(2)).assertEqual(40);
      expect(b.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArraySetPart01TestMindmapTest062
     * @tc.desc Verify two views over the same ArrayBuffer, set on one view makes writes visible to the other view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      let src: Int32Array = Int32Array.of(11, 22, 33, 44);
      a.set(src);
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(1)).assertEqual(22);
      expect(b.$_get(2)).assertEqual(33);
      expect(b.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArraySetPart01TestMindmapTest063
     * @tc.desc Verify set on a view with byteOffset makes the underlying buffer visible at the correct offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      view.set(src);
      let full: Int32Array = new Int32Array(buf);
      expect(full.$_get(0)).assertEqual(0);
      expect(full.$_get(1)).assertEqual(0);
      expect(full.$_get(2)).assertEqual(1);
      expect(full.$_get(3)).assertEqual(2);
      expect(full.$_get(4)).assertEqual(3);
      expect(full.$_get(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArraySetPart01TestMindmapTest064
     * @tc.desc Verify source from a different buffer, after batch set the source buffer is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf1: ArrayBuffer = new ArrayBuffer(8);
      let buf2: ArrayBuffer = new ArrayBuffer(8);
      let dst: Int32Array = new Int32Array(buf1);
      let src: Int32Array = new Int32Array(buf2);
      src.$_set(0, 7);
      src.$_set(1, 8);
      dst.set(src);
      expect(src.$_get(0)).assertEqual(7);
      expect(src.$_get(1)).assertEqual(8);
      expect(dst.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArraySetPart01TestMindmapTest065
     * @tc.desc Verify source Int32Array values are already int32 representation and batch set does not perform secondary conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array(2);
      src.$_set(0, -2147483648);
      src.$_set(1, 2147483647);
      a.set(src);
      expect(a.$_get(0)).assertEqual(-2147483648);
      expect(a.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArraySetPart01TestMindmapTest066
     * @tc.desc Verify batch set does not change the target byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let before: number = a.byteLength;
      let src: Int32Array = Int32Array.of(1, 2);
      a.set(src, 1);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArraySetPart01TestMindmapTest067
     * @tc.desc Verify after batch set, join output reflects the newly written content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(5, 6);
      a.set(src, 1);
      expect(a.join(',')).assertEqual('0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArraySetPart01TestMindmapTest068
     * @tc.desc Verify after batch set, for-of iteration order reflects new writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(7, 8);
      a.set(src);
      let out: number[] = [];
      for (let i = 0; i < a.length; i++) {
        let x = a.$_get(i);
        out.push(x);
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(7);
      expect(out[1]).assertEqual(8);
      expect(out[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArraySetPart01TestMindmapTest069
     * @tc.desc Verify batch set with offset=length-1 placing a single source element at the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(55);
      a.set(src, 3);
      expect(a.$_get(3)).assertEqual(55);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });


  });
}
