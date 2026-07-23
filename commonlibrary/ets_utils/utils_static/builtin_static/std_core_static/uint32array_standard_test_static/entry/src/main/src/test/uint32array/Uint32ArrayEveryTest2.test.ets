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

export default function uint32ArrayEveryTest2(): void {
  describe('Uint32ArrayEveryTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0100
     * @tc.name testUint32ArrayEveryPartTwo001
     * @tc.desc Verify every with Uint32 MAX value >0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0200
     * @tc.name testUint32ArrayEveryPartTwo002
     * @tc.desc Verify every with one zero value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 0, 3);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0300
     * @tc.name testUint32ArrayEveryPartTwo003
     * @tc.desc Verify value > 0 === false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0400
     * @tc.name testUint32ArrayEveryPartTwo004
     * @tc.desc Verify MAX value <= MAX === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295);
      const result = values.every((value: number, index: int, array: Uint32Array) => value <= 4294967295);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0500
     * @tc.name testUint32ArrayEveryPartTwo005
     * @tc.desc Verify 0xFFFFFFFF value === 0xFFFFFFFF === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFFFFFF, 0xFFFFFFFF);
      const result = values.every((value: number, index: int, array: Uint32Array) => value === 0xFFFFFFFF);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0600
     * @tc.name testUint32ArrayEveryPartTwo006
     * @tc.desc Verify 1 value === 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 1, 1);
      const result = values.every((value: number, index: int, array: Uint32Array) => value === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0700
     * @tc.name testUint32ArrayEveryPartTwo007
     * @tc.desc Verify 100 value === 100 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 100, 99);
      const result = values.every((value: number, index: int, array: Uint32Array) => value === 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0800
     * @tc.name testUint32ArrayEveryPartTwo008
     * @tc.desc Verify -1 4294967295 value > 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(-1, -1);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_0900
     * @tc.name testUint32ArrayEveryPartTwo009
     * @tc.desc Verify 0x80000000 value >= 2147483648 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0x80000000, 0x80000000);
      const result = values.every((value: number, index: int, array: Uint32Array) => value >= 2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1000
     * @tc.name testUint32ArrayEveryPartTwo010
     * @tc.desc Verify 2147483647 (int32.MAX) value < 2147483648 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647, 2147483647);
      const result = values.every((value: number, index: int, array: Uint32Array) => value < 2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1100
     * @tc.name testUint32ArrayEveryPartTwo011
     * @tc.desc Verify every value greater or equal to 0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.every((value: number, index: int, array: Uint32Array) => value >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1200
     * @tc.name testUint32ArrayEveryPartTwo012
     * @tc.desc Verify index >= 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => index >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1300
     * @tc.name testUint32ArrayEveryPartTwo013
     * @tc.desc Verify index < array.length true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => index < array.length);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1400
     * @tc.name testUint32ArrayEveryPartTwo014
     * @tc.desc Verify uint32 value >= 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1, 4294967295);
      const result = values.every((value: number, index: int, array: Uint32Array) => value >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1500
     * @tc.name testUint32ArrayEveryPartTwo015
     * @tc.desc Verify 65535 1 value > 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      big.fill(1);
      const result = big.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1600
     * @tc.name testUint32ArrayEveryPartTwo016
     * @tc.desc Verify 0 value > 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      big.fill(1);
      big.$_set(65534, 0);
      const result = big.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1700
     * @tc.name testUint32ArrayEveryPartTwo017
     * @tc.desc Verify array.BYTES_PER_ELEMENT === 4 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => array.BYTES_PER_ELEMENT === 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1800
     * @tc.name testUint32ArrayEveryPartTwo018
     * @tc.desc Verify every length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const before = values.length;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.length).assertEqual(before);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_1900
     * @tc.name testUint32ArrayEveryPartTwo019
     * @tc.desc Verify every byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const before = values.byteLength;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.byteLength).assertEqual(before);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2000
     * @tc.name testUint32ArrayEveryPartTwo020
     * @tc.desc Verify every byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const before = values.byteOffset;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.byteOffset).assertEqual(before);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2100
     * @tc.name testUint32ArrayEveryPartTwo021
     * @tc.desc Verify every buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const before = values.buffer.byteLength;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.buffer.byteLength).assertEqual(before);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2200
     * @tc.name testUint32ArrayEveryPartTwo022
     * @tc.desc Verify every BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const before = values.BYTES_PER_ELEMENT;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.BYTES_PER_ELEMENT).assertEqual(before);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2300
     * @tc.name testUint32ArrayEveryPartTwo023
     * @tc.desc Verify every byteLength === length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.byteLength).assertEqual(values.length * 4);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2400
     * @tc.name testUint32ArrayEveryPartTwo024
     * @tc.desc Verify every length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      big.fill(1);
      const result = big.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(big.length).assertEqual(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2500
     * @tc.name testUint32ArrayEveryPartTwo025
     * @tc.desc Verify every buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const buf = values.buffer;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.buffer).assertEqual(buf);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2600
     * @tc.name testUint32ArrayEveryPartTwo026
     * @tc.desc Verify every $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.$_get(0)).assertEqual(10);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2700
     * @tc.name testUint32ArrayEveryPartTwo027
     * @tc.desc Verify every $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.$_get(1)).assertEqual(20);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2800
     * @tc.name testUint32ArrayEveryPartTwo028
     * @tc.desc Verify every $_get(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.$_get(2)).assertEqual(30);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_2900
     * @tc.name testUint32ArrayEveryPartTwo029
     * @tc.desc Verify every $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.$_get(0)).assertEqual(4294967295);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3000
     * @tc.name testUint32ArrayEveryPartTwo030
     * @tc.desc Verify every large array with mutation returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      big.fill(1);
      big.$_set(65534, 777);
      const result = big.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(big.$_get(65534)).assertEqual(777);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3100
     * @tc.name testUint32ArrayEveryPartTwo031
     * @tc.desc Verify every with direct index mutation returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values[1] = 99;
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.$_get(1)).assertEqual(99);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3200
     * @tc.name testUint32ArrayEveryPartTwo032
     * @tc.desc Verify every join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.join(',')).assertEqual('10,20,30');
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3300
     * @tc.name testUint32ArrayEveryPartTwo033
     * @tc.desc Verify every toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.toString()).assertEqual('10,20,30');
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3400
     * @tc.name testUint32ArrayEveryPartTwo034
     * @tc.desc Verify every valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.valueOf().$_get(0)).assertEqual(10);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3500
     * @tc.name testUint32ArrayEveryPartTwo035
     * @tc.desc Verify every $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFFFFFF);
      const result = values.every((value: number, index: int, array: Uint32Array) => value === 0xFFFFFFFF);
      expect(values.$_get(0)).assertEqual(0xFFFFFFFF);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3600
     * @tc.name testUint32ArrayEveryPartTwo036
     * @tc.desc Verify every subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(view.$_get(0)).assertEqual(20);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3700
     * @tc.name testUint32ArrayEveryPartTwo037
     * @tc.desc Verify every buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const view = new Uint32Array(values.buffer, 0, 1);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(view.$_get(0)).assertEqual(1);
    expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3800
     * @tc.name testUint32ArrayEveryPartTwo038
     * @tc.desc Verify every false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 2, 3);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_3900
     * @tc.name testUint32ArrayEveryPartTwo039
     * @tc.desc Verify every all >0 returns true length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertTrue();
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4000
     * @tc.name testUint32ArrayEveryPartTwo040
     * @tc.desc Verify every boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result: boolean = values.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4100
     * @tc.name testUint32ArrayEveryPartTwo041
     * @tc.desc Verify array buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let captured: boolean = false;
      values.every((value: number, index: int, array: Uint32Array) => {
        captured = array.buffer === values.buffer;
        return true;
      });

      expect(captured).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4200
     * @tc.name testUint32ArrayEveryPartTwo042
     * @tc.desc Verify array byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let captured: number = -1;
      values.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteOffset;
        return true;
      });

      expect(captured).assertEqual(values.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4300
     * @tc.name testUint32ArrayEveryPartTwo043
     * @tc.desc Verify array BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let captured: number = 0;
      values.every((value: number, index: int, array: Uint32Array) => {
        captured = array.BYTES_PER_ELEMENT;
        return true;
      });

      expect(captured).assertEqual(values.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4400
     * @tc.name testUint32ArrayEveryPartTwo044
     * @tc.desc Verify array $_get(0) $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42, 2, 3);
      let captured: number = 0;
      values.every((value: number, index: int, array: Uint32Array) => {
        captured = array.$_get(0);
        return true;
      });

      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4500
     * @tc.name testUint32ArrayEveryPartTwo045
     * @tc.desc Verify subarray every array.byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      let captured: number = -1;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteOffset;
        return true;
      });
      expect(captured).assertEqual(view.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4600
     * @tc.name testUint32ArrayEveryPartTwo046
     * @tc.desc Verify subarray every array.buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      let captured: boolean = false;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.buffer === view.buffer;
        return true;
      });
      expect(captured).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4700
     * @tc.name testUint32ArrayEveryPartTwo047
     * @tc.desc Verify offset=8 array.byteOffset === 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(2, 4);
      let captured: number = -1;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteOffset;
        return true;
      });
      expect(captured).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4800
     * @tc.name testUint32ArrayEveryPartTwo048
     * @tc.desc Verify offset=4 array.byteOffset === 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 4);
      let captured: number = -1;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteOffset;
        return true;
      });
      expect(captured).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_4900
     * @tc.name testUint32ArrayEveryPartTwo049
     * @tc.desc Verify byteOffset === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let captured: number = -1;
      values.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteOffset;
        return true;
      });

      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5000
     * @tc.name testUint32ArrayEveryPartTwo050
     * @tc.desc Verify every buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(2, 4);
      let first: number = 0;
      view.every((value: number, index: int, array: Uint32Array) => {
        first = array.$_get(0);
        return true;
      });
      expect(first).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5100
     * @tc.name testUint32ArrayEveryPartTwo051
     * @tc.desc Verify every array.byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      let captured: number = 0;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteLength;
        return true;
      });
      expect(captured).assertEqual(view.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5200
     * @tc.name testUint32ArrayEveryPartTwo052
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const view = values.subarray(5, 10);
      let called: boolean = false;
      view.every((value: number, index: int, array: Uint32Array) => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5300
     * @tc.name testUint32ArrayEveryPartTwo053
     * @tc.desc Verify slice every array.buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const copy = values.slice(0, 3);
      let captured: boolean = true;
      copy.every((value: number, index: int, array: Uint32Array) => {
        captured = array.buffer === values.buffer;
        return true;
      });
      expect(captured).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5400
     * @tc.name testUint32ArrayEveryPartTwo054
     * @tc.desc Verify slice every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const copy = values.slice(0, 3);
      copy.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5500
     * @tc.name testUint32ArrayEveryPartTwo055
     * @tc.desc Verify ArrayBuffer every byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 4, 2);
      view.$_set(0, 1);
      view.$_set(1, 2);
      let captured: number = -1;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.byteOffset;
        return true;
      });
      expect(captured).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5600
     * @tc.name testUint32ArrayEveryPartTwo056
     * @tc.desc Verify every subarray sees original buffer mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(0, 2);
      values.$_set(0, 99);
      let captured: number = 0;
      view.every((value: number, index: int, array: Uint32Array) => {
        captured = array.$_get(0);
        return true;
      });
      expect(captured).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5700
     * @tc.name testUint32ArrayEveryPartTwo057
     * @tc.desc Verify every subarray all >100 returns false unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(0, 2);
      view.every((value: number, index: int, array: Uint32Array) => value > 100);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5800
     * @tc.name testUint32ArrayEveryPartTwo058
     * @tc.desc Verify every byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      const before = view.byteOffset;
      view.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTTWO_5900
     * @tc.name testUint32ArrayEveryPartTwo059
     * @tc.desc Verify every length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const view = values.subarray(1, 3);
      const before = view.length;
      view.every((value: number, index: int, array: Uint32Array) => value > 0);
      expect(view.length).assertEqual(before);
    });

  });
}
