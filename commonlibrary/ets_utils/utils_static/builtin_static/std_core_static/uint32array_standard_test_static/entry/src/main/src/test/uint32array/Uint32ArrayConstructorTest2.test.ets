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

export default function uint32ArrayConstructorTest2(): void {
  describe('Uint32ArrayConstructorTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testUint32ArrayConstructorTwo001
     * @tc.desc Verify 2 number length 2 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testUint32ArrayConstructorTwo002
     * @tc.desc Verify 2 number length 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 0;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testUint32ArrayConstructorTwo003
     * @tc.desc Verify 2 number length 1 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 1;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testUint32ArrayConstructorTwo004
     * @tc.desc Verify 2 number length 65535 length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 65535;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testUint32ArrayConstructorTwo005
     * @tc.desc Verify 2 number length 2147483647 int32.MAX length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2147483647;
      try {
        new Uint32Array(length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testUint32ArrayConstructorTwo006
     * @tc.desc Verify 2 number length 100 byteLength = 400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 100;
      const values = new Uint32Array(length);
      expect(values.byteLength).assertEqual(400);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testUint32ArrayConstructorTwo007
     * @tc.desc Verify 2 number length 1 byteLength = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 1;
      const values = new Uint32Array(length);
      expect(values.byteLength).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testUint32ArrayConstructorTwo008
     * @tc.desc Verify 2 number length 0 byteLength = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 0;
      const values = new Uint32Array(length);
      expect(values.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testUint32ArrayConstructorTwo009
     * @tc.desc Verify 2 number length 8 BYTES_PER_ELEMENT = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 8;
      const values = new Uint32Array(length);
      expect(values.BYTES_PER_ELEMENT).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testUint32ArrayConstructorTwo010
     * @tc.desc Verify 2 number length 3 byteOffset = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 3;
      const values = new Uint32Array(length);
      expect(values.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testUint32ArrayConstructorTwo011
     * @tc.desc Verify 2 number length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 5;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1200
     * @tc.name testUint32ArrayConstructorTwo012
     * @tc.desc Verify 2 number length 4 buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 4;
      const values = new Uint32Array(length);
      expect(values.buffer.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1300
     * @tc.name testUint32ArrayConstructorTwo013
     * @tc.desc Verify 2 number length 4 default element values are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 4;
      const values = new Uint32Array(length);
      expect(values[0]).assertEqual(0);
      expect(values[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1400
     * @tc.name testUint32ArrayConstructorTwo014
     * @tc.desc Verify 2 number length 16 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 16;
      const values = new Uint32Array(length);
      expect(values[0]).assertEqual(0);
      expect(values[15]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1500
     * @tc.name testUint32ArrayConstructorTwo015
     * @tc.desc Verify 2 number length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 3;
      const values = new Uint32Array(length);
      values[1] = 4294967295;
      expect(values[1]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1600
     * @tc.name testUint32ArrayConstructorTwo016
     * @tc.desc Verify 2 number length 2 subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2;
      const values = new Uint32Array(length);
      const view = values.subarray(0, 1);
      expect(view.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1700
     * @tc.name testUint32ArrayConstructorTwo017
     * @tc.desc Verify 2 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 4294967296;
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1800
     * @tc.name testUint32ArrayConstructorTwo018
     * @tc.desc Verify 2 -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = -1;
      expect(values[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_1900
     * @tc.name testUint32ArrayConstructorTwo019
     * @tc.desc Verify 2 Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = Number.NaN;
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2000
     * @tc.name testUint32ArrayConstructorTwo020
     * @tc.desc Verify 2 Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = Number.POSITIVE_INFINITY;
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2100
     * @tc.name testUint32ArrayConstructorTwo021
     * @tc.desc Verify 2 Number.NEGATIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = Number.NEGATIVE_INFINITY;
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2200
     * @tc.name testUint32ArrayConstructorTwo022
     * @tc.desc Verify 2 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 4294967295;
      expect(values[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2300
     * @tc.name testUint32ArrayConstructorTwo023
     * @tc.desc Verify 2 2147483648 int32 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 2147483648;
      expect(values[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2400
     * @tc.name testUint32ArrayConstructorTwo024
     * @tc.desc Verify 2 -2147483648 int32 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = -2147483648;
      expect(values[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2500
     * @tc.name testUint32ArrayConstructorTwo025
     * @tc.desc Verify 2 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 3.14;
      expect(values[0]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2600
     * @tc.name testUint32ArrayConstructorTwo026
     * @tc.desc Verify 2 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 9007199254740991;
      expect(values[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2700
     * @tc.name testUint32ArrayConstructorTwo027
     * @tc.desc Verify 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 0;
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2800
     * @tc.name testUint32ArrayConstructorTwo028
     * @tc.desc Verify 2 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 1e10;
      expect(values[0]).assertEqual(1410065408);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_2900
     * @tc.name testUint32ArrayConstructorTwo029
     * @tc.desc Verify 2 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 65536;
      expect(values[0]).assertEqual(65536);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3000
     * @tc.name testUint32ArrayConstructorTwo030
     * @tc.desc Verify 2 4294967294 MAX-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 4294967294;
      expect(values[0]).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3100
     * @tc.name testUint32ArrayConstructorTwo031
     * @tc.desc Verify constructor(2) length 2 and arr[0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2;
      const values = new Uint32Array(length);
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3200
     * @tc.name testUint32ArrayConstructorTwo032
     * @tc.desc Verify 2 length=2 toString '0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2;
      const values = new Uint32Array(length);
      expect(values.toString()).assertEqual('0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3300
     * @tc.name testUint32ArrayConstructorTwo033
     * @tc.desc Verify 2 length=3 join(',') '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 3;
      const values = new Uint32Array(length);
      expect(values.join(',')).assertEqual('0,0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3400
     * @tc.name testUint32ArrayConstructorTwo034
     * @tc.desc Verify 2 length=2 valueOf this ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 2;
      const values = new Uint32Array(length);
      expect(values.valueOf()).assertEqual(values);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3500
     * @tc.name testUint32ArrayConstructorTwo035
     * @tc.desc Verify 2 length=0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: number = 0;
      const values = new Uint32Array(length);
      expect(values.toString()).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3600
     * @tc.name testUint32ArrayConstructorTwo036
     * @tc.desc Verify 6 Array<number> [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0];
      const values = new Uint32Array(numbers);
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3700
     * @tc.name testUint32ArrayConstructorTwo037
     * @tc.desc Verify 6 Array<number> 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0.0, 0.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3800
     * @tc.name testUint32ArrayConstructorTwo038
     * @tc.desc Verify 6 Array<number> [3.14, 6.28]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [3.14, 6.28];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(3);
      expect(values[1]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_3900
     * @tc.name testUint32ArrayConstructorTwo039
     * @tc.desc Verify 6 Array<number> Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [Number.NaN];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4000
     * @tc.name testUint32ArrayConstructorTwo040
     * @tc.desc Verify 6 Array<number> 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [4294967295.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4100
     * @tc.name testUint32ArrayConstructorTwo041
     * @tc.desc Verify 6 Array<number> -2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-2147483648.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4200
     * @tc.name testUint32ArrayConstructorTwo042
     * @tc.desc Verify 6 Array<number> 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1e10];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(1410065408);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4300
     * @tc.name testUint32ArrayConstructorTwo043
     * @tc.desc Verify 6 Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0.0, 4294967295.0, -1.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(4294967295);
      expect(values[2]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4400
     * @tc.name testUint32ArrayConstructorTwo044
     * @tc.desc Verify 6 Array<number> 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [0.0, 0.0, 0.0, 0.0];
      const values = new Uint32Array(numbers);
      expect(values.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4500
     * @tc.name testUint32ArrayConstructorTwo045
     * @tc.desc Verify 6 Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [7.0, 7.0, 7.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(7);
      expect(values[2]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4600
     * @tc.name testUint32ArrayConstructorTwo046
     * @tc.desc Verify 6 Array<number> byteLength = 4 * length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0, 2.0, 3.0];
      const values = new Uint32Array(numbers);
      expect(values.byteLength).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4700
     * @tc.name testUint32ArrayConstructorTwo047
     * @tc.desc Verify constructor(Array<number>) length 2 and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0, 2.0];
      const values = new Uint32Array(numbers);
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4800
     * @tc.name testUint32ArrayConstructorTwo048
     * @tc.desc Verify 6 buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0, 2.0];
      const values = new Uint32Array(numbers);
      expect(values.buffer.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_4900
     * @tc.name testUint32ArrayConstructorTwo049
     * @tc.desc Verify 6 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0, 2.0, 3.0];
      const values = new Uint32Array(numbers);
      expect(values.toString()).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5000
     * @tc.name testUint32ArrayConstructorTwo050
     * @tc.desc Verify 6 join('|')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0, 2.0];
      const values = new Uint32Array(numbers);
      expect(values.join('|')).assertEqual('1|2');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5100
     * @tc.name testUint32ArrayConstructorTwo051
     * @tc.desc Verify 6 FixedArray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [];
      const values = new Uint32Array(numbers);
      expect(values.join(',')).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5200
     * @tc.name testUint32ArrayConstructorTwo052
     * @tc.desc Verify 6 - FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.0, 2.0];
      const values = new Uint32Array(numbers);
      numbers[0] = 99.0;
      expect(values[0]).assertEqual(1);
    });
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5300
     * @tc.name testUint32ArrayConstructorTwo053
     * @tc.desc Verify 10 byteOffset number 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const offset: number = 4.0;
      const values = new Uint32Array(buf, offset);
      expect(values.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5400
     * @tc.name testUint32ArrayConstructorTwo054
     * @tc.desc Verify 10 byteOffset number 1.0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(8);
        const offset: number = 1.0;
        new Uint32Array(buf, offset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5500
     * @tc.name testUint32ArrayConstructorTwo055
     * @tc.desc Verify 10 byteOffset number 12.0 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const offset: number = 12.0;
      const values = new Uint32Array(buf, offset);
      expect(values.byteOffset).assertEqual(12);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5600
     * @tc.name testUint32ArrayConstructorTwo056
     * @tc.desc Verify 10 byteOffset number 8.0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const offset: number = 8.0;
      const values = new Uint32Array(buf, offset);
      expect(values.buffer).assertEqual(buf);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5700
     * @tc.name testUint32ArrayConstructorTwo057
     * @tc.desc Verify 10 byteOffset 0.0 buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const offset: number = 0.0;
      const values = new Uint32Array(buf, offset);
      values[0] = 1;
      values[1] = 2;
      expect(values.length).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5800
     * @tc.name testUint32ArrayConstructorTwo058
     * @tc.desc Verify 10 byteOffset 0.0 byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const offset: number = 0.0;
      const values = new Uint32Array(buf, offset);
      expect(values.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_5900
     * @tc.name testUint32ArrayConstructorTwo059
     * @tc.desc Verify 10 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const offset: number = 0.0;
      const values = new Uint32Array(buf, offset);
      expect(values.join('|')).assertEqual('0|0');
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6000
     * @tc.name testUint32ArrayConstructorTwo060
     * @tc.desc Verify 2 4294967297 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 4294967297;
      expect(values[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6100
     * @tc.name testUint32ArrayConstructorTwo061
     * @tc.desc Verify 2 -2 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = -2;
      expect(values[0]).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6200
     * @tc.name testUint32ArrayConstructorTwo062
     * @tc.desc Verify 6 FixedArray -2.0 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-2.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967294);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6300
     * @tc.name testUint32ArrayConstructorTwo063
     * @tc.desc Verify 2 2^32 + 100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = 4294967396;
      expect(values[0]).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6400
     * @tc.name testUint32ArrayConstructorTwo064
     * @tc.desc Verify 6 FixedArray 2^32+100.0 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [4294967396.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6500
     * @tc.name testUint32ArrayConstructorTwo065
     * @tc.desc Verify 2 -100 4294967196
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values[0] = -100;
      expect(values[0]).assertEqual(4294967196);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6600
     * @tc.name testUint32ArrayConstructorTwo066
     * @tc.desc Verify 6 FixedArray -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [-100.0];
      const values = new Uint32Array(numbers);
      expect(values[0]).assertEqual(4294967196);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6700
     * @tc.name testUint32ArrayConstructorTwo067
     * @tc.desc Verify 10 byteOffset 4.0 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const viewLow = new Uint32Array(buf, 0.0);
      const viewHigh = new Uint32Array(buf, 4.0);
      viewLow[0] = 1;
      viewHigh[0] = 2;
      expect(viewLow[0]).assertEqual(1);
      expect(viewHigh[0]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6800
     * @tc.name testUint32ArrayConstructorTwo068
     * @tc.desc Verify 10 byteOffset buf length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const offset: number = 8.0;
      const values = new Uint32Array(buf, offset);
      expect(values.length).assertEqual(0);
      expect(values.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_6900
     * @tc.name testUint32ArrayConstructorTwo069
     * @tc.desc Verify 10 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const offset: number = 0.0;
      const values = new Uint32Array(buf, offset);
      values[0] = -1;
      const reread = new Uint32Array(buf, 0.0);
      expect(reread[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_7000
     * @tc.name testUint32ArrayConstructorTwo070
     * @tc.desc Verify 10 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const offset: number = 8.0;
      const values = new Uint32Array(buf, offset);
      expect(values.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_7100
     * @tc.name testUint32ArrayConstructorTwo071
     * @tc.desc Verify 10 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const offset: number = 0.0;
      const values = new Uint32Array(buf, offset);
      values[0] = 1;
      values[1] = 2;
      expect(values.toString()).assertEqual('1,2');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_TWO_7200
     * @tc.name testUint32ArrayConstructorTwo072
     * @tc.desc Verify 10 - A 0 B 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const viewA = new Uint32Array(buf, 0.0);
      const viewB = new Uint32Array(buf, 0.0);
      viewA[0] = 0;
      viewB[0] = 4294967295;
      expect(viewA[0]).assertEqual(4294967295);
    });

  });
}
