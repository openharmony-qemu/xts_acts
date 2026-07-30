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

export default function Float32ArrayReverse1Test(): void {
  describe('Float32ArrayReverse1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0100
     * @tc.name testFloat32ArrayReverseOne001
     * @tc.desc Verify reverse() on [1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.reverse();
      const element001 = arr.$_get(0);
      expect(element001).assertEqual(2.0);
      const element001Part2 = arr.$_get(1);
      expect(element001Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0200
     * @tc.name testFloat32ArrayReverseOne002
     * @tc.desc Verify reverse() on [3.4028234663852886e+38, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.0]);
      arr.reverse();
      const element002 = arr.$_get(0);
      expect(element002).assertEqual(1.0);
      const element002Part2 = arr.$_get(1);
      expect(element002Part2).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0300
     * @tc.name testFloat32ArrayReverseOne003
     * @tc.desc Verify reverse() on [1.1754943508222875e-38, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38, 2.0]);
      arr.reverse();
      const element003 = arr.$_get(0);
      expect(element003).assertEqual(2.0);
      const element003Part2 = arr.$_get(1);
      expect(element003Part2).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0400
     * @tc.name testFloat32ArrayReverseOne004
     * @tc.desc Verify reverse() on [1.401298464324817e-45, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 3.0]);
      arr.reverse();
      const element004 = arr.$_get(0);
      expect(element004).assertEqual(3.0);
      const element004Part2 = arr.$_get(1);
      expect(element004Part2).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0500
     * @tc.name testFloat32ArrayReverseOne005
     * @tc.desc Verify reverse() on [NaN, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN, 4.0]);
      arr.reverse();
      const element005 = arr.$_get(0);
      expect(element005).assertEqual(4.0);
      const element005Part2 = arr.$_get(1);
      expect(element005Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0600
     * @tc.name testFloat32ArrayReverseOne006
     * @tc.desc Verify reverse() on [Infinity, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, 5.0]);
      arr.reverse();
      const element006 = arr.$_get(0);
      expect(element006).assertEqual(5.0);
      const element006Part2 = arr.$_get(1);
      expect(element006Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0700
     * @tc.name testFloat32ArrayReverseOne007
     * @tc.desc Verify reverse() on [-Infinity, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Number.POSITIVE_INFINITY, 6.0]);
      arr.reverse();
      const element007 = arr.$_get(0);
      expect(element007).assertEqual(6.0);
      const element007Part2 = arr.$_get(1);
      expect(element007Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0800
     * @tc.name testFloat32ArrayReverseOne008
     * @tc.desc Verify reverse() on [0.0, 7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 7.0]);
      arr.reverse();
      const element008 = arr.$_get(0);
      expect(element008).assertEqual(7.0);
      const element008Part2 = arr.$_get(1);
      expect(element008Part2).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_0900
     * @tc.name testFloat32ArrayReverseOne009
     * @tc.desc Verify reverse() on [-0.0, 8.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 8.0]);
      arr.reverse();
      const element009 = arr.$_get(0);
      expect(element009).assertEqual(8.0);
      const element009Part2 = 1.0 / arr.$_get(1);
      expect(element009Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1000
     * @tc.name testFloat32ArrayReverseOne010
     * @tc.desc Verify reverse() on [-3.4028234663852886e+38, 9.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38, 9.0]);
      arr.reverse();
      const element010 = arr.$_get(0);
      expect(element010).assertEqual(9.0);
      const element010Part2 = arr.$_get(1);
      expect(element010Part2).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1100
     * @tc.name testFloat32ArrayReverseOne011
     * @tc.desc Verify reverse() on [0.1, 10.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.1]);
      const arr = new Float32Array([0.1, 10.0]);
      arr.reverse();
      const element011 = arr.$_get(0);
      expect(element011).assertEqual(10.0);
      const element011Part2 = arr.$_get(1);
      expect(element011Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1200
     * @tc.name testFloat32ArrayReverseOne012
     * @tc.desc Verify reverse() on [0.2, 11.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.2]);
      const arr = new Float32Array([0.2, 11.0]);
      arr.reverse();
      const element012 = arr.$_get(0);
      expect(element012).assertEqual(11.0);
      const element012Part2 = arr.$_get(1);
      expect(element012Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1300
     * @tc.name testFloat32ArrayReverseOne013
     * @tc.desc Verify reverse() on [0.3, 12.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.3]);
      const arr = new Float32Array([0.3, 12.0]);
      arr.reverse();
      const element013 = arr.$_get(0);
      expect(element013).assertEqual(12.0);
      const element013Part2 = arr.$_get(1);
      expect(element013Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1400
     * @tc.name testFloat32ArrayReverseOne014
     * @tc.desc Verify reverse() on [1.1, 13.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([1.1]);
      const arr = new Float32Array([1.1, 13.0]);
      arr.reverse();
      const element014 = arr.$_get(0);
      expect(element014).assertEqual(13.0);
      const element014Part2 = arr.$_get(1);
      expect(element014Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1500
     * @tc.name testFloat32ArrayReverseOne015
     * @tc.desc Verify reverse() on [1.0000001, 14.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([1.0000001]);
      const arr = new Float32Array([1.0000001, 14.0]);
      arr.reverse();
      const element015 = arr.$_get(0);
      expect(element015).assertEqual(14.0);
      const element015Part2 = arr.$_get(1);
      expect(element015Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1600
     * @tc.name testFloat32ArrayReverseOne016
     * @tc.desc Verify reverse() on [16777216, 15.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216, 15.0]);
      arr.reverse();
      const element016 = arr.$_get(0);
      expect(element016).assertEqual(15.0);
      const element016Part2 = arr.$_get(1);
      expect(element016Part2).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1700
     * @tc.name testFloat32ArrayReverseOne017
     * @tc.desc Verify reverse() on [16777217, 16.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217, 16.0]);
      arr.reverse();
      const element017 = arr.$_get(0);
      expect(element017).assertEqual(16.0);
      const element017Part2 = arr.$_get(1);
      expect(element017Part2).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1800
     * @tc.name testFloat32ArrayReverseOne018
     * @tc.desc Verify reverse() on [1.0e40, 17.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, 17.0]);
      arr.reverse();
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(17.0);
      const element018Part2 = arr.$_get(1);
      expect(element018Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_1900
     * @tc.name testFloat32ArrayReverseOne019
     * @tc.desc Verify reverse() on [-1.0e40, 18.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40, 18.0]);
      arr.reverse();
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(18.0);
      const element019Part2 = arr.$_get(1);
      expect(element019Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2000
     * @tc.name testFloat32ArrayReverseOne020
     * @tc.desc Verify reverse() on [1.0e-46, 19.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46, 19.0]);
      arr.reverse();
      const element020 = arr.$_get(0);
      expect(element020).assertEqual(19.0);
      const element020Part2 = arr.$_get(1);
      expect(element020Part2).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2100
     * @tc.name testFloat32ArrayReverseOne021
     * @tc.desc Verify reverse() on [0, 20.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 20.0]);
      arr.reverse();
      const element021 = arr.$_get(0);
      expect(element021).assertEqual(20.0);
      const element021Part2 = arr.$_get(1);
      expect(element021Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2200
     * @tc.name testFloat32ArrayReverseOne022
     * @tc.desc Verify reverse() on [-1, 21.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1, 21.0]);
      arr.reverse();
      const element022 = arr.$_get(0);
      expect(element022).assertEqual(21.0);
      const element022Part2 = arr.$_get(1);
      expect(element022Part2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2300
     * @tc.name testFloat32ArrayReverseOne023
     * @tc.desc Verify reverse() on [2147483647, 22.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([2147483647]);
      const arr = new Float32Array([2147483647, 22.0]);
      arr.reverse();
      const element023 = arr.$_get(0);
      expect(element023).assertEqual(22.0);
      const element023Part2 = arr.$_get(1);
      expect(element023Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2400
     * @tc.name testFloat32ArrayReverseOne024
     * @tc.desc Verify reverse() on [-2147483648, 23.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([-2147483648]);
      const arr = new Float32Array([-2147483648, 23.0]);
      arr.reverse();
      const element024 = arr.$_get(0);
      expect(element024).assertEqual(23.0);
      const element024Part2 = arr.$_get(1);
      expect(element024Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2500
     * @tc.name testFloat32ArrayReverseOne025
     * @tc.desc Verify reverse() on [1.0e3, 24.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3, 24.0]);
      arr.reverse();
      const element025 = arr.$_get(0);
      expect(element025).assertEqual(24.0);
      const element025Part2 = arr.$_get(1);
      expect(element025Part2).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2600
     * @tc.name testFloat32ArrayReverseOne026
     * @tc.desc Verify reverse() on [9.0, 25.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([9.0]);
      const arr = new Float32Array([9.0, 25.0]);
      arr.reverse();
      const element026 = arr.$_get(0);
      expect(element026).assertEqual(25.0);
      const element026Part2 = arr.$_get(1);
      expect(element026Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2700
     * @tc.name testFloat32ArrayReverseOne027
     * @tc.desc Verify reverse() on [1.0e-38, 31.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([1.0e-38]);
      const arr = new Float32Array([1.0e-38, 31.0]);
      arr.reverse();
      const element027 = arr.$_get(0);
      expect(element027).assertEqual(31.0);
      const element027Part2 = arr.$_get(1);
      expect(element027Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2800
     * @tc.name testFloat32ArrayReverseOne028
     * @tc.desc Verify reverse() on [8388608, 32.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8388608, 32.0]);
      arr.reverse();
      const element028 = arr.$_get(0);
      expect(element028).assertEqual(32.0);
      const element028Part2 = arr.$_get(1);
      expect(element028Part2).assertEqual(8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_2900
     * @tc.name testFloat32ArrayReverseOne029
     * @tc.desc Verify reverse() on [0.5, 33.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5, 33.0]);
      arr.reverse();
      const element029 = arr.$_get(0);
      expect(element029).assertEqual(33.0);
      const element029Part2 = arr.$_get(1);
      expect(element029Part2).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3000
     * @tc.name testFloat32ArrayReverseOne030
     * @tc.desc Verify reverse() on [-0.5, 34.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.5, 34.0]);
      arr.reverse();
      const element030 = arr.$_get(0);
      expect(element030).assertEqual(34.0);
      const element030Part2 = arr.$_get(1);
      expect(element030Part2).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3100
     * @tc.name testFloat32ArrayReverseOne031
     * @tc.desc Verify reverse() on [255, 26.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([255, 26.0]);
      arr.reverse();
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(26.0);
      const element031Part2 = arr.$_get(1);
      expect(element031Part2).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3200
     * @tc.name testFloat32ArrayReverseOne032
     * @tc.desc Verify reverse() on empty array returns empty array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      arr.reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3300
     * @tc.name testFloat32ArrayReverseOne033
     * @tc.desc Verify reverse() on [42.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
      const element033 = arr.$_get(0);
      expect(element033).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3400
     * @tc.name testFloat32ArrayReverseOne034
     * @tc.desc Verify reverse() on [100.0, 200.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0, 200.0]);
      arr.reverse();
      const element034 = arr.$_get(0);
      expect(element034).assertEqual(200.0);
      const element034Part2 = arr.$_get(1);
      expect(element034Part2).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3500
     * @tc.name testFloat32ArrayReverseOne035
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.reverse();
      const element035 = arr.$_get(0);
      expect(element035).assertEqual(3.0);
      const element035Part2 = arr.$_get(1);
      expect(element035Part2).assertEqual(2.0);
      const element035Part3 = arr.$_get(2);
      expect(element035Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3600
     * @tc.name testFloat32ArrayReverseOne036
     * @tc.desc Verify reverse() on [10.0, 20.0, 30.0, 40.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      arr.reverse();
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(40.0);
      const element036Part2 = arr.$_get(3);
      expect(element036Part2).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3700
     * @tc.name testFloat32ArrayReverseOne037
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, 4.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.reverse();
      const element037 = arr.$_get(0);
      expect(element037).assertEqual(5.0);
      const element037Part2 = arr.$_get(2);
      expect(element037Part2).assertEqual(3.0);
      const element037Part3 = arr.$_get(4);
      expect(element037Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3800
     * @tc.name testFloat32ArrayReverseOne038
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]);
      arr.reverse();
      const element038 = arr.$_get(0);
      expect(element038).assertEqual(7.0);
      const element038Part2 = arr.$_get(3);
      expect(element038Part2).assertEqual(4.0);
      const element038Part3 = arr.$_get(6);
      expect(element038Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_3900
     * @tc.name testFloat32ArrayReverseOne039
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      arr.reverse();
      const element039 = arr.$_get(0);
      expect(element039).assertEqual(99);
      const element039Part2 = arr.$_get(99);
      expect(element039Part2).assertEqual(0);
      const element039Part3 = arr.$_get(50);
      expect(element039Part3).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4000
     * @tc.name testFloat32ArrayReverseOne040
     * @tc.desc Verify reverse() moves NaN from the first position to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN, 1.0, 2.0]);
      arr.reverse();
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(2.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      const element040Part2 = arr.$_get(2);
      expect(element040Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4100
     * @tc.name testFloat32ArrayReverseOne041
     * @tc.desc Verify reverse() moves positive infinity from the first position to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, 1.0, -2.0]);
      arr.reverse();
      const element041 = arr.$_get(0);
      expect(element041).assertEqual(-2.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      const element041Part2 = arr.$_get(2);
      expect(element041Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4200
     * @tc.name testFloat32ArrayReverseOne042
     * @tc.desc Verify reverse() moves positive zero from the first position to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.0, 2.0]);
      arr.reverse();
      const element042 = arr.$_get(0);
      expect(element042).assertEqual(2.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      const element042Part2 = 1.0 / arr.$_get(2);
      expect(element042Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4300
     * @tc.name testFloat32ArrayReverseOne043
     * @tc.desc Verify reverse() moves negative zero from the first position to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 1.0, 2.0]);
      arr.reverse();
      const element043 = arr.$_get(0);
      expect(element043).assertEqual(2.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      const element043Part2 = 1.0 / arr.$_get(2);
      expect(element043Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4400
     * @tc.name testFloat32ArrayReverseOne044
     * @tc.desc Verify reverse() moves the maximum finite Float32 value from the first position to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.0, -2.0]);
      arr.reverse();
      const element044 = arr.$_get(0);
      expect(element044).assertEqual(-2.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      const element044Part2 = arr.$_get(2);
      expect(element044Part2).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4500
     * @tc.name testFloat32ArrayReverseOne045
     * @tc.desc Verify reverse() moves the rounded 16777217 value from the first position to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217, 1.0, -2.0]);
      arr.reverse();
      const element045 = arr.$_get(0);
      expect(element045).assertEqual(-2.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      const element045Part2 = arr.$_get(2);
      expect(element045Part2).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4600
     * @tc.name testFloat32ArrayReverseOne046
     * @tc.desc Verify reverse() on [0.0, -0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0]);
      arr.reverse();
      const element046 = 1.0 / arr.$_get(0);
      expect(element046).assertEqual(-Number.POSITIVE_INFINITY);
      const element046Part2 = 1.0 / arr.$_get(1);
      expect(element046Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4700
     * @tc.name testFloat32ArrayReverseOne047
     * @tc.desc Verify reverse() on [NaN, Infinity]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY]);
      arr.reverse();
      const element047 = arr.$_get(0);
      expect(element047).assertEqual(Number.POSITIVE_INFINITY);
      const element047Part2 = arr.$_get(1);
      expect(element047Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4800
     * @tc.name testFloat32ArrayReverseOne048
     * @tc.desc Verify reverse() on [Infinity, -Infinity, NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, Number.NaN]);
      arr.reverse();
      const element048 = arr.$_get(0);
      expect(element048).assertNaN();
      const element048Part2 = arr.$_get(1);
      expect(element048Part2).assertEqual(-Number.POSITIVE_INFINITY);
      const element048Part3 = arr.$_get(2);
      expect(element048Part3).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_4900
     * @tc.name testFloat32ArrayReverseOne049
     * @tc.desc Verify reverse() on [3.4028234663852886e+38, 1.401298464324817e-45]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.401298464324817e-45]);
      arr.reverse();
      const element049 = arr.$_get(0);
      expect(element049).assertEqual(1.401298464324817e-45);
      const element049Part2 = arr.$_get(1);
      expect(element049Part2).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5000
     * @tc.name testFloat32ArrayReverseOne050
     * @tc.desc Verify reverse() on [-Infinity, 3.4028234663852886e+38, -0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Number.POSITIVE_INFINITY, 3.4028234663852886e+38, -0.0]);
      arr.reverse();
      const element050 = 1.0 / arr.$_get(0);
      expect(element050).assertEqual(-Number.POSITIVE_INFINITY);
      const element050Part2 = arr.$_get(1);
      expect(element050Part2).assertEqual(3.4028234663852886e+38);
      const element050Part3 = arr.$_get(2);
      expect(element050Part3).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5100
     * @tc.name testFloat32ArrayReverseOne051
     * @tc.desc Verify reverse() on [0.1, 0.2, 0.3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.1, 0.2, 0.3]);
      const arr = new Float32Array([0.1, 0.2, 0.3]);
      arr.reverse();
      const element051 = arr.$_get(0);
      expect(element051).assertEqual(ref.$_get(2));
      const element051Part2 = arr.$_get(2);
      expect(element051Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5200
     * @tc.name testFloat32ArrayReverseOne052
     * @tc.desc Verify reverse() on [16777216, 16777218]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216, 16777218]);
      arr.reverse();
      const element052 = arr.$_get(0);
      expect(element052).assertEqual(16777218);
      const element052Part2 = arr.$_get(1);
      expect(element052Part2).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5300
     * @tc.name testFloat32ArrayReverseOne053
     * @tc.desc Verify reverse() on [1.0e40, -1.0e40, 1.0e-46]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, -1.0e40, 1.0e-46]);
      arr.reverse();
      const element053 = arr.$_get(0);
      expect(element053).assertEqual(0.0);
      const element053Part2 = arr.$_get(1);
      expect(element053Part2).assertEqual(-Number.POSITIVE_INFINITY);
      const element053Part3 = arr.$_get(2);
      expect(element053Part3).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5400
     * @tc.name testFloat32ArrayReverseOne054
     * @tc.desc Verify reverse() on [3.4028234663852886e+38, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.0, 2.0]);
      arr.reverse();
      const element054 = arr.$_get(0);
      expect(element054).assertEqual(2.0);
      const element054Part2 = arr.$_get(2);
      expect(element054Part2).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5500
     * @tc.name testFloat32ArrayReverseOne055
     * @tc.desc Verify reverse() on [NaN, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN, 3.0, 4.0]);
      arr.reverse();
      const element055 = arr.$_get(0);
      expect(element055).assertEqual(4.0);
      const element055Part2 = arr.$_get(2);
      expect(element055Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5600
     * @tc.name testFloat32ArrayReverseOne056
     * @tc.desc Verify reverse() on [5.0, 6.0, Infinity]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, Number.POSITIVE_INFINITY]);
      arr.reverse();
      const element056 = arr.$_get(0);
      expect(element056).assertEqual(Number.POSITIVE_INFINITY);
      const element056Part2 = arr.$_get(2);
      expect(element056Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5700
     * @tc.name testFloat32ArrayReverseOne057
     * @tc.desc Verify reverse() on [-Infinity, 7.0, 8.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Number.POSITIVE_INFINITY, 7.0, 8.0]);
      arr.reverse();
      const element057 = arr.$_get(0);
      expect(element057).assertEqual(8.0);
      const element057Part2 = arr.$_get(2);
      expect(element057Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5800
     * @tc.name testFloat32ArrayReverseOne058
     * @tc.desc Verify reverse() on [9.0, 10.0, -0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 10.0, -0.0]);
      arr.reverse();
      const element058 = 1.0 / arr.$_get(0);
      expect(element058).assertEqual(-Number.POSITIVE_INFINITY);
      const element058Part2 = arr.$_get(2);
      expect(element058Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_5900
     * @tc.name testFloat32ArrayReverseOne059
     * @tc.desc Verify reverse() on [0.1, 11.0, 12.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.1]);
      const arr = new Float32Array([0.1, 11.0, 12.0]);
      arr.reverse();
      const element059 = arr.$_get(0);
      expect(element059).assertEqual(12.0);
      const element059Part2 = arr.$_get(2);
      expect(element059Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6000
     * @tc.name testFloat32ArrayReverseOne060
     * @tc.desc Verify reverse() on [16777217, 13.0, 14.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217, 13.0, 14.0]);
      arr.reverse();
      const element060 = arr.$_get(0);
      expect(element060).assertEqual(14.0);
      const element060Part2 = arr.$_get(2);
      expect(element060Part2).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6100
     * @tc.name testFloat32ArrayReverseOne061
     * @tc.desc Verify reverse() on [15.0, 16.0, 1.0e40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([15.0, 16.0, 1.0e40]);
      arr.reverse();
      const element061 = arr.$_get(0);
      expect(element061).assertEqual(Number.POSITIVE_INFINITY);
      const element061Part2 = arr.$_get(2);
      expect(element061Part2).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6200
     * @tc.name testFloat32ArrayReverseOne062
     * @tc.desc Verify reverse() on [1.401298464324817e-45, 17.0, 18.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 17.0, 18.0]);
      arr.reverse();
      const element062 = arr.$_get(0);
      expect(element062).assertEqual(18.0);
      const element062Part2 = arr.$_get(2);
      expect(element062Part2).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6300
     * @tc.name testFloat32ArrayReverseOne063
     * @tc.desc Verify reverse() on [2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([2147483647]);
      const arr = new Float32Array([19.0, 20.0, 2147483647]);
      arr.reverse();
      const element063 = arr.$_get(0);
      expect(element063).assertEqual(ref.$_get(0));
      const element063Part2 = arr.$_get(2);
      expect(element063Part2).assertEqual(19.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6400
     * @tc.name testFloat32ArrayReverseOne064
     * @tc.desc Verify reverse() on [3.4028234663852886e+38, 1.0, 2.0, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.0, 2.0, 3.0, 4.0]);
      arr.reverse();
      const element064 = arr.$_get(0);
      expect(element064).assertEqual(4.0);
      const element064Part2 = arr.$_get(4);
      expect(element064Part2).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6500
     * @tc.name testFloat32ArrayReverseOne065
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, 4.0, NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, Number.NaN]);
      arr.reverse();
      const element065 = arr.$_get(0);
      expect(element065).assertNaN();
      const element065Part2 = arr.$_get(4);
      expect(element065Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6600
     * @tc.name testFloat32ArrayReverseOne066
     * @tc.desc Verify reverse() on [1.0, Infinity, 2.0, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.POSITIVE_INFINITY, 2.0, 3.0, 4.0]);
      arr.reverse();
      const element066 = arr.$_get(0);
      expect(element066).assertEqual(4.0);
      const element066Part2 = arr.$_get(1);
      expect(element066Part2).assertEqual(3.0);
      const element066Part3 = arr.$_get(3);
      expect(element066Part3).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6700
     * @tc.name testFloat32ArrayReverseOne067
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, -0.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, -0.0, 4.0]);
      arr.reverse();
      const element067 = 1.0 / arr.$_get(1);
      expect(element067).assertEqual(-Number.POSITIVE_INFINITY);
      const element067Part2 = arr.$_get(3);
      expect(element067Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6800
     * @tc.name testFloat32ArrayReverseOne068
     * @tc.desc Verify reverse() on [0.1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.1]);
      const arr = new Float32Array([0.1, 1.0, 2.0, 3.0, 4.0]);
      arr.reverse();
      const element068 = arr.$_get(0);
      expect(element068).assertEqual(4.0);
      const element068Part2 = arr.$_get(4);
      expect(element068Part2).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_6900
     * @tc.name testFloat32ArrayReverseOne069
     * @tc.desc Verify reverse() on [1.0, 2.0, 16777217, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 16777217, 3.0, 4.0]);
      arr.reverse();
      const element069 = arr.$_get(0);
      expect(element069).assertEqual(4.0);
      const element069Part2 = arr.$_get(2);
      expect(element069Part2).assertEqual(16777216);
      const element069Part3 = arr.$_get(4);
      expect(element069Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7000
     * @tc.name testFloat32ArrayReverseOne070
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, 4.0, 1.0e40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 1.0e40]);
      arr.reverse();
      const element070 = arr.$_get(0);
      expect(element070).assertEqual(Number.POSITIVE_INFINITY);
      const element070Part2 = arr.$_get(4);
      expect(element070Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7100
     * @tc.name testFloat32ArrayReverseOne071
     * @tc.desc Verify reverse() on [1.401298464324817e-45, 1.0, 2.0, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 1.0, 2.0, 3.0, 4.0]);
      arr.reverse();
      const element071 = arr.$_get(0);
      expect(element071).assertEqual(4.0);
      const element071Part2 = arr.$_get(4);
      expect(element071Part2).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7200
     * @tc.name testFloat32ArrayReverseOne072
     * @tc.desc Verify reverse() on [1.0, 2.0, NaN, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, Number.NaN, 3.0, 4.0]);
      arr.reverse();
      const element072 = arr.$_get(0);
      expect(element072).assertEqual(4.0);
      const element072Part2 = arr.$_get(2);
      expect(element072Part2).assertNaN();
      const element072Part3 = arr.$_get(4);
      expect(element072Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7300
     * @tc.name testFloat32ArrayReverseOne073
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, Infinity, 4.0, 5.0, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, Number.POSITIVE_INFINITY, 4.0, 5.0, 6.0]);
      arr.reverse();
      const element073 = arr.$_get(0);
      expect(element073).assertEqual(6.0);
      const element073Part2 = arr.$_get(3);
      expect(element073Part2).assertEqual(Number.POSITIVE_INFINITY);
      const element073Part3 = arr.$_get(6);
      expect(element073Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7400
     * @tc.name testFloat32ArrayReverseOne074
     * @tc.desc Verify reverse() on [1.0, 2.0, -0.0, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, -0.0, 3.0, 4.0]);
      arr.reverse();
      const element074 = arr.$_get(0);
      expect(element074).assertEqual(4.0);
      const element074Part2 = 1.0 / arr.$_get(2);
      expect(element074Part2).assertEqual(-Number.POSITIVE_INFINITY);
      const element074Part3 = arr.$_get(4);
      expect(element074Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7500
     * @tc.name testFloat32ArrayReverseOne075
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.4028234663852886e+38, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.4028234663852886e+38, 3.0, 4.0]);
      arr.reverse();
      const element075 = arr.$_get(0);
      expect(element075).assertEqual(4.0);
      const element075Part2 = arr.$_get(2);
      expect(element075Part2).assertEqual(3.4028234663852886e+38);
      const element075Part3 = arr.$_get(4);
      expect(element075Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7600
     * @tc.name testFloat32ArrayReverseOne076
     * @tc.desc Verify reverse() on [0.1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.1]);
      const arr = new Float32Array([1.0, 2.0, 3.0, 0.1, 4.0, 5.0, 6.0]);
      arr.reverse();
      const element076 = arr.$_get(0);
      expect(element076).assertEqual(6.0);
      const element076Part2 = arr.$_get(3);
      expect(element076Part2).assertEqual(ref.$_get(0));
      const element076Part3 = arr.$_get(6);
      expect(element076Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7700
     * @tc.name testFloat32ArrayReverseOne077
     * @tc.desc Verify reverse() on [1.0, 2.0, 1.0e40, 3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 1.0e40, 3.0, 4.0]);
      arr.reverse();
      const element077 = arr.$_get(0);
      expect(element077).assertEqual(4.0);
      const element077Part2 = arr.$_get(2);
      expect(element077Part2).assertEqual(Number.POSITIVE_INFINITY);
      const element077Part3 = arr.$_get(4);
      expect(element077Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7800
     * @tc.name testFloat32ArrayReverseOne078
     * @tc.desc Verify reverse() on [1.0, 2.0, 3.0, 16777217, 4.0, 5.0, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 16777217, 4.0, 5.0, 6.0]);
      arr.reverse();
      const element078 = arr.$_get(0);
      expect(element078).assertEqual(6.0);
      const element078Part2 = arr.$_get(3);
      expect(element078Part2).assertEqual(16777216);
      const element078Part3 = arr.$_get(6);
      expect(element078Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_7900
     * @tc.name testFloat32ArrayReverseOne079
     * @tc.desc Verify reverse() on [1.0, 1.0e40, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0e40, 2.0]);
      arr.reverse();
      const element079 = arr.$_get(0);
      expect(element079).assertEqual(2.0);
      const element079Part2 = arr.$_get(1);
      expect(element079Part2).assertEqual(Number.POSITIVE_INFINITY);
      const element079Part3 = arr.$_get(2);
      expect(element079Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8000
     * @tc.name testFloat32ArrayReverseOne080
     * @tc.desc Verify reverse() on [3.0, 1.0e-46, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0e-46, 4.0]);
      arr.reverse();
      const element080 = arr.$_get(0);
      expect(element080).assertEqual(4.0);
      const element080Part2 = arr.$_get(1);
      expect(element080Part2).assertEqual(0.0);
      const element080Part3 = arr.$_get(2);
      expect(element080Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8100
     * @tc.name testFloat32ArrayReverseOne081
     * @tc.desc Verify reverse() on [5.0, 16777217, 6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 16777217, 6.0]);
      arr.reverse();
      const element081 = arr.$_get(0);
      expect(element081).assertEqual(6.0);
      const element081Part2 = arr.$_get(1);
      expect(element081Part2).assertEqual(16777216);
      const element081Part3 = arr.$_get(2);
      expect(element081Part3).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8200
     * @tc.name testFloat32ArrayReverseOne082
     * @tc.desc Verify reverse() on [0.1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.1]);
      const arr = new Float32Array([7.0, 0.1, 8.0]);
      arr.reverse();
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(8.0);
      const element082Part2 = arr.$_get(1);
      expect(element082Part2).assertEqual(ref.$_get(0));
      const element082Part3 = arr.$_get(2);
      expect(element082Part3).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8300
     * @tc.name testFloat32ArrayReverseOne083
     * @tc.desc Verify reverse() on [0.2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([0.2]);
      const arr = new Float32Array([9.0, 0.2, 11.0]);
      arr.reverse();
      const element083 = arr.$_get(0);
      expect(element083).assertEqual(11.0);
      const element083Part2 = arr.$_get(1);
      expect(element083Part2).assertEqual(ref.$_get(0));
      const element083Part3 = arr.$_get(2);
      expect(element083Part3).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8400
     * @tc.name testFloat32ArrayReverseOne084
     * @tc.desc Verify reverse() on [12.0, NaN, 13.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([12.0, Number.NaN, 13.0]);
      arr.reverse();
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(13.0);
      const element084Part2 = arr.$_get(1);
      expect(element084Part2).assertNaN();
      const element084Part3 = arr.$_get(2);
      expect(element084Part3).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8500
     * @tc.name testFloat32ArrayReverseOne085
     * @tc.desc Verify reverse() on [14.0, -0.0, 15.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([14.0, -0.0, 15.0]);
      arr.reverse();
      const element085 = arr.$_get(0);
      expect(element085).assertEqual(15.0);
      const element085Part2 = 1.0 / arr.$_get(1);
      expect(element085Part2).assertEqual(-Number.POSITIVE_INFINITY);
      const element085Part3 = arr.$_get(2);
      expect(element085Part3).assertEqual(14.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8600
     * @tc.name testFloat32ArrayReverseOne086
     * @tc.desc Verify reverse() on [16.0, 3.4028234663852886e+38, 17.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16.0, 3.4028234663852886e+38, 17.0]);
      arr.reverse();
      const element086 = arr.$_get(0);
      expect(element086).assertEqual(17.0);
      const element086Part2 = arr.$_get(1);
      expect(element086Part2).assertEqual(3.4028234663852886e+38);
      const element086Part3 = arr.$_get(2);
      expect(element086Part3).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8700
     * @tc.name testFloat32ArrayReverseOne087
     * @tc.desc Verify reverse() on [18.0, -3.4028234663852886e+38, 19.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([18.0, -3.4028234663852886e+38, 19.0]);
      arr.reverse();
      const element087 = arr.$_get(0);
      expect(element087).assertEqual(19.0);
      const element087Part2 = arr.$_get(1);
      expect(element087Part2).assertEqual(-3.4028234663852886e+38);
      const element087Part3 = arr.$_get(2);
      expect(element087Part3).assertEqual(18.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8800
     * @tc.name testFloat32ArrayReverseOne088
     * @tc.desc Verify reverse() on [20.0, 1.401298464324817e-45, 21.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([20.0, 1.401298464324817e-45, 21.0]);
      arr.reverse();
      const element088 = arr.$_get(0);
      expect(element088).assertEqual(21.0);
      const element088Part2 = arr.$_get(1);
      expect(element088Part2).assertEqual(1.401298464324817e-45);
      const element088Part3 = arr.$_get(2);
      expect(element088Part3).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_8900
     * @tc.name testFloat32ArrayReverseOne089
     * @tc.desc Verify reverse() on [22.0, 1.1754943508222875e-38, 23.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([22.0, 1.1754943508222875e-38, 23.0]);
      arr.reverse();
      const element089 = arr.$_get(0);
      expect(element089).assertEqual(23.0);
      const element089Part2 = arr.$_get(1);
      expect(element089Part2).assertEqual(1.1754943508222875e-38);
      const element089Part3 = arr.$_get(2);
      expect(element089Part3).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_ONE_9000
     * @tc.name testFloat32ArrayReverseOne090
     * @tc.desc Verify reverse() on [2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new Float32Array([2147483647]);
      const arr = new Float32Array([24.0, 2147483647, 25.0]);
      arr.reverse();
      const element090 = arr.$_get(0);
      expect(element090).assertEqual(25.0);
      const element090Part2 = arr.$_get(1);
      expect(element090Part2).assertEqual(ref.$_get(0));
      const element090Part3 = arr.$_get(2);
      expect(element090Part3).assertEqual(24.0);
    });

  });
}
