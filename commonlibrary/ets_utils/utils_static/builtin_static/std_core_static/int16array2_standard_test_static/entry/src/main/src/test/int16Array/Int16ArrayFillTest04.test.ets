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

export default function int16ArrayFillTestFourTest(): void {
  describe('Int16ArrayFillTestFourTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0010
     * @tc.name testInt16ArrayFillTestFour001
     * @tc.desc Verify fill(50) with given arity fills expected range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      arr.fill(50 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 50 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 50 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0020
     * @tc.name testInt16ArrayFillTestFour002
     * @tc.desc Verify fill(200, 2) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      arr.fill(200 as short, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 20 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 200 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 200 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0030
     * @tc.name testInt16ArrayFillTestFour003
     * @tc.desc Verify fill(300, 1, 4) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55, 66]);
      arr.fill(300 as short, 1, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 300 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 300 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 55 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 66 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0040
     * @tc.name testInt16ArrayFillTestFour004
     * @tc.desc Verify fill(16384) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(16384 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 16384 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 16384 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 16384 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0050
     * @tc.name testInt16ArrayFillTestFour005
     * @tc.desc Verify fill(-16384) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500, 600, 700]);
      arr.fill(-16384 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = -16384 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = -16384 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = -16384 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0060
     * @tc.name testInt16ArrayFillTestFour006
     * @tc.desc Verify fill(32767, 2, 5) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      arr.fill(32767 as short, 2, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 32767 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 0 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0070
     * @tc.name testInt16ArrayFillTestFour007
     * @tc.desc Verify fill(-32768, 1, 5) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0, 0]);
      arr.fill(-32768 as short, 1, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 0 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(6);
      let expected5: number = 0 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0080
     * @tc.name testInt16ArrayFillTestFour008
     * @tc.desc Verify fill(0) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, 32767, 32767, 32767, 32767, 32767, 32767, 32767]);
      arr.fill(0 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(7);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0090
     * @tc.name testInt16ArrayFillTestFour009
     * @tc.desc Verify fill(-1) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500, 600]);
      arr.fill(-1 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = -1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = -1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0100
     * @tc.name testInt16ArrayFillTestFour010
     * @tc.desc Verify fill(fillVal) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let fillVal: int = 500;
      arr.fill(fillVal);
      let actual1: number = arr.$_get(0);
      let expected1: number = 500 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 500 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 500 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0110
     * @tc.name testInt16ArrayFillTestFour011
     * @tc.desc Verify fill(negVal) stores expected int16 value across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let negVal: int = -600;
      arr.fill(negVal);
      let actual1: number = arr.$_get(0);
      let expected1: number = -600 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -600 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -600 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0120
     * @tc.name testInt16ArrayFillTestFour012
     * @tc.desc Verify fill(32768) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(32768);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0130
     * @tc.name testInt16ArrayFillTestFour013
     * @tc.desc Verify fill(-32769) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0, 0]);
      arr.fill(-32769);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0140
     * @tc.name testInt16ArrayFillTestFour014
     * @tc.desc Verify fill(98304) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(98304);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0150
     * @tc.name testInt16ArrayFillTestFour015
     * @tc.desc Verify fill(131071) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.fill(131071);
      let actual1: number = arr.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0160
     * @tc.name testInt16ArrayFillTestFour016
     * @tc.desc Verify fill(-65537) int16 overflow wrap semantics; expect -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 1, 1, 1]);
      arr.fill(-65537);
      let actual1: number = arr.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0170
     * @tc.name testInt16ArrayFillTestFour017
     * @tc.desc Verify fill(-32770) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.fill(-32770);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32766 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 32766 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 32766 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0180
     * @tc.name testInt16ArrayFillTestFour018
     * @tc.desc Verify fill(v) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let v: number = 32767 + 2;
      arr.fill(v);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32767 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0190
     * @tc.name testInt16ArrayFillTestFour019
     * @tc.desc Verify fill(32768, 1, 3) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(32768, 1, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 40 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0200
     * @tc.name testInt16ArrayFillTestFour020
     * @tc.desc Verify fill(Number.NaN, 2, 5) converts Number.NaN to 0 in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500, 600]);
      arr.fill(Number.NaN, 2, 5);
      let actual1: number = arr.$_get(1);
      let expected1: number = 200 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 600 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0210
     * @tc.name testInt16ArrayFillTestFour021
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY, 1, 5) converts Number.POSITIVE_INFINITY to 0 in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(Number.POSITIVE_INFINITY, 1, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 60 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0220
     * @tc.name testInt16ArrayFillTestFour022
     * @tc.desc Verify fill(Number.NEGATIVE_INFINITY) converts Number.POSITIVE_INFINITY to 0 in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-10, -20, -30, -40, -50, -60, -70]);
      arr.fill(Number.NEGATIVE_INFINITY);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0230
     * @tc.name testInt16ArrayFillTestFour023
     * @tc.desc Verify fill(32767.3, 0, 4) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      arr.fill(32767.3, 0, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 0 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0240
     * @tc.name testInt16ArrayFillTestFour024
     * @tc.desc Verify fill(-32768.6) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.fill(-32768.6);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0250
     * @tc.name testInt16ArrayFillTestFour025
     * @tc.desc Verify fill(0.1) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 60, 70, 80, 90, 100]);
      arr.fill(0.1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0260
     * @tc.name testInt16ArrayFillTestFour026
     * @tc.desc Verify fill(-0.1) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55, 66, 77]);
      arr.fill(-0.1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0270
     * @tc.name testInt16ArrayFillTestFour027
     * @tc.desc Verify fill(99.9, 0, 3) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      arr.fill(99.9, 0, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0280
     * @tc.name testInt16ArrayFillTestFour028
     * @tc.desc Verify fill(-99.9, 2, 4) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      arr.fill(-99.9, 2, 4);
      let actual1: number = arr.$_get(1);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -99 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 0 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0290
     * @tc.name testInt16ArrayFillTestFour029
     * @tc.desc Verify fill(32767.999) truncates float toward int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      arr.fill(32767.999);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0300
     * @tc.name testInt16ArrayFillTestFour030
     * @tc.desc Verify fill(-0) stores +0 for negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7, 8]);
      arr.fill(-0 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(7);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0310
     * @tc.name testInt16ArrayFillTestFour031
     * @tc.desc Verify fill(-0) stores +0 for negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrA: Int16Array = new Int16Array([10, 10, 10, 10]);
      let arrB: Int16Array = new Int16Array([10, 10, 10, 10]);
      arrA.fill(-0 as short);
      arrB.fill(0 as short);
      let actual1: number = arrA.$_get(0);
      let expected1: number = arrB.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrA.$_get(1);
      let expected2: number = arrB.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrA.$_get(3);
      let expected3: number = arrB.$_get(3);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0320
     * @tc.name testInt16ArrayFillTestFour032
     * @tc.desc Verify fill(0x4000) with hex literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.fill(0x4000);
      let actual1: number = arr.$_get(0);
      let expected1: number = 16384 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 16384 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 16384 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0330
     * @tc.name testInt16ArrayFillTestFour033
     * @tc.desc Verify fill(0xC000) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.fill(0xc000);
      let actual1: number = arr.$_get(0);
      let expected1: number = -16384 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -16384 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -16384 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0340
     * @tc.name testInt16ArrayFillTestFour034
     * @tc.desc Verify fill(0x7FFF) with hex literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      arr.fill(0x7fff);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0350
     * @tc.name testInt16ArrayFillTestFour035
     * @tc.desc Verify fill(0x3FFF) with hex literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400]);
      arr.fill(0x3fff);
      let actual1: number = arr.$_get(0);
      let expected1: number = 16383 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 16383 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 16383 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0360
     * @tc.name testInt16ArrayFillTestFour036
     * @tc.desc Verify fill(250, 0) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.fill(250 as short, 0);
      let actual1: number = arr.$_get(0);
      let expected1: number = 250 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 250 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(7);
      let expected3: number = 250 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0370
     * @tc.name testInt16ArrayFillTestFour037
     * @tc.desc Verify fill(350, 3) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55, 66, 77]);
      arr.fill(350 as short, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 33 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 350 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(6);
      let expected4: number = 350 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0380
     * @tc.name testInt16ArrayFillTestFour038
     * @tc.desc Verify fill(400, 5) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(400 as short, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 400 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0390
     * @tc.name testInt16ArrayFillTestFour039
     * @tc.desc Verify fill(999, 7) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60, 70]);
      arr.fill(999 as short, 7);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = 70 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0400
     * @tc.name testInt16ArrayFillTestFour040
     * @tc.desc Verify fill(999, 9) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.fill(999 as short, 9);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 40 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(7);
      let expected3: number = 80 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0410
     * @tc.name testInt16ArrayFillTestFour041
     * @tc.desc Verify fill(700, pos) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let pos: int = 3;
      arr.fill(700 as short, pos);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 700 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 700 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0420
     * @tc.name testInt16ArrayFillTestFour042
     * @tc.desc Verify fill(150, -1) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(150 as short, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 150 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0430
     * @tc.name testInt16ArrayFillTestFour043
     * @tc.desc Verify fill(250, -3) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55, 66]);
      arr.fill(250 as short, -3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 33 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 250 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 250 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0440
     * @tc.name testInt16ArrayFillTestFour044
     * @tc.desc Verify fill(333, -6) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(333 as short, -6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 333 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 333 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 333 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0450
     * @tc.name testInt16ArrayFillTestFour045
     * @tc.desc Verify fill(444, -7) clamps negative start correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(444 as short, -7);
      let actual1: number = arr.$_get(0);
      let expected1: number = 444 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 444 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 444 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0460
     * @tc.name testInt16ArrayFillTestFour046
     * @tc.desc Verify fill(555, -50) clamps negative start correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.fill(555 as short, -50);
      let actual1: number = arr.$_get(0);
      let expected1: number = 555 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 555 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 555 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0470
     * @tc.name testInt16ArrayFillTestFour047
     * @tc.desc Verify fill(32768, -1) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(32768, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 40 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0480
     * @tc.name testInt16ArrayFillTestFour048
     * @tc.desc Verify fill(800, 0, 2) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7]);
      arr.fill(800 as short, 0, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 800 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 800 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 3 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(6);
      let expected4: number = 7 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0490
     * @tc.name testInt16ArrayFillTestFour049
     * @tc.desc Verify fill(900, 1, 4) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60, 70]);
      arr.fill(900 as short, 1, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 900 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 900 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 50 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0500
     * @tc.name testInt16ArrayFillTestFour050
     * @tc.desc Verify fill(1000, 0, 6) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(1000 as short, 0, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1000 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 1000 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 1000 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0510
     * @tc.name testInt16ArrayFillTestFour051
     * @tc.desc Verify fill(1100, 1, 5) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      arr.fill(1100 as short, 1, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 1100 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 1100 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 0 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0520
     * @tc.name testInt16ArrayFillTestFour052
     * @tc.desc Verify fill(1200, 2, eIdx) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      let eIdx: int = 4;
      arr.fill(1200 as short, 2, eIdx);
      let actual1: number = arr.$_get(1);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 1200 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 1200 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 0 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0530
     * @tc.name testInt16ArrayFillTestFour053
     * @tc.desc Verify fill(1300, 0, -1) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(1300 as short, 0, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1300 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 1300 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 60 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0540
     * @tc.name testInt16ArrayFillTestFour054
     * @tc.desc Verify fill(1400, 1, -2) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7, 8]);
      arr.fill(1400 as short, 1, -2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 1400 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 1400 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(6);
      let expected4: number = 7 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(7);
      let expected5: number = 8 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0550
     * @tc.name testInt16ArrayFillTestFour055
     * @tc.desc Verify fill(1500, 0, -3) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(1500 as short, 0, -3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1500 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 1500 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 4 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 6 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0560
     * @tc.name testInt16ArrayFillTestFour056
     * @tc.desc Verify fill(1600, 0, -7) is no-op when start>=end after clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60, 70]);
      arr.fill(1600 as short, 0, -7);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 40 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = 70 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0570
     * @tc.name testInt16ArrayFillTestFour057
     * @tc.desc Verify fill(1700, 2, 8) clamps negative start correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7]);
      arr.fill(1700 as short, 2, 8);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 2 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 1700 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(6);
      let expected4: number = 1700 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0580
     * @tc.name testInt16ArrayFillTestFour058
     * @tc.desc Verify fill(1800, 0, 200) clamps negative start correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.fill(1800 as short, 0, 200);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1800 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 1800 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 1800 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0590
     * @tc.name testInt16ArrayFillTestFour059
     * @tc.desc Verify fill(1900, 0, -8) is no-op when start>=end after clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7]);
      arr.fill(1900 as short, 0, -8);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 5 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(6);
      let expected3: number = 7 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0600
     * @tc.name testInt16ArrayFillTestFour060
     * @tc.desc Verify fill(2000, 3, 3) is no-op when start>=end after clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(2000 as short, 3, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 30 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 40 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 60 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0610
     * @tc.name testInt16ArrayFillTestFour061
     * @tc.desc Verify fill(2100, 4, 2) is no-op when start>=end after clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(2100 as short, 4, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 20 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 60 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0620
     * @tc.name testInt16ArrayFillTestFour062
     * @tc.desc Verify fill(2200, -1, -3) is no-op when start>=end after clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(2200 as short, -1, -3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 40 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 60 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0630
     * @tc.name testInt16ArrayFillTestFour063
     * @tc.desc Verify fill(2300, -4, -1) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55, 66]);
      arr.fill(2300 as short, -4, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 22 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 2300 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 2300 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 66 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0640
     * @tc.name testInt16ArrayFillTestFour064
     * @tc.desc Verify fill(2400, -5, -2) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(2400 as short, -5, -2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 2400 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 2400 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 5 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 6 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0650
     * @tc.name testInt16ArrayFillTestFour065
     * @tc.desc Verify fill(2500, -6, -1) respects start boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(2500 as short, -6, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 2500 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 2500 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 60 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0660
     * @tc.name testInt16ArrayFillTestFour066
     * @tc.desc Verify fill(3000) on empty Int16Array returns this and length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.fill(3000 as short);
      let actual1: int = arr.length;
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0670
     * @tc.name testInt16ArrayFillTestFour067
     * @tc.desc Verify fill(3100, 0, 0) on empty Int16Array returns this and length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.fill(3100 as short, 0, 0);
      let actual1: int = arr.length;
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0680
     * @tc.name testInt16ArrayFillTestFour068
     * @tc.desc Verify fill(32768) on single-element Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      arr.fill(32768);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0690
     * @tc.name testInt16ArrayFillTestFour069
     * @tc.desc Verify fill(3200, 0, 1) on single-element Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100]);
      arr.fill(3200 as short, 0, 1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 3200 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0700
     * @tc.name testInt16ArrayFillTestFour070
     * @tc.desc Verify fill(3300, 4, 8) semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      arr.fill(3300 as short, 4, 8);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 3300 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(7);
      let expected4: number = 3300 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(8);
      let expected5: number = 8 as short;
      expect(actual5).assertEqual(expected5);
      let actual6: number = arr.$_get(9);
      let expected6: number = 9 as short;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0710
     * @tc.name testInt16ArrayFillTestFour071
     * @tc.desc Verify fill(3400) then loop confirms all elements filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
      arr.fill(3400 as short);
      let matched: int = 0;
      let i: int = 0;
      while (i < arr.length) {
        if (arr.$_get(i) === 3400) {
          matched = matched + 1;
        }
        i = i + 1;
      }
      expect(matched).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0720
     * @tc.name testInt16ArrayFillTestFour072
     * @tc.desc Verify fill(100) returns same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let ret: Int16Array = arr.fill(100 as short);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0730
     * @tc.name testInt16ArrayFillTestFour073
     * @tc.desc Verify fill(200, 1, 3) semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let ref: Int16Array = arr.fill(200 as short, 1, 3);
      ref.$_set(2, 999);
      let actual1: number = arr.$_get(2);
      let expected1: number = 999 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0740
     * @tc.name testInt16ArrayFillTestFour074
     * @tc.desc Verify chained fill() calls overwrite with last fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      arr.fill(111).fill(222);
      let actual1: number = arr.$_get(0);
      let expected1: number = 222 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 222 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 222 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0750
     * @tc.name testInt16ArrayFillTestFour075
     * @tc.desc Verify fill(25 as short, 0, 2) chain sort; expect sorted 10/25/25/30/40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 20, 40, 10, 30]);
      arr.fill(25 as short, 0, 2).sort();
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 25 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 25 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 30 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: number = 40 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0760
     * @tc.name testInt16ArrayFillTestFour076
     * @tc.desc Verify chained fill() calls overwrite with last fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.fill(99 as short, 0, 3).reverse();
      let actual1: number = arr.$_get(0);
      let expected1: number = 5 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 4 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 99 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 99 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: number = 99 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0770
     * @tc.name testInt16ArrayFillTestFour077
     * @tc.desc Verify chained fill() calls overwrite with last fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0, 0, 0]);
      arr
        .fill(1 as short, 0, 2)
        .fill(2, 2, 5)
        .fill(3, 5, 8);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 2 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 2 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 3 as short;
      expect(actual5).assertEqual(expected5);
      let actual6: number = arr.$_get(7);
      let expected6: number = 3 as short;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0780
     * @tc.name testInt16ArrayFillTestFour078
     * @tc.desc Verify fill(99, 2, 5) keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let origLen: int = arr.length;
      arr.fill(99 as short, 2, 5);
      let actual1: int = arr.length;
      let expected1: number = origLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0790
     * @tc.name testInt16ArrayFillTestFour079
     * @tc.desc Verify fill(77) keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let origByteLen: int = arr.byteLength;
      arr.fill(77 as short);
      let actual1: int = arr.byteLength;
      let expected1: number = origByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0800
     * @tc.name testInt16ArrayFillTestFour080
     * @tc.desc Verify fill(32768) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0, 0]);
      arr.fill(32768);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0810
     * @tc.name testInt16ArrayFillTestFour081
     * @tc.desc Verify fill(65535) byte layout via Int8Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(65535);
      let bytes: Int8Array = new Int8Array(buf);
      let actual1: number = bytes.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = bytes.$_get(1);
      let expected2: number = -1 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0820
     * @tc.name testInt16ArrayFillTestFour082
     * @tc.desc Verify fill(0x7FFF) byte layout via Int8Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(0x7fff);
      let bytes: Int8Array = new Int8Array(buf);
      let actual1: number = bytes.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = bytes.$_get(1);
      let expected2: number = 127 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0830
     * @tc.name testInt16ArrayFillTestFour083
     * @tc.desc Verify fill(32768) int16 overflow wrap semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(32768);
      let view: Int16Array = new Int16Array(buf);
      let actual1: number = view.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = view.$_get(1);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0840
     * @tc.name testInt16ArrayFillTestFour084
     * @tc.desc Verify fill(32768, 2, 5) semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500, 600]);
      arr.fill(32768, 2, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 100 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 200 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = -32768 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 600 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FOUR_0850
     * @tc.name testInt16ArrayFillTestFour085
     * @tc.desc Verify fill(Number.NaN, 1, 4) then loop confirms all elements filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50, 60]);
      arr.fill(Number.NaN, 1, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 50 as short;
      expect(actual4).assertEqual(expected4);
    });
