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

export default function Float32ArrayOf2Test(): void {
  describe('Float32ArrayOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0010
     * @tc.name testFloat32ArrayOfTwo001
     * @tc.desc Verify Float32Array.of empty result has zero byte length and offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0020
     * @tc.name testFloat32ArrayOfTwo002
     * @tc.desc Verify Float32Array.of preserves a single negative fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.25);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(-1.25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0030
     * @tc.name testFloat32ArrayOfTwo003
     * @tc.desc Verify Float32Array.of preserves signed pair order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.5, -3.5);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.$_get(0)).assertEqual(3.5);
      expect(arr.$_get(1)).assertEqual(-3.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0040
     * @tc.name testFloat32ArrayOfTwo004
     * @tc.desc Verify Float32Array.of preserves fractional sequence endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.25, 0.5, 0.75);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(0.25);
      expect(arr.$_get(2)).assertEqual(0.75);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0050
     * @tc.name testFloat32ArrayOfTwo005
     * @tc.desc Verify Float32Array.of preserves negative to positive ten-value range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0);
      expect(arr.length).assertEqual(10);
      expect(arr.byteLength).assertEqual(40);
      expect(arr.$_get(0)).assertEqual(-5.0);
      expect(arr.$_get(5)).assertEqual(0.0);
      expect(arr.$_get(9)).assertEqual(4.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0060
     * @tc.name testFloat32ArrayOfTwo006
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0,...) produces asserted values 20, 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0);
      expect(arr.length).assertEqual(20);
      const element006 = arr.$_get(19);
      expect(element006).assertEqual(20.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0070
     * @tc.name testFloat32ArrayOfTwo007
     * @tc.desc Verify Float32Array.of(5.0, 5.0, 5.0, 5.0, 5.0) produces asserted values 5, 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0, 5.0, 5.0);
      expect(arr.length).assertEqual(5);
      const element007 = arr.$_get(0);
      expect(element007).assertEqual(5.0);
      const element007Part2 = arr.$_get(4);
      expect(element007Part2).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0080
     * @tc.name testFloat32ArrayOfTwo008
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0,...) produces asserted values 50, 1.0, 50.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0);
      expect(arr.length).assertEqual(50);
      const element008 = arr.$_get(0);
      expect(element008).assertEqual(1.0);
      const element008Part2 = arr.$_get(49);
      expect(element008Part2).assertEqual(50.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0090
     * @tc.name testFloat32ArrayOfTwo009
     * @tc.desc Verify Float32Array.of(3.4028234663852886e+38) produces asserted values 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38);
      const element009 = arr.$_get(0);
      expect(element009).assertEqual(3.4028234663852886e+38);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0100
     * @tc.name testFloat32ArrayOfTwo010
     * @tc.desc Verify Float32Array.of(-3.4028234663852886e+38) produces asserted values -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.4028234663852886e+38);
      const element010 = arr.$_get(0);
      expect(element010).assertEqual(-3.4028234663852886e+38);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0110
     * @tc.name testFloat32ArrayOfTwo011
     * @tc.desc Verify Float32Array.of(1.1754943508222875e-38) produces asserted values 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38);
      const element011 = arr.$_get(0);
      expect(element011).assertEqual(1.1754943508222875e-38);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0120
     * @tc.name testFloat32ArrayOfTwo012
     * @tc.desc Verify Float32Array.of(1.401298464324817e-45) produces asserted values 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45);
      const element012 = arr.$_get(0);
      expect(element012).assertEqual(1.401298464324817e-45);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0130
     * @tc.name testFloat32ArrayOfTwo013
     * @tc.desc Verify Float32Array.of(Number.NaN) produces asserted values NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN);
      const element013 = arr.$_get(0);
      expect(element013).assertNaN();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0140
     * @tc.name testFloat32ArrayOfTwo014
     * @tc.desc Verify Float32Array.of(Number.POSITIVE_INFINITY) produces asserted values Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY);
      const element014 = arr.$_get(0);
      expect(element014).assertEqual(Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0150
     * @tc.name testFloat32ArrayOfTwo015
     * @tc.desc Verify Float32Array.of(Number.NEGATIVE_INFINITY) produces asserted values -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NEGATIVE_INFINITY);
      const element015 = arr.$_get(0);
      expect(element015).assertEqual(-Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0160
     * @tc.name testFloat32ArrayOfTwo016
     * @tc.desc Verify Float32Array.of(0.0) produces asserted values Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0);
      const element016 = 1 / arr.$_get(0);
      expect(element016).assertEqual(Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0170
     * @tc.name testFloat32ArrayOfTwo017
     * @tc.desc Verify Float32Array.of(-0.0) produces asserted values -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const element017 = 1 / arr.$_get(0);
      expect(element017).assertEqual(-Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0180
     * @tc.name testFloat32ArrayOfTwo018
     * @tc.desc Verify Float32Array.of(7.0) produces asserted values 7.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(7.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0190
     * @tc.name testFloat32ArrayOfTwo019
     * @tc.desc Verify Float32Array.of(-7.0) produces asserted values -7.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-7.0);
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(-7.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0200
     * @tc.name testFloat32ArrayOfTwo020
     * @tc.desc Verify Float32Array.of(0.1) produces asserted values Math.fround(0.1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.1))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0210
     * @tc.name testFloat32ArrayOfTwo021
     * @tc.desc Verify Float32Array.of(0.2) produces asserted values Math.fround(0.2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.2);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.2))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0220
     * @tc.name testFloat32ArrayOfTwo022
     * @tc.desc Verify Float32Array.of(0.3) produces asserted values Math.fround(0.3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.3);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.3))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0230
     * @tc.name testFloat32ArrayOfTwo023
     * @tc.desc Verify Float32Array.of(1.1) produces asserted values Math.fround(1.1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1);
      expect(arr.$_get(0)).assertEqual(Math.fround(1.1))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0240
     * @tc.name testFloat32ArrayOfTwo024
     * @tc.desc Verify Float32Array.of(1.0000001) produces asserted values Math.fround(1.0000001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0000001);
      expect(arr.$_get(0)).assertEqual(Math.fround(1.0000001))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0250
     * @tc.name testFloat32ArrayOfTwo025
     * @tc.desc Verify Float32Array.of(16777216.0) produces asserted values 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0);
      const element025 = arr.$_get(0);
      expect(element025).assertEqual(16777216);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0260
     * @tc.name testFloat32ArrayOfTwo026
     * @tc.desc Verify Float32Array.of(16777217.0) produces asserted values 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0);
      const element026 = arr.$_get(0);
      expect(element026).assertEqual(16777216);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0270
     * @tc.name testFloat32ArrayOfTwo027
     * @tc.desc Verify Float32Array.of(-1.0e40) produces asserted values -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40);
      const element028 = arr.$_get(0);
      expect(element028).assertEqual(-Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0280
     * @tc.name testFloat32ArrayOfTwo028
     * @tc.desc Verify Float32Array.of(1.0e-46) produces asserted values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-46);
      const element029 = arr.$_get(0);
      expect(element029).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0290
     * @tc.name testFloat32ArrayOfTwo029
     * @tc.desc Verify Float32Array.of(2147483647.0) produces asserted values 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2147483647.0);
      const element030 = arr.$_get(0);
      expect(element030).assertEqual(2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0300
     * @tc.name testFloat32ArrayOfTwo030
     * @tc.desc Verify Float32Array.of(-2147483648.0) produces asserted values -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2147483648.0);
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0310
     * @tc.name testFloat32ArrayOfTwo031
     * @tc.desc Verify Float32Array.of(0.5) produces asserted values 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.5);
      const element032 = arr.$_get(0);
      expect(element032).assertEqual(0.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0320
     * @tc.name testFloat32ArrayOfTwo032
     * @tc.desc Verify Float32Array.of(3.14159265) produces asserted values Math.fround(3.14159265)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.14159265);
      expect(arr.$_get(0)).assertEqual(Math.fround(3.14159265))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0330
     * @tc.name testFloat32ArrayOfTwo033
     * @tc.desc Verify Float32Array.of(2.718281828) produces asserted values Math.fround(2.718281828)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.718281828);
      expect(arr.$_get(0)).assertEqual(Math.fround(2.718281828))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0340
     * @tc.name testFloat32ArrayOfTwo034
     * @tc.desc Verify Float32Array.of(100.0) produces asserted values 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0);
      const element035 = arr.$_get(0);
      expect(element035).assertEqual(100.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0350
     * @tc.name testFloat32ArrayOfTwo035
     * @tc.desc Verify Float32Array.of(-100.0) produces asserted values -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-100.0);
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(-100.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0360
     * @tc.name testFloat32ArrayOfTwo036
     * @tc.desc Verify Float32Array.of(123456.789) produces asserted values the documented behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(123456.789);
      const element037 = Math.abs(arr.$_get(0) - 123456.789);
      expect(element037).assertLess(0.01);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0370
     * @tc.name testFloat32ArrayOfTwo037
     * @tc.desc Verify Float32Array.of(1e-7) produces asserted values the documented behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e-7);
      const element038 = Math.abs(arr.$_get(0) - 1e-7);
      expect(element038).assertLess(1e-9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0380
     * @tc.name testFloat32ArrayOfTwo038
     * @tc.desc Verify Float32Array.of(1e7) produces asserted values 1e7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e7);
      const element039 = arr.$_get(0);
      expect(element039).assertEqual(1e7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0390
     * @tc.name testFloat32ArrayOfTwo039
     * @tc.desc Verify Float32Array.of(Number.MAX_SAFE_INTEGER) produces asserted values 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.MAX_SAFE_INTEGER);
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(9007199254740992);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0400
     * @tc.name testFloat32ArrayOfTwo040
     * @tc.desc Verify Float32Array.of(Number.MIN_SAFE_INTEGER) produces asserted values -9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.MIN_SAFE_INTEGER);
      const element041 = arr.$_get(0);
      expect(element041).assertEqual(-9007199254740992);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0410
     * @tc.name testFloat32ArrayOfTwo041
     * @tc.desc Verify Float32Array.of(Number.MAX_VALUE) produces asserted values Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.MAX_VALUE);
      const element042 = arr.$_get(0);
      expect(element042).assertEqual(Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0420
     * @tc.name testFloat32ArrayOfTwo042
     * @tc.desc Verify Float32Array.of(Number.MIN_VALUE) produces asserted values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.MIN_VALUE);
      const element043 = arr.$_get(0);
      expect(element043).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0430
     * @tc.name testFloat32ArrayOfTwo043
     * @tc.desc Verify Float32Array.of(0x10) produces asserted values 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10);
      const element044 = arr.$_get(0);
      expect(element044).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0440
     * @tc.name testFloat32ArrayOfTwo044
     * @tc.desc Verify Float32Array.of(0o20) produces asserted values 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0o20);
      const element045 = arr.$_get(0);
      expect(element045).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0450
     * @tc.name testFloat32ArrayOfTwo045
     * @tc.desc Verify Float32Array.of(0b10000) produces asserted values 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b10000);
      const element046 = arr.$_get(0);
      expect(element046).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0460
     * @tc.name testFloat32ArrayOfTwo046
     * @tc.desc Verify Float32Array.of(16.0) produces asserted values 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16.0);
      const element047 = arr.$_get(0);
      expect(element047).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0470
     * @tc.name testFloat32ArrayOfTwo047
     * @tc.desc Verify Float32Array.of(1.0e3) produces asserted values 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e3);
      const element048 = arr.$_get(0);
      expect(element048).assertEqual(1000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0480
     * @tc.name testFloat32ArrayOfTwo048
     * @tc.desc Verify Float32Array.of(1.0e-3) produces asserted values the documented behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-3);
      const element049 = Math.abs(arr.$_get(0) - 0.001);
      expect(element049).assertLess(1e-7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0490
     * @tc.name testFloat32ArrayOfTwo049
     * @tc.desc Verify Float32Array.of(2.5e2) produces asserted values 250
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.5e2);
      const element050 = arr.$_get(0);
      expect(element050).assertEqual(250);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0500
     * @tc.name testFloat32ArrayOfTwo050
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0) produces asserted values 1.0, 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const element051 = arr.$_get(0);
      expect(element051).assertEqual(1.0);
      const element051Part2 = arr.$_get(4);
      expect(element051Part2).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0510
     * @tc.name testFloat32ArrayOfTwo051
     * @tc.desc Verify Float32Array.of(5.0, 4.0, 3.0, 2.0, 1.0) produces asserted values 5.0, 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 4.0, 3.0, 2.0, 1.0);
      const element052 = arr.$_get(0);
      expect(element052).assertEqual(5.0);
      const element052Part2 = arr.$_get(4);
      expect(element052Part2).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0520
     * @tc.name testFloat32ArrayOfTwo052
     * @tc.desc Verify Float32Array.of(-1.0, 0.0, 1.0) produces asserted values -1.0, 0.0, 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, 0.0, 1.0);
      const element053 = arr.$_get(0);
      expect(element053).assertEqual(-1.0);
      const element053Part2 = arr.$_get(1);
      expect(element053Part2).assertEqual(0.0);
      const element053Part3 = arr.$_get(2);
      expect(element053Part3).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0530
     * @tc.name testFloat32ArrayOfTwo053
     * @tc.desc Verify Float32Array.of(Number.NaN, 1.0, -Number.POSITIVE_INFINITY, 0.0) produces asserted values 1.0, -Number.POSITIVE_INFINITY, 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, -Number.POSITIVE_INFINITY, 0.0);
      const element054 = arr.$_get(0);
      expect(element054).assertNaN();
      const element054Part2 = arr.$_get(1);
      expect(element054Part2).assertEqual(1.0);
      const element054Part3 = arr.$_get(2);
      expect(element054Part3).assertEqual(-Number.POSITIVE_INFINITY);
      const element054Part4 = arr.$_get(3);
      expect(element054Part4).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0540
     * @tc.name testFloat32ArrayOfTwo054
     * @tc.desc Verify Float32Array.of(1.0, Number.NaN, 2.0) produces asserted values 1.0, 2.0, NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 2.0);
      const element055 = arr.$_get(0);
      expect(element055).assertEqual(1.0);
      const element055Part2 = arr.$_get(1);
      expect(element055Part2).assertNaN();
      const element055Part3 = arr.$_get(2);
      expect(element055Part3).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0550
     * @tc.name testFloat32ArrayOfTwo055
     * @tc.desc Verify Float32Array.of(0.1, 0.2, 0.3) produces asserted values Math.fround(0.1), Math.fround(0.2), Math.fround(0.3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2, 0.3);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.1))
      expect(arr.$_get(1)).assertEqual(Math.fround(0.2))
      expect(arr.$_get(2)).assertEqual(Math.fround(0.3))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0560
     * @tc.name testFloat32ArrayOfTwo056
     * @tc.desc Verify Float32Array.of(16777216.0, 16777217.0, 16777218.0) produces asserted values 16777216, 16777218
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 16777217.0, 16777218.0);
      const element057 = arr.$_get(0);
      expect(element057).assertEqual(16777216);
      const element057Part2 = arr.$_get(1);
      expect(element057Part2).assertEqual(16777216);
      const element057Part3 = arr.$_get(2);
      expect(element057Part3).assertEqual(16777218);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0570
     * @tc.name testFloat32ArrayOfTwo057
     * @tc.desc Verify Float32Array.of(3.4028234663852886e+38, -3.4028234663852886e+38, Number.NaN, Number.POSITIVE_INFINITY) produces asserted values 3.4028234663852886e+38, -3.4028234663852886e+38, Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, -3.4028234663852886e+38, Number.NaN, Number.POSITIVE_INFINITY);
      const element058 = arr.$_get(0);
      expect(element058).assertEqual(3.4028234663852886e+38);
      const element058Part2 = arr.$_get(1);
      expect(element058Part2).assertEqual(-3.4028234663852886e+38);
      const element058Part3 = arr.$_get(2);
      expect(element058Part3).assertNaN();
      const element058Part4 = arr.$_get(3);
      expect(element058Part4).assertEqual(Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0580
     * @tc.name testFloat32ArrayOfTwo058
     * @tc.desc Verify Float32Array.of(3.4028234663852886e+38, -3.4028234663852886e+38) produces asserted values 3.4028234663852886e+38, -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, -3.4028234663852886e+38);
      const element059 = arr.$_get(0);
      expect(element059).assertEqual(3.4028234663852886e+38);
      const element059Part2 = arr.$_get(1);
      expect(element059Part2).assertEqual(-3.4028234663852886e+38);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0590
     * @tc.name testFloat32ArrayOfTwo059
     * @tc.desc Verify Float32Array.of(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0.0, -0.0) produces asserted values Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0.0, -0.0);
      const element060 = arr.$_get(0);
      expect(element060).assertEqual(Number.POSITIVE_INFINITY);
      const element060Part2 = arr.$_get(1);
      expect(element060Part2).assertEqual(-Number.POSITIVE_INFINITY);
      const element060Part3 = 1 / arr.$_get(2);
      expect(element060Part3).assertEqual(Number.POSITIVE_INFINITY);
      const element060Part4 = 1 / arr.$_get(3);
      expect(element060Part4).assertEqual(-Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0600
     * @tc.name testFloat32ArrayOfTwo060
     * @tc.desc Verify Float32Array.of(0.0, -0.0) produces asserted values Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0);
      const element061 = 1 / arr.$_get(0);
      expect(element061).assertEqual(Number.POSITIVE_INFINITY);
      const element061Part2 = 1 / arr.$_get(1);
      expect(element061Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0610
     * @tc.name testFloat32ArrayOfTwo061
     * @tc.desc Verify Float32Array.of(Number.NaN, Number.NaN, Number.NaN) produces asserted values NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.NaN, Number.NaN);
      const element062 = arr.$_get(0);
      expect(element062).assertNaN();
      const element062Part2 = arr.$_get(1);
      expect(element062Part2).assertNaN();
      const element062Part3 = arr.$_get(2);
      expect(element062Part3).assertNaN();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0620
     * @tc.name testFloat32ArrayOfTwo062
     * @tc.desc Verify Float32Array.of(16777216.0, 16777217.0) produces asserted values 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 16777217.0);
      const element063 = arr.$_get(0);
      expect(element063).assertEqual(16777216);
      const element063Part2 = arr.$_get(1);
      expect(element063Part2).assertEqual(16777216);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0630
     * @tc.name testFloat32ArrayOfTwo063
     * @tc.desc Verify Float32Array.of(1.0e40, -1.0e40) produces asserted values Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40, -1.0e40);
      const element064 = arr.$_get(0);
      expect(element064).assertEqual(Number.POSITIVE_INFINITY);
      const element064Part2 = arr.$_get(1);
      expect(element064Part2).assertEqual(-Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0640
     * @tc.name testFloat32ArrayOfTwo064
     * @tc.desc Verify Float32Array.of(1.0e-46, 1.0e-45) produces asserted values 0, 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-46, 1.0e-45);
      const element065 = arr.$_get(0);
      expect(element065).assertEqual(0);
      const element065Part2 = arr.$_get(1);
      expect(element065Part2).assertEqual(1.401298464324817e-45);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0650
     * @tc.name testFloat32ArrayOfTwo065
     * @tc.desc Verify Float32Array.of(0.1, 0.2, 0.3) produces asserted values the documented behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2, 0.3);
      const sum = arr.$_get(0) + arr.$_get(1);
      const element066 = Math.abs(sum - arr.$_get(2));
      expect(element066).assertLarger(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0660
     * @tc.name testFloat32ArrayOfTwo066
     * @tc.desc Verify Float32Array.of(1.0, 2.0) produces asserted values 2, 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0670
     * @tc.name testFloat32ArrayOfTwo067
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0, 4.0) produces asserted values 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      expect(arr.length).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0680
     * @tc.name testFloat32ArrayOfTwo068
     * @tc.desc Verify Float32Array.of(1.0, 2.0) produces asserted values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.byteOffset).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0690
     * @tc.name testFloat32ArrayOfTwo069
     * @tc.desc Verify Float32Array.of(1.0, 2.0) produces asserted values 8, 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.buffer.byteLength).assertEqual(8);
      expect(arr.$_get(0)).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0700
     * @tc.name testFloat32ArrayOfTwo070
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.buffer.byteLength).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0710
     * @tc.name testFloat32ArrayOfTwo071
     * @tc.desc Verify Float32Array.of(11.0, 22.0, 33.0) produces asserted values 11.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const element073 = arr.$_get(0);
      expect(element073).assertEqual(11.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0720
     * @tc.name testFloat32ArrayOfTwo072
     * @tc.desc Verify Float32Array.of(11.0, 22.0, 33.0) produces asserted values 33.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const element074 = arr.$_get(2);
      expect(element074).assertEqual(33.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0730
     * @tc.name testFloat32ArrayOfTwo073
     * @tc.desc Verify Float32Array.of(11.0, 22.0, 33.0) produces asserted values 11.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const atValue075 = arr.at(0);
      expect(atValue075).assertEqual(11.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0740
     * @tc.name testFloat32ArrayOfTwo074
     * @tc.desc Verify Float32Array.of(11.0, 22.0, 33.0) produces asserted values 33.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const atValue076 = arr.at(-1);
      expect(atValue076).assertEqual(33.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0750
     * @tc.name testFloat32ArrayOfTwo075
     * @tc.desc Verify Float32Array.of(11.0, 22.0, 33.0) produces asserted values undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const atValue077 = arr.at(3);
      expect(atValue077).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0760
     * @tc.name testFloat32ArrayOfTwo076
     * @tc.desc Verify Float32Array.of(11.0, 22.0, 33.0) produces asserted values 11.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const iter = arr.values();
      const iteratorValue078 = iter.next().value;
      expect(iteratorValue078).assertEqual(11.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0770
     * @tc.name testFloat32ArrayOfTwo077
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values 1.0, 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const collected: number[] = [0, 0, 0];
      let i = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) { const v = arr.$_get(__f32i);
        collected[i] = v;
        i = i + 1;
      }
      expect(collected[0]).assertEqual(1.0);
      expect(collected[2]).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0780
     * @tc.name testFloat32ArrayOfTwo078
     * @tc.desc Verify Float32Array.of(1.0) produces asserted values 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0);
      const b = Float32Array.of(1.0);
      b.$_set(0, 99.0);
      const element080 = a.$_get(0);
      expect(element080).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0790
     * @tc.name testFloat32ArrayOfTwo079
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const observedValue081 = arr.toString();
      expect(observedValue081).assertEqual('1,2,3');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0800
     * @tc.name testFloat32ArrayOfTwo080
     * @tc.desc Verify Float32Array.of(1.0) produces asserted values 1, 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0810
     * @tc.name testFloat32ArrayOfTwo081
     * @tc.desc Verify Float32Array.of(10.0, 20.0) produces asserted values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const iter = arr.keys();
      const iteratorValue083 = iter.next().value;
      expect(iteratorValue083).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0820
     * @tc.name testFloat32ArrayOfTwo082
     * @tc.desc Verify Float32Array.of(10.0, 20.0) produces asserted values 0, 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const iter = arr.entries();
      const first = iter.next().value!;
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0830
     * @tc.name testFloat32ArrayOfTwo083
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values 99.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const view = arr.subarray(0, 2);
      view.$_set(0, 99.0);
      const element085 = arr.$_get(0);
      expect(element085).assertEqual(99.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0840
     * @tc.name testFloat32ArrayOfTwo084
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const copy = arr.slice(0, 2);
      copy.$_set(0, 99.0);
      const element086 = arr.$_get(0);
      expect(element086).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0850
     * @tc.name testFloat32ArrayOfTwo085
     * @tc.desc Verify Float32Array.of(no arguments) produces asserted values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      expect(arr.buffer.byteLength).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0860
     * @tc.name testFloat32ArrayOfTwo086
     * @tc.desc Verify Float32Array.of(16777219.0) produces asserted values 16777220
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777219.0);
      const element088 = arr.$_get(0);
      expect(element088).assertEqual(16777220);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0870
     * @tc.name testFloat32ArrayOfTwo087
     * @tc.desc Verify Float32Array.of(16777215.0) produces asserted values 16777215
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777215.0);
      const element089 = arr.$_get(0);
      expect(element089).assertEqual(16777215);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0880
     * @tc.name testFloat32ArrayOfTwo088
     * @tc.desc Verify Float32Array.of(0.1) produces asserted values the documented behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const element090 = Math.abs(arr.$_get(0) - 0.1);
      expect(element090).assertLarger(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0890
     * @tc.name testFloat32ArrayOfTwo089
     * @tc.desc Verify Float32Array.of(2.0 / 3.0) produces asserted values Math.fround((2.0 / 3.0))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0 / 3.0);
      expect(arr.$_get(0)).assertEqual(Math.fround((2.0 / 3.0)))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0900
     * @tc.name testFloat32ArrayOfTwo090
     * @tc.desc Verify Float32Array.of(1.0 / 3.0) produces asserted values Math.fround((1.0 / 3.0))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0 / 3.0);
      expect(arr.$_get(0)).assertEqual(Math.fround((1.0 / 3.0)))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0910
     * @tc.name testFloat32ArrayOfTwo091
     * @tc.desc Verify Float32Array.of(0.1 + 0.2) produces asserted values Math.fround(0.3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1 + 0.2);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.3))
    });
        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0920
     * @tc.name testFloat32ArrayOfTwo092
     * @tc.desc Verify Float32Array.of(Number.MAX_SAFE_INTEGER - 1) produces asserted values 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.MAX_SAFE_INTEGER - 1);
      const element095 = arr.$_get(0);
      expect(element095).assertEqual(9007199254740992);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0930
     * @tc.name testFloat32ArrayOfTwo093
     * @tc.desc Verify Float32Array.of(v) produces asserted values 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 42.0;
      const arr = Float32Array.of(v);
      const element096 = arr.$_get(0);
      expect(element096).assertEqual(42.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0940
     * @tc.name testFloat32ArrayOfTwo094
     * @tc.desc Verify Float32Array.of(1 + 1) produces asserted values 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1 + 1);
      const element097 = arr.$_get(0);
      expect(element097).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0950
     * @tc.name testFloat32ArrayOfTwo095
     * @tc.desc Verify Float32Array.of(-1 * 5) produces asserted values -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1 * 5);
      const element098 = arr.$_get(0);
      expect(element098).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0960
     * @tc.name testFloat32ArrayOfTwo096
     * @tc.desc Verify Float32Array.of(10.0 / 4.0) produces asserted values 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0 / 4.0);
      const element099 = arr.$_get(0);
      expect(element099).assertEqual(2.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0970
     * @tc.name testFloat32ArrayOfTwo097
     * @tc.desc Verify Float32Array.of(10 % 3) produces asserted values 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10 % 3);
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0980
     * @tc.name testFloat32ArrayOfTwo098
     * @tc.desc Verify Float32Array.of(a * b) produces asserted values 12.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 3.0;
      const b: number = 4.0;
      const arr = Float32Array.of(a * b);
      const element101 = arr.$_get(0);
      expect(element101).assertEqual(12.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_0990
     * @tc.name testFloat32ArrayOfTwo099
     * @tc.desc Verify Float32Array.of(2.9) produces asserted values 1, Math.fround(2.9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.9);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(Math.fround(2.9))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1000
     * @tc.name testFloat32ArrayOfTwo100
     * @tc.desc Verify Float32Array.of(-2.9) produces asserted values 1, Math.fround((-2.9))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2.9);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(Math.fround((-2.9)))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1010
     * @tc.name testFloat32ArrayOfTwo101
     * @tc.desc Verify Float32Array.of(0.0) produces asserted values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0);
      const element104 = arr.$_get(0);
      expect(element104).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1020
     * @tc.name testFloat32ArrayOfTwo102
     * @tc.desc Verify Float32Array.of(1e15) produces asserted values 999999986991104
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e15);
      const element105 = arr.$_get(0);
      expect(element105).assertEqual(999999986991104);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1030
     * @tc.name testFloat32ArrayOfTwo103
     * @tc.desc Verify Float32Array.of(-1e15) produces asserted values -999999986991104
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1e15);
      const element106 = arr.$_get(0);
      expect(element106).assertEqual(-999999986991104);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1040
     * @tc.name testFloat32ArrayOfTwo104
     * @tc.desc Verify Float32Array.of(0.125) produces asserted values 0.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.125);
      const element107 = arr.$_get(0);
      expect(element107).assertEqual(0.125);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1050
     * @tc.name testFloat32ArrayOfTwo105
     * @tc.desc Verify Float32Array.of(0.0625) produces asserted values 0.0625
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0625);
      const element108 = arr.$_get(0);
      expect(element108).assertEqual(0.0625);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1060
     * @tc.name testFloat32ArrayOfTwo106
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0) produces asserted values 1, 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const element109 = arr.$_get(0);
      expect(element109).assertEqual(1);
      const element109Part2 = arr.$_get(4);
      expect(element109Part2).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1070
     * @tc.name testFloat32ArrayOfTwo107
     * @tc.desc Verify Float32Array.of(-1.0, -2.0, -3.0, -4.0, -5.0) produces asserted values -1, -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0, -4.0, -5.0);
      const element110 = arr.$_get(0);
      expect(element110).assertEqual(-1);
      const element110Part2 = arr.$_get(4);
      expect(element110Part2).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1080
     * @tc.name testFloat32ArrayOfTwo108
     * @tc.desc Verify Float32Array.of(0.0, 0.0, 0.0, 0.0) produces asserted values 4, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      expect(arr.length).assertEqual(4);
      const element111 = arr.$_get(0);
      expect(element111).assertEqual(0);
      const element111Part2 = arr.$_get(3);
      expect(element111Part2).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1090
     * @tc.name testFloat32ArrayOfTwo109
     * @tc.desc Verify Float32Array.of(1.0, -1.0, 2.0, -2.0, 3.0, -3.0) produces asserted values 1, -1, -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -1.0, 2.0, -2.0, 3.0, -3.0);
      const element112 = arr.$_get(0);
      expect(element112).assertEqual(1);
      const element112Part2 = arr.$_get(1);
      expect(element112Part2).assertEqual(-1);
      const element112Part3 = arr.$_get(5);
      expect(element112Part3).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1100
     * @tc.name testFloat32ArrayOfTwo110
     * @tc.desc Verify Float32Array.of(0.1, 0.2, 0.3, 0.4) produces asserted values 4, Math.fround(0.1), Math.fround(0.4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2, 0.3, 0.4);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.1))
      expect(arr.$_get(3)).assertEqual(Math.fround(0.4))
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1110
     * @tc.name testFloat32ArrayOfTwo111
     * @tc.desc Verify Float32Array.of(1e30, 1e-30) produces asserted values 1.0000000150474662e+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e30, 1e-30);
      const element114 = arr.$_get(0);
      expect(element114).assertEqual(1.0000000150474662e+30);
      const element114Part2 = Math.abs(arr.$_get(1) - 1e-30);
      expect(element114Part2).assertLess(1e-36);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1120
     * @tc.name testFloat32ArrayOfTwo112
     * @tc.desc Verify Float32Array.of(v) produces asserted values 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 5.0;
      const arr = Float32Array.of(v);
      arr.$_set(0, 99.0);
      expect(v).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1130
     * @tc.name testFloat32ArrayOfTwo113
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values 3, 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.fill(0.0);
      expect(arr.length).assertEqual(3);
      const element116 = arr.$_get(0);
      expect(element116).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1140
     * @tc.name testFloat32ArrayOfTwo114
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) produces asserted values 3.0, 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const element117 = arr.$_get(0);
      expect(element117).assertEqual(3.0);
      const element117Part2 = arr.$_get(2);
      expect(element117Part2).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1150
     * @tc.name testFloat32ArrayOfTwo115
     * @tc.desc Verify Float32Array.of(10.0, 20.0, 30.0) produces asserted values 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const indexValue118 = arr.indexOf(20.0);
      expect(indexValue118).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1160
     * @tc.name testFloat32ArrayOfTwo116
     * @tc.desc Verify Float32Array.of(10.0, 20.0, 30.0) produces asserted values true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const predicateResult119 = arr.includes(20.0);
      expect(predicateResult119).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1170
     * @tc.name testFloat32ArrayOfTwo117
     * @tc.desc Verify Float32Array.of(1.0, Number.NaN, 3.0) produces asserted values true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const predicateResult120 = arr.includes(Number.NaN);
      expect(predicateResult120).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_TWO_1180
     * @tc.name testFloat32ArrayOfTwo118
     * @tc.desc Verify Float32Array.of(1.0, Number.NaN, 3.0) produces asserted values -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2

     */

    it('testFloat32ArrayOfTwo118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const indexValue121 = arr.indexOf(Number.NaN);
      expect(indexValue121).assertEqual(-1);
    });
  });
}
