'use static'
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayIncludesTest2(): void {
  describe('Uint32ArrayIncludesTest2', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0100
     * @tc.name testUint32ArrayIncludesPartTwo001
     * @tc.desc Verify includes typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.includes(99);
      expect(r).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0200
     * @tc.name testUint32ArrayIncludesPartTwo002
     * @tc.desc Verify typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7);
      const r = values.includes(8);
      expect(r).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0300
     * @tc.name testUint32ArrayIncludesPartTwo003
     * @tc.desc Verify fromIndex=0 typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.includes(4, 0);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0400
     * @tc.name testUint32ArrayIncludesPartTwo004
     * @tc.desc Verify fromIndex typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.includes(6, -1);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0500
     * @tc.name testUint32ArrayIncludesPartTwo005
     * @tc.desc Verify fromIndex=length typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.includes(4, 3);
      expect(r).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0600
     * @tc.name testUint32ArrayIncludesPartTwo006
     * @tc.desc Verify fromIndex=length+1 typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.includes(4, 4);
      expect(r).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0700
     * @tc.name testUint32ArrayIncludesPartTwo007
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r = values.includes(20);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0800
     * @tc.name testUint32ArrayIncludesPartTwo008
     * @tc.desc Verify false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r = values.includes(99);
      expect(r).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_0900
     * @tc.name testUint32ArrayIncludesPartTwo009
     * @tc.desc Verify assertTrue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r = values.includes(30);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1000
     * @tc.name testUint32ArrayIncludesPartTwo010
     * @tc.desc Verify includes 30 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r = values.includes(30);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1100
     * @tc.name testUint32ArrayIncludesPartTwo011
     * @tc.desc Verify includes 99 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r = values.includes(99);
      expect(r).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1200
     * @tc.name testUint32ArrayIncludesPartTwo012
     * @tc.desc Verify includes(3) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 3, 3);
      expect(values.includes(3)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1300
     * @tc.name testUint32ArrayIncludesPartTwo013
     * @tc.desc Verify fromIndex=1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(5, 1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1400
     * @tc.name testUint32ArrayIncludesPartTwo014
     * @tc.desc Verify fromIndex=-2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(5, -2)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1500
     * @tc.name testUint32ArrayIncludesPartTwo015
     * @tc.desc Verify fromIndex=-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(6, -1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1600
     * @tc.name testUint32ArrayIncludesPartTwo016
     * @tc.desc Verify includes(2147483647) int32 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483647);
      expect(values.includes(2147483647)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1700
     * @tc.name testUint32ArrayIncludesPartTwo017
     * @tc.desc Verify includes(2147483648) int32 +1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483648);
      expect(values.includes(2147483648)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1800
     * @tc.name testUint32ArrayIncludesPartTwo018
     * @tc.desc Verify includes(3.0) SameValueZero 3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3);
      expect(values.includes(3.0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_1900
     * @tc.name testUint32ArrayIncludesPartTwo019
     * @tc.desc Verify fromIndex=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(4, 0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2000
     * @tc.name testUint32ArrayIncludesPartTwo020
     * @tc.desc Verify includes(200) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(100, 200, 300, 400);
      expect(values.includes(200)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2100
     * @tc.name testUint32ArrayIncludesPartTwo021
     * @tc.desc Verify includes(0) 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(values.includes(0)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2200
     * @tc.name testUint32ArrayIncludesPartTwo022
     * @tc.desc Verify includes(4294967295) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 1, 2);
      expect(values.includes(4294967295)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2300
     * @tc.name testUint32ArrayIncludesPartTwo023
     * @tc.desc Verify searchElement=-1 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      expect(values.includes(-1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2400
     * @tc.name testUint32ArrayIncludesPartTwo024
     * @tc.desc Verify includes(4294967296) not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0);
      expect(values.includes(4294967296)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2500
     * @tc.name testUint32ArrayIncludesPartTwo025
     * @tc.desc Verify includes(Number.POSITIVE_INFINITY) uint32 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0);
      expect(values.includes(Number.POSITIVE_INFINITY)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2600
     * @tc.name testUint32ArrayIncludesPartTwo026
     * @tc.desc Verify includes(Number.NaN) uint32 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0);
      expect(values.includes(Number.NaN)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2700
     * @tc.name testUint32ArrayIncludesPartTwo027
     * @tc.desc Verify includes(3.5) 3 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3);
      expect(values.includes(3.5)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2800
     * @tc.name testUint32ArrayIncludesPartTwo028
     * @tc.desc Verify fromIndex=2 includes(5) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(5, 2)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_2900
     * @tc.name testUint32ArrayIncludesPartTwo029
     * @tc.desc Verify fromIndex includes(5) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(5, 1000000)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3000
     * @tc.name testUint32ArrayIncludesPartTwo030
     * @tc.desc Verify fromIndex=-1 1 includes(5) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.includes(5, -1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3100
     * @tc.name testUint32ArrayIncludesPartTwo031
     * @tc.desc Verify includes(4) 4 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 6, 7);
      expect(values.includes(4)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3200
     * @tc.name testUint32ArrayIncludesPartTwo032
     * @tc.desc Verify includes(2147483647) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0);
      expect(values.includes(2147483647)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3300
     * @tc.name testUint32ArrayIncludesPartTwo033
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.length;
      values.includes(5);
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3400
     * @tc.name testUint32ArrayIncludesPartTwo034
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      const before: number = values.length;
      const result: boolean = values.includes(0);
      expect(result).assertFalse();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3500
     * @tc.name testUint32ArrayIncludesPartTwo035
     * @tc.desc Verify uint32 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      const before: number = values.length;
      const result: boolean = values.includes(4294967295);
      expect(result).assertTrue();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3600
     * @tc.name testUint32ArrayIncludesPartTwo036
     * @tc.desc Verify fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.length;
      const result: boolean = values.includes(5, 1);
      expect(result).assertTrue();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3700
     * @tc.name testUint32ArrayIncludesPartTwo037
     * @tc.desc Verify fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.length;
      const result: boolean = values.includes(6, -1);
      expect(result).assertTrue();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3800
     * @tc.name testUint32ArrayIncludesPartTwo038
     * @tc.desc Verify fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.length;
      const result: boolean = values.includes(5, 1000000);
      expect(result).assertFalse();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_3900
     * @tc.name testUint32ArrayIncludesPartTwo039
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(100, 200, 300, 400);
      const before: number = values.length;
      const result: boolean = values.includes(200);
      expect(result).assertTrue();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4000
     * @tc.name testUint32ArrayIncludesPartTwo040
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 3, 3);
      const before: number = values.length;
      const result: boolean = values.includes(3);
      expect(result).assertTrue();
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4100
     * @tc.name testUint32ArrayIncludesPartTwo041
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      const before: number = values.byteLength;
      const result: boolean = values.includes(0);
      expect(result).assertFalse();
      expect(values.byteLength).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4200
     * @tc.name testUint32ArrayIncludesPartTwo042
     * @tc.desc Verify uint32 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      const before: number = values.byteLength;
      const result: boolean = values.includes(4294967295);
      expect(result).assertTrue();
      expect(values.byteLength).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4300
     * @tc.name testUint32ArrayIncludesPartTwo043
     * @tc.desc Verify fromIndex byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.byteLength;
      const result: boolean = values.includes(5, 1);
      expect(result).assertTrue();
      expect(values.byteLength).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4400
     * @tc.name testUint32ArrayIncludesPartTwo044
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(100, 200, 300, 400);
      const before: number = values.byteLength;
      const result: boolean = values.includes(200);
      expect(result).assertTrue();
      expect(values.byteLength).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4500
     * @tc.name testUint32ArrayIncludesPartTwo045
     * @tc.desc Verify buffer includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const values: Uint32Array = new Uint32Array(buf, 8, 3);
      values[0] = 4; values[1] = 5; values[2] = 6;
      const before: number = values.byteOffset;
      const result: boolean = values.includes(5);
      expect(result).assertTrue();
      expect(values.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4600
     * @tc.name testUint32ArrayIncludesPartTwo046
     * @tc.desc Verify buffer includes byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const values: Uint32Array = new Uint32Array(buf, 8, 3);
      values[0] = 4; values[1] = 5; values[2] = 6;
      const result: boolean = values.includes(5);
      expect(result).assertTrue();
      expect(values.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4700
     * @tc.name testUint32ArrayIncludesPartTwo047
     * @tc.desc Verify fromIndex byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.byteOffset;
      const result: boolean = values.includes(5, 1);
      expect(result).assertTrue();
      expect(values.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4800
     * @tc.name testUint32ArrayIncludesPartTwo048
     * @tc.desc Verify fromIndex byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const before: number = values.byteOffset;
      const result: boolean = values.includes(6, -1);
      expect(result).assertTrue();
      expect(values.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_4900
     * @tc.name testUint32ArrayIncludesPartTwo049
     * @tc.desc Verify fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const result: boolean = values.includes(5, 1);
      expect(result).assertTrue();
      expect(values[1]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5000
     * @tc.name testUint32ArrayIncludesPartTwo050
     * @tc.desc Verify fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const result: boolean = values.includes(6, -1);
      expect(result).assertTrue();
      expect(values[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5100
     * @tc.name testUint32ArrayIncludesPartTwo051
     * @tc.desc Verify fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      values.includes(5, 1000000);
      expect(values[0]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5200
     * @tc.name testUint32ArrayIncludesPartTwo052
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 3, 3);
      values.includes(3);
      expect(values[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5300
     * @tc.name testUint32ArrayIncludesPartTwo053
     * @tc.desc Verify includes buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      view.includes(200);
      expect(parent[0]).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5400
     * @tc.name testUint32ArrayIncludesPartTwo054
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      expect(view.includes(100)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5500
     * @tc.name testUint32ArrayIncludesPartTwo055
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      const before: number = view.length;
      const result: boolean = view.includes(200);
      expect(result).assertTrue();
      expect(view.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5600
     * @tc.name testUint32ArrayIncludesPartTwo056
     * @tc.desc Verify includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      const before: number = view.byteOffset;
      const result: boolean = view.includes(200);
      expect(result).assertTrue();
      expect(view.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5700
     * @tc.name testUint32ArrayIncludesPartTwo057
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      const before: number = parent.length;
      view.includes(200);
      expect(parent.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5800
     * @tc.name testUint32ArrayIncludesPartTwo058
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      const before: number = view.byteLength;
      view.includes(200);
      expect(view.byteLength).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTTWO_5900
     * @tc.name testUint32ArrayIncludesPartTwo059
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent[0] = 100; parent[1] = 200; parent[2] = 300; parent[3] = 400;
      const view: Uint32Array = parent.subarray(1, 3);
      const before: number = parent.byteLength;
      view.includes(200);
      expect(parent.byteLength).assertEqual(before);
    });

  });
}
