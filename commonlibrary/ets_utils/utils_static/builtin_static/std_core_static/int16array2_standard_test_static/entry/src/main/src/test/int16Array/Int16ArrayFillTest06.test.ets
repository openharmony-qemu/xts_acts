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

export default function int16ArrayFillTestSixTest(): void {
  describe('Int16ArrayFillTestSixTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0010
     * @tc.name testInt16ArrayFillTestSix001
     * @tc.desc Verify short value fill dispatches E overload and $_get reads filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let val: short = 99 as short;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0020
     * @tc.name testInt16ArrayFillTestSix002
     * @tc.desc Verify int literal fill dispatches number overload and $_get reads int16 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(88);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(88);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0030
     * @tc.name testInt16ArrayFillTestSix003
     * @tc.desc Verify explicit number variable fill dispatches number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: number = 77;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(77);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0040
     * @tc.name testInt16ArrayFillTestSix004
     * @tc.desc Verify short fill with start dispatches E overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let val: short = 55 as short;
      arr.fill(val, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 55 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 55 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0050
     * @tc.name testInt16ArrayFillTestSix005
     * @tc.desc Verify int literal fill with start dispatches number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(66, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(66);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0060
     * @tc.name testInt16ArrayFillTestSix006
     * @tc.desc Verify short fill with start and end dispatches E overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let val: short = 44 as short;
      arr.fill(val, 1, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 44 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 40 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0070
     * @tc.name testInt16ArrayFillTestSix007
     * @tc.desc Verify int literal fill with start and end dispatches number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(33, 0, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(33);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(33);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0080
     * @tc.name testInt16ArrayFillTestSix008
     * @tc.desc Verify short zero fill E overload matches number fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([5, 5, 5]);
      let arrN = new Int16Array([5, 5, 5]);
      let val: short = 0 as short;
      arrE.fill(val);
      arrN.fill(0);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrN.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(1);
      let expected2: number = arrN.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0090
     * @tc.name testInt16ArrayFillTestSix009
     * @tc.desc Verify short fill with int16 max 32767 preserves value via E overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = 32767 as short;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0100
     * @tc.name testInt16ArrayFillTestSix010
     * @tc.desc Verify number fill(32767) matches E fill(32767 as short) content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([0, 0, 0]);
      let arrN = new Int16Array([0, 0, 0]);
      let val: short = 32767 as short;
      arrE.fill(val);
      arrN.fill(32767);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrN.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(1);
      let expected2: number = arrN.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrE.$_get(2);
      let expected3: number = arrN.$_get(2);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0110
     * @tc.name testInt16ArrayFillTestSix011
     * @tc.desc Verify short fill with int16 min -32768 preserves value via E overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = -32768 as short;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0120
     * @tc.name testInt16ArrayFillTestSix012
     * @tc.desc Verify number fill(-32768) matches E fill(-32768 as short) content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([0, 0, 0]);
      let arrN = new Int16Array([0, 0, 0]);
      let val: short = -32768 as short;
      arrE.fill(val);
      arrN.fill(-32768);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrN.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(1);
      let expected2: number = arrN.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrE.$_get(2);
      let expected3: number = arrN.$_get(2);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0130
     * @tc.name testInt16ArrayFillTestSix013
     * @tc.desc Verify E fill then number fill overwrite keeps final values from second fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let valE: short = 5 as short;
      arr.fill(valE);
      arr.fill(99, 1, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 5 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      let expected4: number = 5 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0140
     * @tc.name testInt16ArrayFillTestSix014
     * @tc.desc Verify number fill then E fill overwrite keeps final values from second fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      arr.fill(77);
      let valE: short = 3 as short;
      arr.fill(valE, 0, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 3 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(77);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0150
     * @tc.name testInt16ArrayFillTestSix015
     * @tc.desc Verify negative short fill E overload matches number fill same negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([0, 0, 0]);
      let arrN = new Int16Array([0, 0, 0]);
      let val: short = -100 as short;
      arrE.fill(val);
      arrN.fill(-100);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrN.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(1);
      let expected2: number = arrN.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0160
     * @tc.name testInt16ArrayFillTestSix016
     * @tc.desc Verify E fill value 1 matches number fill value 1 result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([0, 0, 0]);
      let arrN = new Int16Array([0, 0, 0]);
      let val: short = 1 as short;
      arrE.fill(val, 1, 2);
      arrN.fill(1, 1, 2);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrN.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(1);
      let expected2: number = arrN.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrE.$_get(2);
      let expected3: number = arrN.$_get(2);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0170
     * @tc.name testInt16ArrayFillTestSix017
     * @tc.desc Verify E fill(value) omits start/end and fills whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let val: short = 7 as short;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = 7 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 7 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0180
     * @tc.name testInt16ArrayFillTestSix018
     * @tc.desc Verify number fill(value) omits start/end and fills whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      arr.fill(7);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(7);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0190
     * @tc.name testInt16ArrayFillTestSix019
     * @tc.desc Verify E and number fill omit start/end produce same fill effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([1, 2, 3, 4]);
      let arrN = new Int16Array([1, 2, 3, 4]);
      let val: short = 42 as short;
      arrE.fill(val);
      arrN.fill(42);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrN.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(1);
      let expected2: number = arrN.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrE.$_get(3);
      let expected3: number = arrN.$_get(3);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0200
     * @tc.name testInt16ArrayFillTestSix020
     * @tc.desc Verify E fill(value, start) omits end and fills to array end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let val: short = 8 as short;
      arr.fill(val, 3);
      let actual1: number = arr.$_get(2);
      let expected1: number = 30 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 8 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 8 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0210
     * @tc.name testInt16ArrayFillTestSix021
     * @tc.desc Verify number fill(value, start) omits end and fills to array end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(8, 3);
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(8);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0220
     * @tc.name testInt16ArrayFillTestSix022
     * @tc.desc Verify E and number fill omit end default behavior consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([1, 2, 3, 4, 5]);
      let arrN = new Int16Array([1, 2, 3, 4, 5]);
      let val: short = 99 as short;
      arrE.fill(val, 2);
      arrN.fill(99, 2);
      let actual1: number = arrE.$_get(2);
      let expected1: number = arrN.$_get(2);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(4);
      let expected2: number = arrN.$_get(4);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0230
     * @tc.name testInt16ArrayFillTestSix023
     * @tc.desc Verify E fill(value, 0) matches omit-start default fill behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrDefault = new Int16Array([5, 5, 5, 5]);
      let arrExplicit = new Int16Array([5, 5, 5, 5]);
      let val: short = 3 as short;
      arrDefault.fill(val);
      arrExplicit.fill(val, 0);
      let actual1: number = arrDefault.$_get(0);
      let expected1: number = arrExplicit.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrDefault.$_get(3);
      let expected2: number = arrExplicit.$_get(3);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0240
     * @tc.name testInt16ArrayFillTestSix024
     * @tc.desc Verify number fill(value, 0) matches omit-start default fill behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrDefault = new Int16Array([5, 5, 5, 5]);
      let arrExplicit = new Int16Array([5, 5, 5, 5]);
      arrDefault.fill(3);
      arrExplicit.fill(3, 0);
      let actual1: number = arrDefault.$_get(0);
      let expected1: number = arrExplicit.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrDefault.$_get(3);
      let expected2: number = arrExplicit.$_get(3);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0250
     * @tc.name testInt16ArrayFillTestSix025
     * @tc.desc Verify E fill with omitted end equals default end behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrOmit = new Int16Array([1, 2, 3, 4, 5]);
      let arrUndef = new Int16Array([1, 2, 3, 4, 5]);
      let val: short = 6 as short;
      arrOmit.fill(val, 2);
      arrUndef.fill(val, 2);
      let actual1: number = arrOmit.$_get(4);
      let expected1: number = arrUndef.$_get(4);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0260
     * @tc.name testInt16ArrayFillTestSix026
     * @tc.desc Verify number fill with omitted end equals default end behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrOmit = new Int16Array([1, 2, 3, 4, 5]);
      let arrUndef = new Int16Array([1, 2, 3, 4, 5]);
      arrOmit.fill(6, 2);
      arrUndef.fill(6, 2);
      let actual1: number = arrOmit.$_get(4);
      let expected1: number = arrUndef.$_get(4);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0270
     * @tc.name testInt16ArrayFillTestSix027
     * @tc.desc Verify E fill returns this same array instance via ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = 5 as short;
      let ret = arr.fill(val);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0280
     * @tc.name testInt16ArrayFillTestSix028
     * @tc.desc Verify number fill returns this same array instance via ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let ret = arr.fill(5);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0290
     * @tc.name testInt16ArrayFillTestSix029
     * @tc.desc Verify E fill return length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let val: short = 1 as short;
      let ret = arr.fill(val);
      let actual1: int = ret.length;
      let expected1: number = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0300
     * @tc.name testInt16ArrayFillTestSix030
     * @tc.desc Verify number fill return length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let ret = arr.fill(1);
      let actual1: int = ret.length;
      let expected1: number = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0310
     * @tc.name testInt16ArrayFillTestSix031
     * @tc.desc Verify E fill chained with number fill returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = 7 as short;
      let ret = arr.fill(val).fill(99);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0320
     * @tc.name testInt16ArrayFillTestSix032
     * @tc.desc Verify number fill chained with E fill returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = 3 as short;
      let ret = arr.fill(88).fill(val);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
      let actual2: number = ret.$_get(0);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0330
     * @tc.name testInt16ArrayFillTestSix033
     * @tc.desc Verify three chained fill alternate overloads always return same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      let val: short = 1 as short;
      let ret = arr.fill(val).fill(2).fill(val, 2, 4);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
      let actual2: number = ret.$_get(0);
      expect(actual2).assertEqual(2);
      let actual3: number = ret.$_get(2);
      let expected3: number = 1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0340
     * @tc.name testInt16ArrayFillTestSix034
     * @tc.desc Verify E fill chain then $_get reads filled value from returned this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = 9 as short;
      let result = arr.fill(val).$_get(1);
      expect(result).assertEqual(9 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0350
     * @tc.name testInt16ArrayFillTestSix035
     * @tc.desc Verify number fill chain then $_get reads filled value from returned this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.fill(9).$_get(1);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0360
     * @tc.name testInt16ArrayFillTestSix036
     * @tc.desc Verify E fill return this then fill with start keeps same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      let val1: short = 5 as short;
      let val2: short = 9 as short;
      let mid = arr.fill(val1, 0, 2);
      let filled = mid.fill(val2, 3, 5);
      let actual1: boolean = mid === arr;
      expect(actual1).assertTrue();
      let actual2: boolean = filled === arr;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0370
     * @tc.name testInt16ArrayFillTestSix037
     * @tc.desc Verify E fill then $_get reads filled values consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = 42 as short;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = 42 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 42 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 42 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0380
     * @tc.name testInt16ArrayFillTestSix038
     * @tc.desc Verify number fill then $_get reads filled int16 values consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(42);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(42);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(42);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0390
     * @tc.name testInt16ArrayFillTestSix039
     * @tc.desc Verify E fill keeps length property unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let lenBefore = arr.length;
      let val: short = 7 as short;
      arr.fill(val);
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0400
     * @tc.name testInt16ArrayFillTestSix040
     * @tc.desc Verify number fill keeps length property unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let lenBefore = arr.length;
      arr.fill(7);
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0410
     * @tc.name testInt16ArrayFillTestSix041
     * @tc.desc Verify E fill keeps BYTES_PER_ELEMENT unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let val: short = 0 as short;
      arr.fill(val);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0420
     * @tc.name testInt16ArrayFillTestSix042
     * @tc.desc Verify number fill keeps BYTES_PER_ELEMENT unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.fill(0);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0430
     * @tc.name testInt16ArrayFillTestSix043
     * @tc.desc Verify E fill keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      let byteLenBefore = arr.byteLength;
      let val: short = 5 as short;
      arr.fill(val);
      let actual1: int = arr.byteLength;
      let expected1: number = byteLenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0440
     * @tc.name testInt16ArrayFillTestSix044
     * @tc.desc Verify number fill keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      let byteLenBefore = arr.byteLength;
      arr.fill(5);
      let actual1: int = arr.byteLength;
      let expected1: number = byteLenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0450
     * @tc.name testInt16ArrayFillTestSix045
     * @tc.desc Verify E fill then toString output reflects filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = 77 as short;
      arr.fill(val);
      let str: string = arr.toString();
      expect(str).assertEqual('77,77,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0460
     * @tc.name testInt16ArrayFillTestSix046
     * @tc.desc Verify number fill then toString output reflects filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(77);
      let str: string = arr.toString();
      expect(str).assertEqual('77,77,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0470
     * @tc.name testInt16ArrayFillTestSix047
     * @tc.desc Verify E fill and number fill same value produce equal join output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([0, 0, 0]);
      let arrN = new Int16Array([0, 0, 0]);
      let val: short = 50 as short;
      arrE.fill(val);
      arrN.fill(50);
      let actual1: string = arrE.join(',');
      let expected1: string = arrN.join(',');
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0480
     * @tc.name testInt16ArrayFillTestSix048
     * @tc.desc Verify E fill then $_set one element leaves other filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      let val: short = 10 as short;
      arr.fill(val);
      arr.$_set(2, 99 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 10 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 99 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 10 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0490
     * @tc.name testInt16ArrayFillTestSix049
     * @tc.desc Verify number fill then $_set one element leaves other filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      arr.fill(10);
      arr.$_set(2, 99);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(10);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0500
     * @tc.name testInt16ArrayFillTestSix050
     * @tc.desc Verify E fill keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 3);
      let val: short = 1 as short;
      arr.fill(val);
      let actual1: int = arr.byteOffset;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0510
     * @tc.name testInt16ArrayFillTestSix051
     * @tc.desc Verify number fill keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 3);
      arr.fill(1);
      let actual1: int = arr.byteOffset;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0520
     * @tc.name testInt16ArrayFillTestSix052
     * @tc.desc Verify two views same ArrayBuffer E fill one updates the other view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 0, 4);
      let val: short = 99 as short;
      view1.fill(val);
      let actual1: number = view2.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = view2.$_get(1);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0530
     * @tc.name testInt16ArrayFillTestSix053
     * @tc.desc Verify two views same ArrayBuffer number fill one updates the other view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 0, 4);
      view1.fill(99);
      let actual1: number = view2.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = view2.$_get(1);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0540
     * @tc.name testInt16ArrayFillTestSix054
     * @tc.desc Verify E fill on subarray updates only that view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0, 0]);
      let child = parent.subarray(1, 4);
      let val: short = 7 as short;
      parent.fill(val);
      let actual1: number = child.$_get(0);
      let expected1: number = 7 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = child.$_get(1);
      let expected2: number = 7 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = child.$_get(2);
      let expected3: number = 7 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0550
     * @tc.name testInt16ArrayFillTestSix055
     * @tc.desc Verify number fill on subarray updates only that view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0]);
      let val: short = 55 as short;
      parent.fill(val);
      let child = parent.subarray(1, 3);
      let actual1: number = child.$_get(0);
      let expected1: number = 55 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = child.$_get(1);
      let expected2: number = 55 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0560
     * @tc.name testInt16ArrayFillTestSix056
     * @tc.desc Verify E fill does not allocate new ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0]);
      parent.fill(55);
      let child = parent.subarray(1, 3);
      let actual1: number = child.$_get(0);
      expect(actual1).assertEqual(55);
      let actual2: number = child.$_get(1);
      expect(actual2).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0570
     * @tc.name testInt16ArrayFillTestSix057
     * @tc.desc Verify number fill does not allocate new ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0, 0]);
      let child = parent.subarray(1, 4);
      let val: short = 33 as short;
      child.fill(val);
      let actual1: number = parent.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = parent.$_get(1);
      let expected2: number = 33 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = parent.$_get(3);
      let expected3: number = 33 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = parent.$_get(4);
      expect(actual4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0580
     * @tc.name testInt16ArrayFillTestSix058
     * @tc.desc Verify E fill shares buffer reference with original view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let bufBefore = arr.buffer;
      let val: short = 9 as short;
      arr.fill(val);
      let actual1: boolean = bufBefore === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0590
     * @tc.name testInt16ArrayFillTestSix059
     * @tc.desc Verify number fill shares buffer reference with original view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let val: short = 1 as short;
      arr.fill(val, 2, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 20 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 1 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 1 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: number = 50 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0600
     * @tc.name testInt16ArrayFillTestSix060
     * @tc.desc Verify E fill on one view does not change sibling view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 2, 3);
      let val: short = 77 as short;
      view1.fill(val, 1, 3);
      let actual1: number = view2.$_get(0);
      let expected1: number = 77 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = view2.$_get(1);
      let expected2: number = 77 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0610
     * @tc.name testInt16ArrayFillTestSix061
     * @tc.desc Verify number fill on one view does not change sibling view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 2, 3);
      view1.fill(77, 1, 3);
      let actual1: number = view2.$_get(0);
      expect(actual1).assertEqual(77);
      let actual2: number = view2.$_get(1);
      expect(actual2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0620
     * @tc.name testInt16ArrayFillTestSix062
     * @tc.desc Verify E fill then number fill on shared buffer both affect buffer bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0, 0]);
      let valP: short = 10 as short;
      parent.fill(valP);
      let child = parent.subarray(2, 5);
      let valC: short = 20 as short;
      child.fill(valC);
      let actual1: number = parent.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = parent.$_get(2);
      let expected2: number = 20 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = parent.$_get(4);
      let expected3: number = 20 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0630
     * @tc.name testInt16ArrayFillTestSix063
     * @tc.desc Verify fill identity: E fill whole range then values remain filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      let val1: short = 5 as short;
      let val2: short = 8 as short;
      arr.fill(val1);
      arr.fill(val2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 8 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 8 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 8 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 8 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0640
     * @tc.name testInt16ArrayFillTestSix064
     * @tc.desc Verify fill identity: number fill whole range then values remain filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let identBefore = arr;
      let lenBefore = arr.length;
      let val: short = 1 as short;
      arr.fill(val);
      let actual1: boolean = arr === identBefore;
      expect(actual1).assertTrue();
      let actual2: int = arr.length;
      let expected2: number = lenBefore;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0650
     * @tc.name testInt16ArrayFillTestSix065
     * @tc.desc Verify E fill identity keeps length after full-range fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let identBefore = arr;
      let lenBefore = arr.length;
      arr.fill(1);
      let actual1: boolean = arr === identBefore;
      expect(actual1).assertTrue();
      let actual2: int = arr.length;
      let expected2: number = lenBefore;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0660
     * @tc.name testInt16ArrayFillTestSix066
     * @tc.desc Verify number fill identity keeps length after full-range fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let val: short = 5 as short;
      arr.fill(val);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0670
     * @tc.name testInt16ArrayFillTestSix067
     * @tc.desc Verify E fill(start=0,end=length) equals omit-range fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int16Array(buf, 4, 3);
      let val: short = 2 as short;
      arr.fill(val);
      let actual1: int = arr.byteOffset;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0680
     * @tc.name testInt16ArrayFillTestSix068
     * @tc.desc Verify number fill(start=0,end=length) equals omit-range fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let bufBefore = arr.buffer;
      arr.fill(99);
      let bufAfter = arr.buffer;
      let actual1: boolean = bufBefore === bufAfter;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0690
     * @tc.name testInt16ArrayFillTestSix069
     * @tc.desc Verify E fill(start greater-or-equal length) makes no modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let identBefore = arr;
      let val: short = 5 as short;
      arr.fill(val, 5);
      let actual1: boolean = arr === identBefore;
      expect(actual1).assertTrue();
      let actual2: number = arr.$_get(0);
      let expected2: number = 10 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0700
     * @tc.name testInt16ArrayFillTestSix070
     * @tc.desc Verify number fill(start greater-or-equal length) makes no modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let identBefore = arr;
      arr.fill(5, 5);
      let actual1: boolean = arr === identBefore;
      expect(actual1).assertTrue();
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0710
     * @tc.name testInt16ArrayFillTestSix071
     * @tc.desc Verify E fill(start greater-or-equal end) makes no modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let val: short = 9 as short;
      arr.fill(val, 3, 1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 20 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0720
     * @tc.name testInt16ArrayFillTestSix072
     * @tc.desc Verify number fill(32768) wraps to int16 -32768 via fill truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0730
     * @tc.name testInt16ArrayFillTestSix073
     * @tc.desc Verify number fill(-32769) wraps to int16 32767 via fill truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(-32769);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0740
     * @tc.name testInt16ArrayFillTestSix074
     * @tc.desc Verify number fill(65535) truncates to -1 via fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0]);
      arr.fill(65535);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0750
     * @tc.name testInt16ArrayFillTestSix075
     * @tc.desc Verify number fill(65536) truncates to 0 via fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0]);
      arr.fill(65536);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0760
     * @tc.name testInt16ArrayFillTestSix076
     * @tc.desc Verify number fill(32767+65536) matches fill(32767) after wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrW = new Int16Array([0]);
      let arrD = new Int16Array([0]);
      arrW.fill(32767 + 65536);
      arrD.fill(32767);
      let actual1: number = arrW.$_get(0);
      let expected1: number = arrD.$_get(0);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0770
     * @tc.name testInt16ArrayFillTestSix077
     * @tc.desc Verify number fill(NaN) coerces to 0 matching fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrNaN = new Int16Array([1, 1]);
      let arrZero = new Int16Array([1, 1]);
      arrNaN.fill(Number.NaN);
      arrZero.fill(0);
      let actual1: number = arrNaN.$_get(0);
      let expected1: number = arrZero.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrNaN.$_get(1);
      let expected2: number = arrZero.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0780
     * @tc.name testInt16ArrayFillTestSix078
     * @tc.desc Verify number fill(Infinity) coerces to 0 matching fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrInf = new Int16Array([1, 1]);
      let arrZero = new Int16Array([1, 1]);
      arrInf.fill(Number.POSITIVE_INFINITY);
      arrZero.fill(0);
      let actual1: number = arrInf.$_get(0);
      let expected1: number = arrZero.$_get(0);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0790
     * @tc.name testInt16ArrayFillTestSix079
     * @tc.desc Verify number fill(-Infinity) coerces to 0 matching fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrNInf = new Int16Array([1, 1]);
      let arrZero = new Int16Array([1, 1]);
      arrNInf.fill(-Number.POSITIVE_INFINITY);
      arrZero.fill(0);
      let actual1: number = arrNInf.$_get(0);
      let expected1: number = arrZero.$_get(0);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0800
     * @tc.name testInt16ArrayFillTestSix080
     * @tc.desc Verify number fill(-0) coerces to 0 matching fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrNZero = new Int16Array([1, 1]);
      let arrZero = new Int16Array([1, 1]);
      arrNZero.fill(-0);
      arrZero.fill(0);
      let actual1: number = arrNZero.$_get(0);
      let expected1: number = arrZero.$_get(0);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0810
     * @tc.name testInt16ArrayFillTestSix081
     * @tc.desc Verify number fill(3.7) truncates to integer 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.fill(3.7);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0820
     * @tc.name testInt16ArrayFillTestSix082
     * @tc.desc Verify number fill(-3.7) truncates to integer -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.fill(-3.7);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0830
     * @tc.name testInt16ArrayFillTestSix083
     * @tc.desc Verify number fill(32768.9) truncates then wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.fill(32768.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0840
     * @tc.name testInt16ArrayFillTestSix084
     * @tc.desc Verify number fill(-32769.9) truncates then wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.fill(-32769.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0850
     * @tc.name testInt16ArrayFillTestSix085
     * @tc.desc Verify number fill overflow then E fill restores exact int16 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrN = new Int16Array([0]);
      let arrE = new Int16Array([0]);
      arrN.fill(32768);
      let valE: short = 32767 as short;
      arrE.fill(valE);
      let actual1: number = arrN.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arrE.$_get(0);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0860
     * @tc.name testInt16ArrayFillTestSix086
     * @tc.desc Verify number fill(98303) equals 32767 after wrap via fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.fill(32767 + 65536);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0870
     * @tc.name testInt16ArrayFillTestSix087
     * @tc.desc Verify number fill(-98304) equals -32768 after wrap via fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      arr.fill(-32768 - 65536);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0880
     * @tc.name testInt16ArrayFillTestSix088
     * @tc.desc Verify number fill then subarray sees filled truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0]);
      parent.fill(32768);
      let child = parent.subarray(1, 3);
      let actual1: number = child.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = child.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0890
     * @tc.name testInt16ArrayFillTestSix089
     * @tc.desc Verify number fill then $_set on subarray interacts with fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0]);
      parent.fill(32768);
      parent.$_set(2, 100);
      let child = parent.subarray(0, 2);
      let actual1: number = child.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = child.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0900
     * @tc.name testInt16ArrayFillTestSix090
     * @tc.desc Verify E fill all then number fill partial keeps non-covered E values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      let valE: short = 10 as short;
      arr.fill(valE);
      arr.fill(32768, 2, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 10 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(-32768);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(-32768);
      let actual5: number = arr.$_get(4);
      let expected5: number = 10 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0910
     * @tc.name testInt16ArrayFillTestSix091
     * @tc.desc Verify number fill all then E fill partial keeps non-covered number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      arr.fill(32768);
      let valE: short = 50 as short;
      arr.fill(valE, 1, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 50 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(-32768);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0920
     * @tc.name testInt16ArrayFillTestSix092
     * @tc.desc Verify alternating fill overloads leave values from last fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val1: short = 1 as short;
      let val2: short = 2 as short;
      arr.fill(val1);
      arr.fill(32768);
      arr.fill(val2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 2 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 2 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 2 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0930
     * @tc.name testInt16ArrayFillTestSix093
     * @tc.desc Verify number fill truncation then forEach sees truncated int16 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(32768);
      let count: int = 0;
      arr.forEach((value: number, index: int) => {
        expect(value).assertEqual(-32768);
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0940
     * @tc.name testInt16ArrayFillTestSix094
     * @tc.desc Verify E fill then forEach iterates original int16 filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = 100 as short;
      arr.fill(val);
      let count: int = 0;
      arr.forEach((value: number, index: int) => {
        expect(value).assertEqual(100 as short);
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0950
     * @tc.name testInt16ArrayFillTestSix095
     * @tc.desc Verify both fill overloads values iterator produce same valid sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE = new Int16Array([0, 0, 0]);
      let arrN = new Int16Array([0, 0, 0]);
      let val: short = 42 as short;
      arrE.fill(val);
      arrN.fill(42);
      let iterE = arrE.values();
      let iterN = arrN.values();
      let nextE = iterE.next();
      let nextN = iterN.next();
      while (!nextE.done && !nextN.done) {
        let actual1 = nextE.value;
        let expected1 = nextN.value;
        expect(actual1).assertEqual(expected1);
        nextE = iterE.next();
        nextN = iterN.next();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0960
     * @tc.name testInt16ArrayFillTestSix096
     * @tc.desc Verify number fill positive overflow then every equals truncated true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(32768);
      let result = arr.every((v: number): boolean => {
        return v === -32768;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0970
     * @tc.name testInt16ArrayFillTestSix097
     * @tc.desc Verify E fill then some finds filled value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = 77 as short;
      arr.fill(val);
      let result = arr.some((v: number): boolean => {
        return v === (77 as short);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0980
     * @tc.name testInt16ArrayFillTestSix098
     * @tc.desc Verify number fill NaN becomes 0 then indexOf(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.fill(Number.NaN);
      let idx = arr.indexOf(0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_SIX_0990
     * @tc.name testInt16ArrayFillTestSix099
     * @tc.desc Verify E fill then indexOf filled value returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestSix099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let val: short = 55 as short;
      arr.fill(val);
      let idx = arr.indexOf(55 as short);
      expect(idx).assertEqual(0);
    });
