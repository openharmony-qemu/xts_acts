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

export default function int16ArrayWithTestTwoTest(): void {
  describe('Int16ArrayWithTestTwoTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0100
     * @tc.name testInt16ArrayWithTestTwo001
     * @tc.desc Verify with(1, 99) stores 99 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      let result: Int16Array = arr.with(1, 99);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0200
     * @tc.name testInt16ArrayWithTestTwo002
     * @tc.desc Verify with(-2, 99) stores 99 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      let result: Int16Array = arr.with(-2, 99);
      let actual1: number = result.$_get(3);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0300
     * @tc.name testInt16ArrayWithTestTwo003
     * @tc.desc Verify with(4, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(4, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0400
     * @tc.name testInt16ArrayWithTestTwo004
     * @tc.desc Verify with(8, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(8, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0500
     * @tc.name testInt16ArrayWithTestTwo005
     * @tc.desc Verify with(100, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(100, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0600
     * @tc.name testInt16ArrayWithTestTwo006
     * @tc.desc Verify with(1000000, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(1000000, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0700
     * @tc.name testInt16ArrayWithTestTwo007
     * @tc.desc Verify with(-8, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(-8, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0800
     * @tc.name testInt16ArrayWithTestTwo008
     * @tc.desc Verify with(-100, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(-100, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_0900
     * @tc.name testInt16ArrayWithTestTwo009
     * @tc.desc Verify with(-1000000, 99) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.with(-1000000, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1000
     * @tc.name testInt16ArrayWithTestTwo010
     * @tc.desc Verify with(0, 0) stores 0 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 0);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1100
     * @tc.name testInt16ArrayWithTestTwo011
     * @tc.desc Verify with(0, 1) stores 1 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 1);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1200
     * @tc.name testInt16ArrayWithTestTwo012
     * @tc.desc Verify with(0, -1) stores -1 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -1);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1300
     * @tc.name testInt16ArrayWithTestTwo013
     * @tc.desc Verify with(0, 32767) stores 32767 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 32767);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1400
     * @tc.name testInt16ArrayWithTestTwo014
     * @tc.desc Verify with(0, -32768) stores -32768 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -32768);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1500
     * @tc.name testInt16ArrayWithTestTwo015
     * @tc.desc Verify with(0, 3.7) truncates float and stores 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 3.7);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1600
     * @tc.name testInt16ArrayWithTestTwo016
     * @tc.desc Verify with(0, 0.1) truncates float and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 0.1);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1700
     * @tc.name testInt16ArrayWithTestTwo017
     * @tc.desc Verify with(0, 32766.9) truncates float and stores 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 32766.9);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1800
     * @tc.name testInt16ArrayWithTestTwo018
     * @tc.desc Verify with(0, -3.7) truncates float and stores -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -3.7);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_1900
     * @tc.name testInt16ArrayWithTestTwo019
     * @tc.desc Verify with(0, -0.1) truncates float and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -0.1);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2000
     * @tc.name testInt16ArrayWithTestTwo020
     * @tc.desc Verify with(0, -32767.1) truncates float and stores -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -32767.1);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2100
     * @tc.name testInt16ArrayWithTestTwo021
     * @tc.desc Verify with(0, 0.5) truncates float and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 0.5);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2200
     * @tc.name testInt16ArrayWithTestTwo022
     * @tc.desc Verify with(0, Double.NaN) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, Double.NaN);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2300
     * @tc.name testInt16ArrayWithTestTwo023
     * @tc.desc Verify with(0, Double.POSITIVE_INFINITY) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, Double.POSITIVE_INFINITY);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2400
     * @tc.name testInt16ArrayWithTestTwo024
     * @tc.desc Verify with(0, Double.NEGATIVE_INFINITY) stores 0 after ToInt16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, Double.NEGATIVE_INFINITY);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2500
     * @tc.name testInt16ArrayWithTestTwo025
     * @tc.desc Verify with(0, 32768) wraps to -32768 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 32768);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2600
     * @tc.name testInt16ArrayWithTestTwo026
     * @tc.desc Verify with(0, -32769) wraps to 32767 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -32769);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2700
     * @tc.name testInt16ArrayWithTestTwo027
     * @tc.desc Verify with(0, 32769) wraps to -32767 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 32769);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2800
     * @tc.name testInt16ArrayWithTestTwo028
     * @tc.desc Verify with(0, -32770) wraps to 32766 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -32770);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_2900
     * @tc.name testInt16ArrayWithTestTwo029
     * @tc.desc Verify with(0, 65535) wraps to -1 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 65535);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3000
     * @tc.name testInt16ArrayWithTestTwo030
     * @tc.desc Verify with(0, 65536) wraps to 0 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 65536);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3100
     * @tc.name testInt16ArrayWithTestTwo031
     * @tc.desc Verify with(0, 65537) wraps to 1 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 65537);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3200
     * @tc.name testInt16ArrayWithTestTwo032
     * @tc.desc Verify with(0, -65535) wraps to 1 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -65535);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3300
     * @tc.name testInt16ArrayWithTestTwo033
     * @tc.desc Verify with(0, -65536) wraps to 0 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -65536);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3400
     * @tc.name testInt16ArrayWithTestTwo034
     * @tc.desc Verify with(0, -65537) wraps to -1 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -65537);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3500
     * @tc.name testInt16ArrayWithTestTwo035
     * @tc.desc Verify with(0, 100000) wraps to -31072 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 100000);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-31072);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3600
     * @tc.name testInt16ArrayWithTestTwo036
     * @tc.desc Verify with(0, 200000) wraps to 3392 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 200000);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(3392);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3700
     * @tc.name testInt16ArrayWithTestTwo037
     * @tc.desc Verify with(0, 1000000) wraps to 16960 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 1000000);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(16960);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3800
     * @tc.name testInt16ArrayWithTestTwo038
     * @tc.desc Verify with(0, -100000) wraps to 31072 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -100000);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(31072);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_3900
     * @tc.name testInt16ArrayWithTestTwo039
     * @tc.desc Verify with(0, -200000) wraps to -3392 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -200000);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-3392);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4000
     * @tc.name testInt16ArrayWithTestTwo040
     * @tc.desc Verify with(0, 5e-324) stores 0 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 5e-324);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4100
     * @tc.name testInt16ArrayWithTestTwo041
     * @tc.desc Verify with(0, v) stores 99 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let v: number = 99.9;
      let result: Int16Array = arr.with(0, v);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4200
     * @tc.name testInt16ArrayWithTestTwo042
     * @tc.desc Verify with(0, 99) length and first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(3);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4300
     * @tc.name testInt16ArrayWithTestTwo043
     * @tc.desc Verify with(0, 99) return array length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4400
     * @tc.name testInt16ArrayWithTestTwo044
     * @tc.desc Verify with(1, 99) stores 10 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(1, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4500
     * @tc.name testInt16ArrayWithTestTwo045
     * @tc.desc Verify original array element unchanged after with(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      arr.with(0, 99);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4600
     * @tc.name testInt16ArrayWithTestTwo046
     * @tc.desc Verify mutating with result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 99);
      result.$_set(1, 888);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4700
     * @tc.name testInt16ArrayWithTestTwo047
     * @tc.desc Verify mutating original array does not affect prior with result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 99);
      arr.$_set(1, 777);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4800
     * @tc.name testInt16ArrayWithTestTwo048
     * @tc.desc Verify with(0, 3.5) truncates float and stores 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 3.5);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_4900
     * @tc.name testInt16ArrayWithTestTwo049
     * @tc.desc Verify with(0, -3.5) truncates float and stores -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, -3.5);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5000
     * @tc.name testInt16ArrayWithTestTwo050
     * @tc.desc Verify with(0, 131071) wraps to -1 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 131071);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5100
     * @tc.name testInt16ArrayWithTestTwo051
     * @tc.desc Verify with(0, 131072) wraps to 0 under Int16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: Int16Array = arr.with(0, 131072);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5200
     * @tc.name testInt16ArrayWithTestTwo052
     * @tc.desc Verify with(-1, 0) stores 0 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(-1, 0);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5300
     * @tc.name testInt16ArrayWithTestTwo053
     * @tc.desc Verify with(0, 10) stores 10 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 10);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5400
     * @tc.name testInt16ArrayWithTestTwo054
     * @tc.desc Verify chained with calls compose non-mutating replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 11).with(1, 22);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5500
     * @tc.name testInt16ArrayWithTestTwo055
     * @tc.desc Verify chained with calls compose non-mutating replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.with(0, 11).with(0, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5600
     * @tc.name testInt16ArrayWithTestTwo056
     * @tc.desc Verify with(0, -32768) on all-MAX Int16Array keeps other MAX elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, 32767, 32767]);
      let result: Int16Array = arr.with(0, -32768);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5700
     * @tc.name testInt16ArrayWithTestTwo057
     * @tc.desc Verify with(0, 32767) on all-MIN Int16Array keeps other MIN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
      let result: Int16Array = arr.with(0, 32767);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_TWO_5800
     * @tc.name testInt16ArrayWithTestTwo058
     * @tc.desc Verify with(0, 32767) on all-zero Int16Array keeps other zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      let result: Int16Array = arr.with(0, 32767);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(0);
    });
  });
}
