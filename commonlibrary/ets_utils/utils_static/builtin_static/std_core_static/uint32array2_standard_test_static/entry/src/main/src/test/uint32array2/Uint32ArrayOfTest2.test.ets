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

export default function uint32ArrayOfTwoTest(): void {
  describe('Uint32ArrayOfTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0100
     * @tc.name testUint32ArrayOfTwo001
     * @tc.desc Verify empty of() join() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of();
      expect(r.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0200
     * @tc.name testUint32ArrayOfTwo002
     * @tc.desc Verify empty of() at(0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of();
      expect(r.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0300
     * @tc.name testUint32ArrayOfTwo003
     * @tc.desc Verify of(7) length is 1 element is 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(7);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0400
     * @tc.name testUint32ArrayOfTwo004
     * @tc.desc Verify of(8, 9) length is 2 last element is 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(8, 9);
      expect(r.length).assertEqual(2);
      expect(r.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0500
     * @tc.name testUint32ArrayOfTwo005
     * @tc.desc Verify of(10, 20, 30) length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(10, 20, 30);
      expect(r.length).assertEqual(3);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0600
     * @tc.name testUint32ArrayOfTwo006
     * @tc.desc Verify of(5, 6, 7, 8, 9) length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(5, 6, 7, 8, 9);
      expect(r.length).assertEqual(5);
      expect(r.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0700
     * @tc.name testUint32ArrayOfTwo007
     * @tc.desc Verify of() with 10 args length is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60, 70, 80, 90, 100);
      expect(r.length).assertEqual(10);
      expect(r.$_get(9)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0800
     * @tc.name testUint32ArrayOfTwo008
     * @tc.desc Verify of() with 15 args length is 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
      expect(r.length).assertEqual(15);
      expect(r.$_get(14)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_0900
     * @tc.name testUint32ArrayOfTwo009
     * @tc.desc Verify of(0) sets element to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1000
     * @tc.name testUint32ArrayOfTwo010
     * @tc.desc Verify of(2147483646) preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(2147483646);
      expect(r.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1100
     * @tc.name testUint32ArrayOfTwo011
     * @tc.desc Verify of(-1) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(-1);
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1200
     * @tc.name testUint32ArrayOfTwo012
     * @tc.desc Verify of(3.99) truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(3.99);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1300
     * @tc.name testUint32ArrayOfTwo013
     * @tc.desc Verify of(0.99) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0.99);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1400
     * @tc.name testUint32ArrayOfTwo014
     * @tc.desc Verify of(-0.5) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(-0.5);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1500
     * @tc.name testUint32ArrayOfTwo015
     * @tc.desc Verify of(2147483648.5) truncates to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(2147483648.5);
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1600
     * @tc.name testUint32ArrayOfTwo016
     * @tc.desc Verify of(1.5e9) equals 1500000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1.5e9);
      expect(r.$_get(0)).assertEqual(1500000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1700
     * @tc.name testUint32ArrayOfTwo017
     * @tc.desc Verify of(4294967295.5) truncates to max uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(4294967295.5);
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1800
     * @tc.name testUint32ArrayOfTwo018
     * @tc.desc Verify of(6442450944) wraps to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(6442450944);
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_1900
     * @tc.name testUint32ArrayOfTwo019
     * @tc.desc Verify of(0b1) binary literal equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0b1);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2000
     * @tc.name testUint32ArrayOfTwo020
     * @tc.desc Verify of(4294967294) preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(4294967294);
      expect(r.$_get(0)).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2100
     * @tc.name testUint32ArrayOfTwo021
     * @tc.desc Verify of(4294967296, -1) wraps to [0, 4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(4294967296, -1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2200
     * @tc.name testUint32ArrayOfTwo022
     * @tc.desc Verify of(0xFFFFFFFF, 0x100000000) wraps to [4294967295, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0xFFFFFFFF, 0x100000000);
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2300
     * @tc.name testUint32ArrayOfTwo023
     * @tc.desc Verify of(0, max, 2147483648) preserves boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0, 4294967295, 2147483648);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(4294967295);
      expect(r.$_get(2)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2400
     * @tc.name testUint32ArrayOfTwo024
     * @tc.desc Verify of(0x80000000, 0x7FFFFFFF) preserves boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0x80000000, 0x7FFFFFFF);
      expect(r.$_get(0)).assertEqual(2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2500
     * @tc.name testUint32ArrayOfTwo025
     * @tc.desc Verify of(1e10, 1.5e9) wraps and preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1e10, 1.5e9);
      expect(r.$_get(0)).assertEqual(1410065408);
      expect(r.$_get(1)).assertEqual(1500000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2600
     * @tc.name testUint32ArrayOfTwo026
     * @tc.desc Verify of() with three max values sets all elements to max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(4294967295, 4294967295, 4294967295);
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(4294967295);
      expect(r.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2700
     * @tc.name testUint32ArrayOfTwo027
     * @tc.desc Verify of() with large positive and negative wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(9007199254740991, -9007199254740991);
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2800
     * @tc.name testUint32ArrayOfTwo028
     * @tc.desc Verify of() with fractional values all truncate to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(0.5, 0.99, -0.5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_2900
     * @tc.name testUint32ArrayOfTwo029
     * @tc.desc Verify of() with values above 2^32 wrap correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(8589934592, 4294967296, 12849239040);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(4259304448);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3000
     * @tc.name testUint32ArrayOfTwo030
     * @tc.desc Verify of(4294967297, 4294967298) wraps to [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(4294967297, 4294967298);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3100
     * @tc.name testUint32ArrayOfTwo031
     * @tc.desc Verify of(-4294967295, -4294967296) wraps to [1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(-4294967295, -4294967296);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3200
     * @tc.name testUint32ArrayOfTwo032
     * @tc.desc Verify of(1, 2, 3) at(-1) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(r.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3300
     * @tc.name testUint32ArrayOfTwo033
     * @tc.desc Verify of(1, 2, 3) join('') returns '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(r.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3400
     * @tc.name testUint32ArrayOfTwo034
     * @tc.desc Verify of(1, 2, 3) at(3) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(r.at(3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3500
     * @tc.name testUint32ArrayOfTwo035
     * @tc.desc Verify of(1, 2, 3) $_get(5) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        r.$_get(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3600
     * @tc.name testUint32ArrayOfTwo036
     * @tc.desc Verify of(1, 2, 3) for-of sum equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      let sum: number = 0;
      for (const v of r) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3700
     * @tc.name testUint32ArrayOfTwo037
     * @tc.desc Verify of() creates independent buffers per call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint32Array = Uint32Array.of(1, 2, 3);
      const b: Uint32Array = Uint32Array.of(1, 2, 3);
      a.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(999);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3800
     * @tc.name testUint32ArrayOfTwo038
     * @tc.desc Verify of(1) then $_set updates element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1);
      r.$_set(0, 999);
      expect(r.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_3900
     * @tc.name testUint32ArrayOfTwo039
     * @tc.desc Verify of(1, 2, 3) fill(0) fills all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      r.fill(0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4000
     * @tc.name testUint32ArrayOfTwo040
     * @tc.desc Verify of(1, 2, 3, 4) subarray shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const v: Uint32Array = r.subarray(1, 3);
      v.$_set(0, 99);
      expect(r.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4100
     * @tc.name testUint32ArrayOfTwo041
     * @tc.desc Verify of(1, 2, 3) slice returns independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      const c: Uint32Array = r.slice(0);
      c.$_set(0, 99);
      expect(r.$_get(0)).assertEqual(1);
      expect(c.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4200
     * @tc.name testUint32ArrayOfTwo042
     * @tc.desc Verify of(1, 2, 3) indexOf(2) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(r.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4300
     * @tc.name testUint32ArrayOfTwo043
     * @tc.desc Verify of(1, 2, 3) includes checks presence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(r.includes(2)).assertTrue();
      expect(r.includes(9)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4400
     * @tc.name testUint32ArrayOfTwo044
     * @tc.desc Verify of() copyWithin(0, 3, 5) copies tail to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      r.copyWithin(0, 3, 5);
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4500
     * @tc.name testUint32ArrayOfTwo045
     * @tc.desc Verify of(2, 2, 2) lastIndexOf(2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of(2, 2, 2);
      expect(r.lastIndexOf(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4600
     * @tc.name testUint32ArrayOfTwo046
     * @tc.desc Verify of items equals new Uint32Array from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint32Array = Uint32Array.of(1, 2, 3);
      const b: Uint32Array = new Uint32Array([1, 2, 3]);
      expect(a.length).assertEqual(b.length);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OF_TWO_4700
     * @tc.name testUint32ArrayOfTwo047
     * @tc.desc Verify empty of byteLength 0 and buffer byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Uint32Array = Uint32Array.of();
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      expect(r.buffer.byteLength).assertEqual(0);
    });

  });
}
