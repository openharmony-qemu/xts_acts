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

export default function int32ArrayToStringPart02Test(): void {
  describe('Int32ArrayToStringPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayToStringPart02Test001
     * @tc.desc Verify Int32Array.of(5,9) toString returns '5,9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 9);
      let s: string = arr.toString();
      expect(s).assertEqual('5,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayToStringPart02Test002
     * @tc.desc Verify an empty Int32Array toString returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let s: string = arr.toString();
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayToStringPart02Test003
     * @tc.desc Verify Int32Array.of(0) toString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let s: string = arr.toString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayToStringPart02Test004
     * @tc.desc Verify INT_MAX toString returns '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let s: string = arr.toString();
      expect(s).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayToStringPart02Test005
     * @tc.desc Verify negative elements toString returns '-10,-20,-30,-40,-50'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-10, -20, -30, -40, -50);
      let s: string = arr.toString();
      expect(s).assertEqual('-10,-20,-30,-40,-50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayToStringPart02Test006
     * @tc.desc Verify toString returns comma-separated values; Also verify verify [1,2,3] length 5 ("1,2,3" 2 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.toString()).assertEqual('1,2,3');

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.toString().length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayToStringPart02Test007
     * @tc.desc Verify toString charAt(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88);
      let s: string = arr.toString();
      expect(s.charAt(0).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayToStringPart02Test008
     * @tc.desc Verify toString substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42, 1);
      let s: string = arr.toString();
      expect(s.substring(0, 2)).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayToStringPart02Test009
     * @tc.desc Verify toString for a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayToStringPart02Test010
     * @tc.desc Verify [-1] toString "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      expect(arr.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayToStringPart02Test011
     * @tc.desc Verify [-2] toString "-2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2);
      expect(arr.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayToStringPart02Test012
     * @tc.desc Verify [0,1] toString "0,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      expect(arr.toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayToStringPart02Test013
     * @tc.desc Verify [-1,0] toString "-1,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0);
      expect(arr.toString()).assertEqual('-1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayToStringPart02Test014
     * @tc.desc Verify [10,20,30,40] toString "10,20,30,40"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      expect(arr.toString()).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayToStringPart02Test015
     * @tc.desc Verify INT_MAX 2147483647 toString "2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      expect(arr.toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayToStringPart02Test016
     * @tc.desc Verify INT_MIN -2147483648 toString "-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      expect(arr.toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayToStringPart02Test017
     * @tc.desc Verify [INT_MIN, INT_MAX] toString "-2147483648,2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 2147483647);
      expect(arr.toString()).assertEqual('-2147483648,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayToStringPart02Test018
     * @tc.desc Verify INT_MAX-1 = 2147483646 toString "2147483646"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483646);
      expect(arr.toString()).assertEqual('2147483646');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayToStringPart02Test019
     * @tc.desc Verify INT_MIN+1 = -2147483647 toString "-2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483647);
      expect(arr.toString()).assertEqual('-2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayToStringPart02Test020
     * @tc.desc Verify [0,0,0] toString "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      expect(arr.toString()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayToStringPart02Test021
     * @tc.desc Verify [7,7,7,7] toString "7,7,7,7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      expect(arr.toString()).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayToStringPart02Test022
     * @tc.desc Verify [-5,-10,-15] toString "-5,-10,-15"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, -10, -15);
      expect(arr.toString()).assertEqual('-5,-10,-15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayToStringPart02Test023
     * @tc.desc Verify [-1,0,1] toString "-1,0,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      expect(arr.toString()).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayToStringPart02Test024
     * @tc.desc Verify $_set 5.9 5, toString "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 5.9);
      expect(arr.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayToStringPart02Test025
     * @tc.desc Verify $_set -5.9 -5, toString "-5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -5.9);
      expect(arr.toString()).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayToStringPart02Test026
     * @tc.desc Verify $_set 4294967295(0xFFFFFFFF) -1, toString "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967295);
      expect(arr.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayToStringPart02Test027
     * @tc.desc Verify $_set -0 ToInt32 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayToStringPart02Test028
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.toString().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayToStringPart02Test029
     * @tc.desc Verify [0] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      expect(arr.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayToStringPart02Test030
     * @tc.desc Verify [-1] length 2 ( +1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      expect(arr.toString().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayToStringPart02Test031
     * @tc.desc Verify [10] ( ) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10);
      expect(arr.toString().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayToStringPart02Test032
     * @tc.desc Verify INT_MAX length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      expect(arr.toString().length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayToStringPart02Test033
     * @tc.desc Verify INT_MIN length 11 ( +10 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      expect(arr.toString().length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayToStringPart02Test034
     * @tc.desc Verify [1,2] length 3 ("1,2" 1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      expect(arr.toString().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayToStringPart02Test035
     * @tc.desc Verify [100,200] length 7 ("100,200" 3+1+3=7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200);
      expect(arr.toString().length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayToStringPart02Test036
     * @tc.desc Verify toString for a single element contains no comma separator; Also verify verify toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(999);
      expect(arr.toString().indexOf(',')).assertEqual(-1);

      {
      let arr: Int32Array = Int32Array.of(999);
      expect(arr.toString()).assertEqual(arr.join(','));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayToStringPart02Test037
     * @tc.desc Verify length-1=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let s: string = arr.toString();
      let cnt: int = 0;
      for (let i = 0; i < s.length; i++) {
        if (s.substring(i, i + 1) === ',') {
          cnt++;
        }
      }
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayToStringPart02Test038
     * @tc.desc Verify toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayToStringPart02Test039
     * @tc.desc Verify toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, -20, 300);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayToStringPart02Test040
     * @tc.desc Verify toString join()( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-7, 0, 7);
      expect(arr.toString()).assertEqual(arr.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayToStringPart02Test041
     * @tc.desc Verify INT_MAX/INT_MIN toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayToStringPart02Test042
     * @tc.desc Verify toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 5, 5, 5);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayToStringPart02Test043
     * @tc.desc Verify toString joins elements without space characters; Also verify verify toString toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let s: string = arr.toString();
      expect(s.indexOf(' ')).assertEqual(-1);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let s: string = arr.toString();
      expect(s.toString()).assertEqual(s);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayToStringPart02Test044
     * @tc.desc Verify "["; Also verify verify "]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let s: string = arr.toString();
      expect(s.indexOf('[')).assertEqual(-1);

      {
      let arr: Int32Array = Int32Array.of(1, 2);
      let s: string = arr.toString();
      expect(s.indexOf(']')).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayToStringPart02Test045
     * @tc.desc Verify "+"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(123);
      let s: string = arr.toString();
      expect(s.charAt(0).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayToStringPart02Test046
     * @tc.desc Verify "undefined" ( undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let s: string = arr.toString();
      expect(s.indexOf('undefined')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayToStringPart02Test047
     * @tc.desc Verify "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1);
      let s: string = arr.toString();
      expect(s.indexOf('null')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayToStringPart02Test048
     * @tc.desc Verify [100] "100" "1e2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100);
      expect(arr.toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayToStringPart02Test049
     * @tc.desc Verify [10000] "10000" "1e4"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10000);
      expect(arr.toString()).assertEqual('10000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayToStringPart02Test050
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2, 300);
      let s1: string = arr.toString();
      let s2: string = arr.toString();
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayToStringPart02Test051
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      let s1: string = arr.toString();
      arr.toString();
      let s3: string = arr.toString();
      expect(s1).assertEqual(s3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayToStringPart02Test052
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.$_set(0, 99);
      expect(arr.toString()).assertEqual('99,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayToStringPart02Test053
     * @tc.desc Verify toString length ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let before: int = arr.length;
      arr.toString();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayToStringPart02Test054
     * @tc.desc Verify toString length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.toString();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayToStringPart02Test055
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      arr.toString();
      expect(arr.$_get(0)).assertEqual(11);

      {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      arr.toString();
      expect(arr.$_get(arr.length - 1)).assertEqual(33);
      }

      {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      arr.toString();
      expect(arr.$_get(1)).assertEqual(22);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayToStringPart02Test056
     * @tc.desc Verify toString ( / )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1, 2147483647, -2147483648);
      arr.toString();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2147483647);
      expect(arr.$_get(4)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayToStringPart02Test057
     * @tc.desc Verify toString byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let blBefore: int = arr.byteLength;
      arr.toString();
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayToStringPart02Test058
     * @tc.desc Verify toString BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      arr.toString();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayToStringPart02Test059
     * @tc.desc Verify toString buffer (===)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.toString();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayToStringPart02Test060
     * @tc.desc Verify toString buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let bufBLen: int = arr.buffer.byteLength;
      arr.toString();
      expect(arr.buffer.byteLength).assertEqual(bufBLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayToStringPart02Test061
     * @tc.desc Verify toString INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      arr.toString();
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayToStringPart02Test062
     * @tc.desc Verify toString INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      arr.toString();
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayToStringPart02Test063
     * @tc.desc Verify toString byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.toString();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayToStringPart02Test064
     * @tc.desc Verify byteOffset=4 toString byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      arr.toString();
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayToStringPart02Test065
     * @tc.desc Verify byteOffset=8 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 0);
      full.$_set(1, 0);
      full.$_set(2, 111);
      full.$_set(3, 222);
      full.$_set(4, 333);
      let sub: Int32Array = new Int32Array(buf, 8, 3);
      expect(sub.toString()).assertEqual('111,222,333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayToStringPart02Test066
     * @tc.desc Verify subarray toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3, 4);
      let child: Int32Array = parent.subarray(1, 3);
      let childStr: string = child.toString();
      expect(childStr).assertEqual('2,3');
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayToStringPart02Test067
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30);
      let child: Int32Array = parent.subarray(0, 2);
      parent.toString();
      expect(child.$_get(0)).assertEqual(10);
      expect(child.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayToStringPart02Test068
     * @tc.desc Verify buffer toString ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf, 0, 2);
      let a2: Int32Array = new Int32Array(buf, 0, 2);
      a1.$_set(0, 11);
      a1.$_set(1, 22);
      expect(a2.toString()).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayToStringPart02Test069
     * @tc.desc Verify DataView INT_MIN buffer Int32Array.toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, -2147483648);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayToStringPart02Test070
     * @tc.desc Verify fill toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(7);
      expect(arr.toString()).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayToStringPart02Test071
     * @tc.desc Verify reverse toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayToStringPart02Test072
     * @tc.desc Verify sort toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 2);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayToStringPart02Test073
     * @tc.desc Verify copyWithin toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayToStringPart02Test074
     * @tc.desc Verify set toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(5, 15, 25);
      arr.set(src);
      expect(arr.toString()).assertEqual('5,15,25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayToStringPart02Test075
     * @tc.desc Verify ArrayBuffer toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayToStringPart02Test076
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a1: Int32Array = new Int32Array(buf, 0, 3);
      let a2: Int32Array = new Int32Array(buf, 0, 3);
      a1.$_set(0, -1);
      a1.$_set(1, 0);
      a1.$_set(2, 1);
      expect(a2.toString()).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArrayToStringPart02Test077
     * @tc.desc Verify new Int32Array(N) ( ) toString "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      expect(arr.toString()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7800
     * @tc.name int32ArrayToStringPart02Test078
     * @tc.desc Verify Int32Array.from JS toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [100, -200];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.toString()).assertEqual('100,-200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_7900
     * @tc.name int32ArrayToStringPart02Test079
     * @tc.desc Verify ArrayBuffer toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      arr.$_set(2, 9);
      expect(arr.toString()).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_8000
     * @tc.name int32ArrayToStringPart02Test080
     * @tc.desc Verify Int32Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(5, 6, 7);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.toString()).assertEqual(src.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_8100
     * @tc.name int32ArrayToStringPart02Test081
     * @tc.desc Verify JS new Int32Array([...]) Int32Array.of toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3]);
      let a2: Int32Array = Int32Array.of(1, 2, 3);
      expect(a1.toString()).assertEqual(a2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART02_TEST_MINDMAP_8200
     * @tc.name int32ArrayToStringPart02Test082
     * @tc.desc Verify subarray(0) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let sub: Int32Array = arr.subarray(0);
      expect(sub.toString()).assertEqual(arr.toString());
    });
  });
}
