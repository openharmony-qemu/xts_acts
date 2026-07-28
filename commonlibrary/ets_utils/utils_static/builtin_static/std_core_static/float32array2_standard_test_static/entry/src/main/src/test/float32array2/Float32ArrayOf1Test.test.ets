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

export default function Float32ArrayOf1Test(): void {
  describe('Float32ArrayOf1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0010
     * @tc.name testFloat32ArrayOfOne001
     * @tc.desc Verify of() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0020
     * @tc.name testFloat32ArrayOfOne002
     * @tc.desc Verify of() creates one element and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0030
     * @tc.name testFloat32ArrayOfOne003
     * @tc.desc Verify of() preserves two element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0040
     * @tc.name testFloat32ArrayOfOne004
     * @tc.desc Verify of() preserves middle element in three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0050
     * @tc.name testFloat32ArrayOfOne005
     * @tc.desc Verify of() preserves signed and fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-2.5, -1.5, 0.5, 1.5, 2.5);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(-2.5);
      expect(arr.$_get(2)).assertEqual(0.5);
      expect(arr.$_get(4)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0060
     * @tc.name testFloat32ArrayOfOne006
     * @tc.desc Verify of() preserves selected indexes in ten values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      expect(arr.length).assertEqual(10);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
      expect(arr.$_get(9)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0070
     * @tc.name testFloat32ArrayOfOne007
     * @tc.desc Verify of() preserves first middle and last values in fifty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array =
        Float32Array.of(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0,
          18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0, 32.0, 33.0, 34.0, 35.0,
          36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0);
      expect(arr.length).assertEqual(50);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(25)).assertEqual(25);
      expect(arr.$_get(49)).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0080
     * @tc.name testFloat32ArrayOfOne008
     * @tc.desc Verify of() preserves boundary indexes in one hundred values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array =
        Float32Array.of(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0,
          18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0, 32.0, 33.0, 34.0, 35.0,
          36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0,
          54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0, 61.0, 62.0, 63.0, 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0, 71.0,
          72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0, 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0, 88.0, 89.0,
          90.0, 91.0, 92.0, 93.0, 94.0, 95.0, 96.0, 97.0, 98.0, 99.0);
      expect(arr.length).assertEqual(100);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(50)).assertEqual(50);
      expect(arr.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0090
     * @tc.name testFloat32ArrayOfOne009
     * @tc.desc Verify of(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0);
      const element009 = arr.$_get(0);
      expect(element009).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0100
     * @tc.name testFloat32ArrayOfOne010
     * @tc.desc Verify of(-0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-0.0);
      const element010 = arr.$_get(0);
      expect(element010).assertEqual(0);
      const sign = 1.0 / element010;
      expect(sign).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0110
     * @tc.name testFloat32ArrayOfOne011
     * @tc.desc Verify of(+0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(+0);
      const element011 = arr.$_get(0);
      expect(element011).assertEqual(0);
      const sign = 1.0 / element011;
      expect(sign).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0120
     * @tc.name testFloat32ArrayOfOne012
     * @tc.desc Verify of(NaN) NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Number.NaN);
      const element012 = arr.$_get(0);
      expect(element012).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0130
     * @tc.name testFloat32ArrayOfOne013
     * @tc.desc Verify of(Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Number.POSITIVE_INFINITY);
      const element013 = arr.$_get(0);
      expect(element013).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0140
     * @tc.name testFloat32ArrayOfOne014
     * @tc.desc Verify of(-Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-Number.POSITIVE_INFINITY);
      const element014 = arr.$_get(0);
      expect(element014).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0150
     * @tc.name testFloat32ArrayOfOne015
     * @tc.desc Verify of(Float32 MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 3.4028234663852886e+38;
      const arr: Float32Array = Float32Array.of(value);
      const element015 = arr.$_get(0);
      expect(element015).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0160
     * @tc.name testFloat32ArrayOfOne016
     * @tc.desc Verify of(-Float32 MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -3.4028234663852886e+38;
      const arr: Float32Array = Float32Array.of(value);
      const element016 = arr.$_get(0);
      expect(element016).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0170
     * @tc.name testFloat32ArrayOfOne017
     * @tc.desc Verify of(Float32 MIN_NORMAL)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.1754943508222875e-38;
      const arr: Float32Array = Float32Array.of(value);
      const element017 = arr.$_get(0);
      expect(element017).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0180
     * @tc.name testFloat32ArrayOfOne018
     * @tc.desc Verify of(Float32 MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.401298464324817e-45;
      const arr: Float32Array = Float32Array.of(value);
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0190
     * @tc.name testFloat32ArrayOfOne019
     * @tc.desc Verify of(1.0e40) float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e40);
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0200
     * @tc.name testFloat32ArrayOfOne020
     * @tc.desc Verify of(-1.0e40) float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0e40);
      const element020 = arr.$_get(0);
      expect(element020).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0210
     * @tc.name testFloat32ArrayOfOne021
     * @tc.desc Verify of(1.0e-46)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e-46);
      const element021 = arr.$_get(0);
      expect(element021).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0220
     * @tc.name testFloat32ArrayOfOne022
     * @tc.desc Verify of(-1.0e-46)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0e-46);
      const element022 = arr.$_get(0);
      expect(element022).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0230
     * @tc.name testFloat32ArrayOfOne023
     * @tc.desc Verify of(0.1) float32 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1);
      const element023 = arr.$_get(0);
      expect(element023).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0240
     * @tc.name testFloat32ArrayOfOne024
     * @tc.desc Verify of(0.2) float32 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.2);
      const element024 = arr.$_get(0);
      expect(element024).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0250
     * @tc.name testFloat32ArrayOfOne025
     * @tc.desc Verify of(0.3) float32 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.3);
      const element025 = arr.$_get(0);
      expect(element025).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0260
     * @tc.name testFloat32ArrayOfOne026
     * @tc.desc Verify of(1.1) float32 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.1);
      const element026 = arr.$_get(0);
      expect(element026).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0270
     * @tc.name testFloat32ArrayOfOne027
     * @tc.desc Verify of(1.0000001) float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0000001);
      const element027 = arr.$_get(0);
      expect(element027).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0280
     * @tc.name testFloat32ArrayOfOne028
     * @tc.desc Verify of(16777216) 2^24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777216.0);
      const element028 = arr.$_get(0);
      expect(element028).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0290
     * @tc.name testFloat32ArrayOfOne029
     * @tc.desc Verify of(16777217) 2^24+1 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777217.0);
      const element029 = arr.$_get(0);
      expect(element029).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0300
     * @tc.name testFloat32ArrayOfOne030
     * @tc.desc Verify of(16777218) 2^24+2 16777218
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777218.0);
      const element030 = arr.$_get(0);
      expect(element030).assertEqual(16777218);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0310
     * @tc.name testFloat32ArrayOfOne031
     * @tc.desc Verify of(2147483647) int float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2147483647.0);
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0320
     * @tc.name testFloat32ArrayOfOne032
     * @tc.desc Verify of(-2147483648) int float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-2147483648.0);
      const element032 = arr.$_get(0);
      expect(element032).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0330
     * @tc.name testFloat32ArrayOfOne033
     * @tc.desc Verify of(1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0);
      const element033 = arr.$_get(0);
      expect(element033).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0340
     * @tc.name testFloat32ArrayOfOne034
     * @tc.desc Verify of(-1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0);
      const element034 = arr.$_get(0);
      expect(element034).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0350
     * @tc.name testFloat32ArrayOfOne035
     * @tc.desc Verify of(100) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(100.0);
      const element035 = arr.$_get(0);
      expect(element035).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0360
     * @tc.name testFloat32ArrayOfOne036
     * @tc.desc Verify of(2.9) number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2.9);
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(2.9000000953674316);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0370
     * @tc.name testFloat32ArrayOfOne037
     * @tc.desc Verify of(3.14159)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.14159);
      const element037 = arr.$_get(0);
      expect(element037).assertEqual(3.141590118408203);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0380
     * @tc.name testFloat32ArrayOfOne038
     * @tc.desc Verify of(0x10) 16 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10);
      const element038 = arr.$_get(0);
      expect(element038).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0390
     * @tc.name testFloat32ArrayOfOne039
     * @tc.desc Verify of(0xff) 16 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0xff);
      const element039 = arr.$_get(0);
      expect(element039).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0400
     * @tc.name testFloat32ArrayOfOne040
     * @tc.desc Verify of(0o20) 8 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0o20);
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0410
     * @tc.name testFloat32ArrayOfOne041
     * @tc.desc Verify of(0o17) 8 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0o17);
      const element041 = arr.$_get(0);
      expect(element041).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0420
     * @tc.name testFloat32ArrayOfOne042
     * @tc.desc Verify of(0b10000) 2 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0b10000);
      const element042 = arr.$_get(0);
      expect(element042).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0430
     * @tc.name testFloat32ArrayOfOne043
     * @tc.desc Verify of(0b11111111) 2 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0b11111111);
      const element043 = arr.$_get(0);
      expect(element043).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0440
     * @tc.name testFloat32ArrayOfOne044
     * @tc.desc Verify of(1.0e3) 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e3);
      const element044 = arr.$_get(0);
      expect(element044).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0450
     * @tc.name testFloat32ArrayOfOne045
     * @tc.desc Verify of(1e10) 10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1e10);
      const element045 = arr.$_get(0);
      expect(element045).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0460
     * @tc.name testFloat32ArrayOfOne046
     * @tc.desc Verify of(-2.5e3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-2.5e3);
      const element046 = arr.$_get(0);
      expect(element046).assertEqual(-2500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0470
     * @tc.name testFloat32ArrayOfOne047
     * @tc.desc Verify of(9.0) 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(9.0);
      const element047 = arr.$_get(0);
      expect(element047).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0480
     * @tc.name testFloat32ArrayOfOne048
     * @tc.desc Verify of(0.25) 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.25);
      const element048 = arr.$_get(0);
      expect(element048).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0490
     * @tc.name testFloat32ArrayOfOne049
     * @tc.desc Verify of(1, 2, 3) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const element049 = arr.$_get(0);
      expect(element049).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0500
     * @tc.name testFloat32ArrayOfOne050
     * @tc.desc Verify of(1, 2, 3) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const element050 = arr.$_get(2);
      expect(element050).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0510
     * @tc.name testFloat32ArrayOfOne051
     * @tc.desc Verify of(3, 2, 1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.0, 2.0, 1.0);
      const element051 = arr.$_get(2);
      expect(element051).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0520
     * @tc.name testFloat32ArrayOfOne052
     * @tc.desc Verify of(-1, 0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0, 0.0, 1.0);
      const element052 = arr.$_get(1);
      expect(element052).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0530
     * @tc.name testFloat32ArrayOfOne053
     * @tc.desc Verify of(NaN, Infinity, -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      const element053 = arr.$_get(1);
      expect(element053).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0540
     * @tc.name testFloat32ArrayOfOne054
     * @tc.desc Verify of(0.1, 0.2, 0.3) 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1, 0.2, 0.3);
      const element054 = arr.$_get(0);
      expect(element054).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0550
     * @tc.name testFloat32ArrayOfOne055
     * @tc.desc Verify of(0.1, 0.2, 0.3) 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1, 0.2, 0.3);
      const element055 = arr.$_get(2);
      expect(element055).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0560
     * @tc.name testFloat32ArrayOfOne056
     * @tc.desc Verify of(1, -1, 2, -2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -1.0, 2.0, -2.0, 3.0);
      const element056 = arr.$_get(3);
      expect(element056).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0570
     * @tc.name testFloat32ArrayOfOne057
     * @tc.desc Verify of(5, 4, 3, 2, 1) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 4.0, 3.0, 2.0, 1.0);
      const element057 = arr.$_get(0);
      expect(element057).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0580
     * @tc.name testFloat32ArrayOfOne058
     * @tc.desc Verify of(5, 4, 3, 2, 1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 4.0, 3.0, 2.0, 1.0);
      const element058 = arr.$_get(4);
      expect(element058).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0590
     * @tc.name testFloat32ArrayOfOne059
     * @tc.desc Verify of(0, NaN, Infinity, -Infinity, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 1.0);
      const element059 = arr.$_get(3);
      expect(element059).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0600
     * @tc.name testFloat32ArrayOfOne060
     * @tc.desc Verify of(Float32 MAX, 0, -Float32 MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.4028234663852886e+38, 0.0, -3.4028234663852886e+38);
      const element060 = arr.$_get(0);
      expect(element060).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0610
     * @tc.name testFloat32ArrayOfOne061
     * @tc.desc Verify of(NaN, NaN, NaN) NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Number.NaN, Number.NaN, Number.NaN);
      const element061 = arr.$_get(0);
      expect(element061).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0620
     * @tc.name testFloat32ArrayOfOne062
     * @tc.desc Verify of(Infinity, Infinity) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
      expect(arr.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0630
     * @tc.name testFloat32ArrayOfOne063
     * @tc.desc Verify of(-0, 0, -0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-0.0, 0.0, -0.0);
      const element063 = arr.$_get(0);
      expect(element063).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0640
     * @tc.name testFloat32ArrayOfOne064
     * @tc.desc Verify of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) 10 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      const element064 = arr.$_get(4);
      expect(element064).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0650
     * @tc.name testFloat32ArrayOfOne065
     * @tc.desc Verify of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) 10 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      const element065 = arr.$_get(8);
      expect(element065).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0660
     * @tc.name testFloat32ArrayOfOne066
     * @tc.desc Verify of(1) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0670
     * @tc.name testFloat32ArrayOfOne067
     * @tc.desc Verify of(1, 2) TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0680
     * @tc.name testFloat32ArrayOfOne068
     * @tc.desc Verify of() byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0690
     * @tc.name testFloat32ArrayOfOne069
     * @tc.desc Verify of(1, 2, 3) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0700
     * @tc.name testFloat32ArrayOfOne070
     * @tc.desc Verify Float32Array.of(1.0) creates a four-byte backing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0710
     * @tc.name testFloat32ArrayOfOne071
     * @tc.desc Verify of(1, 2) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0720
     * @tc.name testFloat32ArrayOfOne072
     * @tc.desc Verify of(1, 2, 3) at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const atValue074 = arr.at(0);
      expect(atValue074).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0730
     * @tc.name testFloat32ArrayOfOne073
     * @tc.desc Verify of(1, 2, 3) at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const atValue075 = arr.at(-1);
      expect(atValue075).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0740
     * @tc.name testFloat32ArrayOfOne074
     * @tc.desc Verify of(1.5, 2.5) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.5, 2.5);
      const element076 = arr.$_get(0);
      expect(element076).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0750
     * @tc.name testFloat32ArrayOfOne075
     * @tc.desc Verify of(1.5, 2.5) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.5, 2.5);
      const element077 = arr.$_get(1);
      expect(element077).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0760
     * @tc.name testFloat32ArrayOfOne076
     * @tc.desc Verify of(1, 2, 3, 4, 5, 6, 7, 8) length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0770
     * @tc.name testFloat32ArrayOfOne077
     * @tc.desc Verify of(1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Float32Array = Float32Array.of(1.0, 2.0);
      const a2: Float32Array = Float32Array.of(1.0, 2.0);
      a2.$_set(0, 99);
      const element079 = a1.$_get(0);
      expect(element079).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0780
     * @tc.name testFloat32ArrayOfOne078
     * @tc.desc Verify of(1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Float32Array = Float32Array.of(1.0, 2.0);
      a1.$_set(0, 100);
      const a2: Float32Array = Float32Array.of(1.0, 2.0);
      const element080 = a2.$_get(0);
      expect(element080).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0790
     * @tc.name testFloat32ArrayOfOne079
     * @tc.desc Verify of(1, 2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Float32Array = Float32Array.of(1.0, 2.0);
      const a2: Float32Array = Float32Array.of(3.0, 4.0);
      const observedValue081 = a1.buffer === a2.buffer;
      expect(observedValue081).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0800
     * @tc.name testFloat32ArrayOfOne080
     * @tc.desc Verify of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const a2: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const element082 = a1.$_get(2);
      expect(element082).assertEqual(a2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0810
     * @tc.name testFloat32ArrayOfOne081
     * @tc.desc Verify of(1, 2, 3) for of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      let first: number = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        first = v;
        break;
      }
      expect(first).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0820
     * @tc.name testFloat32ArrayOfOne082
     * @tc.desc Verify of(1, 2, 3) values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.values();
      const iteratorValue084 = it.next().value;
      expect(iteratorValue084).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0830
     * @tc.name testFloat32ArrayOfOne083
     * @tc.desc Verify of(1, 2, 3) values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.values();
      it.next();
      it.next();
      const iteratorValue085 = it.next().value;
      expect(iteratorValue085).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0840
     * @tc.name testFloat32ArrayOfOne084
     * @tc.desc Verify of(1, 2, 3) done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.values();
      it.next();
      it.next();
      it.next();
      const iteratorValue086 = it.next().done;
      expect(iteratorValue086).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0850
     * @tc.name testFloat32ArrayOfOne085
     * @tc.desc Verify of(1, 2, 3) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const predicateResult087 = arr.toString();
      expect(predicateResult087).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0860
     * @tc.name testFloat32ArrayOfOne086
     * @tc.desc Verify of() toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of();
      const observedValue088 = arr.toString();
      expect(observedValue088).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0870
     * @tc.name testFloat32ArrayOfOne087
     * @tc.desc Verify of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testFloat32ArrayOfOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0880
     * @tc.name testFloat32ArrayOfOne088
     * @tc.desc Verify of(-0.0) stores negative zero, 1/value is -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-0.0);
      expect(arr.length).assertEqual(1);
      expect(1 / arr.$_get(0)).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0890
     * @tc.name testFloat32ArrayOfOne089
     * @tc.desc Verify of(NaN, Infinity, -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testFloat32ArrayOfOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0900
     * @tc.name testFloat32ArrayOfOne090
     * @tc.desc Verify of(1.0e40) stores positive infinity without throwing for an overflow value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testFloat32ArrayOfOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e40);
      const result: number = arr.$_get(0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0910
     * @tc.name testFloat32ArrayOfOne091
     * @tc.desc Verify of(16777217) stores the nearest float32 value without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testFloat32ArrayOfOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777217.0);
      const result: number = arr.$_get(0);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0920
     * @tc.name testFloat32ArrayOfOne092
     * @tc.desc Verify of(1.0e40, -1.0e40) stores positive and negative infinity for overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e40, -1.0e40);
      const element094 = arr.$_get(0);
      expect(element094).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0930
     * @tc.name testFloat32ArrayOfOne093
     * @tc.desc Verify of(1.0e40, -1.0e40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e40, -1.0e40);
      const element095 = arr.$_get(1);
      expect(element095).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0940
     * @tc.name testFloat32ArrayOfOne094
     * @tc.desc Verify of(1.0e-46, -1.0e-46)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e-46, -1.0e-46);
      const element097 = arr.$_get(1);
      expect(element097).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0950
     * @tc.name testFloat32ArrayOfOne095
     * @tc.desc Verify of(0.1, 0.2, 0.3) 0.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1, 0.2, 0.3);
      const sum: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const observedValue098 = sum === 0.6;
      expect(observedValue098).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0960
     * @tc.name testFloat32ArrayOfOne096
     * @tc.desc Verify of(16777216, 16777217)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777216.0, 16777217.0);
      const element099 = arr.$_get(0);
      expect(element099).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0970
     * @tc.name testFloat32ArrayOfOne097
     * @tc.desc Verify of(2147483647, 2147483648) int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2147483647.0, 2147483648.0);
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0980
     * @tc.name testFloat32ArrayOfOne098
     * @tc.desc Verify of set TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const dst: Float32Array = new Float32Array(3);
      dst.set(src);
      const element101 = dst.$_get(2);
      expect(element101).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_0990
     * @tc.name testFloat32ArrayOfOne099
     * @tc.desc Verify of slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const sub: Float32Array = src.slice(1, 3);
      const element102 = sub.$_get(0);
      expect(element102).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1000
     * @tc.name testFloat32ArrayOfOne100
     * @tc.desc Verify of subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view: Float32Array = src.subarray(1, 3);
      view.$_set(0, 99);
      const element103 = src.$_get(1);
      expect(element103).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1010
     * @tc.name testFloat32ArrayOfOne101
     * @tc.desc Verify of fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      arr.fill(0);
      const element104 = arr.$_get(1);
      expect(element104).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1020
     * @tc.name testFloat32ArrayOfOne102
     * @tc.desc Verify of copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2);
      const element105 = arr.$_get(0);
      expect(element105).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1030
     * @tc.name testFloat32ArrayOfOne103
     * @tc.desc Verify of map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const mapped: Float32Array = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const element106 = mapped.$_get(1);
      expect(element106).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1040
     * @tc.name testFloat32ArrayOfOne104
     * @tc.desc Verify of filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const filtered: Float32Array = arr.filter((v: number, index: int, array: Float32Array): boolean => v > 2);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1050
     * @tc.name testFloat32ArrayOfOne105
     * @tc.desc Verify of reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const sum: number = arr.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1060
     * @tc.name testFloat32ArrayOfOne106
     * @tc.desc Verify of indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 2.0, 1.0);
      const indexValue109 = arr.indexOf(2);
      expect(indexValue109).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1070
     * @tc.name testFloat32ArrayOfOne107
     * @tc.desc Verify of includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const predicateResult110 = arr.includes(2);
      expect(predicateResult110).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1080
     * @tc.name testFloat32ArrayOfOne108
     * @tc.desc Verify of includes NaN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, Number.NaN, 3.0);
      const predicateResult111 = arr.includes(Number.NaN);
      expect(predicateResult111).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1090
     * @tc.name testFloat32ArrayOfOne109
     * @tc.desc Verify of indexOf NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, Number.NaN, 3.0);
      const indexValue112 = arr.indexOf(Number.NaN);
      expect(indexValue112).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1100
     * @tc.name testFloat32ArrayOfOne110
     * @tc.desc Verify of reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const rev: Float32Array = arr.reverse() as Float32Array;
      const element113 = rev.$_get(0);
      expect(element113).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1110
     * @tc.name testFloat32ArrayOfOne111
     * @tc.desc Verify of sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.0, 1.0, 2.0);
      const sorted: Float32Array = arr.sort() as Float32Array;
      const element114 = sorted.$_get(0);
      expect(element114).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1120
     * @tc.name testFloat32ArrayOfOne112
     * @tc.desc Verify of with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const newArr: Float32Array = arr.with(1, 99);
      const element115 = newArr.$_get(1);
      expect(element115).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1130
     * @tc.name testFloat32ArrayOfOne113
     * @tc.desc Verify of toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const rev: Float32Array = arr.toReversed();
      const element116 = rev.$_get(0);
      expect(element116).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1140
     * @tc.name testFloat32ArrayOfOne114
     * @tc.desc Verify of toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.0, 1.0, 2.0);
      const sorted: Float32Array = arr.toSorted();
      const element117 = sorted.$_get(0);
      expect(element117).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1150
     * @tc.name testFloat32ArrayOfOne115
     * @tc.desc Verify of of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const arr2: Float32Array = Float32Array.of(arr.$_get(0), arr.$_get(2));
      const element118 = arr2.$_get(1);
      expect(element118).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1160
     * @tc.name testFloat32ArrayOfOne116
     * @tc.desc Verify of find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const found: number | undefined = arr.find((v: number, index: int, array: Float32Array): boolean => v > 2);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1170
     * @tc.name testFloat32ArrayOfOne117
     * @tc.desc Verify of findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const foundIndex120 = arr.findIndex((v: number, index: int, array: Float32Array): boolean => v > 2);
      expect(foundIndex120).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1180
     * @tc.name testFloat32ArrayOfOne118
     * @tc.desc Verify of some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const predicateResult121 = arr.some((v: number, index: int, array: Float32Array): boolean => v > 2);
      expect(predicateResult121).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1190
     * @tc.name testFloat32ArrayOfOne119
     * @tc.desc Verify of every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const predicateResult122 = arr.every((v: number, index: int, array: Float32Array): boolean => v > 0);
      expect(predicateResult122).assertTrue();
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1200
       * @tc.name testFloat32ArrayOfOne120
       * @tc.desc Verify of forEach
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
    */
    it('testFloat32ArrayOfOne120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      let forEachTotal1125: number = 0;
      arr.forEach((v: number, index: int, array: Float32Array): void => {
        forEachTotal1125 += v;
      });
      expect(forEachTotal1125).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_OF_ONE_1210
     * @tc.name testFloat32ArrayOfOne121
     * @tc.desc Verify of join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayOfOne121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue124 = arr.join(',');
      expect(joinedValue124).assertEqual('1,2,3');
    });
  });
}
