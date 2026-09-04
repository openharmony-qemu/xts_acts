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

export default function int32ArrayJoinPart01Test(): void {
  describe('Int32ArrayJoinPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayJoinPart01TestMindmapTest001
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: string = arr.join();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayJoinPart01TestMindmapTest002
     * @tc.desc Verify 0 join '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayJoinPart01TestMindmapTest003
     * @tc.desc Verify 1 join '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: string = arr.join();
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayJoinPart01TestMindmapTest004
     * @tc.desc Verify -1 join '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r: string = arr.join();
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayJoinPart01TestMindmapTest005
     * @tc.desc Verify INT_MAX (2147483647) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r: string = arr.join();
      expect(r).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayJoinPart01TestMindmapTest006
     * @tc.desc Verify INT_MIN (-2147483648) join '-2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: string = arr.join();
      expect(r).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayJoinPart01TestMindmapTest007
     * @tc.desc Verify -12345 join '-12345'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-12345);
      let r: string = arr.join();
      expect(r).assertEqual('-12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayJoinPart01TestMindmapTest008
     * @tc.desc Verify [1,2] join '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join();
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayJoinPart01TestMindmapTest009
     * @tc.desc Verify [1,2,3] join '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join();
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayJoinPart01TestMindmapTest010
     * @tc.desc Verify [0,0,0] join '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: string = arr.join();
      expect(r).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayJoinPart01TestMindmapTest011
     * @tc.desc Verify / / [-1,0,1] join '-1,0,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let r: string = arr.join();
      expect(r).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayJoinPart01TestMindmapTest012
     * @tc.desc Verify INT_MAX INT_MIN join '2147483647,-2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      let r: string = arr.join();
      expect(r).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayJoinPart01TestMindmapTest013
     * @tc.desc Verify new Int32Array(2) join '0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let r: string = arr.join();
      expect(r).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayJoinPart01TestMindmapTest014
     * @tc.desc Verify from [10,20,30] join '10,20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [10, 20, 30];
      let arr: Int32Array = Int32Array.from(src);
      let r: string = arr.join();
      expect(r).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayJoinPart01TestMindmapTest015
     * @tc.desc Verify [10,20,30,40] join '10,20,30,40'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: string = arr.join();
      expect(r).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayJoinPart01TestMindmapTest016
     * @tc.desc Verify [1,-2,3,-4] join '1,-2,3,-4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2, 3, -4);
      let r: string = arr.join();
      expect(r).assertEqual('1,-2,3,-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayJoinPart01TestMindmapTest017
     * @tc.desc Verify join() undefined separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(undefined);
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayJoinPart01TestMindmapTest018
     * @tc.desc Verify join uses an explicit comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(',');
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayJoinPart01TestMindmapTest019
     * @tc.desc Verify join() undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: string = arr.join(undefined);
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayJoinPart01TestMindmapTest020
     * @tc.desc Verify join with a comma separator returns the single element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: string = arr.join(',');
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayJoinPart01TestMindmapTest021
     * @tc.desc Verify join() separator [1,2] '12'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('');
      expect(r).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayJoinPart01TestMindmapTest022
     * @tc.desc Verify join() separator [1,2,3] '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayJoinPart01TestMindmapTest023
     * @tc.desc Verify join() separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: string = arr.join('');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayJoinPart01TestMindmapTest024
     * @tc.desc Verify join() separator [5] '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5);
      let r: string = arr.join('');
      expect(r).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayJoinPart01TestMindmapTest025
     * @tc.desc Verify join() separator / / [-1,0,1] '-101'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let r: string = arr.join('');
      expect(r).assertEqual('-101');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayJoinPart01TestMindmapTest026
     * @tc.desc Verify join() separator [INT_MIN, INT_MAX] '-21474836482147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 2147483647);
      let r: string = arr.join('');
      expect(r).assertEqual('-21474836482147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayJoinPart01TestMindmapTest027
     * @tc.desc Verify join() separator [-1,-2,-3] '-1-2-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -3);
      let r: string = arr.join('');
      expect(r).assertEqual('-1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayJoinPart01TestMindmapTest028
     * @tc.desc Verify join() ' ' separator '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(' ');
      expect(r).assertEqual('1 2 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayJoinPart01TestMindmapTest029
     * @tc.desc Verify join() '-' separator '1-2-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('-');
      expect(r).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayJoinPart01TestMindmapTest030
     * @tc.desc Verify join() '|' separator from [-1,0,1] '-1|0|1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [-1, 0, 1];
      let arr: Int32Array = Int32Array.from(src);
      let r: string = arr.join('|');
      expect(r).assertEqual('-1|0|1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayJoinPart01TestMindmapTest031
     * @tc.desc Verify join() '/' separator [10,20,30] '10/20/30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: string = arr.join('/');
      expect(r).assertEqual('10/20/30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayJoinPart01TestMindmapTest032
     * @tc.desc Verify join() ', ' separator '1, 2, 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(', ');
      expect(r).assertEqual('1, 2, 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayJoinPart01TestMindmapTest033
     * @tc.desc Verify join() ' - ' separator '1 - 2 - 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(' - ');
      expect(r).assertEqual('1 - 2 - 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayJoinPart01TestMindmapTest034
     * @tc.desc Verify join() '::' separator '1::2::3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('::');
      expect(r).assertEqual('1::2::3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayJoinPart01TestMindmapTest035
     * @tc.desc Verify join() 'SEP' separator '1SEP2SEP3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('SEP');
      expect(r).assertEqual('1SEP2SEP3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayJoinPart01TestMindmapTest036
     * @tc.desc Verify join() 'LONGSEP' separator '1LONGSEP2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('LONGSEP');
      expect(r).assertEqual('1LONGSEP2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayJoinPart01TestMindmapTest037
     * @tc.desc Verify join() '.' separator [192,168,1,1] '192.168.1.1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(192, 168, 1, 1);
      let r: string = arr.join('.');
      expect(r).assertEqual('192.168.1.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayJoinPart01TestMindmapTest038
     * @tc.desc Verify join() ',x' separator '1,x2,x3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(',x');
      expect(r).assertEqual('1,x2,x3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayJoinPart01TestMindmapTest039
     * @tc.desc Verify join() ' ' separator '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('和');
      expect(r).assertEqual('1和2和3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayJoinPart01TestMindmapTest040
     * @tc.desc Verify join() ' ' separator '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('，');
      expect(r).assertEqual('1，2，3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayJoinPart01TestMindmapTest041
     * @tc.desc Verify join() ' ' separator '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('→');
      expect(r).assertEqual('1→2→3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayJoinPart01TestMindmapTest042
     * @tc.desc Verify join() ' ' separator '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('±');
      expect(r).assertEqual('1±2±3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayJoinPart01TestMindmapTest043
     * @tc.desc Verify join() ' ' separator '1 2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('の');
      expect(r).assertEqual('1の2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayJoinPart01TestMindmapTest044
     * @tc.desc Verify join() ' ' separator [-1,2,-3] '-1 2 -3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 2, -3);
      let r: string = arr.join('·');
      expect(r).assertEqual('-1·2·-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayJoinPart01TestMindmapTest045
     * @tc.desc Verify join() emoji ' ' separator '1 2 3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('🎉');
      expect(r).assertEqual('1🎉2🎉3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayJoinPart01TestMindmapTest046
     * @tc.desc Verify join() emoji ' ' separator [-1,0] '-1 0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0);
      let r: string = arr.join('👍');
      expect(r).assertEqual('-1👍0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayJoinPart01TestMindmapTest047
     * @tc.desc Verify join() emoji ' ' separator [INT_MAX,INT_MIN] '2147483647 -2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      let r: string = arr.join('💥');
      expect(r).assertEqual('2147483647💥-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayJoinPart01TestMindmapTest048
     * @tc.desc Verify join() emoji ' ' separator [-1,0,1] '-1 0 1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let r: string = arr.join('🚀');
      expect(r).assertEqual('-1🚀0🚀1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayJoinPart01TestMindmapTest049
     * @tc.desc Verify join() with newline and carriage-return separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.join('\n')).assertEqual('1\n2\n3');
      expect(arr.join('\r')).assertEqual('1\r2\r3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayJoinPart01TestMindmapTest050
     * @tc.desc Verify join() '\t' separator '1\t2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('\t');
      expect(r).assertEqual('1\t2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayJoinPart01TestMindmapTest051
     * @tc.desc Verify join() '\\' separator '1\\2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('\\');
      expect(r).assertEqual('1\\2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayJoinPart01TestMindmapTest052
     * @tc.desc Verify join() ''\' separator \'1'2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('\'');
      expect(r).assertEqual('1\'2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayJoinPart01TestMindmapTest053
     * @tc.desc Verify join() separator [-1,-2] '-1\\-2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2);
      let r: string = arr.join('\\');
      expect(r).assertEqual('-1\\-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayJoinPart01TestMindmapTest054
     * @tc.desc Verify join() separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: string = arr.join('\n');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayJoinPart01TestMindmapTest055
     * @tc.desc Verify join() '-' separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: string = arr.join('-');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayJoinPart01TestMindmapTest056
     * @tc.desc Verify join() '0' separator [1,2] '102'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('0');
      expect(r).assertEqual('102');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayJoinPart01TestMindmapTest057
     * @tc.desc Verify join() '-0' separator [0,1] '0-01'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let r: string = arr.join('-0');
      expect(r).assertEqual('0-01');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayJoinPart01TestMindmapTest058
     * @tc.desc Verify join() '123' separator [4,5] '41235'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5);
      let r: string = arr.join('123');
      expect(r).assertEqual('41235');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayJoinPart01TestMindmapTest059
     * @tc.desc Verify join() '-' separator [-1,-2] '-1--2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2);
      let r: string = arr.join('-');
      expect(r).assertEqual('-1--2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayJoinPart01TestMindmapTest060
     * @tc.desc Verify join() '-' separator [INT_MAX,INT_MIN] '2147483647--2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      let r: string = arr.join('-');
      expect(r).assertEqual('2147483647--2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayJoinPart01TestMindmapTest061
     * @tc.desc Verify join() '-' separator [0,0] '0-0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0);
      let r: string = arr.join('-');
      expect(r).assertEqual('0-0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayJoinPart01TestMindmapTest062
     * @tc.desc Verify join() '-' separator [42] '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: string = arr.join('-');
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayJoinPart01TestMindmapTest063
     * @tc.desc Verify join() '(' separator '1(2(3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('(');
      expect(r).assertEqual('1(2(3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayJoinPart01TestMindmapTest064
     * @tc.desc Verify join() '[' separator '1[2[3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join('[');
      expect(r).assertEqual('1[2[3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayJoinPart01TestMindmapTest065
     * @tc.desc Verify join() ';' separator '1;2;3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.join(';');
      expect(r).assertEqual('1;2;3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayJoinPart01TestMindmapTest066
     * @tc.desc Verify join() '#' separator '1#2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.join('#');
      expect(r).assertEqual('1#2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayJoinPart01TestMindmapTest067
     * @tc.desc Verify join() separator ArrayBuffer set 10/20 '10 20'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 10);
      view.$_set(1, 20);
      let r: string = view.join(' ');
      expect(r).assertEqual('10 20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayJoinPart01TestMindmapTest068
     * @tc.desc Verify join() separator byteOffset offset 4, length 2, 100/-200 '100--200'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      view.$_set(0, 100);
      view.$_set(1, -200);
      let r: string = view.join('-');
      expect(r).assertEqual('100--200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayJoinPart01TestMindmapTest069
     * @tc.desc Verify join() separator '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: string = arr.join(',');
      expect(r).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayJoinPart01TestMindmapTest070
     * @tc.desc Verify join() separator subarray [10,20,30,40] [20,30] '20-30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = base.subarray(1, 3);
      let r: string = sub.join('-');
      expect(r).assertEqual('20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayJoinPart01TestMindmapTest071
     * @tc.desc Verify join() separator fill(7) '7,7,7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(7);
      let r: string = arr.join(',');
      expect(r).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayJoinPart01TestMindmapTest072
     * @tc.desc Verify join() separator [0,-1,INT_MAX] '0 -1 2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 2147483647);
      let r: string = arr.join(' ');
      expect(r).assertEqual('0 -1 2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_JOIN_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayJoinPart01TestMindmapTest073
     * @tc.desc Verify join() separator [-1,-2,-3] '-1,-2,-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayJoinPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -3);
      let r: string = arr.join(',');
      expect(r).assertEqual('-1,-2,-3');
    });



  });
}
