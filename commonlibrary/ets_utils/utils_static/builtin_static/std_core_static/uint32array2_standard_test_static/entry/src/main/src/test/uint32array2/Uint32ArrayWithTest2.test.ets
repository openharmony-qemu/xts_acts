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

export default function uint32ArrayWithTwoTest(): void {
  describe('Uint32ArrayWithTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0100
     * @tc.name testUint32ArrayWithTwo001
     * @tc.desc Verify arity 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const replaced = values.with(1, 99);
      expect(replaced.$_get(1)).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0200
     * @tc.name testUint32ArrayWithTwo002
     * @tc.desc Verify index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const replaced = values.with(2, 99);
      expect(replaced.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0300
     * @tc.name testUint32ArrayWithTwo003
     * @tc.desc Verify index=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      try {
        values.with(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0400
     * @tc.name testUint32ArrayWithTwo004
     * @tc.desc Verify index=-3 throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      try {
        values.with(-3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0500
     * @tc.name testUint32ArrayWithTwo005
     * @tc.desc Verify index=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      try {
        values.with(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0600
     * @tc.name testUint32ArrayWithTwo006
     * @tc.desc Verify index=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      try {
        values.with(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0700
     * @tc.name testUint32ArrayWithTwo007
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10);
      const replaced = values.with(0, 99);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0800
     * @tc.name testUint32ArrayWithTwo008
     * @tc.desc Verify index=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10);
      try {
        values.with(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_0900
     * @tc.name testUint32ArrayWithTwo009
     * @tc.desc Verify with(-1) on single element throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      values.with(-1, 99);
      expect(values.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1000
     * @tc.name testUint32ArrayWithTwo010
     * @tc.desc Verify value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 0);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1100
     * @tc.name testUint32ArrayWithTwo011
     * @tc.desc Verify value=4294967295 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 4294967295);
      expect(replaced.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1200
     * @tc.name testUint32ArrayWithTwo012
     * @tc.desc Verify value=4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 4294967296);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1300
     * @tc.name testUint32ArrayWithTwo013
     * @tc.desc Verify value=2147483648 (int32 +1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 2147483648);
      expect(replaced.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1400
     * @tc.name testUint32ArrayWithTwo014
     * @tc.desc Verify value=2147483647 (int32 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 2147483647);
      expect(replaced.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1500
     * @tc.name testUint32ArrayWithTwo015
     * @tc.desc Verify value=-1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -1);
      expect(replaced.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1600
     * @tc.name testUint32ArrayWithTwo016
     * @tc.desc Verify value=-2147483648 (int32 ) 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -2147483648);
      expect(replaced.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1700
     * @tc.name testUint32ArrayWithTwo017
     * @tc.desc Verify value=-2 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -2);
      expect(replaced.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1800
     * @tc.name testUint32ArrayWithTwo018
     * @tc.desc Verify value=-4294967295 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -4294967295);
      expect(replaced.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_1900
     * @tc.name testUint32ArrayWithTwo019
     * @tc.desc Verify value=3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 3.14);
      expect(replaced.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2000
     * @tc.name testUint32ArrayWithTwo020
     * @tc.desc Verify value=3.99 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 3.99);
      expect(replaced.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2100
     * @tc.name testUint32ArrayWithTwo021
     * @tc.desc Verify value=-3.14 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -3.14);
      expect(replaced.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2200
     * @tc.name testUint32ArrayWithTwo022
     * @tc.desc Verify value=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, Number.NaN);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2300
     * @tc.name testUint32ArrayWithTwo023
     * @tc.desc Verify value=9007199254740991 (MAX_SAFE_INTEGER) 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 9007199254740991);
      expect(replaced.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2400
     * @tc.name testUint32ArrayWithTwo024
     * @tc.desc Verify value=1e10 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 1e10);
      expect(replaced.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2500
     * @tc.name testUint32ArrayWithTwo025
     * @tc.desc Verify value=-0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -0);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2600
     * @tc.name testUint32ArrayWithTwo026
     * @tc.desc Verify value=4294967295.5 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 4294967295.5);
      expect(replaced.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2700
     * @tc.name testUint32ArrayWithTwo027
     * @tc.desc Verify value=0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 0.5);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2800
     * @tc.name testUint32ArrayWithTwo028
     * @tc.desc Verify value=8589934591 (2^33-1) 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 8589934591);
      expect(replaced.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_2900
     * @tc.name testUint32ArrayWithTwo029
     * @tc.desc Verify value=4294967297 (2^32+1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 4294967297);
      expect(replaced.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3000
     * @tc.name testUint32ArrayWithTwo030
     * @tc.desc Verify value=-4294967294 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, -4294967294);
      expect(replaced.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3100
     * @tc.name testUint32ArrayWithTwo031
     * @tc.desc Verify length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.length).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3200
     * @tc.name testUint32ArrayWithTwo032
     * @tc.desc Verify byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3300
     * @tc.name testUint32ArrayWithTwo033
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3400
     * @tc.name testUint32ArrayWithTwo034
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3500
     * @tc.name testUint32ArrayWithTwo035
     * @tc.desc Verify buffer.byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3600
     * @tc.name testUint32ArrayWithTwo036
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3700
     * @tc.name testUint32ArrayWithTwo037
     * @tc.desc Verify with(1, 99) on [10,20] keeps $_get(0) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(1, 99);
      expect(replaced.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3800
     * @tc.name testUint32ArrayWithTwo038
     * @tc.desc Verify with(1, 99) on [10,20,30] keeps $_get(2) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const replaced = values.with(1, 99);
      expect(replaced.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_3900
     * @tc.name testUint32ArrayWithTwo039
     * @tc.desc Verify with does not affect original $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4000
     * @tc.name testUint32ArrayWithTwo040
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(values.join(",")).assertEqual("10,20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4100
     * @tc.name testUint32ArrayWithTwo041
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.subarray(0,1).$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4200
     * @tc.name testUint32ArrayWithTwo042
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      replaced.$_set(1, 888);
      expect(values.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4300
     * @tc.name testUint32ArrayWithTwo043
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      values.$_set(0, 777);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4400
     * @tc.name testUint32ArrayWithTwo044
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      const same = replaced.valueOf();
      same.$_set(0, 555);
      expect(replaced.$_get(0)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4500
     * @tc.name testUint32ArrayWithTwo045
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99).with(1, 88);
      expect(replaced.join(",")).assertEqual("99,88");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4600
     * @tc.name testUint32ArrayWithTwo046
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.toString()).assertEqual("99,20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4700
     * @tc.name testUint32ArrayWithTwo047
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4800
     * @tc.name testUint32ArrayWithTwo048
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      expect(replaced.indexOf(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_4900
     * @tc.name testUint32ArrayWithTwo049
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(1, 99);
      expect(replaced.lastIndexOf(99)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5000
     * @tc.name testUint32ArrayWithTwo050
     * @tc.desc Verify $_set with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      values.$_set(0, 50);
      const replaced = values.with(0, 99);
      expect(replaced.$_get(0)).assertEqual(99);
      expect(replaced.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5100
     * @tc.name testUint32ArrayWithTwo051
     * @tc.desc Verify with new Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      const copied = new Uint32Array(replaced);
      expect(copied.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5200
     * @tc.name testUint32ArrayWithTwo052
     * @tc.desc Verify with set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      const target = new Uint32Array(2);
      target.set(replaced);
      expect(target.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5300
     * @tc.name testUint32ArrayWithTwo053
     * @tc.desc Verify ArrayBuffer with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint32Array(buf, 0, 2);
      view.$_set(0, 10);
      view.$_set(1, 20);
      const replaced = view.with(0, 99);
      expect(view.$_get(0)).assertEqual(10);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5400
     * @tc.name testUint32ArrayWithTwo054
     * @tc.desc Verify subarray with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const sub = values.subarray(0, 2);
      const replaced = sub.with(0, 99);
      expect(sub.$_get(0)).assertEqual(10);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5500
     * @tc.name testUint32ArrayWithTwo055
     * @tc.desc Verify slice with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const sl = values.slice(0, 2);
      const replaced = sl.with(0, 99);
      expect(sl.$_get(0)).assertEqual(10);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5600
     * @tc.name testUint32ArrayWithTwo056
     * @tc.desc Verify toReversed with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const rev = values.toReversed();
      const replaced = rev.with(0, 99);
      expect(rev.$_get(0)).assertEqual(30);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5700
     * @tc.name testUint32ArrayWithTwo057
     * @tc.desc Verify map with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const mapped = values.map((v) => v + 1);
      const replaced = mapped.with(0, 99);
      expect(mapped.$_get(0)).assertEqual(11);
      expect(replaced.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5800
     * @tc.name testUint32ArrayWithTwo058
     * @tc.desc Verify with 4294967296 0 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(65535);
      values.$_set(65534, 7);
      const replaced = values.with(65534, 4294967296);
      expect(replaced.$_get(65534)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_5900
     * @tc.name testUint32ArrayWithTwo059
     * @tc.desc Verify with(1, NaN) 0 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const replaced = values.with(1, Number.NaN);
      expect(replaced.join(",")).assertEqual("10,0,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_6000
     * @tc.name testUint32ArrayWithTwo060
     * @tc.desc Verify with(2, 3.14) 3 includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const replaced = values.with(2, 3.14);
      expect(replaced.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_6100
     * @tc.name testUint32ArrayWithTwo061
     * @tc.desc Verify with(0, 0xFFFFFFFF) 4294967295 indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 0xFFFFFFFF);
      expect(replaced.indexOf(4294967295)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_6200
     * @tc.name testUint32ArrayWithTwo062
     * @tc.desc Verify with(3, 0x100000000) 0 lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const replaced = values.with(3, 0x100000000);
      expect(replaced.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_6300
     * @tc.name testUint32ArrayWithTwo063
     * @tc.desc Verify with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const a = values.with(0, 1);
      const b = values.with(1, 2);
      const c = values.with(2, 3);
      a.$_set(1, 999);
      expect(b.$_get(1)).assertEqual(2);
      expect(c.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_6400
     * @tc.name testUint32ArrayWithTwo064
     * @tc.desc Verify with subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      const sub = replaced.subarray(0, 2);
      sub.$_set(0, 777);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_TWO_6500
     * @tc.name testUint32ArrayWithTwo065
     * @tc.desc Verify with fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const replaced = values.with(0, 99);
      replaced.fill(7);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
    });

  });
}
