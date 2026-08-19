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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayJoinTestThreeTest(): void {
  describe('Int16ArrayJoinTestThreeTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0100
     * @tc.name testInt16ArrayJoinTestThree001
     * @tc.desc Verify join(undefined) on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join(undefined);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0200
     * @tc.name testInt16ArrayJoinTestThree002
     * @tc.desc Verify join on empty array with multi-char separator " -- " returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join(' -- ');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0300
     * @tc.name testInt16ArrayJoinTestThree003
     * @tc.desc Verify join on empty array with tab separator '\t' returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join('\t');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0400
     * @tc.name testInt16ArrayJoinTestThree004
     * @tc.desc Verify join on empty array with unicode separator returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join('中文');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0500
     * @tc.name testInt16ArrayJoinTestThree005
     * @tc.desc Verify join on empty array with XSS-like separator "<script>" returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join('<script>');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0600
     * @tc.name testInt16ArrayJoinTestThree006
     * @tc.desc Verify join on empty array with null-character separator '\0' returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join('\0');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0700
     * @tc.name testInt16ArrayJoinTestThree007
     * @tc.desc Verify join on empty array with long separator of 100 chars returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep = '';
      for (let i = 0; i < 100; i++) {
        sep = sep + 'x';
      }
      let arr = new Int16Array(0);
      let result = arr.join(sep);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0800
     * @tc.name testInt16ArrayJoinTestThree008
     * @tc.desc Verify join single element with value 0 and default separator returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0);
      let result = arr.join();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_0900
     * @tc.name testInt16ArrayJoinTestThree009
     * @tc.desc Verify join single element with value int16.MAX (32767) and default separator returns "32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767);
      let result = arr.join();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1000
     * @tc.name testInt16ArrayJoinTestThree010
     * @tc.desc Verify join single element with value int16.MIN (-32768) and default separator returns "-32768"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768);
      let result = arr.join();
      expect(result).assertEqual('-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1100
     * @tc.name testInt16ArrayJoinTestThree011
     * @tc.desc Verify join single element with value -1 and default separator returns "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1);
      let result = arr.join();
      expect(result).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1200
     * @tc.name testInt16ArrayJoinTestThree012
     * @tc.desc Verify join single element with value 0 and pipe separator returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0);
      let result = arr.join('|');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1300
     * @tc.name testInt16ArrayJoinTestThree013
     * @tc.desc Verify join single element with value 32767 and newline separator returns "32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767);
      let result = arr.join('\n');
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1400
     * @tc.name testInt16ArrayJoinTestThree014
     * @tc.desc Verify join single element with value -32768 and multi-char separator returns "-32768"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768);
      let result = arr.join(' -- ');
      expect(result).assertEqual('-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1500
     * @tc.name testInt16ArrayJoinTestThree015
     * @tc.desc Verify join single element with value 0 and empty string separator returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0);
      let result = arr.join('');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1600
     * @tc.name testInt16ArrayJoinTestThree016
     * @tc.desc Verify join single element with value 1 and default separator returns '1' without any separator char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1);
      let result = arr.join(',');
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1700
     * @tc.name testInt16ArrayJoinTestThree017
     * @tc.desc Verify join single element result does not contain separator character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768);
      let result = arr.join(',');
      let actual1: int = result.indexOf(',');
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1800
     * @tc.name testInt16ArrayJoinTestThree018
     * @tc.desc Verify join five zeros with default comma separator produces "0,0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0, 0, 0, 0, 0);
      let result = arr.join();
      expect(result).assertEqual('0,0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_1900
     * @tc.name testInt16ArrayJoinTestThree019
     * @tc.desc Verify join five zeros with pipe separator produces "0|0|0|0|0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0, 0, 0, 0, 0);
      let result = arr.join('|');
      expect(result).assertEqual('0|0|0|0|0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2000
     * @tc.name testInt16ArrayJoinTestThree020
     * @tc.desc Verify join five zeros with empty string separator produces "00000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0, 0, 0, 0, 0);
      let result = arr.join('');
      expect(result).assertEqual('00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2100
     * @tc.name testInt16ArrayJoinTestThree021
     * @tc.desc Verify join three int16.MAX values with default comma produces "32767,32767,32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, 32767, 32767);
      let result = arr.join();
      expect(result).assertEqual('32767,32767,32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2200
     * @tc.name testInt16ArrayJoinTestThree022
     * @tc.desc Verify join three int16.MAX values with pipe separator produces "32767|32767|32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, 32767, 32767);
      let result = arr.join('|');
      expect(result).assertEqual('32767|32767|32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2300
     * @tc.name testInt16ArrayJoinTestThree023
     * @tc.desc Verify join three int16.MIN values with default comma produces "-32768,-32768,-32768"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, -32768, -32768);
      let result = arr.join();
      expect(result).assertEqual('-32768,-32768,-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2400
     * @tc.name testInt16ArrayJoinTestThree024
     * @tc.desc Verify join three int16.MIN values with pipe separator produces "-32768|-32768|-32768"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, -32768, -32768);
      let result = arr.join('|');
      expect(result).assertEqual('-32768|-32768|-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2500
     * @tc.name testInt16ArrayJoinTestThree025
     * @tc.desc Verify join four negative-one values with default comma produces "-1,-1,-1,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1, -1, -1, -1);
      let result = arr.join();
      expect(result).assertEqual('-1,-1,-1,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2600
     * @tc.name testInt16ArrayJoinTestThree026
     * @tc.desc Verify join four negative-one values with empty string separator produces "-1-1-1-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1, -1, -1, -1);
      let result = arr.join('');
      expect(result).assertEqual('-1-1-1-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2700
     * @tc.name testInt16ArrayJoinTestThree027
     * @tc.desc Verify join five ones with default comma produces "1,1,1,1,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 1, 1, 1, 1);
      let result = arr.join();
      expect(result).assertEqual('1,1,1,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2800
     * @tc.name testInt16ArrayJoinTestThree028
     * @tc.desc Verify join three same arbitrary values with default comma produces expected repeated pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(42, 42, 42);
      let result = arr.join();
      expect(result).assertEqual('42,42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_2900
     * @tc.name testInt16ArrayJoinTestThree029
     * @tc.desc Verify join three same negative values with dash separator produces expected pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-5, -5, -5);
      let result = arr.join('-');
      expect(result).assertEqual('-5--5--5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3000
     * @tc.name testInt16ArrayJoinTestThree030
     * @tc.desc Verify original array length unchanged after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let lenBefore = arr.length;
      arr.join();
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3100
     * @tc.name testInt16ArrayJoinTestThree031
     * @tc.desc Verify original array element at index 0 unchanged after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let valBefore = arr.$_get(0 as int);
      arr.join('|');
      let actual1: number = arr.$_get(0 as int);
      let expected1: number = valBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3200
     * @tc.name testInt16ArrayJoinTestThree032
     * @tc.desc Verify original array element at last index unchanged after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let lastIdx = arr.length - 1;
      let valBefore = arr.$_get(lastIdx);
      arr.join('|');
      let actual1: number = arr.$_get(lastIdx);
      let expected1: number = valBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3300
     * @tc.name testInt16ArrayJoinTestThree033
     * @tc.desc Verify all original array elements unchanged after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.join(' -- ');
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3400
     * @tc.name testInt16ArrayJoinTestThree034
     * @tc.desc Verify join result on empty array has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.join('|');
      let actual1: int = result.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3500
     * @tc.name testInt16ArrayJoinTestThree035
     * @tc.desc Verify join result does not start with separator character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let result = arr.join('|');
      let actual1: boolean = result.startsWith('|');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3600
     * @tc.name testInt16ArrayJoinTestThree036
     * @tc.desc Verify join result does not end with separator character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let result = arr.join('|');
      let actual1: boolean = result.endsWith('|');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3700
     * @tc.name testInt16ArrayJoinTestThree037
     * @tc.desc Verify join result first character matches first element string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let result = arr.join('|');
      let actual1: boolean = result.startsWith('10');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3800
     * @tc.name testInt16ArrayJoinTestThree038
     * @tc.desc Verify join result last character matches last element string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let result = arr.join('|');
      let actual1: boolean = result.endsWith('30');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_3900
     * @tc.name testInt16ArrayJoinTestThree039
     * @tc.desc Verify join result on 2-element array with default has comma exactly once in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200);
      let result = arr.join();
      expect(result).assertEqual('100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4000
     * @tc.name testInt16ArrayJoinTestThree040
     * @tc.desc Verify join result split by separator recovers original element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let result = arr.join('|');
      let parts = result.split('|');
      let actual1: int = parts.length;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4100
     * @tc.name testInt16ArrayJoinTestThree041
     * @tc.desc Verify subarray().join() produces correct subset result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let sub = arr.subarray(1, 4);
      let result = sub.join();
      expect(result).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4200
     * @tc.name testInt16ArrayJoinTestThree042
     * @tc.desc Verify Int16Array.from() with Set source join returns expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let arr = Int16Array.from(s);
      let result = arr.join();
      let found: boolean = result.indexOf('10') !== -1;
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4300
     * @tc.name testInt16ArrayJoinTestThree043
     * @tc.desc Verify subarray covering entire array join returns same as original join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let sub = arr.subarray(0, 4);
      let originalResult = arr.join('|');
      let subResult = sub.join('|');
      expect(subResult).assertEqual(originalResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4400
     * @tc.name testInt16ArrayJoinTestThree044
     * @tc.desc Verify array with +Infinity in source converts to 0 before join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY);
      let result = arr.join();
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4500
     * @tc.name testInt16ArrayJoinTestThree045
     * @tc.desc Verify array with -Infinity in source converts to 0 before join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      let result = arr.join();
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4600
     * @tc.name testInt16ArrayJoinTestThree046
     * @tc.desc Verify array with mixed overflow values join shows wrapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(2);
      arr.$_set(0 as int, 32768);
      arr.$_set(1 as int, -32769);
      let result = arr.join('|');
      expect(result).assertEqual('-32768|32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4700
     * @tc.name testInt16ArrayJoinTestThree047
     * @tc.desc Verify array with alternating positive and negative values join preserves signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, -20, 30, -40);
      let result = arr.join();
      expect(result).assertEqual('10,-20,30,-40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4800
     * @tc.name testInt16ArrayJoinTestThree048
     * @tc.desc Verify array with all strictly negative values join displays all minus signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-10, -20, -30);
      let result = arr.join();
      expect(result).assertEqual('-10,-20,-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_4900
     * @tc.name testInt16ArrayJoinTestThree049
     * @tc.desc Verify array with 0 and -0 both display as '0' in join result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0, -0);
      let result = arr.join();
      expect(result).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5000
     * @tc.name testInt16ArrayJoinTestThree050
     * @tc.desc Verify array of size 1 containing float 3.7 truncates to 3 in join result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(1);
      arr.$_set(0 as int, 3.7);
      let result = arr.join();
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5100
     * @tc.name testInt16ArrayJoinTestThree051
     * @tc.desc Verify array with 500 same-value elements join default separator returns correct length string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(500);
      for (let i = 0; i < 500; i++) {
        arr.$_set(i, 0);
      }
      let result = arr.join();
      let actual1: int = result.length;
      expect(actual1).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5200
     * @tc.name testInt16ArrayJoinTestThree052
     * @tc.desc Verify array with 500 same-value elements join empty string returns contiguous string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(500);
      for (let i = 0; i < 500; i++) {
        arr.$_set(i, 1);
      }
      let result = arr.join('');
      let actual1: int = result.length;
      expect(actual1).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5300
     * @tc.name testInt16ArrayJoinTestThree053
     * @tc.desc Verify array with 1000 elements mixed values join with pipe produces correct separator count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i);
      }
      let result = arr.join('|');
      let sepCount = 0;
      for (let j = 0; j < result.length; j++) {
        if (result[j] === '|') {
          sepCount = sepCount + 1;
        }
      }
      expect(sepCount).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5400
     * @tc.name testInt16ArrayJoinTestThree054
     * @tc.desc Verify array with 2000 elements all MAX join returns consistent repeated pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(2000);
      for (let i = 0; i < 2000; i++) {
        arr.$_set(i, 32767);
      }
      let result = arr.join();
      let actual1: boolean = result.startsWith('32767,');
      expect(actual1).assertTrue();
      let actual2: boolean = result.endsWith('32767');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5500
     * @tc.name testInt16ArrayJoinTestThree055
     * @tc.desc Verify join on subarray from middle of array produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5, 6);
      let sub = arr.subarray(2, 5);
      let result = sub.join(':');
      expect(result).assertEqual('3:4:5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5600
     * @tc.name testInt16ArrayJoinTestThree056
     * @tc.desc Verify join on subarray with length 1 produces single element without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let sub = arr.subarray(2, 3);
      let result = sub.join(',');
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5700
     * @tc.name testInt16ArrayJoinTestThree057
     * @tc.desc Verify join after fill operation returns string of repeated filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      arr.fill(7);
      let result = arr.join();
      expect(result).assertEqual('7,7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_THREE_5800
     * @tc.name testInt16ArrayJoinTestThree058
     * @tc.desc Verify join after reverse operation reflects reversed element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.reverse();
      let result = arr.join();
      expect(result).assertEqual('30,20,10');
    });
  });
}
