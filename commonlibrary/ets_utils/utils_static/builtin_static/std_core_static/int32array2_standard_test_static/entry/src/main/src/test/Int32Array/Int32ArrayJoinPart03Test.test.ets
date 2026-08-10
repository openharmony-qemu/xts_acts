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

export default function int32ArrayJoinPart03Test(): void {
  describe('Int32ArrayJoinPart03Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayJoinPart03TestMindmapTest001
     * @tc.desc Verify join with an explicit comma separator returns 4,5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5);
      expect(arr.join(',')).assertEqual('4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayJoinPart03TestMindmapTest002
     * @tc.desc Verify join() undefined separator [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(arr.join(undefined)).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayJoinPart03TestMindmapTest003
     * @tc.desc Verify join() undefined separator [INT_MAX,INT_MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      expect(arr.join(undefined)).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayJoinPart03TestMindmapTest004
     * @tc.desc Verify join() separator 'null' [1,2] '1null2'( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      expect(arr.join('null')).assertEqual('1null2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayJoinPart03TestMindmapTest005
     * @tc.desc Verify join() separator 'undefined' [3,4] '3undefined4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 4);
      expect(arr.join('undefined')).assertEqual('3undefined4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayJoinPart03TestMindmapTest006
     * @tc.desc Verify join() separator 'Number.NaN' [5,6] '5Number.NaN6'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6);
      expect(arr.join('Number.NaN')).assertEqual('5Number.NaN6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayJoinPart03TestMindmapTest007
     * @tc.desc Verify join() separator 'true' [0,1] '0true1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      expect(arr.join('true')).assertEqual('0true1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayJoinPart03TestMindmapTest008
     * @tc.desc Verify join() separator 'false' [1,0] '1false0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0);
      expect(arr.join('false')).assertEqual('1false0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayJoinPart03TestMindmapTest009
     * @tc.desc Verify join() separator '0' [0,0,0] returns '00000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      expect(arr.join('0')).assertEqual('00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayJoinPart03TestMindmapTest010
     * @tc.desc Verify join() separator '-1' [1,1] '1-11'( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1);
      expect(arr.join('-1')).assertEqual('1-11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayJoinPart03TestMindmapTest011
     * @tc.desc Verify from Number.NaN number 0 join '0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, Number.NaN];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join(',')).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayJoinPart03TestMindmapTest012
     * @tc.desc Verify from Number.POSITIVE_INFINITY 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.POSITIVE_INFINITY];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayJoinPart03TestMindmapTest013
     * @tc.desc Verify from -Number.POSITIVE_INFINITY 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-Number.POSITIVE_INFINITY];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayJoinPart03TestMindmapTest014
     * @tc.desc Verify from 0.9 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [0.9];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayJoinPart03TestMindmapTest015
     * @tc.desc Verify from -0.9 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-0.9];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayJoinPart03TestMindmapTest016
     * @tc.desc Verify from 2147483647.9 2147483647 join '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [2147483647.9];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayJoinPart03TestMindmapTest017
     * @tc.desc Verify from 2147483648(INT_MAX+1) -2147483648 join '-2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [2147483648.0];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayJoinPart03TestMindmapTest018
     * @tc.desc Verify from 4294967296(2^32) 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [4294967296.0];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayJoinPart03TestMindmapTest019
     * @tc.desc Verify from -2147483649(INT_MIN-1) 2147483647 join '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-2147483649.0];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayJoinPart03TestMindmapTest020
     * @tc.desc Verify from [1.5,-2.5,3.1] [1,-2,3] join '1,-2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1.5, -2.5, 3.1];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join(',')).assertEqual('1,-2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayJoinPart03TestMindmapTest021
     * @tc.desc Verify new Int32Array() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      expect(arr.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayJoinPart03TestMindmapTest022
     * @tc.desc Verify new Int32Array(0) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.join('ABC')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayJoinPart03TestMindmapTest023
     * @tc.desc Verify new ArrayBuffer(0) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int32Array = new Int32Array(buf);
      expect(view.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayJoinPart03TestMindmapTest024
     * @tc.desc Verify from int[] join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayJoinPart03TestMindmapTest025
     * @tc.desc Verify subarray(0,0) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = parent.subarray(0, 0);
      expect(sub.join('-')).assertEqual('');
      expect(parent.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayJoinPart03TestMindmapTest026
     * @tc.desc Verify subarray(begin>end) subarray(2,1) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = parent.subarray(2, 1);
      expect(sub.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayJoinPart03TestMindmapTest027
     * @tc.desc Verify join length 0 buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.join(',');
      expect(arr.length).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayJoinPart03TestMindmapTest028
     * @tc.desc Verify of(-0) of(0) join '0'(-0 int32 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      expect(arr.join()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayJoinPart03TestMindmapTest029
     * @tc.desc Verify of(2) join '2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2);
      expect(arr.join(',')).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayJoinPart03TestMindmapTest030
     * @tc.desc Verify new Int32Array(1) join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      expect(arr.join('-')).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayJoinPart03TestMindmapTest031
     * @tc.desc Verify ArrayBuffer -99 join '-99'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, -99);
      expect(view.join()).assertEqual('-99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayJoinPart03TestMindmapTest032
     * @tc.desc Verify ArrayBuffer offset=4 2147483647 join '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 4, 1);
      view.$_set(0, 2147483647);
      expect(view.join()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayJoinPart03TestMindmapTest033
     * @tc.desc Verify fill(7) join '7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.fill(7);
      expect(arr.join('')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayJoinPart03TestMindmapTest034
     * @tc.desc Verify subarray(length-1,length) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = parent.subarray(parent.length - 1, parent.length);
      expect(sub.join()).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayJoinPart03TestMindmapTest035
     * @tc.desc Verify fill(9) join '9,9,9,9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(9);
      expect(arr.join(',')).assertEqual('9,9,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayJoinPart03TestMindmapTest036
     * @tc.desc Verify new Int32Array(5) join '00000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      expect(arr.join('')).assertEqual('00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayJoinPart03TestMindmapTest037
     * @tc.desc Verify of(INT_MAX,INT_MAX,INT_MAX)join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 2147483647, 2147483647);
      expect(arr.join('|')).assertEqual('2147483647|2147483647|2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayJoinPart03TestMindmapTest038
     * @tc.desc Verify of(INT_MIN,INT_MIN)join '--'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, -2147483648);
      expect(arr.join('--')).assertEqual('-2147483648---2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayJoinPart03TestMindmapTest039
     * @tc.desc Verify of(-1,-1,-1,-1,-1) join '+' '-1+-1+-1+-1+-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -1, -1, -1, -1);
      expect(arr.join('+')).assertEqual('-1+-1+-1+-1+-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayJoinPart03TestMindmapTest040
     * @tc.desc Verify [1,10,100,1000,10000]join '110100100010000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 10, 100, 1000, 10000);
      expect(arr.join('')).assertEqual('110100100010000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayJoinPart03TestMindmapTest041
     * @tc.desc Verify [2,4,6,8]join '*' '2*4*6*8'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6, 8);
      expect(arr.join('*')).assertEqual('2*4*6*8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayJoinPart03TestMindmapTest042
     * @tc.desc Verify [1,3,5,7,9]join ' ' '1 3 5 7 9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 3, 5, 7, 9);
      expect(arr.join('、')).assertEqual('1、3、5、7、9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayJoinPart03TestMindmapTest043
     * @tc.desc Verify INT_MIN INT_MAX [INT_MIN,-1,0,INT_MAX]join '->'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, -1, 0, 2147483647);
      expect(arr.join('->')).assertEqual('-2147483648->-1->0->2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayJoinPart03TestMindmapTest044
     * @tc.desc Verify [2147483648 INT_MIN,-2147483649 INT_MAX]join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [2147483648.0, -2147483649.0];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join(',')).assertEqual('-2147483648,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayJoinPart03TestMindmapTest045
     * @tc.desc Verify 2^32+1=4294967297 1 join '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [4294967297.0];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayJoinPart03TestMindmapTest046
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      expect(arr.join('')).assertEqual('4321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayJoinPart03TestMindmapTest047
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-3, 1, -1, 3, 0);
      arr.sort();
      expect(arr.join(',')).assertEqual('-3,-1,0,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayJoinPart03TestMindmapTest048
     * @tc.desc Verify fill join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.fill(0, 1, 4);
      expect(arr.join(',')).assertEqual('1,0,0,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayJoinPart03TestMindmapTest049
     * @tc.desc Verify set offset join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let src: number[] = [77, 88];
      arr.set(src as number[], 2);
      expect(arr.join(',')).assertEqual('0,0,77,88,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayJoinPart03TestMindmapTest050
     * @tc.desc Verify copyWithin join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(3, 0, 2);
      expect(arr.join(',')).assertEqual('1,2,3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayJoinPart03TestMindmapTest051
     * @tc.desc Verify $_set join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(1, 999);
      expect(arr.join('-')).assertEqual('1-999-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayJoinPart03TestMindmapTest052
     * @tc.desc Verify reverse join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let orig: string = arr.join();
      arr.reverse();
      arr.reverse();
      expect(arr.join()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayJoinPart03TestMindmapTest053
     * @tc.desc Verify ArrayBuffer Int32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 111);
      a.$_set(1, 222);
      a.$_set(2, 333);
      expect(b.join(',')).assertEqual('111,222,333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayJoinPart03TestMindmapTest054
     * @tc.desc Verify $_set subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let sub: Int32Array = parent.subarray(1, 3);
      parent.$_set(1, 77);
      parent.$_set(2, 88);
      expect(sub.join('-')).assertEqual('77-88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayJoinPart03TestMindmapTest055
     * @tc.desc Verify subarray $_set join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let sub: Int32Array = parent.subarray(1, 3);
      sub.$_set(0, 99);
      sub.$_set(1, 11);
      expect(parent.join(',')).assertEqual('0,99,11,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayJoinPart03TestMindmapTest056
     * @tc.desc Verify offset join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 11);
      a.$_set(1, 22);
      b.$_set(0, 33);
      b.$_set(1, 44);
      expect(a.join('-')).assertEqual('11-22');
      expect(b.join('-')).assertEqual('33-44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayJoinPart03TestMindmapTest057
     * @tc.desc Verify slice join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      expect(cp.join()).assertEqual(orig.join());
      cp.$_set(0, 999);
      expect(orig.join()).assertEqual('1,2,3');
      expect(cp.join()).assertEqual('999,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayJoinPart03TestMindmapTest058
     * @tc.desc Verify subarray(0,length) join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(11, 22, 33);
      let sub: Int32Array = parent.subarray(0, parent.length);
      expect(sub.join()).assertEqual(parent.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayJoinPart03TestMindmapTest059
     * @tc.desc Verify Uint8Array buffer ( 0x05000000=5) Int32Array join 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let u8: Uint8Array = new Uint8Array(buf);
      u8.$_set(0, 5);
      u8.$_set(1, 0);
      u8.$_set(2, 0);
      u8.$_set(3, 0);
      let view: Int32Array = new Int32Array(buf);
      expect(view.join()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayJoinPart03TestMindmapTest060
     * @tc.desc Verify join without arguments returns the single element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: string = arr.join();
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayJoinPart03TestMindmapTest061
     * @tc.desc Verify join length [12,345] 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(12, 345);
      expect(arr.join('')).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayJoinPart03TestMindmapTest062
     * @tc.desc Verify join length-1=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(',');
      let cnt: number = 0;
      for (let i: int = 0; i < r.length; i++) {
        if (r.charAt(i).toString() === ',') {
          cnt = cnt + 1;
        }
      }
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayJoinPart03TestMindmapTest063
     * @tc.desc Verify join with '|' separator returns '42|56'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42, 56);
      expect(arr.join('|')).assertEqual('42|56');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayJoinPart03TestMindmapTest064
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r1: string = arr.join();
      let r2: string = arr.join();
      let r3: string = arr.join();
      expect(r1).assertEqual('1,2,3,4');
      expect(r2).assertEqual('1,2,3,4');
      expect(r3).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayJoinPart03TestMindmapTest065
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8, 9);
      let b: Int32Array = Int32Array.of(7, 8, 9);
      expect(a.join()).assertEqual(b.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayJoinPart03TestMindmapTest066
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(1, 3);
      expect(a.join()).not().assertEqual(b.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayJoinPart03TestMindmapTest067
     * @tc.desc Verify join join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.join()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayJoinPart03TestMindmapTest068
     * @tc.desc Verify join() does not mutate the separator variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep: string = '|';
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.join(sep);
      expect(sep).assertEqual('|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayJoinPart03TestMindmapTest069
     * @tc.desc Verify join() separator "\r' '1\r2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      expect(arr.join('\r')).assertEqual('1\r2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayJoinPart03TestMindmapTest070
     * @tc.desc Verify join() separator "\\' [-1,0] '-1\\0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0);
      expect(arr.join('\\')).assertEqual('-1\\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayJoinPart03TestMindmapTest071
     * @tc.desc Verify join() separator '\'\' \'1\'2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      expect(arr.join('\'')).assertEqual('1\'2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayJoinPart03TestMindmapTest072
     * @tc.desc Verify join() with a left brace separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
       expect(arr.join('\u007b')).assertEqual('1\u007b2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayJoinPart03TestMindmapTest073
     * @tc.desc Verify join() separator '~'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      expect(arr.join('~')).assertEqual('2147483647~-2147483648');
    });


  });
}
