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

export default function Float32ArraySet5Test(): void {
  describe('Float32ArraySet5Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0100
     * @tc.name testFloat32ArraySetFive001
     * @tc.desc Verify set() with NaN literal input stores NaN (ArrayLike source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([Number.NaN]);
      expect(target.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0200
     * @tc.name testFloat32ArraySetFive002
     * @tc.desc Verify set() with -0.0 literal input preserves the sign bit (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([-0.0]);
      const inv = 1.0 / target.$_get(0);
      expect(inv).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0300
     * @tc.name testFloat32ArraySetFive003
     * @tc.desc Verify set() with positive Infinity literal input stores Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([Number.POSITIVE_INFINITY]);
      expect(target.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0400
     * @tc.name testFloat32ArraySetFive004
     * @tc.desc Verify set() with negative Infinity literal input stores -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([-Number.POSITIVE_INFINITY]);
      expect(target.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0500
     * @tc.name testFloat32ArraySetFive005
     * @tc.desc Verify set() with exact MAX_VALUE stores it without overflow (distinct from 3.5e38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [3.4028234663852886e+38];
      target.set(src);
      expect(target.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0600
     * @tc.name testFloat32ArraySetFive006
     * @tc.desc Verify set() with 0.1 applies float32 rounding to 0.10000000149011612
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [0.1];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0700
     * @tc.name testFloat32ArraySetFive007
     * @tc.desc Verify set() with MIN subnormal value preserves it exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.401298464324817e-45];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0800
     * @tc.name testFloat32ArraySetFive008
     * @tc.desc Verify set(Float32Array, -1) throws RangeError (negative offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      try {
        target.set(Float32Array.of(1.0), -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_0900
     * @tc.name testFloat32ArraySetFive009
     * @tc.desc Verify set(Float32Array, 0) with source too long throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set(Float32Array.of(1.0, 2.0, 3.0), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1000
     * @tc.name testFloat32ArraySetFive010
     * @tc.desc Verify set(Float32Array, 2) where source length exceeds remaining space throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      try {
        target.set(Float32Array.of(1.0, 2.0), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1100
     * @tc.name testFloat32ArraySetFive011
     * @tc.desc Verify set(Float32Array.of(NaN)) stores NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(Number.NaN));
      expect(target.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1200
     * @tc.name testFloat32ArraySetFive012
     * @tc.desc Verify set(Float32Array.of(Infinity)) stores Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(Number.POSITIVE_INFINITY));
      expect(target.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1300
     * @tc.name testFloat32ArraySetFive013
     * @tc.desc Verify set(Float32Array.of(-Infinity)) stores -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(-Number.POSITIVE_INFINITY));
      expect(target.$_get(0)).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1400
     * @tc.name testFloat32ArraySetFive014
     * @tc.desc Verify set(Float32Array.of(-0.0)) preserves -0 sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(-0.0));
      const inv = 1.0 / target.$_get(0);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1500
     * @tc.name testFloat32ArraySetFive015
     * @tc.desc Verify set(0, NaN) stores NaN via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, Number.NaN);
      expect(target.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1600
     * @tc.name testFloat32ArraySetFive016
     * @tc.desc Verify set(0, Infinity) stores Infinity via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, Number.POSITIVE_INFINITY);
      expect(target.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1700
     * @tc.name testFloat32ArraySetFive017
     * @tc.desc Verify set(0, -Infinity) stores -Infinity via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, -Number.POSITIVE_INFINITY);
      expect(target.$_get(0)).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1800
     * @tc.name testFloat32ArraySetFive018
     * @tc.desc Verify set(0, -0.0) preserves -0 sign via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, -0.0);
      const inv = 1.0 / target.$_get(0);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_1900
     * @tc.name testFloat32ArraySetFive019
     * @tc.desc Verify set(Float32Array.of(MAX_VALUE)) stores MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(3.4028234663852886e+38));
      expect(target.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2000
     * @tc.name testFloat32ArraySetFive020
     * @tc.desc Verify set(Float32Array.of(0.1)) stores float32 rounding of 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(0.1));
      expect(target.$_get(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2100
     * @tc.name testFloat32ArraySetFive021
     * @tc.desc Verify set(Float32Array.of(MIN_VALUE)) stores subnormal MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(Float32Array.of(1.401298464324817e-45));
      expect(target.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2200
     * @tc.name testFloat32ArraySetFive022
     * @tc.desc Verify set(0, MAX_VALUE) stores MAX_VALUE via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, 3.4028234663852886e+38);
      expect(target.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2300
     * @tc.name testFloat32ArraySetFive023
     * @tc.desc Verify set(0, 0.1) stores float32 rounding of 0.1 via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, 0.1);
      expect(target.$_get(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2400
     * @tc.name testFloat32ArraySetFive024
     * @tc.desc Verify set(0, MIN_VALUE) stores subnormal MIN_VALUE via single-element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set(0, 1.401298464324817e-45);
      expect(target.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2500
     * @tc.name testFloat32ArraySetFive025
     * @tc.desc Verify set() with subarray source (non-zero byteOffset) reads correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub = src.subarray(2, 5);
      const target = new Float32Array(3);
      target.set(sub);
      expect(target.$_get(0)).assertEqual(3.0);
      expect(target.$_get(1)).assertEqual(4.0);
      expect(target.$_get(2)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2600
     * @tc.name testFloat32ArraySetFive026
     * @tc.desc Verify set(subarray, 1) with offset 1 copies subarray source to correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub = src.subarray(1, 4);
      const target = new Float32Array(5);
      target.set(sub, 1);
      expect(target.$_get(0)).assertEqual(0.0);
      expect(target.$_get(1)).assertEqual(2.0);
      expect(target.$_get(2)).assertEqual(3.0);
      expect(target.$_get(3)).assertEqual(4.0);
      expect(target.$_get(4)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2700
     * @tc.name testFloat32ArraySetFive027
     * @tc.desc Verify set(subarray with special values) reads NaN/Infinity/-Infinity/-0 from subarray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0);
      const sub = src.subarray(1, 5);
      const target = new Float32Array(4);
      target.set(sub);
      expect(target.$_get(0)).assertNaN();
      expect(target.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
      expect(target.$_get(2)).assertEqual(-Number.POSITIVE_INFINITY);
      const inv = 1.0 / target.$_get(3);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FIVE_2800
     * @tc.name testFloat32ArraySetFive028
     * @tc.desc Verify set(subarray, 0) when subarray is the entire array (same as set(Float32Array))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(3.0, 6.0, 9.0);
      const sub = src.subarray(0);
      const target = new Float32Array(3);
      target.set(sub, 0);
      expect(target.$_get(0)).assertEqual(3.0);
      expect(target.$_get(1)).assertEqual(6.0);
      expect(target.$_get(2)).assertEqual(9.0);
    });

  });
}
