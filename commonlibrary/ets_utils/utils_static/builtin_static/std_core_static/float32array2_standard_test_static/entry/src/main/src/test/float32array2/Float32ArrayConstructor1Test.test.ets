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

export default function Float32ArrayConstructor1Test(): void {
  describe('Float32ArrayConstructor1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0010
     * @tc.name testFloat32ArrayConstructorOne001
     * @tc.desc Verify overload 1 constructor() zero-argument constructs internal buffer is non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0020
     * @tc.name testFloat32ArrayConstructorOne002
     * @tc.desc Verify overload 5 constructor(FixedArray) one-argument empty source constructs length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0030
     * @tc.name testFloat32ArrayConstructorOne003
     * @tc.desc Verify overload 5 constructor(FixedArray) one-argument single-element source length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [7.5];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0040
     * @tc.name testFloat32ArrayConstructorOne004
     * @tc.desc Verify overload 5 constructor(FixedArray) one-argument three-element source length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0050
     * @tc.name testFloat32ArrayConstructorOne005
     * @tc.desc Verify overload 5 constructor(FixedArray) one-argument ten-element source length is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0060
     * @tc.name testFloat32ArrayConstructorOne006
     * @tc.desc Verify overload 9 constructor(ArrayBuffer,int) two-argument byteOffset=4 on 8 buffer length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 4);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0070
     * @tc.name testFloat32ArrayConstructorOne007
     * @tc.desc Verify overload 9 constructor(ArrayBuffer,int) two-argument byteOffset=0 on 12 buffer length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0080
     * @tc.name testFloat32ArrayConstructorOne008
     * @tc.desc Verify overload 13 constructor(ArrayBuffer) one-argument 20 buffer length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0090
     * @tc.name testFloat32ArrayConstructorOne009
     * @tc.desc Verify overload 5 source contains float32 maximum finite value 3.4028234663852886e+38 stores unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [3.4028234663852886e+38];
      const arr = new Float32Array(src);
      const element017 = arr.$_get(0);
      expect(element017).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0100
     * @tc.name testFloat32ArrayConstructorOne010
     * @tc.desc Verify overload 5 source contains float32 minimum finite negative value-3.4028234663852886e+38 stores unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-3.4028234663852886e+38];
      const arr = new Float32Array(src);
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0110
     * @tc.name testFloat32ArrayConstructorOne011
     * @tc.desc Verify overload 5 source contains minimum normal value 1.1754943508222875e-38 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.1754943508222875e-38];
      const arr = new Float32Array(src);
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0120
     * @tc.name testFloat32ArrayConstructorOne012
     * @tc.desc Verify overload 5 source contains minimum positive subnormal value 1.401298464324817e-45 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.401298464324817e-45];
      const arr = new Float32Array(src);
      const element020 = arr.$_get(0);
      expect(element020).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0130
     * @tc.name testFloat32ArrayConstructorOne013
     * @tc.desc Verify overload 5 source contains NaN stores as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [Number.NaN];
      const arr = new Float32Array(src);
      const element021 = arr.$_get(0);
      expect(element021).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0140
     * @tc.name testFloat32ArrayConstructorOne014
     * @tc.desc Verify overload 5 source contains +Infinity stores as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      const arr = new Float32Array(src);
      const element022 = arr.$_get(0);
      expect(element022).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0150
     * @tc.name testFloat32ArrayConstructorOne015
     * @tc.desc Verify overload 5 source contains -Infinity stores as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      const arr = new Float32Array(src);
      const element023 = arr.$_get(0);
      expect(element023).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0160
     * @tc.name testFloat32ArrayConstructorOne016
     * @tc.desc Verify overload 5 source contains +0 stores as +0(1/x is Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.0];
      const arr = new Float32Array(src);
      const element024 = 1.0 / arr.$_get(0);
      expect(element024).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0170
     * @tc.name testFloat32ArrayConstructorOne017
     * @tc.desc Verify overload 5 source contains -0 stores as -0(1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-0.0];
      const arr = new Float32Array(src);
      const element025 = 1.0 / arr.$_get(0);
      expect(element025).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0180
     * @tc.name testFloat32ArrayConstructorOne018
     * @tc.desc Verify overload 5 source contains 0.1 is truncated by float32 precision and approximates 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.1];
      const arr = new Float32Array(src);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0190
     * @tc.name testFloat32ArrayConstructorOne019
     * @tc.desc Verify overload 5 source contains 0.2 is truncated by float32 precision and approximates 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.2];
      const arr = new Float32Array(src);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0200
     * @tc.name testFloat32ArrayConstructorOne020
     * @tc.desc Verify overload 5 source contains 0.3 is truncated by float32 precision and approximates 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.3];
      const arr = new Float32Array(src);
      expect(arr.$_get(0)).assertEqual(Math.fround(0.3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0210
     * @tc.name testFloat32ArrayConstructorOne021
     * @tc.desc Verify overload 5 source contains 1.1 is truncated by float32 precision and approximates 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.1];
      const arr = new Float32Array(src);
      expect(arr.$_get(0)).assertEqual(Math.fround(1.1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0220
     * @tc.name testFloat32ArrayConstructorOne022
     * @tc.desc Verify overload 5 source contains 0.1+0.2 and float64 0.3 on float32 precision difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.1 + 0.2];
      const arr = new Float32Array(src);
      const element030 = Math.abs(arr.$_get(0) - 0.3);
      expect(element030).assertLarger(1e-9);
      expect(element030).assertLess(2e-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0230
     * @tc.name testFloat32ArrayConstructorOne023
     * @tc.desc Verify overload 5 source contains 16777216(2^24) stores exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [16777216];
      const arr = new Float32Array(src);
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0240
     * @tc.name testFloat32ArrayConstructorOne024
     * @tc.desc Verify overload 5 source contains 16777217(2^24+1) is float32 truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [16777217];
      const arr = new Float32Array(src);
      const element032 = arr.$_get(0);
      expect(element032).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0250
     * @tc.name testFloat32ArrayConstructorOne025
     * @tc.desc Verify overload 5 source contains 1.0e40 exceeds the float32 range stores as +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0e40];
      const arr = new Float32Array(src);
      const element033 = arr.$_get(0);
      expect(element033).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0260
     * @tc.name testFloat32ArrayConstructorOne026
     * @tc.desc Verify overload 5 source contains -1.0e40 exceeds the float32 range stores as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-1.0e40];
      const arr = new Float32Array(src);
      const element034 = arr.$_get(0);
      expect(element034).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0270
     * @tc.name testFloat32ArrayConstructorOne027
     * @tc.desc Verify overload 5 source contains 1.0e-46 underflows stores as +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0e-46];
      const arr = new Float32Array(src);
      const element035 = arr.$_get(0);
      expect(element035).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0280
     * @tc.name testFloat32ArrayConstructorOne028
     * @tc.desc Verify overload 5 source contains scientific notation 1.0e3 stores as 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0e3];
      const arr = new Float32Array(src);
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0290
     * @tc.name testFloat32ArrayConstructorOne029
     * @tc.desc Verify overload 5 source contains 16 float 9.0 stores as 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [9.0];
      const arr = new Float32Array(src);
      const element037 = arr.$_get(0);
      expect(element037).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0300
     * @tc.name testFloat32ArrayConstructorOne030
     * @tc.desc Verify overload 5 source contains maximum int value 2147483647 stores float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [2147483647];
      const arr = new Float32Array(src);
      const element038 = arr.$_get(0);
      expect(element038).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0310
     * @tc.name testFloat32ArrayConstructorOne031
     * @tc.desc Verify overload 5 source contains minimum int value-2147483648 stores float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-2147483648];
      const arr = new Float32Array(src);
      const element039 = arr.$_get(0);
      expect(element039).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0320
     * @tc.name testFloat32ArrayConstructorOne032
     * @tc.desc Verify overload 5 source contains element value 2.9 stores unchanged (non truncates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [2.9];
      const arr = new Float32Array(src);
      expect(arr.$_get(0)).assertEqual(Math.fround(2.9));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0330
     * @tc.name testFloat32ArrayConstructorOne033
     * @tc.desc Verify overload 5 source contains negative float -1.5 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-1.5];
      const arr = new Float32Array(src);
      const element041 = arr.$_get(0);
      expect(element041).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0340
     * @tc.name testFloat32ArrayConstructorOne034
     * @tc.desc Verify overload 5 source all same values [5.0,5.0,5.0] stores each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [5.0, 5.0, 5.0];
      const arr = new Float32Array(src);
      const element042 = arr.$_get(0);
      expect(element042).assertEqual(5.0);
      expect(arr.$_get(1)).assertEqual(5.0);
      const element042Part2 = arr.$_get(2);
      expect(element042Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0350
     * @tc.name testFloat32ArrayConstructorOne035
     * @tc.desc Verify overload 5 source contains mixed signs [-1.0,0.0,1.0] stores in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-1.0, 0.0, 1.0];
      const arr = new Float32Array(src);
      const element043 = arr.$_get(0);
      expect(element043).assertEqual(-1.0);
      const middle = 1.0 / arr.$_get(1);
      expect(middle).assertEqual(Number.POSITIVE_INFINITY);
      const element043Part2 = arr.$_get(2);
      expect(element043Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0360
     * @tc.name testFloat32ArrayConstructorOne036
     * @tc.desc Verify overload 5 source contains Number.MAX_SAFE_INTEGER is float32 stores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [9007199254740991];
      const arr = new Float32Array(src);
      const element044 = arr.$_get(0);
      expect(element044).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0370
     * @tc.name testFloat32ArrayConstructorOne037
     * @tc.desc Verify overload 9 byteOffset=8 on 8 buffer to 0 empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 8);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0380
     * @tc.name testFloat32ArrayConstructorOne038
     * @tc.desc Verify overload 9 byteOffset=12 on 16 buffer length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 12);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0390
     * @tc.name testFloat32ArrayConstructorOne039
     * @tc.desc Verify overload 9 byteOffset=0 on 0 buffer length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Float32Array(buf, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0400
     * @tc.name testFloat32ArrayConstructorOne040
     * @tc.desc Verify overload 9 byteOffset=0 on 4 buffer length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Float32Array(buf, 0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0410
     * @tc.name testFloat32ArrayConstructorOne041
     * @tc.desc Verify overload 13 one-argument 12 buffer length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0420
     * @tc.name testFloat32ArrayConstructorOne042
     * @tc.desc Verify overload 13 one-argument 16 buffer length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0430
     * @tc.name testFloat32ArrayConstructorOne043
     * @tc.desc Verify overload 13 one-argument 28 buffer length is 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(28);
      const arr = new Float32Array(buf);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0440
     * @tc.name testFloat32ArrayConstructorOne044
     * @tc.desc Verify overload 1 vs overload 5 is constructs argument count different result different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a0 = new Float32Array();
      const a1 = new Float32Array([1.0, 2.0]);
      expect(a0.length).assertEqual(0);
      expect(a1.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0450
     * @tc.name testFloat32ArrayConstructorOne045
     * @tc.desc Verify overload 5(FixedArray source) vs overload 13(ArrayBuffer source) result length source different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromFixed = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const fromBuf = new Float32Array(new ArrayBuffer(16));
      expect(fromFixed.length).assertEqual(4);
      expect(fromBuf.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0460
     * @tc.name testFloat32ArrayConstructorOne046
     * @tc.desc Verify overload 9(byteOffset=0) and overload 13(buffer) on buffer result consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue056 = new Float32Array(buf, 0);
      const observedValue056Part2 = new Float32Array(new ArrayBuffer(8));
      expect(observedValue056.length).assertEqual(observedValue056Part2.length);
      expect(observedValue056.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0470
     * @tc.name testFloat32ArrayConstructorOne047
     * @tc.desc Verify overload 9 view buffer overload 5 constructs buffer (for)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new ArrayBuffer(8);
      const observedValue057 = new Float32Array(shared, 0);
      const observedValue057Part2 = new Float32Array([1.0, 2.0]);
      expect(observedValue057.buffer).assertEqual(shared);
      const observedValue057Part3 = observedValue057Part2.buffer === shared;
      expect(observedValue057Part3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0480
     * @tc.name testFloat32ArrayConstructorOne048
     * @tc.desc Verify zero-argument construction creates an empty Float32Array with four-byte elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0490
     * @tc.name testFloat32ArrayConstructorOne049
     * @tc.desc Verify empty Float32Array $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0500
     * @tc.name testFloat32ArrayConstructorOne050
     * @tc.desc Verify empty Float32Array at(0) and at(-1) both return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      expect(arr.at(0)).assertUndefined();
      expect(arr.at(-1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0510
     * @tc.name testFloat32ArrayConstructorOne051
     * @tc.desc Verify empty Float32Array toString is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const observedValue062 = arr.toString();
      expect(observedValue062).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0520
     * @tc.name testFloat32ArrayConstructorOne052
     * @tc.desc Verify empty Float32Array join(',') is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const joinedValue063 = arr.join(',');
      expect(joinedValue063).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0530
     * @tc.name testFloat32ArrayConstructorOne053
     * @tc.desc Verify empty Float32Array values() iterator is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const it = arr.values();
      const iteratorValue064 = it.next().done;
      expect(iteratorValue064).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0540
     * @tc.name testFloat32ArrayConstructorOne054
     * @tc.desc Verify empty Float32Array fill returns this and stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.fill(1.0);
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0550
     * @tc.name testFloat32ArrayConstructorOne055
     * @tc.desc Verify empty Float32Array map returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.map((v: number, index: int, array: Float32Array): number => v + 1.0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0560
     * @tc.name testFloat32ArrayConstructorOne056
     * @tc.desc Verify empty Float32Array filter returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.filter((v: number, index: int, array: Float32Array): boolean => v > 0.0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0570
     * @tc.name testFloat32ArrayConstructorOne057
     * @tc.desc Verify empty Float32Array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const predicateResult068 = arr.every((v: number, index: int, array: Float32Array): boolean => v > 0.0);
      expect(predicateResult068).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0580
     * @tc.name testFloat32ArrayConstructorOne058
     * @tc.desc Verify empty Float32Array some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const predicateResult069 = arr.some((v: number, index: int, array: Float32Array): boolean => v > 0.0);
      expect(predicateResult069).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0590
     * @tc.name testFloat32ArrayConstructorOne059
     * @tc.desc Verify empty Float32Array find returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const foundValue070 = arr.find((v: number, index: int, array: Float32Array): boolean => v > 0.0);
      expect(foundValue070).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0600
     * @tc.name testFloat32ArrayConstructorOne060
     * @tc.desc Verify empty Float32Array findIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const foundIndex071 = arr.findIndex((v: number, index: int, array: Float32Array): boolean => v > 0.0);
      expect(foundIndex071).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0610
     * @tc.name testFloat32ArrayConstructorOne061
     * @tc.desc Verify empty Float32Array reduce without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      try {
        arr.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0620
     * @tc.name testFloat32ArrayConstructorOne062
     * @tc.desc Verify empty Float32Array reduce with initialValue returns the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 42.0);
      expect(r).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0630
     * @tc.name testFloat32ArrayConstructorOne063
     * @tc.desc Verify empty Float32Array subarray(0) returns an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.subarray(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0640
     * @tc.name testFloat32ArrayConstructorOne064
     * @tc.desc Verify empty Float32Array slice(0) returns an empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.slice(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0650
     * @tc.name testFloat32ArrayConstructorOne065
     * @tc.desc Verify empty Float32Array reverse returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0660
     * @tc.name testFloat32ArrayConstructorOne066
     * @tc.desc Verify empty Float32Array sort returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.sort();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0670
     * @tc.name testFloat32ArrayConstructorOne067
     * @tc.desc Verify empty Float32Array toReversed returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0680
     * @tc.name testFloat32ArrayConstructorOne068
     * @tc.desc Verify empty Float32Array toSorted returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const r = arr.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0690
     * @tc.name testFloat32ArrayConstructorOne069
     * @tc.desc Verify empty Float32Array indexOf returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const indexValue080 = arr.indexOf(1.0);
      expect(indexValue080).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0700
     * @tc.name testFloat32ArrayConstructorOne070
     * @tc.desc Verify empty Float32Array includes returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const predicateResult081 = arr.includes(1.0);
      expect(predicateResult081).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0710
     * @tc.name testFloat32ArrayConstructorOne071
     * @tc.desc Verify empty Float32Array entries() iterator is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      const it = arr.entries();
      const iteratorValue082 = it.next().done;
      expect(iteratorValue082).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0720
     * @tc.name testFloat32ArrayConstructorOne072
     * @tc.desc Verify two FixedArray-constructed arrays do not share buffer on $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const b = new Float32Array([1.0, 2.0, 3.0]);
      a.$_set(0, 99.0);
      const element085 = b.$_get(0);
      expect(element085).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0730
     * @tc.name testFloat32ArrayConstructorOne073
     * @tc.desc Verify FixedArray-constructed $_set middle element keeps neighbors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      arr.$_set(1, 200.0);
      const element086 = arr.$_get(0);
      expect(element086).assertEqual(10.0);
      expect(arr.$_get(1)).assertEqual(200.0);
      const element086Part2 = arr.$_get(2);
      expect(element086Part2).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0740
     * @tc.name testFloat32ArrayConstructorOne074
     * @tc.desc Verify [1,2,3] at(-1) returns last and at(0) returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.at(-1)).assertEqual(3.0);
      expect(arr.at(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0750
     * @tc.name testFloat32ArrayConstructorOne075
     * @tc.desc Verify FixedArray-constructed values() yields elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.values();
      const iteratorValue089 = it.next().value;
      expect(iteratorValue089).assertEqual(1.0);
      const iteratorValue089Part2 = it.next().value;
      expect(iteratorValue089Part2).assertEqual(2.0);
      const iteratorValue089Part3 = it.next().value;
      expect(iteratorValue089Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0760
     * @tc.name testFloat32ArrayConstructorOne076
     * @tc.desc Verify FixedArray-constructed entries() yields [index,value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0]);
      const it = arr.entries();
      const first = it.next().value!;
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(7.0);
      const second = it.next().value!;
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertEqual(8.0);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0770
     * @tc.name testFloat32ArrayConstructorOne077
     * @tc.desc Verify FixedArray-constructed indexOf match returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const indexValue091 = arr.indexOf(2.0);
      expect(indexValue091).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0780
     * @tc.name testFloat32ArrayConstructorOne078
     * @tc.desc Verify FixedArray-constructed lastIndexOf match returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 2.0, 3.0]);
      const lastIndexValue092 = arr.lastIndexOf(2.0);
      expect(lastIndexValue092).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0790
     * @tc.name testFloat32ArrayConstructorOne079
     * @tc.desc Verify FixedArray-constructed includes(NaN) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.NaN, 3.0]);
      const predicateResult093 = arr.includes(Number.NaN);
      expect(predicateResult093).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0800
     * @tc.name testFloat32ArrayConstructorOne080
     * @tc.desc Verify FixedArray-constructed indexOf(NaN) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.NaN, 3.0]);
      const indexValue094 = arr.indexOf(Number.NaN);
      expect(indexValue094).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0810
     * @tc.name testFloat32ArrayConstructorOne081
     * @tc.desc Verify ArrayBuffer view byteOffset=4 length is (16-4)/4 = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0820
     * @tc.name testFloat32ArrayConstructorOne082
     * @tc.desc Verify ArrayBuffer view buffer property equals source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0830
     * @tc.name testFloat32ArrayConstructorOne083
     * @tc.desc Verify ArrayBuffer view byteOffset=4 byteLength is 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0840
     * @tc.name testFloat32ArrayConstructorOne084
     * @tc.desc Verify ArrayBuffer view byteOffset=0 length and buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0);
      expect(arr.length).assertEqual(2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0850
     * @tc.name testFloat32ArrayConstructorOne085
     * @tc.desc Verify ArrayBuffer view $_set then $_get is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0);
      arr.$_set(0, 1.5);
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0860
     * @tc.name testFloat32ArrayConstructorOne086
     * @tc.desc Verify one-arg ArrayBuffer(8) view byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0870
     * @tc.name testFloat32ArrayConstructorOne087
     * @tc.desc Verify one-arg ArrayBuffer(4) view length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Float32Array(buf);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0880
     * @tc.name testFloat32ArrayConstructorOne088
     * @tc.desc Verify one-arg ArrayBuffer view $_set/$_get second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      arr.$_set(1, 2.5);
      const element106 = arr.$_get(1);
      expect(element106).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0890
     * @tc.name testFloat32ArrayConstructorOne089
     * @tc.desc Verify empty Float32Array with(0,1.0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      try {
        arr.with(0, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0900
     * @tc.name testFloat32ArrayConstructorOne090
     * @tc.desc Verify byteOffset=3 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0910
     * @tc.name testFloat32ArrayConstructorOne091
     * @tc.desc Verify byteOffset=5 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0920
     * @tc.name testFloat32ArrayConstructorOne092
     * @tc.desc Verify byteOffset=6 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0930
     * @tc.name testFloat32ArrayConstructorOne093
     * @tc.desc Verify byteOffset=-1 negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0940
     * @tc.name testFloat32ArrayConstructorOne094
     * @tc.desc Verify byteOffset=16 exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0950
     * @tc.name testFloat32ArrayConstructorOne095
     * @tc.desc Verify byteOffset=20 exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 20);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0960
     * @tc.name testFloat32ArrayConstructorOne096
     * @tc.desc Verify byteOffset=9 unaligned and out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0970
     * @tc.name testFloat32ArrayConstructorOne097
     * @tc.desc Verify one-arg ArrayBuffer(6) not multiple of 4 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      try {
        new Float32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0980
     * @tc.name testFloat32ArrayConstructorOne098
     * @tc.desc Verify one-arg ArrayBuffer(10) not multiple of 4 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      try {
        new Float32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_0990
     * @tc.name testFloat32ArrayConstructorOne099
     * @tc.desc Verify one-arg ArrayBuffer(2) not multiple of 4 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      try {
        new Float32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1000
     * @tc.name testFloat32ArrayConstructorOne100
     * @tc.desc Verify one-arg ArrayBuffer(14) not multiple of 4 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(14);
      try {
        new Float32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1010
     * @tc.name testFloat32ArrayConstructorOne101
     * @tc.desc Verify one-arg ArrayBuffer(18) not multiple of 4 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(18);
      try {
        new Float32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1020
     * @tc.name testFloat32ArrayConstructorOne102
     * @tc.desc Verify Float32Array view write is readable via another view on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0);
      view.$_set(0, 1.5);
      const readBack = new Float32Array(buf, 0);
      const element123 = readBack.$_get(0);
      expect(element123).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1030
     * @tc.name testFloat32ArrayConstructorOne103
     * @tc.desc Verify offset views share underlying buffer on write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue124 = new Float32Array(buf, 0);
      const observedValue124Part2 = new Float32Array(buf, 4);
      observedValue124.$_set(1, 7.5);
      const element124 = observedValue124Part2.$_get(0);
      expect(element124).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1040
     * @tc.name testFloat32ArrayConstructorOne104
     * @tc.desc Verify base view $_set is visible through offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue125 = new Float32Array(buf, 0);
      const observedValue125Part2 = new Float32Array(buf, 4);
      observedValue125Part2.$_set(0, 9.5);
      const element125 = observedValue125.$_get(1);
      expect(element125).assertEqual(9.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1050
     * @tc.name testFloat32ArrayConstructorOne105
     * @tc.desc Verify offset view observes base view write at overlapping index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue126 = new Float32Array(buf, 0);
      const observedValue126Part2 = new Float32Array(buf, 4);
      observedValue126.$_set(1, 3.25);
      const element126 = observedValue126Part2.$_get(0);
      expect(element126).assertEqual(3.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1060
     * @tc.name testFloat32ArrayConstructorOne106
     * @tc.desc Verify view stores and reads maximum finite float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf, 0);
      view.$_set(0, 3.4028234663852886e+38);
      const readBack = new Float32Array(buf, 0);
      const element127 = readBack.$_get(0);
      expect(element127).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1070
     * @tc.name testFloat32ArrayConstructorOne107
     * @tc.desc Verify buffer.byteLength unchanged after view writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0);
      view.$_set(0, 1.5);
      view.$_set(1, 2.5);
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1080
     * @tc.name testFloat32ArrayConstructorOne108
     * @tc.desc Verify offset view write is visible through base view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue129 = new Float32Array(buf, 0);
      const observedValue129Part2 = new Float32Array(buf, 4);
      observedValue129Part2.$_set(0, 6.5);
      const element129 = observedValue129.$_get(1);
      expect(element129).assertEqual(6.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1090
     * @tc.name testFloat32ArrayConstructorOne109
     * @tc.desc Verify Float32Array write of 0 replaces an existing non-zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view = new Float32Array([1.0, 2.0]);
      view.$_set(0, 0.0);
      const observedValue130 = view.$_get(0);
      expect(observedValue130).assertEqual(0);
      const observedValue130Part2 = view.$_get(1);
      expect(observedValue130Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1100
     * @tc.name testFloat32ArrayConstructorOne110
     * @tc.desc Verify write is readable via another Float32Array on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf);
      view.$_set(0, 1.5);
      const readBack = new Float32Array(buf, 0);
      const element131 = readBack.$_get(0);
      expect(element131).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1110
     * @tc.name testFloat32ArrayConstructorOne111
     * @tc.desc Verify view writes and reads the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf);
      view.$_set(1, 9.5);
      const element132 = view.$_get(1);
      expect(element132).assertEqual(9.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1120
     * @tc.name testFloat32ArrayConstructorOne112
     * @tc.desc Verify two one-arg buffer views share writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const observedValue133 = new Float32Array(buf);
      const observedValue133Part2 = new Float32Array(buf);
      observedValue133.$_set(0, 4.5);
      const element133 = observedValue133Part2.$_get(0);
      expect(element133).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1130
     * @tc.name testFloat32ArrayConstructorOne113
     * @tc.desc Verify Float32Array write updates all underlying bytes on either native endianness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf);
      view.$_set(0, 1.0);
      const bytes = new Uint8Array(buf);
      const isLittleEndian = bytes.$_get(0) === 0 && bytes.$_get(1) === 0 &&
        bytes.$_get(2) === 128 && bytes.$_get(3) === 63;
      const isBigEndian = bytes.$_get(0) === 63 && bytes.$_get(1) === 128 &&
        bytes.$_get(2) === 0 && bytes.$_get(3) === 0;
      expect(isLittleEndian || isBigEndian).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1140
     * @tc.name testFloat32ArrayConstructorOne114
     * @tc.desc Verify subarray write affects underlying buffer at correct offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf);
      const sub = view.subarray(1);
      sub.$_set(0, 8.5);
      const readBack = new Float32Array(buf, 4);
      const element135 = readBack.$_get(0);
      expect(element135).assertEqual(8.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1150
     * @tc.name testFloat32ArrayConstructorOne115
     * @tc.desc Verify view $_set(-0) preserves negative zero (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf);
      view.$_set(0, -0.0);
      const readBack = new Float32Array(buf, 0);
      const element136 = 1.0 / readBack.$_get(0);
      expect(element136).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1160
     * @tc.name testFloat32ArrayConstructorOne116
     * @tc.desc Verify view $_set(Infinity) is readable as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf);
      view.$_set(0, Number.POSITIVE_INFINITY);
      const readBack = new Float32Array(buf, 0);
      const element137 = readBack.$_get(0);
      expect(element137).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_ONE_1170
     * @tc.name testFloat32ArrayConstructorOne117
     * @tc.desc Verify view $_set(NaN) is readable as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorOne117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Float32Array(buf);
      view.$_set(0, Number.NaN);
      const readBack = new Float32Array(buf, 0);
      const element138 = readBack.$_get(0);
      expect(element138).assertNaN();
    });

  });
}
