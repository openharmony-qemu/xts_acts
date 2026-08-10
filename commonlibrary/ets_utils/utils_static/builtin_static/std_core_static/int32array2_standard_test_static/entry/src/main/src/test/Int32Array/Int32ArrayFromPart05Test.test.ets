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

export default function int32ArrayFromPart05Test(): void {
  describe('Int32ArrayFromPart05Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart05TestMindmapTest001
     * @tc.desc Verify from 1 ArrayLike<number> arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10.0, 20.0, 30.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart05TestMindmapTest002
     * @tc.desc Verify from() empty Array<number> creates Int32Array with length=0 and byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      {
        const src: Array<number> = [];
        const r = Int32Array.from(src as ArrayLike<number>);
        expect(r.join(',')).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart05TestMindmapTest003
     * @tc.desc Verify from() 1 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [42.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
      {
        const src: Array<number> = [42.0];
        const r = Int32Array.from(src as ArrayLike<number>);
        expect(r.toString()).assertEqual('42');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart05TestMindmapTest004
     * @tc.desc Verify from() 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart05TestMindmapTest005
     * @tc.desc Verify from() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [7.0, 9.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart05TestMindmapTest006
     * @tc.desc Verify from() 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(8);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
      expect(r.$_get(7)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart05TestMindmapTest007
     * @tc.desc Verify from() 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [
      1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0,
      9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0
      ];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(16);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(15)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart05TestMindmapTest008
     * @tc.desc Verify from() 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart05TestMindmapTest009
     * @tc.desc Verify from() -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart05TestMindmapTest010
     * @tc.desc Verify from() with ArrayLike<number> coerces each element to int32 and preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-3.0, 0.0, 7.0, -11.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(-11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart05TestMindmapTest011
     * @tc.desc Verify from() 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0, 0.0, 0.0, 0.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart05TestMindmapTest012
     * @tc.desc Verify from() 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5.0, 5.0, 5.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart05TestMindmapTest013
     * @tc.desc Verify from() -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-7.0, -7.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-7);
      expect(r.$_get(1)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart05TestMindmapTest014
     * @tc.desc Verify from() -0.0 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-0.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart05TestMindmapTest015
     * @tc.desc Verify from() 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.5];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart05TestMindmapTest016
     * @tc.desc Verify from() -0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-0.9];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart05TestMindmapTest017
     * @tc.desc Verify from() 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.9];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart05TestMindmapTest018
     * @tc.desc Verify from() -1.1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1.1];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart05TestMindmapTest019
     * @tc.desc Verify from() 2147483647.9 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483647.9];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart05TestMindmapTest020
     * @tc.desc Verify from() -100.999 -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-100.999];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart05TestMindmapTest021
     * @tc.desc Verify from() Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart05TestMindmapTest022
     * @tc.desc Verify from() +Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.POSITIVE_INFINITY];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart05TestMindmapTest023
     * @tc.desc Verify from() -Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-Number.POSITIVE_INFINITY];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart05TestMindmapTest024
     * @tc.desc Verify from() Number.NaN Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, 3.0, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -2.5];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart05TestMindmapTest025
     * @tc.desc Verify from() Number.MAX_VALUE double ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.MAX_VALUE];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart05TestMindmapTest026
     * @tc.desc Verify from() INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483647.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart05TestMindmapTest027
     * @tc.desc Verify from() INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-2147483648.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart05TestMindmapTest028
     * @tc.desc Verify from() 2147483648 MAX+1 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483648.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart05TestMindmapTest029
     * @tc.desc Verify from() 2147483649 MAX+2 INT_MIN+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483649.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart05TestMindmapTest030
     * @tc.desc Verify from() -2147483649 MIN-1 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-2147483649.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart05TestMindmapTest031
     * @tc.desc Verify from() 4294967296 2^32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967296.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart05TestMindmapTest032
     * @tc.desc Verify from() 4294967297 2^32+1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967297.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart05TestMindmapTest033
     * @tc.desc Verify from() 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFF];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart05TestMindmapTest034
     * @tc.desc Verify from() -1000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1000000000.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart05TestMindmapTest035
     * @tc.desc Verify from() -1e3 -1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1e3];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart05TestMindmapTest036
     * @tc.desc Verify from converts Number.NaN to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const manual: Array<number> = [11.0, Number.NaN, 33.0];
      const r = Int32Array.from(manual as ArrayLike<number>);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart05TestMindmapTest037
     * @tc.desc Verify from() [Number.NaN, Number.NaN, Number.NaN] Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, Number.NaN, Number.NaN];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart05TestMindmapTest038
     * @tc.desc Verify from() Number.NaN/ 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, 5.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart05TestMindmapTest039
     * @tc.desc Verify from() Number.NaN/ 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, Number.NaN];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart05TestMindmapTest040
     * @tc.desc Verify from() arguments length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Int32Array.from([100.0, 200.0, 300.0] as number[]);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(200);
      expect(r.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart05TestMindmapTest041
     * @tc.desc Verify from() arguments length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Int32Array.from([1.0, 2.0] as number[]);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart05TestMindmapTest042
     * @tc.desc Verify from() arguments length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Int32Array.from([77.0] as number[]);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart05TestMindmapTest043
     * @tc.desc Verify from() Int32Array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const r: Int32Array = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart05TestMindmapTest044
     * @tc.desc Verify from() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart05TestMindmapTest045
     * @tc.desc Verify from() byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart05TestMindmapTest046
     * @tc.desc Verify from() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart05TestMindmapTest047
     * @tc.desc Verify two from() calls on the same ArrayLike source return distinct Int32Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const a = Int32Array.from(src as ArrayLike<number>);
      const b = Int32Array.from(src as ArrayLike<number>);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart05TestMindmapTest048
     * @tc.desc Verify mutation on one from() result does not affect another from() result on the same source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9.0, 8.0];
      const a = Int32Array.from(src as ArrayLike<number>);
      const b = Int32Array.from(src as ArrayLike<number>);
      a.$_set(0, 100);
      expect(b.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart05TestMindmapTest049
     * @tc.desc Verify from() does not mutate the source Array elements or values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      Int32Array.from(src as ArrayLike<number>);
      expect(src[0]).assertEqual(1.0);
      expect(src[1]).assertEqual(2.0);
      expect(src[2]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart05TestMindmapTest050
     * @tc.desc Verify mutating the from() result via $_set does not affect the source ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      r.$_set(0, 999);
      expect(src[0]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart05TestMindmapTest051
     * @tc.desc Verify from() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5.0, 6.0, 7.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      let sum = 0;
      let count = 0;
      for (const v of r) {
        sum += v;
        count++;
      }
      expect(count).assertEqual(3);
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart05TestMindmapTest052
     * @tc.desc Verify from join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart05TestMindmapTest053
     * @tc.desc Verify from() arrayLike null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(null as ArrayLike<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart05TestMindmapTest054
     * @tc.desc Verify from() arrayLike undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(undefined as ArrayLike<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart05TestMindmapTest055
     * @tc.desc Verify Array<number> from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      try {
        Int32Array.from(src as ArrayLike<number>, (v: number, k: number): number => {
          throw new Error('accessor_err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart05TestMindmapTest056
     * @tc.desc Verify from() 0xFFFFFFFF 1 ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFFFFFFFF];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart05TestMindmapTest057
     * @tc.desc Verify from() Number.EPSILON 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.EPSILON];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5800
     * @tc.name int32ArrayFromPart05TestMindmapTest058
     * @tc.desc Verify from() Number.MIN_VALUE 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.MIN_VALUE];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_5900
     * @tc.name int32ArrayFromPart05TestMindmapTest059
     * @tc.desc Verify from() 0.0001 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0001];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6000
     * @tc.name int32ArrayFromPart05TestMindmapTest060
     * @tc.desc Verify from() -0.0001 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-0.0001];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6100
     * @tc.name int32ArrayFromPart05TestMindmapTest061
     * @tc.desc Verify from() -Number.MAX_VALUE ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-Number.MAX_VALUE];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6200
     * @tc.name int32ArrayFromPart05TestMindmapTest062
     * @tc.desc Verify from(from(x))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, -2.0, 300.0];
      const first = Int32Array.from(src as ArrayLike<number>);
      const second = Int32Array.from(first as ArrayLike<number>);
      expect(second.length).assertEqual(3);
      expect(second.$_get(0)).assertEqual(1);
      expect(second.$_get(1)).assertEqual(-2);
      expect(second.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6300
     * @tc.name int32ArrayFromPart05TestMindmapTest063
     * @tc.desc Verify from() INT_MAX/INT_MIN/0/-1/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483647.0, -2147483648.0, 0.0, -1.0, 1.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-1);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6400
     * @tc.name int32ArrayFromPart05TestMindmapTest064
     * @tc.desc Verify from() coerces overflow values (2147483648) to int32 via ToInt32 wrapping among valid values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2147483648.0, 2.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6500
     * @tc.name int32ArrayFromPart05TestMindmapTest065
     * @tc.desc Verify from() 0.0 -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0, -0.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6600
     * @tc.name int32ArrayFromPart05TestMindmapTest066
     * @tc.desc Verify from() /Number.NaN/Number.POSITIVE_INFINITY/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [3.7, Number.NaN, Number.POSITIVE_INFINITY, 2147483648.0, -0.9, -2147483649.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.length).assertEqual(6);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-2147483648);
      expect(r.$_get(4)).assertEqual(0);
      expect(r.$_get(5)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6700
     * @tc.name int32ArrayFromPart05TestMindmapTest067
     * @tc.desc Verify from() length=1 buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [7.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.byteLength).assertEqual(4);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6800
     * @tc.name int32ArrayFromPart05TestMindmapTest068
     * @tc.desc Verify from() for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      let acc = 0;
      for (const v of r) {
        acc += v;
        if (v === 2) {
          break;
        }
      }
      expect(acc).assertEqual(3);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_6900
     * @tc.name int32ArrayFromPart05TestMindmapTest069
     * @tc.desc Verify from at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [55.0, 66.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.at(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_7000
     * @tc.name int32ArrayFromPart05TestMindmapTest070
     * @tc.desc Verify from at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [55.0, 66.0];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.at(-1)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART05_TEST_MINDMAP_7100
     * @tc.name int32ArrayFromPart05TestMindmapTest071
     * @tc.desc Verify from at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart05TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const r = Int32Array.from(src as ArrayLike<number>);
      expect(r.at(0)).assertUndefined();
    });


  });
}
