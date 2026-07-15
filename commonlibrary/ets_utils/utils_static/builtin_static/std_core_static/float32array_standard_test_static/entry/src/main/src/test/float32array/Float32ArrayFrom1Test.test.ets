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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayFrom1Test(): void {
  describe('Float32ArrayFrom1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0010
     * @tc.name testFloat32ArrayFromONE001
     * @tc.desc Verify arity 1 passing a FixedArray creates a new Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0x10, 0b1010, -1.0];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(16);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0020
     * @tc.name testFloat32ArrayFromONE002
     * @tc.desc Verify an empty FixedArray yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0030
     * @tc.name testFloat32ArrayFromONE003
     * @tc.desc Verify a single-element FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [42.0];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0040
     * @tc.name testFloat32ArrayFromONE004
     * @tc.desc Verify Float32.MAX boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [3.4028234663852886e+38];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0050
     * @tc.name testFloat32ArrayFromONE005
     * @tc.desc Verify Float32.MIN_NORMAL minimum positive normal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.1754943508222875e-38];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0060
     * @tc.name testFloat32ArrayFromONE006
     * @tc.desc Verify Float32.MIN_VALUE minimum positive subnormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.401298464324817e-45];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0070
     * @tc.name testFloat32ArrayFromONE007
     * @tc.desc Verify NaN is preserved through from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [NaN];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0080
     * @tc.name testFloat32ArrayFromONE008
     * @tc.desc Verify +Infinity is preserved through from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [Infinity];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0090
     * @tc.name testFloat32ArrayFromONE009
     * @tc.desc Verify -Infinity is preserved through from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-Infinity];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0100
     * @tc.name testFloat32ArrayFromONE010
     * @tc.desc Verify +0 is preserved through from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.0];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0110
     * @tc.name testFloat32ArrayFromONE011
     * @tc.desc Verify -0 is preserved through from() as negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-0.0];
      const r = Float32Array.from(src);
      expect(1.0 / r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0120
     * @tc.name testFloat32ArrayFromONE012
     * @tc.desc Verify minimum finite negative value -Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-3.4028234663852886e+38];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0130
     * @tc.name testFloat32ArrayFromONE013
     * @tc.desc Verify 0.1 truncated by float32 precision matches direct construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.1];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(new Float32Array([0.1]).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0140
     * @tc.name testFloat32ArrayFromONE014
     * @tc.desc Verify 0.2 truncated by float32 precision matches direct construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.2];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(new Float32Array([0.2]).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0150
     * @tc.name testFloat32ArrayFromONE015
     * @tc.desc Verify 0.3 truncated by float32 precision matches direct construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0.3];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(new Float32Array([0.3]).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0160
     * @tc.name testFloat32ArrayFromONE016
     * @tc.desc Verify 1.1 truncated by float32 precision matches direct construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.1];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(new Float32Array([1.1]).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0170
     * @tc.name testFloat32ArrayFromONE017
     * @tc.desc Verify 2^24=16777216 exact integer storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [16777216];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0180
     * @tc.name testFloat32ArrayFromONE018
     * @tc.desc Verify 2^24+1=16777217 is truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [16777217];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0190
     * @tc.name testFloat32ArrayFromONE019
     * @tc.desc Verify 1.0e40 exceeds the float32 range and overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0e40];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0200
     * @tc.name testFloat32ArrayFromONE020
     * @tc.desc Verify -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-1.0e40];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0210
     * @tc.name testFloat32ArrayFromONE021
     * @tc.desc Verify 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0e-46];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0220
     * @tc.name testFloat32ArrayFromONE022
     * @tc.desc Verify int maximum 2147483647 stored into float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [2147483647];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0230
     * @tc.name testFloat32ArrayFromONE023
     * @tc.desc Verify int minimum -2147483648 stored into float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-2147483648];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0240
     * @tc.name testFloat32ArrayFromONE024
     * @tc.desc Verify hexadecimal literal 0x10 stored as 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0x10];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0250
     * @tc.name testFloat32ArrayFromONE025
     * @tc.desc Verify octal literal 0o17 stored as 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0o17];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0260
     * @tc.name testFloat32ArrayFromONE026
     * @tc.desc Verify binary literal 0b1010 stored as 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0b1010];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0270
     * @tc.name testFloat32ArrayFromONE027
     * @tc.desc Verify scientific notation 1.0e3 stored as 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0e3];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0280
     * @tc.name testFloat32ArrayFromONE028
     * @tc.desc Verify scientific notation 1.5e1 stored as 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.5e1];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0290
     * @tc.name testFloat32ArrayFromONE029
     * @tc.desc Verify a mixed array of positive/negative zero and special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [-1.5, 0.0, 2.5, NaN];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(-1.5);
      expect(r.$_get(2)).assertEqual(2.5);
      expect(r.$_get(3)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0300
     * @tc.name testFloat32ArrayFromONE030
     * @tc.desc Verify an all-same-value array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [5.0, 5.0, 5.0, 5.0];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(5.0);
      expect(r.$_get(3)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0310
     * @tc.name testFloat32ArrayFromONE031
     * @tc.desc Verify return value BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const r = Float32Array.from(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0320
     * @tc.name testFloat32ArrayFromONE032
     * @tc.desc Verify return value byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0];
      const r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0330
     * @tc.name testFloat32ArrayFromONE033
     * @tc.desc Verify arity 1 copying from a Float32Array creates a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0340
     * @tc.name testFloat32ArrayFromONE034
     * @tc.desc Verify an empty Float32Array source yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of();
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0350
     * @tc.name testFloat32ArrayFromONE035
     * @tc.desc Verify a single-element Float32Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(7.5);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0360
     * @tc.name testFloat32ArrayFromONE036
     * @tc.desc Verify source containing Float32.MAX is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(3.4028234663852886e+38);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0370
     * @tc.name testFloat32ArrayFromONE037
     * @tc.desc Verify source containing NaN is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(NaN);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0380
     * @tc.name testFloat32ArrayFromONE038
     * @tc.desc Verify source containing +Infinity is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(Infinity);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0390
     * @tc.name testFloat32ArrayFromONE039
     * @tc.desc Verify source containing -Infinity is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(-Infinity);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0400
     * @tc.name testFloat32ArrayFromONE040
     * @tc.desc Verify source containing -0 is copied and preserved as negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(-0.0);
      const r = Float32Array.from(src);
      expect(1.0 / r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0410
     * @tc.name testFloat32ArrayFromONE041
     * @tc.desc Verify source 16777217 already truncated to 16777216 is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(16777217.0);
      const r = Float32Array.from(src);
      expect(src.$_get(0)).assertEqual(16777216);
      expect(r.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0420
     * @tc.name testFloat32ArrayFromONE042
     * @tc.desc Verify source 0.1 float32 value is copied consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0.1);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(src.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0430
     * @tc.name testFloat32ArrayFromONE043
     * @tc.desc Verify source containing negative values is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(-2.5, -3.5);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2.5);
      expect(r.$_get(1)).assertEqual(-3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0440
     * @tc.name testFloat32ArrayFromONE044
     * @tc.desc Verify return value BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const r = Float32Array.from(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0450
     * @tc.name testFloat32ArrayFromONE045
     * @tc.desc Verify return value length equals the source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0460
     * @tc.name testFloat32ArrayFromONE046
     * @tc.desc Verify return value byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0470
     * @tc.name testFloat32ArrayFromONE047
     * @tc.desc Verify modifying the returned array does not affect the source Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(src);
      r.$_set(0, 99.0);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0480
     * @tc.name testFloat32ArrayFromONE048
     * @tc.desc Verify modifying the source Float32Array does not affect the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(src);
      src.$_set(0, 99.0);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0490
     * @tc.name testFloat32ArrayFromONE049
     * @tc.desc Verify returned array byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0500
     * @tc.name testFloat32ArrayFromONE050
     * @tc.desc Verify source of all-same value 1.0 is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 1.0, 1.0);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0510
     * @tc.name testFloat32ArrayFromONE051
     * @tc.desc Verify source containing a mix of NaN/Infinity/-Infinity/0 is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(NaN, Infinity, -Infinity, 0.0);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertNaN();
      expect(r.$_get(1)).assertEqual(Infinity);
      expect(r.$_get(2)).assertEqual(-Infinity);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0520
     * @tc.name testFloat32ArrayFromONE052
     * @tc.desc Verify returned array at(-1) gets the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(10.0, 20.0, 30.0);
      const r = Float32Array.from(src);
      expect(r.at(-1)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0530
     * @tc.name testFloat32ArrayFromONE053
     * @tc.desc Verify returned array values iterator sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(src);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < r.length; __f32i++) {
        const v = r.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0540
     * @tc.name testFloat32ArrayFromONE054
     * @tc.desc Verify source is an ArrayBuffer view copying values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view = new Float32Array(buf);
      view.$_set(0, 1.0);
      view.$_set(1, 2.0);
      view.$_set(2, 3.0);
      const r = Float32Array.from(view);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0550
     * @tc.name testFloat32ArrayFromONE055
     * @tc.desc Verify source 1.0e40 already stored as Infinity is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0e40);
      const r = Float32Array.from(src);
      expect(src.$_get(0)).assertEqual(Infinity);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0560
     * @tc.name testFloat32ArrayFromONE056
     * @tc.desc Verify source Float32.MIN_VALUE is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.401298464324817e-45);
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0570
     * @tc.name testFloat32ArrayFromONE057
     * @tc.desc Verify arity 1 passing an ArrayLike creates a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0x10, 0b1010, -1.0];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0580
     * @tc.name testFloat32ArrayFromONE058
     * @tc.desc Verify an empty ArrayLike yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0590
     * @tc.name testFloat32ArrayFromONE059
     * @tc.desc Verify a single-element ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [9.0];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0600
     * @tc.name testFloat32ArrayFromONE060
     * @tc.desc Verify ArrayLike containing Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [3.4028234663852886e+38];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0610
     * @tc.name testFloat32ArrayFromONE061
     * @tc.desc Verify ArrayLike containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [NaN];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0620
     * @tc.name testFloat32ArrayFromONE062
     * @tc.desc Verify ArrayLike containing +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [Infinity];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0630
     * @tc.name testFloat32ArrayFromONE063
     * @tc.desc Verify ArrayLike containing -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [-Infinity];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0640
     * @tc.name testFloat32ArrayFromONE064
     * @tc.desc Verify ArrayLike containing -0 preserves negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [-0.0];
      const r = Float32Array.from(src);
      expect(1.0 / r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0650
     * @tc.name testFloat32ArrayFromONE065
     * @tc.desc Verify ArrayLike containing 16777217 is truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [16777217];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0660
     * @tc.name testFloat32ArrayFromONE066
     * @tc.desc Verify ArrayLike containing 0.1 matches direct construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0.1];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(new Float32Array([0.1]).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0670
     * @tc.name testFloat32ArrayFromONE067
     * @tc.desc Verify ArrayLike containing 1.0e40 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [1.0e40];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0680
     * @tc.name testFloat32ArrayFromONE068
     * @tc.desc Verify ArrayLike containing negative values is copied and preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [-4.5, -5.5];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-4.5);
      expect(r.$_get(1)).assertEqual(-5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0690
     * @tc.name testFloat32ArrayFromONE069
     * @tc.desc Verify ArrayLike containing int maximum 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [2147483647];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0700
     * @tc.name testFloat32ArrayFromONE070
     * @tc.desc Verify ArrayLike containing hexadecimal 0x10 stored as 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0x10];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0710
     * @tc.name testFloat32ArrayFromONE071
     * @tc.desc Verify ArrayLike containing binary 0b1010 stored as 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0b1010];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0720
     * @tc.name testFloat32ArrayFromONE072
     * @tc.desc Verify ArrayLike large length of 30 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = new Float32Array(30);
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0730
     * @tc.name testFloat32ArrayFromONE073
     * @tc.desc Verify ArrayLike containing a mix of positive/negative zero and NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [-1.0, 0.0, 1.0, NaN];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(-1.0);
      expect(r.$_get(3)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0740
     * @tc.name testFloat32ArrayFromONE074
     * @tc.desc Verify ArrayLike all-same binary value 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0b1010, 0b1010, 0b1010];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0750
     * @tc.name testFloat32ArrayFromONE075
     * @tc.desc Verify return value BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [1.0, 2.0];
      const r = Float32Array.from(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0760
     * @tc.name testFloat32ArrayFromONE076
     * @tc.desc Verify return value length equals the source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
      const r = Float32Array.from(src);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0770
     * @tc.name testFloat32ArrayFromONE077
     * @tc.desc Verify return value byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0x10, 0b1010, -1.0];
      const r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0780
     * @tc.name testFloat32ArrayFromONE078
     * @tc.desc Verify returned array index-by-index values are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0x10, 0b1010, -1.0, 0.0];
      const r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16);
      expect(r.$_get(1)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0790
     * @tc.name testFloat32ArrayFromONE079
     * @tc.desc Verify returned array values iterator sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLike<number> = [0x10, 0b1010, -1.0];
      const r = Float32Array.from(src);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < r.length; __f32i++) {
        const v = r.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0800
     * @tc.name testFloat32ArrayFromONE080
     * @tc.desc Verify arity 1 passing only an Iterable with no mapFn performs an identity copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values());
      expect(r.length).assertEqual(3);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0810
     * @tc.name testFloat32ArrayFromONE081
     * @tc.desc Verify arity 2 passing an Iterable and mapFn transforms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v * 2.0);
      expect(r.$_get(0)).assertEqual(32);
      expect(r.$_get(2)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0820
     * @tc.name testFloat32ArrayFromONE082
     * @tc.desc Verify an empty iterable with no mapFn yields an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of();
      const r = Float32Array.from(base.values());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0830
     * @tc.name testFloat32ArrayFromONE083
     * @tc.desc Verify an empty iterable with mapFn does not invoke mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const base = Float32Array.of();
      const r = Float32Array.from(base.values(), (v: number, k: number): number => {
        called = true;
        return v;
      });
      expect(r.length).assertEqual(0);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0840
     * @tc.name testFloat32ArrayFromONE084
     * @tc.desc Verify a single-element iterable with mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(5.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v + 1.0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0850
     * @tc.name testFloat32ArrayFromONE085
     * @tc.desc Verify mapFn uses a combination of v and k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0, 30.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v + k);
      expect(r.$_get(0)).assertEqual(10.0);
      expect(r.$_get(1)).assertEqual(21.0);
      expect(r.$_get(2)).assertEqual(32.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0860
     * @tc.name testFloat32ArrayFromONE086
     * @tc.desc Verify mapFn returns a constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 7.0);
      expect(r.$_get(0)).assertEqual(7.0);
      expect(r.$_get(2)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0870
     * @tc.name testFloat32ArrayFromONE087
     * @tc.desc Verify mapFn returns the index k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0, 30.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => k);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0880
     * @tc.name testFloat32ArrayFromONE088
     * @tc.desc Verify mapFn reads an outer closure variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor: number = 10.0;
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v * factor);
      expect(r.$_get(0)).assertEqual(160);
      expect(r.$_get(2)).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0890
     * @tc.name testFloat32ArrayFromONE089
     * @tc.desc Verify mapFn returning 16777217 is truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 16777217);
      expect(r.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0900
     * @tc.name testFloat32ArrayFromONE090
     * @tc.desc Verify mapFn returning 1.0e40 is truncated to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 1.0e40);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0910
     * @tc.name testFloat32ArrayFromONE091
     * @tc.desc Verify mapFn returning 1.0e-46 underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 1.0e-46);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0920
     * @tc.name testFloat32ArrayFromONE092
     * @tc.desc Verify mapFn returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => NaN);
      expect(r.$_get(0)).assertNaN();
      expect(r.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0930
     * @tc.name testFloat32ArrayFromONE093
     * @tc.desc Verify mapFn returns +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => Infinity);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0940
     * @tc.name testFloat32ArrayFromONE094
     * @tc.desc Verify mapFn returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => -Infinity);
      expect(r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0950
     * @tc.name testFloat32ArrayFromONE095
     * @tc.desc Verify mapFn returning -0 preserves negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => -0.0);
      expect(1.0 / r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0960
     * @tc.name testFloat32ArrayFromONE096
     * @tc.desc Verify mapFn returns Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 3.4028234663852886e+38);
      expect(r.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0970
     * @tc.name testFloat32ArrayFromONE097
     * @tc.desc Verify mapFn throws RangeError which propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        Float32Array.from(base.values(), (v: number, k: number): number => {
          throw new RangeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0980
     * @tc.name testFloat32ArrayFromONE098
     * @tc.desc Verify mapFn throws TypeError which propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        Float32Array.from(base.values(), (v: number, k: number): number => {
          throw new TypeError('bad');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_0990
     * @tc.name testFloat32ArrayFromONE099
     * @tc.desc Verify mapFn throws Error which propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        Float32Array.from(base.values(), (v: number, k: number): number => {
          throw new Error('err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1000
     * @tc.name testFloat32ArrayFromONE100
     * @tc.desc Verify mapFn throwing at the specified index k===2 propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      try {
        Float32Array.from(base.values(), (v: number, k: number): number => {
          if (k === 2) {
            throw new TypeError('idx2');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1010
     * @tc.name testFloat32ArrayFromONE101
     * @tc.desc Verify mapFn cumulative call count equals the element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: number = 0;
      const base = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => {
        counter = counter + 1;
        return v;
      });
      expect(counter).assertEqual(4);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1020
     * @tc.name testFloat32ArrayFromONE102
     * @tc.desc Verify mapFn uses only v and returns identically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(11.0, 22.0, 33.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v);
      expect(r.$_get(0)).assertEqual(11.0);
      expect(r.$_get(2)).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1030
     * @tc.name testFloat32ArrayFromONE103
     * @tc.desc Verify mapFn nested from(from()) chained transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const mid = Float32Array.from(base.values(), (v: number, k: number): number => v + 1.0);
      const r = Float32Array.from(mid.values(), (v: number, k: number): number => v * 2.0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(34);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1040
     * @tc.name testFloat32ArrayFromONE104
     * @tc.desc Verify mapFn returning 0 yields all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 0.0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1050
     * @tc.name testFloat32ArrayFromONE105
     * @tc.desc Verify mapFn returns a negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => -v);
      expect(r.$_get(0)).assertEqual(-1.0);
      expect(r.$_get(1)).assertEqual(-2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1060
     * @tc.name testFloat32ArrayFromONE106
     * @tc.desc Verify mapFn returning 0.1 matches direct storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 0.1);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.1);
      expect(r.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1070
     * @tc.name testFloat32ArrayFromONE107
     * @tc.desc Verify mapFn returning hexadecimal 0x10 stored as 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 0x10);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1080
     * @tc.name testFloat32ArrayFromONE108
     * @tc.desc Verify mapFn returning int maximum 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => 2147483647);
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1090
     * @tc.name testFloat32ArrayFromONE109
     * @tc.desc Verify a large-length 40-element iterable with mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array(40);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v + 1.0);
      expect(r.length).assertEqual(40);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(39)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1100
     * @tc.name testFloat32ArrayFromONE110
     * @tc.desc Verify mapFn returns v*v squared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v * v);
      expect(r.$_get(0)).assertEqual(256);
      expect(r.$_get(1)).assertEqual(100);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1110
     * @tc.name testFloat32ArrayFromONE111
     * @tc.desc Verify returned array values iterator sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < r.length; __f32i++) {
        const v = r.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1120
     * @tc.name testFloat32ArrayFromONE112
     * @tc.desc Verify returned array BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1130
     * @tc.name testFloat32ArrayFromONE113
     * @tc.desc Verify mapFn throws which propagates preserving the error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0);
      try {
        Float32Array.from(base.values(), (v: number, k: number): number => {
          throw new RangeError('custom-msg');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('custom-msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMONE_1140
     * @tc.name testFloat32ArrayFromONE114
     * @tc.desc Verify returned array byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromONE114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = Float32Array.from(base.values(), (v: number, k: number): number => v);
      expect(r.byteLength).assertEqual(12);
    });

  });
}
