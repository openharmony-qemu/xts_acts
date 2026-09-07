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

export default function int32ArrayJoinPart02Test(): void {
  describe('Int32ArrayJoinPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayJoinPart02TestMindmapTest001
     * @tc.desc Verify join returns the expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int32Array = new Int32Array(0);
      let r: string = empty.join();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayJoinPart02TestMindmapTest002
     * @tc.desc Verify join returns the expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let one: Int32Array = new Int32Array([7]);
      let r: string = one.join(',');
      expect(r).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayJoinPart02TestMindmapTest003
     * @tc.desc Verify join returns the expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.join('');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayJoinPart02TestMindmapTest004
     * @tc.desc Verify join returns the default comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let r: string = arr.join();
      expect(r).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayJoinPart02TestMindmapTest005
     * @tc.desc Verify join returns the single element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.join('-');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayJoinPart02TestMindmapTest006
     * @tc.desc Verify join returns all elements separated by commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: string = arr.join();
      expect(r).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayJoinPart02TestMindmapTest007
     * @tc.desc Verify join returns negative and zero elements separated by commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0]);
      let r: string = arr.join();
      expect(r).assertEqual('-1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayJoinPart02TestMindmapTest008
     * @tc.desc Verify join() returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Object = arr.join() as Object;
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayJoinPart02TestMindmapTest009
     * @tc.desc Verify join without arguments uses the default comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: string = arr.join();
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayJoinPart02TestMindmapTest010
     * @tc.desc Verify join returns the expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: string = arr.join('→');
      expect(r).assertEqual('1→2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayJoinPart02TestMindmapTest011
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.join('###');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayJoinPart02TestMindmapTest012
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.join('');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayJoinPart02TestMindmapTest013
     * @tc.desc Verify [0]join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayJoinPart02TestMindmapTest014
     * @tc.desc Verify [1]join '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.join('###');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayJoinPart02TestMindmapTest015
     * @tc.desc Verify [-1]join '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let r: string = arr.join('');
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayJoinPart02TestMindmapTest016
     * @tc.desc Verify INT_MAX join '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: string = arr.join();
      expect(r).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayJoinPart02TestMindmapTest017
     * @tc.desc Verify INT_MIN join '-2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: string = arr.join();
      expect(r).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayJoinPart02TestMindmapTest018
     * @tc.desc Verify [0,-1]join '0,-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1]);
      let r: string = arr.join(',');
      expect(r).assertEqual('0,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayJoinPart02TestMindmapTest019
     * @tc.desc Verify join length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: string = arr.join();
      expect(r).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayJoinPart02TestMindmapTest020
     * @tc.desc Verify join '00'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: string = arr.join('');
      expect(r).assertEqual('00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayJoinPart02TestMindmapTest021
     * @tc.desc Verify [INT_MIN,0,INT_MAX]join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let r: string = arr.join('');
      expect(r).assertEqual('-214748364802147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayJoinPart02TestMindmapTest022
     * @tc.desc Verify join [12,34] with comma separator returns '12,34'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([12, 34]);
      expect(arr.join(',')).assertEqual('12,34');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayJoinPart02TestMindmapTest023
     * @tc.desc Verify join(',') returns the comma-separated string for [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayJoinPart02TestMindmapTest024
     * @tc.desc Verify join toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.join()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayJoinPart02TestMindmapTest025
     * @tc.desc Verify join toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      expect(arr.join()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayJoinPart02TestMindmapTest026
     * @tc.desc Verify join toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 300]);
      expect(arr.join()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayJoinPart02TestMindmapTest027
     * @tc.desc Verify join ','
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      expect(arr.join()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayJoinPart02TestMindmapTest028
     * @tc.desc Verify join undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6]);
      expect(arr.join()).assertEqual(arr.join(undefined));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayJoinPart02TestMindmapTest029
     * @tc.desc Verify [-1]join length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      expect(arr.join()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayJoinPart02TestMindmapTest030
     * @tc.desc Verify [1,2,3]join length 5('1,2,3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayJoinPart02TestMindmapTest031
     * @tc.desc Verify [12,345]join length 5(2+3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([12, 345]);
      expect(arr.join('')).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayJoinPart02TestMindmapTest032
     * @tc.desc Verify [1,2]join '--' length 4('1--2')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      expect(arr.join('--')).assertEqual('1--2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayJoinPart02TestMindmapTest033
     * @tc.desc Verify [1,2,3].join('=>') length 7 ('1=>2=>3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.join('=>')).assertEqual('1=>2=>3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayJoinPart02TestMindmapTest034
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      expect(arr.join('----')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayJoinPart02TestMindmapTest035
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let before: number = arr.length;
      arr.join(',');
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayJoinPart02TestMindmapTest036
     * @tc.desc Verify join length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.join('-');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayJoinPart02TestMindmapTest037
     * @tc.desc Verify join byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: number = arr.byteLength;
      arr.join();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayJoinPart02TestMindmapTest038
     * @tc.desc Verify join offset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let before: number = arr.byteOffset;
      arr.join(',');
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayJoinPart02TestMindmapTest039
     * @tc.desc Verify join BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.join();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      {
        let arr: Int32Array = new Int32Array([1, 2]);
        let bufBefore: ArrayBuffer = arr.buffer;
        arr.join();
        expect(arr.buffer).assertEqual(bufBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayJoinPart02TestMindmapTest040
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647, -1]);
      arr.join('/');
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayJoinPart02TestMindmapTest041
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      arr.join('');
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayJoinPart02TestMindmapTest042
     * @tc.desc Verify join length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.join('---');
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayJoinPart02TestMindmapTest043
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([999]);
      arr.join();
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayJoinPart02TestMindmapTest044
     * @tc.desc Verify ArrayBuffer Int32Array join buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 11);
      a.$_set(1, 22);
      let b: Int32Array = new Int32Array(buf);
      a.join(',');
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayJoinPart02TestMindmapTest045
     * @tc.desc Verify offset join buffer offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      a.$_set(0, 100);
      a.$_set(1, 200);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      a.join('-');
      expect(b.$_get(0)).assertEqual(100);
      expect(b.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayJoinPart02TestMindmapTest046
     * @tc.desc Verify subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = parent.subarray(1, 3);
      sub.join('|');
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayJoinPart02TestMindmapTest047
     * @tc.desc Verify join subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = parent.subarray(0, 2);
      parent.join();
      expect(sub.$_get(0)).assertEqual(10);
      expect(sub.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayJoinPart02TestMindmapTest048
     * @tc.desc Verify Int32Array.of join (Uint8Array )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let u8: Uint8Array = new Uint8Array(arr.buffer);
      let before0: number = u8.$_get(0);
      arr.join();
      expect(u8.$_get(0)).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayJoinPart02TestMindmapTest049
     * @tc.desc Verify subarray (0,length)join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let sub: Int32Array = arr.subarray(0, arr.length);
      expect(sub.join()).assertEqual(arr.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayJoinPart02TestMindmapTest050
     * @tc.desc Verify subarray (1,3)join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(sub.join(',')).assertEqual('22,33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayJoinPart02TestMindmapTest051
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: string = arr.join();
      let r2: string = arr.join();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayJoinPart02TestMindmapTest052
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let r1: string = arr.join('::');
      let r2: string = arr.join('::');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayJoinPart02TestMindmapTest053
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200]);
      let r1: string = arr.join('');
      let r2: string = arr.join('');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayJoinPart02TestMindmapTest054
     * @tc.desc Verify Int32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 8, 9]);
      let b: Int32Array = new Int32Array([7, 8, 9]);
      expect(a.join()).assertEqual(b.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayJoinPart02TestMindmapTest055
     * @tc.desc Verify Int32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let b: Int32Array = new Int32Array([1, 3]);
      expect(a.join()).not().assertEqual(b.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayJoinPart02TestMindmapTest056
     * @tc.desc Verify ArrayBuffer join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      expect(view.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayJoinPart02TestMindmapTest057
     * @tc.desc Verify ArrayBuffer+offset+length join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      view.$_set(0, 10);
      view.$_set(1, 20);
      expect(view.join('-')).assertEqual('10-20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayJoinPart02TestMindmapTest058
     * @tc.desc Verify Int32Array.of join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, 0, 5);
      expect(arr.join()).assertEqual('-5,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayJoinPart02TestMindmapTest059
     * @tc.desc Verify Int32Array.from join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [100, -200];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.join('/')).assertEqual('100/-200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayJoinPart02TestMindmapTest060
     * @tc.desc Verify Int32Array.from Int32Array join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.join()).assertEqual(src.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayJoinPart02TestMindmapTest061
     * @tc.desc Verify join with tab and newline separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      expect(arr.join('\t')).assertEqual('1\t2');
      expect(arr.join('\n')).assertEqual('1\n2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayJoinPart02TestMindmapTest062
     * @tc.desc Verify separator \\ join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: string = arr.join('\\');
      expect(r).assertEqual('1\\2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayJoinPart02TestMindmapTest063
     * @tc.desc Verify separator ' ' join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.join('和');
      expect(r).assertEqual('1和2和3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayJoinPart02TestMindmapTest064
     * @tc.desc Verify separator '<>' join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: string = arr.join('<>');
      expect(r).assertEqual('1<>2<>3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayJoinPart02TestMindmapTest065
     * @tc.desc Verify separator join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: string = arr.join('\'');
      expect(r).assertEqual('1\'2');
    });

  });
}
