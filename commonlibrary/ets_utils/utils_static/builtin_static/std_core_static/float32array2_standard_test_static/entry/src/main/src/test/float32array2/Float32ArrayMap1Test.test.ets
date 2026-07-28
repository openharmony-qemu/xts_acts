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

export default function Float32ArrayMap1Test(): void {
  describe('Float32ArrayMap1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0100
     * @tc.name testFloat32ArrayMapOne001
 * @tc.desc Verify map callback receives val, index, and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let capturedVal: number = 0;
      let capturedIdx: number = 0;
      let capturedLen: number = 0;
      const result = arr.map((val, index, array) => {
        capturedVal = val;
        capturedIdx = index;
        capturedLen = array.length;
        return val;
      });
      expect(capturedVal).assertEqual(3.0);
      expect(capturedIdx).assertEqual(2);
      expect(capturedLen).assertEqual(3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0200
     * @tc.name testFloat32ArrayMapOne002
     * @tc.desc Verify map callback with only val param doubles each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 15.0]);
      const result = arr.map((val) => val * 2.0);
      const element002 = result.$_get(0);
      expect(element002).assertEqual(10.0);
      const element002Part2 = result.$_get(1);
      expect(element002Part2).assertEqual(20.0);
      const element002Part3 = result.$_get(2);
      expect(element002Part3).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0300
     * @tc.name testFloat32ArrayMapOne003
     * @tc.desc Verify map callback with val and index params computes val + index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.map((val, index) => val + index);
      const element003 = result.$_get(0);
      expect(element003).assertEqual(1.0);
      const element003Part2 = result.$_get(1);
      expect(element003Part2).assertEqual(3.0);
      const element003Part3 = result.$_get(2);
      expect(element003Part3).assertEqual(5.0);
      const element003Part4 = result.$_get(3);
      expect(element003Part4).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0400
     * @tc.name testFloat32ArrayMapOne004
 * @tc.desc Verify map callback uses val param to compute val-1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0, 9.0]);
      const result = arr.map((val, index, array) => val - 1.0);
      const element004 = result.$_get(0);
      expect(element004).assertEqual(2.0);
      const element004Part2 = result.$_get(1);
      expect(element004Part2).assertEqual(5.0);
      const element004Part3 = result.$_get(2);
      expect(element004Part3).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0500
     * @tc.name testFloat32ArrayMapOne005
 * @tc.desc Verify map callback uses index param to compute index*10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const result = arr.map((val, index, array) => index * 10);
      const element005 = result.$_get(0);
      expect(element005).assertEqual(0);
      const element005Part2 = result.$_get(1);
      expect(element005Part2).assertEqual(10);
      const element005Part3 = result.$_get(2);
      expect(element005Part3).assertEqual(20);
      const element005Part4 = result.$_get(3);
      expect(element005Part4).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0600
     * @tc.name testFloat32ArrayMapOne006
 * @tc.desc Verify map callback uses array param to return array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const result = arr.map((val, index, array) => array.length);
      const element006 = result.$_get(0);
      expect(element006).assertEqual(3);
      const element006Part2 = result.$_get(1);
      expect(element006Part2).assertEqual(3);
      const element006Part3 = result.$_get(2);
      expect(element006Part3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0700
     * @tc.name testFloat32ArrayMapOne007
 * @tc.desc Verify map callback returns constant 7.0 for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const k: number = 7.0;
      const result = arr.map(() => k);
      const element007 = result.$_get(0);
      expect(element007).assertEqual(7.0);
      const element007Part2 = result.$_get(1);
      expect(element007Part2).assertEqual(7.0);
      const element007Part3 = result.$_get(2);
      expect(element007Part3).assertEqual(7.0);
      const element007Part4 = result.$_get(3);
      expect(element007Part4).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0800
     * @tc.name testFloat32ArrayMapOne008
 * @tc.desc Verify map callback with typed params doubles each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const result = arr.map((val: number, index: int, array: Float32Array): number => val * 2.0);
      const element008 = result.$_get(0);
      expect(element008).assertEqual(3.0);
      const element008Part2 = result.$_get(1);
      expect(element008Part2).assertEqual(5.0);
      const element008Part3 = result.$_get(2);
      expect(element008Part3).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_0900
     * @tc.name testFloat32ArrayMapOne009
 * @tc.desc Verify map callback returns 0.1 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0.1);
      const element009 = result.$_get(0);
      expect(element009).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1000
     * @tc.name testFloat32ArrayMapOne010
 * @tc.desc Verify map callback returns 0.2 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0.2);
      const element010 = result.$_get(0);
      expect(element010).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1100
     * @tc.name testFloat32ArrayMapOne011
 * @tc.desc Verify map callback returns 0.3 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0.3);
      const element011 = result.$_get(0);
      expect(element011).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1200
     * @tc.name testFloat32ArrayMapOne012
 * @tc.desc Verify map callback returns 0.1+0.2 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const sum: number = 0.1 + 0.2;
      const result = arr.map(() => sum);
      const element012 = result.$_get(0);
      expect(element012).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1300
     * @tc.name testFloat32ArrayMapOne013
 * @tc.desc Verify map callback returns 1.1 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.1);
      const element013 = result.$_get(0);
      expect(element013).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1400
     * @tc.name testFloat32ArrayMapOne014
 * @tc.desc Verify map callback returns 1.0000001 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.0000001);
      const element014 = result.$_get(0);
      expect(element014).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1500
     * @tc.name testFloat32ArrayMapOne015
 * @tc.desc Verify map callback returns 16777216 (2^24) as exact float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 16777216);
      const element015 = result.$_get(0);
      expect(element015).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1600
     * @tc.name testFloat32ArrayMapOne016
 * @tc.desc Verify map callback returning 16777217 truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 16777217);
      const element016 = result.$_get(0);
      expect(element016).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1700
     * @tc.name testFloat32ArrayMapOne017
 * @tc.desc Verify map callback returning 16777219 rounds to 16777220
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 16777219);
      const element017 = result.$_get(0);
      expect(element017).assertEqual(16777220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1800
     * @tc.name testFloat32ArrayMapOne018
 * @tc.desc Verify map callback returns Float32.MAX (3.4028235e+38) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 3.4028234663852886e+38);
      const element018 = result.$_get(0);
      expect(element018).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_1900
     * @tc.name testFloat32ArrayMapOne019
 * @tc.desc Verify map callback returning 1.0e40 overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.0e40);
      const element019 = result.$_get(0);
      expect(element019).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2000
     * @tc.name testFloat32ArrayMapOne020
 * @tc.desc Verify map callback returning -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -1.0e40);
      const element020 = result.$_get(0);
      expect(element020).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2100
     * @tc.name testFloat32ArrayMapOne021
 * @tc.desc Verify map callback returns Float32.MIN_NORMAL as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.1754943508222875e-38);
      const element021 = result.$_get(0);
      expect(element021).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2200
     * @tc.name testFloat32ArrayMapOne022
 * @tc.desc Verify map callback returns Float32.MIN_VALUE as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.401298464324817e-45);
      const element022 = result.$_get(0);
      expect(element022).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2300
     * @tc.name testFloat32ArrayMapOne023
 * @tc.desc Verify map callback returning 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.0e-46);
      const element023 = result.$_get(0);
      expect(element023).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2400
     * @tc.name testFloat32ArrayMapOne024
 * @tc.desc Verify map callback returns NaN as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => Number.NaN);
      const element024 = result.$_get(0);
      expect(element024).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2500
     * @tc.name testFloat32ArrayMapOne025
 * @tc.desc Verify map callback returns +Infinity as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => Number.POSITIVE_INFINITY);
      const element025 = result.$_get(0);
      expect(element025).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2600
     * @tc.name testFloat32ArrayMapOne026
 * @tc.desc Verify map callback returns -Infinity as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -Number.POSITIVE_INFINITY);
      const element026 = result.$_get(0);
      expect(element026).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2700
     * @tc.name testFloat32ArrayMapOne027
 * @tc.desc Verify map callback returns +0 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0);
      const element027 = result.$_get(0);
      expect(element027).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2800
     * @tc.name testFloat32ArrayMapOne028
 * @tc.desc Verify map callback returns -0 distinguished via 1/-0 = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -0);
      const element028 = 1 / result.$_get(0);
      expect(element028).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_2900
     * @tc.name testFloat32ArrayMapOne029
 * @tc.desc Verify map callback returns -Float32.MAX as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -3.4028234663852886e+38);
      const element029 = result.$_get(0);
      expect(element029).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3000
     * @tc.name testFloat32ArrayMapOne030
 * @tc.desc Verify map callback returns 2147483647 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 2147483647);
      const element030 = result.$_get(0);
      expect(element030).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3100
     * @tc.name testFloat32ArrayMapOne031
 * @tc.desc Verify map callback returns -2147483648 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -2147483648);
      const element031 = result.$_get(0);
      expect(element031).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3200
     * @tc.name testFloat32ArrayMapOne032
 * @tc.desc Verify map callback returns hex 0x10 (16) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0x10);
      const element032 = result.$_get(0);
      expect(element032).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3300
     * @tc.name testFloat32ArrayMapOne033
 * @tc.desc Verify map callback returns octal 0o17 (15) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0o17);
      const element033 = result.$_get(0);
      expect(element033).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3400
     * @tc.name testFloat32ArrayMapOne034
 * @tc.desc Verify map callback returns binary 0b1010 (10) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0b1010);
      const element034 = result.$_get(0);
      expect(element034).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3500
     * @tc.name testFloat32ArrayMapOne035
 * @tc.desc Verify map callback returns 1.0e3 (1000) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1.0e3);
      const element035 = result.$_get(0);
      expect(element035).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3600
     * @tc.name testFloat32ArrayMapOne036
 * @tc.desc Verify map callback returns -1.0e3 (-1000) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -1.0e3);
      const element036 = result.$_get(0);
      expect(element036).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3700
     * @tc.name testFloat32ArrayMapOne037
 * @tc.desc Verify map callback returns 1e-10 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1e-10);
      const element037 = result.$_get(0);
      expect(element037).assertEqual(1.000000013351432e-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3800
     * @tc.name testFloat32ArrayMapOne038
 * @tc.desc Verify map callback returns 123456.789 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 123456.789);
      const element038 = result.$_get(0);
      expect(element038).assertEqual(123456.7890625);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_3900
     * @tc.name testFloat32ArrayMapOne039
 * @tc.desc Verify map callback returns PI (3.1415927) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 3.141592653589793);
      const element039 = result.$_get(0);
      expect(element039).assertEqual(3.1415927410125732);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4000
     * @tc.name testFloat32ArrayMapOne040
 * @tc.desc Verify map callback returns 0.5 as exact float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 0.5);
      const element040 = result.$_get(0);
      expect(element040).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4100
     * @tc.name testFloat32ArrayMapOne041
 * @tc.desc Verify map callback returns -0.5 as exact float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -0.5);
      const element041 = result.$_get(0);
      expect(element041).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4200
     * @tc.name testFloat32ArrayMapOne042
 * @tc.desc Verify map callback returns 1e15 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 1e15);
      const element042 = result.$_get(0);
      expect(element042).assertEqual(999999986991104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4300
     * @tc.name testFloat32ArrayMapOne043
 * @tc.desc Verify map callback returns MAX_SAFE_INTEGER+2 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => 9007199254740993);
      const element043 = result.$_get(0);
      expect(element043).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4400
     * @tc.name testFloat32ArrayMapOne044
 * @tc.desc Verify map callback returns val*2 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2, 0.3]);
      const result = arr.map((val) => val * 2.0);
      const element044 = result.$_get(0);
      expect(element044).assertEqual(0.20000000298023224);
      const element044Part2 = result.$_get(1);
      expect(element044Part2).assertEqual(0.4000000059604645);
      const element044Part3 = result.$_get(2);
      expect(element044Part3).assertEqual(0.6000000238418579);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4500
     * @tc.name testFloat32ArrayMapOne045
 * @tc.desc Verify map callback returns index*0.1 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const result = arr.map((val, index) => index * 0.1);
      const element045 = result.$_get(0);
      expect(element045).assertEqual(0.0);
      const element045Part2 = result.$_get(1);
      expect(element045Part2).assertEqual(0.10000000149011612);
      const element045Part3 = result.$_get(2);
      expect(element045Part3).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4600
     * @tc.name testFloat32ArrayMapOne046
 * @tc.desc Verify map callback returns val+1e-7 as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map((val) => val + 1e-7);
      const element046 = result.$_get(0);
      expect(element046).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4700
     * @tc.name testFloat32ArrayMapOne047
 * @tc.desc Verify map callback returns -0xFF (-255) as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const result = arr.map(() => -0xFF);
      const element047 = result.$_get(0);
      expect(element047).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4800
     * @tc.name testFloat32ArrayMapOne048
 * @tc.desc Verify map callback captures element 0.1 stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      let captured: number = 0;
      arr.map((val) => {
        captured = val;
        return val;
      });
      expect(captured).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_4900
     * @tc.name testFloat32ArrayMapOne049
 * @tc.desc Verify map callback captures NaN element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN]);
      let captured: number = 0;
      arr.map((val) => {
        captured = val;
        return val;
      });
      expect(captured).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5000
     * @tc.name testFloat32ArrayMapOne050
 * @tc.desc Verify map callback captures +Infinity element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY]);
      let captured: number = 0;
      arr.map((val) => {
        captured = val;
        return val;
      });
      expect(captured).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5100
     * @tc.name testFloat32ArrayMapOne051
 * @tc.desc Verify map callback captures -0 element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      let captured: number = 0;
      arr.map((val) => {
        captured = val;
        return val;
      });
      const observedValue051 = 1 / captured;
      expect(observedValue051).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5200
     * @tc.name testFloat32ArrayMapOne052
 * @tc.desc Verify map callback captures 16777217 truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      let captured: number = 0;
      arr.map((val) => {
        captured = val;
        return val;
      });
      expect(captured).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5300
     * @tc.name testFloat32ArrayMapOne053
 * @tc.desc Verify map on empty array never calls callback, returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      let calls: number = 0;
      const result = arr.map((val) => {
        calls = calls + 1;
        return val;
      });
      expect(calls).assertEqual(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5400
     * @tc.name testFloat32ArrayMapOne054
 * @tc.desc Verify map callback captures first element 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      let captured: number = 0;
      let calls: number = 0;
      arr.map((val) => {
        captured = val;
        calls = calls + 1;
        return val;
      });
      expect(captured).assertEqual(42.0);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5500
     * @tc.name testFloat32ArrayMapOne055
 * @tc.desc Verify map on length-100 array calls callback 100 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Float32Array(100);
      let calls: number = 0;
      big.map((val) => {
        calls = calls + 1;
        return val;
      });
      expect(calls).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5600
     * @tc.name testFloat32ArrayMapOne056
 * @tc.desc Verify map callback captures first and last element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0]);
      let first: number = 0;
      let last: number = 0;
      arr.map((val, index) => {
        if (index === 0) {
          first = val;
        }
        if (index === 2) {
          last = val;
        }
        return val;
      });
      expect(first).assertEqual(7.0);
      expect(last).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5700
     * @tc.name testFloat32ArrayMapOne057
 * @tc.desc Verify map callback captures element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.5, -2.5]);
      let captured: number = 0;
      arr.map((val, index) => {
        if (index === 1) {
          captured = val;
        }
        return val;
      });
      expect(captured).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5800
     * @tc.name testFloat32ArrayMapOne058
 * @tc.desc Verify map callback captures element 0.0 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 5.0]);
      let captured: number = 1;
      arr.map((val, index) => {
        if (index === 0) {
          captured = val;
        }
        return val;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_5900
     * @tc.name testFloat32ArrayMapOne059
 * @tc.desc Verify map callback captures Float32.MAX element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      let captured: number = 0;
      arr.map((val) => {
        captured = val;
        return val;
      });
      expect(captured).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6000
     * @tc.name testFloat32ArrayMapOne060
 * @tc.desc Verify map callback receives first index as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let firstIdx: number = -1;
      arr.map((val, index) => {
        if (index === 0) {
          firstIdx = index;
        }
        return val;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6100
     * @tc.name testFloat32ArrayMapOne061
 * @tc.desc Verify map callback index increments by 1 each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let prev: number = -1;
      let ok: number = 1;
      arr.map((val, index) => {
        if (index !== prev + 1) {
          ok = 0;
        }
        prev = index;
        return val;
      });
      expect(ok).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6200
     * @tc.name testFloat32ArrayMapOne062
 * @tc.desc Verify map callback last index equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let lastIdx: number = -1;
      arr.map((val, index) => {
        lastIdx = index;
        return val;
      });
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6300
     * @tc.name testFloat32ArrayMapOne063
 * @tc.desc Verify map callback index is 0 on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0]);
      let capturedIdx: number = -1;
      arr.map((val, index) => {
        capturedIdx = index;
        return val;
      });
      expect(capturedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6400
     * @tc.name testFloat32ArrayMapOne064
 * @tc.desc Verify map callback max index equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let maxIdx: number = -1;
      arr.map((val, index) => {
        if (index > maxIdx) {
          maxIdx = index;
        }
        return val;
      });
      expect(maxIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6500
     * @tc.name testFloat32ArrayMapOne065
 * @tc.desc Verify map callback last index is 99 on length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Float32Array(100);
      let lastIdx: number = -1;
      big.map((val, index) => {
        lastIdx = index;
        return val;
      });
      expect(lastIdx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6600
     * @tc.name testFloat32ArrayMapOne066
 * @tc.desc Verify map callback returns index values stored as float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0, 0.0]);
      const result = arr.map((val, index) => index);
      const element066 = result.$_get(0);
      expect(element066).assertEqual(0);
      const element066Part2 = result.$_get(1);
      expect(element066Part2).assertEqual(1);
      const element066Part3 = result.$_get(2);
      expect(element066Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6700
     * @tc.name testFloat32ArrayMapOne067
 * @tc.desc Verify map callback array param has length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let capturedLen: number = 0;
      arr.map((val, index, array) => {
        capturedLen = array.length;
        return val;
      });
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6800
     * @tc.name testFloat32ArrayMapOne068
 * @tc.desc Verify map callback array param is Float32Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let isF32: number = 0;
      arr.map((val, index, array) => {
        if (array === arr) {
          isF32 = 1;
        }
        return val;
      });
      expect(isF32).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_6900
     * @tc.name testFloat32ArrayMapOne069
 * @tc.desc Verify map callback reads first element via array.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([11.0, 22.0]);
      let first: number = 0;
      arr.map((val, index, array) => {
        first = array.$_get(0);
        return val;
      });
      expect(first).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7000
     * @tc.name testFloat32ArrayMapOne070
 * @tc.desc Verify map callback array.$_get(index) matches val parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      let allEqual: number = 1;
      arr.map((val, index, array) => {
        if (array.$_get(index) !== val) {
          allEqual = 0;
        }
        return val;
      });
      expect(allEqual).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7100
     * @tc.name testFloat32ArrayMapOne071
 * @tc.desc Verify map callback array.byteLength equals 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let capturedBytes: number = 0;
      arr.map((val, index, array) => {
        capturedBytes = array.byteLength;
        return val;
      });
      expect(capturedBytes).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7200
     * @tc.name testFloat32ArrayMapOne072
 * @tc.desc Verify map callback array.length is consistently 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let consistent: number = 1;
      arr.map((val, index, array) => {
        if (array.length !== 3) {
          consistent = 0;
        }
        return val;
      });
      expect(consistent).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7300
     * @tc.name testFloat32ArrayMapOne073
 * @tc.desc Verify map throws Error when callback throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      try {
        arr.map(() => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7400
     * @tc.name testFloat32ArrayMapOne074
 * @tc.desc Verify map throws RangeError when callback throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      try {
        arr.map(() => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7500
     * @tc.name testFloat32ArrayMapOne075
 * @tc.desc Verify map throws TypeError when callback throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      try {
        arr.map(() => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7600
     * @tc.name testFloat32ArrayMapOne076
 * @tc.desc Verify map callback throws Error with custom string message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      try {
        arr.map(() => {
          throw new Error('string error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('string error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7700
     * @tc.name testFloat32ArrayMapOne077
 * @tc.desc Verify map stops after first callback throw (calls=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let calls: number = 0;
      try {
        arr.map((val) => {
          calls = calls + 1;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7800
     * @tc.name testFloat32ArrayMapOne078
 * @tc.desc Verify map throws at index 2 and halts after 3 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let calls: number = 0;
      try {
        arr.map((val, index) => {
          calls = calls + 1;
          if (index === 2) {
            throw new Error('mid');
          }
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_7900
     * @tc.name testFloat32ArrayMapOne079
 * @tc.desc Verify map throws at last element after 3 callback calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let calls: number = 0;
      try {
        arr.map((val, index) => {
          calls = calls + 1;
          if (index === 2) {
            throw new Error('last');
          }
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8000
     * @tc.name testFloat32ArrayMapOne080
 * @tc.desc Verify map throws on value >5 and halts after 2 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 6.0, 2.0]);
      let calls: number = 0;
      try {
        arr.map((val) => {
          calls = calls + 1;
          if (val > 5.0) {
            throw new Error('too big');
          }
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8100
     * @tc.name testFloat32ArrayMapOne081
 * @tc.desc Verify map throws on second element and halts after 2 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let counter: number = 0;
      try {
        arr.map((val) => {
          counter = counter + 1;
          if (counter === 2) {
            throw new Error('state');
          }
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8200
     * @tc.name testFloat32ArrayMapOne082
 * @tc.desc Verify map callback returns constant 100.0 for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const base: number = 100.0;
      const result = arr.map(() => base);
      const element082 = result.$_get(0);
      expect(element082).assertEqual(100.0);
      const element082Part2 = result.$_get(1);
      expect(element082Part2).assertEqual(100.0);
      const element082Part3 = result.$_get(2);
      expect(element082Part3).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8300
     * @tc.name testFloat32ArrayMapOne083
 * @tc.desc Verify map callback is called for each of 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let calls: number = 0;
      arr.map((val) => {
        calls = calls + 1;
        return val;
      });
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8400
     * @tc.name testFloat32ArrayMapOne084
 * @tc.desc Verify map callback accumulates sum of all element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let sum: number = 0;
      arr.map((val) => {
        sum = sum + val;
        return val;
      });
      expect(sum).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8500
     * @tc.name testFloat32ArrayMapOne085
 * @tc.desc Verify map callback collects all element values into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let collected: Array<number> = [];
      arr.map((val) => {
        collected.push(val);
        return val;
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10.0);
      expect(collected[1]).assertEqual(20.0);
      expect(collected[2]).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8600
     * @tc.name testFloat32ArrayMapOne086
 * @tc.desc Verify map callback maps each element to val*10 using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let out: Array<number> = [0, 0, 0];
      arr.map((val, index) => {
        out[index] = val * 10;
        return val;
      });
      expect(out[0]).assertEqual(10.0);
      expect(out[1]).assertEqual(20.0);
      expect(out[2]).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8700
     * @tc.name testFloat32ArrayMapOne087
 * @tc.desc Verify chained map calls compute (val+1.0)*2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const result = arr.map((val) => val + 1.0).map((val) => val * 2.0);
      const element087 = result.$_get(0);
      expect(element087).assertEqual(4.0);
      const element087Part2 = result.$_get(1);
      expect(element087Part2).assertEqual(6.0);
      const element087Part3 = result.$_get(2);
      expect(element087Part3).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8800
     * @tc.name testFloat32ArrayMapOne088
 * @tc.desc Verify map callback closure computes val*factor with factor=1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let factor: number = 1.0;
      const result = arr.map((val) => {
        const r: number = val * factor;
        factor = factor + 1.0;
        return r;
      });
      const element088 = result.$_get(0);
      expect(element088).assertEqual(1.0);
      const element088Part2 = result.$_get(1);
      expect(element088Part2).assertEqual(4.0);
      const element088Part3 = result.$_get(2);
      expect(element088Part3).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_8900
     * @tc.name testFloat32ArrayMapOne089
 * @tc.desc Verify map callback returns array.length-index for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const result = arr.map((val, index) => arr.length - index);
      const element089 = result.$_get(0);
      expect(element089).assertEqual(3);
      const element089Part2 = result.$_get(1);
      expect(element089Part2).assertEqual(2);
      const element089Part3 = result.$_get(2);
      expect(element089Part3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_ONE_9000
     * @tc.name testFloat32ArrayMapOne090
     * @tc.desc Verify map result is a new Float32Array instance (not the source reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.map((element: number): number => element * 2.0);
      expect(result === arr).assertFalse();
    });

  });
}
