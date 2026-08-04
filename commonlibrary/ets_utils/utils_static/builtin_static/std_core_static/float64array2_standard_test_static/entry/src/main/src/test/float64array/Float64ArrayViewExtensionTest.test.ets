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
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function Float64ArrayViewExtensionTest(): void {
  describe('Float64ArrayViewExtensionTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0010
     * @tc.name testFloat64ArrayViewExtension001
     * @tc.desc Verify constructor from decimal array retains precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.1, 0.2, 0.3]);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.2;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0020
     * @tc.name testFloat64ArrayViewExtension002
     * @tc.desc Verify constructor from mixed int and decimal array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1, 2.5, 3]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.5;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0030
     * @tc.name testFloat64ArrayViewExtension003
     * @tc.desc Verify constructor from empty array yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([]);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0040
     * @tc.name testFloat64ArrayViewExtension004
     * @tc.desc Verify constructor from array with NaN, Infinity, -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, Infinity, -Infinity]);
      expect(arr.$_get(0)).assertNaN();
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0050
     * @tc.name testFloat64ArrayViewExtension005
     * @tc.desc Verify constructor from array with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1e-5, 1e10, 1e300]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1e-5;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1e10;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1e300;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0060
     * @tc.name testFloat64ArrayViewExtension006
     * @tc.desc Verify constructor from array with 0.1+0.2 floating precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.1 + 0.2, 0.3]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.30000000000000004;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.3;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0070
     * @tc.name testFloat64ArrayViewExtension007
     * @tc.desc Verify constructor from negative decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1.5, -2.5, -3.5]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -1.5;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -3.5;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0080
     * @tc.name testFloat64ArrayViewExtension008
     * @tc.desc Verify constructor from array with 0.0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, -0.0]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement1Second = 1 / arr.$_get(1);
      const expectedElement1Second: number = -Infinity;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0090
     * @tc.name testFloat64ArrayViewExtension009
     * @tc.desc Verify constructor from array with MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MAX_VALUE, Number.MIN_VALUE]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Number.MIN_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0100
     * @tc.name testFloat64ArrayViewExtension010
     * @tc.desc Verify constructor from single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.5]);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.5;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0110
     * @tc.name testFloat64ArrayViewExtension011
     * @tc.desc Verify zero-length view at offset 0 has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float64Array = new Float64Array(buf, 0, 0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0120
     * @tc.name testFloat64ArrayViewExtension012
     * @tc.desc Verify zero-length view at non-zero offset has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 16, 0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 16;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0130
     * @tc.name testFloat64ArrayViewExtension013
     * @tc.desc Verify zero-length view byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Float64Array = new Float64Array(buf, 0, 0);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0140
     * @tc.name testFloat64ArrayViewExtension014
     * @tc.desc Verify of() with 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.14);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.14;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0150
     * @tc.name testFloat64ArrayViewExtension015
     * @tc.desc Verify of() with 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const actualLength = arr.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0160
     * @tc.name testFloat64ArrayViewExtension016
     * @tc.desc Verify of() with 5 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const actualLength = arr.length;
      const expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0170
     * @tc.name testFloat64ArrayViewExtension017
     * @tc.desc Verify of() with 10 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);
      const actualLength = arr.length;
      const expectedLength: int = 10;
      expect(actualLength).assertEqual(expectedLength);
      const actualElementAt9 = arr.$_get(9);
      const expectedElementAt9: number = 9.0;
      expect(actualElementAt9).assertEqual(expectedElementAt9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0180
     * @tc.name testFloat64ArrayViewExtension018
     * @tc.desc Verify of() with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0190
     * @tc.name testFloat64ArrayViewExtension019
     * @tc.desc Verify of() with -0.0 preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = 1 / arr.$_get(0);
      const expectedElement0Second: number = -Infinity;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0200
     * @tc.name testFloat64ArrayViewExtension020
     * @tc.desc Verify of() with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_VALUE);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0210
     * @tc.name testFloat64ArrayViewExtension021
     * @tc.desc Verify four views on same buffer byteOffsets 0/8/16/24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const zeroOffsetView: Float64Array = new Float64Array(buf, 0, 1);
      const eightOffsetView: Float64Array = new Float64Array(buf, 8, 1);
      const sixteenOffsetView: Float64Array = new Float64Array(buf, 16, 1);
      const twentyFourOffsetView: Float64Array = new Float64Array(buf, 24, 1);
      zeroOffsetView.$_set(0, 10.0);
      eightOffsetView.$_set(0, 20.0);
      sixteenOffsetView.$_set(0, 30.0);
      twentyFourOffsetView.$_set(0, 40.0);
      const actualElement0 = zeroOffsetView.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = eightOffsetView.$_get(0);
      const expectedElement0Second: number = 20.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = sixteenOffsetView.$_get(0);
      const expectedElement0Third: number = 30.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElement0Fourth = twentyFourOffsetView.$_get(0);
      const expectedElement0Fourth: number = 40.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0220
     * @tc.name testFloat64ArrayViewExtension022
     * @tc.desc Verify each view offset is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const zeroOffsetView: Float64Array = new Float64Array(buf, 0, 1);
      const eightOffsetView: Float64Array = new Float64Array(buf, 8, 1);
      const sixteenOffsetView: Float64Array = new Float64Array(buf, 16, 1);
      const twentyFourOffsetView: Float64Array = new Float64Array(buf, 24, 1);
      const actualByteOffsetSecond = zeroOffsetView.byteOffset;
      const expectedByteOffsetSecond: int = 0;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
      const actualByteOffsetThird = eightOffsetView.byteOffset;
      const expectedByteOffsetThird: int = 8;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteOffsetFourth = sixteenOffsetView.byteOffset;
      const expectedByteOffsetFourth: int = 16;
      expect(actualByteOffsetFourth).assertEqual(expectedByteOffsetFourth);
      const actualByteOffsetFifth = twentyFourOffsetView.byteOffset;
      const expectedByteOffsetFifth: int = 24;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0230
     * @tc.name testFloat64ArrayViewExtension023
     * @tc.desc Verify views are non-overlapping independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const zeroOffsetView: Float64Array = new Float64Array(buf, 0, 1);
      const eightOffsetView: Float64Array = new Float64Array(buf, 8, 1);
      zeroOffsetView.$_set(0, 99.0);
      const actualElement0Fifth = eightOffsetView.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0240
     * @tc.name testFloat64ArrayViewExtension024
     * @tc.desc Verify write via eightOffsetView does not affect sixteenOffsetView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const eightOffsetView: Float64Array = new Float64Array(buf, 8, 1);
      const sixteenOffsetView: Float64Array = new Float64Array(buf, 16, 1);
      eightOffsetView.$_set(0, 55.0);
      const actualElement0Fifth = sixteenOffsetView.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0250
     * @tc.name testFloat64ArrayViewExtension025
     * @tc.desc Verify writes via two non-overlapping views are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const zeroOffsetView: Float64Array = new Float64Array(buf, 0, 1);
      const eightOffsetView: Float64Array = new Float64Array(buf, 8, 1);
      zeroOffsetView.$_set(0, 1.0);
      eightOffsetView.$_set(0, 2.0);
      const actualElement0Fifth = zeroOffsetView.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement0Sixth = eightOffsetView.$_get(0);
      const expectedElement0Sixth: number = 2.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0260
     * @tc.name testFloat64ArrayViewExtension026
     * @tc.desc Verify two views reference the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const zeroOffsetView: Float64Array = new Float64Array(buf, 0, 1);
      const eightOffsetView: Float64Array = new Float64Array(buf, 8, 1);
      const sixteenOffsetView: Float64Array = new Float64Array(buf, 16, 1);
      const twentyFourOffsetView: Float64Array = new Float64Array(buf, 24, 1);
      expect(zeroOffsetView.buffer).assertEqual(buf);
      expect(eightOffsetView.buffer).assertEqual(buf);
      expect(sixteenOffsetView.buffer).assertEqual(buf);
      expect(twentyFourOffsetView.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0270
     * @tc.name testFloat64ArrayViewExtension027
     * @tc.desc Verify two views with 8-byte gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(40);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 24, 2);
      firstResult.$_set(0, 10.0);
      firstResult.$_set(1, 20.0);
      secondResult.$_set(0, 30.0);
      secondResult.$_set(1, 40.0);
      const actualElement0Fifth = firstResult.$_get(0);
      const expectedElement0Fifth: number = 10.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement0Sixth = secondResult.$_get(0);
      const expectedElement0Sixth: number = 30.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0280
     * @tc.name testFloat64ArrayViewExtension028
     * @tc.desc Verify two views with 16-byte gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(48);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 32, 2);
      firstResult.$_set(0, 5.0);
      const actualElement0Fifth = secondResult.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0290
     * @tc.name testFloat64ArrayViewExtension029
     * @tc.desc Verify three views with gaps between them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(64);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 24, 2);
      const thirdResult: Float64Array = new Float64Array(buf, 48, 2);
      firstResult.$_set(0, 1.0);
      secondResult.$_set(0, 2.0);
      thirdResult.$_set(0, 3.0);
      const actualElement0Fifth = firstResult.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement0Sixth = secondResult.$_get(0);
      const expectedElement0Sixth: number = 2.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement0Seventh = thirdResult.$_get(0);
      const expectedElement0Seventh: number = 3.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0300
     * @tc.name testFloat64ArrayViewExtension030
     * @tc.desc Verify gap region between views stays zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(40);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 24, 2);
      firstResult.fill(7.0);
      secondResult.fill(8.0);
      const gap: Float64Array = new Float64Array(buf, 16, 1);
      const actualElement0Fifth = gap.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0310
     * @tc.name testFloat64ArrayViewExtension031
     * @tc.desc Verify gap with specific offset values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 1);
      const secondResult: Float64Array = new Float64Array(buf, 24, 1);
      firstResult.$_set(0, 100.0);
      secondResult.$_set(0, 200.0);
      const mid: Float64Array = new Float64Array(buf, 8, 2);
      const actualElement0Fifth = mid.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = mid.$_get(1);
      const expectedElement1Third: number = 0.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0320
     * @tc.name testFloat64ArrayViewExtension032
     * @tc.desc Verify constructor from Float32Array round-trip values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32: Float32Array = new Float32Array([1.5, 2.5]);
      const f64: Float64Array = new Float64Array(f32);
      const actualLengthSecond = f64.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0Fifth = f64.$_get(0);
      const expectedElement0Fifth: number = 1.5;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = f64.$_get(1);
      const expectedElement1Third: number = 2.5;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0330
     * @tc.name testFloat64ArrayViewExtension033
     * @tc.desc Verify set(Float32Array) simple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(3);
      const f32: Float32Array = new Float32Array([1.0, 2.0]);
      target.set(f32);
      const actualElement0Fifth = target.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = target.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0340
     * @tc.name testFloat64ArrayViewExtension034
     * @tc.desc Verify set(Float32Array) decimal precision preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(2);
      const f32: Float32Array = new Float32Array([0.1, 0.2]);
      target.set(f32);
      const actualElement0Fifth = target.$_get(0);
      const expectedElement0Fifth: number = 0.10000000149011612;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = target.$_get(1);
      const expectedElement1Third: number = 0.20000000298023224;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0350
     * @tc.name testFloat64ArrayViewExtension035
     * @tc.desc Verify constructor from Float32Array with NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32: Float32Array = new Float32Array([NaN, Infinity]);
      const f64: Float64Array = new Float64Array(f32);
      expect(f64.$_get(0)).assertNaN();
      const actualElement1Third = f64.$_get(1);
      const expectedElement1Third: number = Infinity;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0360
     * @tc.name testFloat64ArrayViewExtension036
     * @tc.desc Verify set(Float32Array) at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const f32: Float32Array = new Float32Array([99.0]);
      target.set(f32, 2);
      const actualElement2Second = target.$_get(2);
      const expectedElement2Second: number = 99.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0370
     * @tc.name testFloat64ArrayViewExtension037
     * @tc.desc Verify Float64Array -> Float32Array -> Float64Array round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orig: Float64Array = new Float64Array([1.5, 2.5]);
      const f32: Float32Array = new Float32Array(orig);
      const round: Float64Array = new Float64Array(f32);
      const actualElement0Fifth = round.$_get(0);
      const expectedElement0Fifth: number = 1.5;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = round.$_get(1);
      const expectedElement1Third: number = 2.5;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0380
     * @tc.name testFloat64ArrayViewExtension038
     * @tc.desc Verify set(Int32Array) at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(3);
      const i32: Int32Array = new Int32Array([10, 20]);
      target.set(i32, 0);
      const actualElement0Fifth = target.$_get(0);
      const expectedElement0Fifth: number = 10;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = target.$_get(1);
      const expectedElement1Third: number = 20;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0390
     * @tc.name testFloat64ArrayViewExtension039
     * @tc.desc Verify set(Int32Array) at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const i32: Int32Array = new Int32Array([99, 100]);
      target.set(i32, 1);
      const actualElement0Fifth = target.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = target.$_get(1);
      const expectedElement1Third: number = 99;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Second = target.$_get(2);
      const expectedElement2Second: number = 100;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0400
     * @tc.name testFloat64ArrayViewExtension040
     * @tc.desc Verify set(Int32Array) at offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const i32: Int32Array = new Int32Array([77, 88]);
      target.set(i32, 2);
      const actualElement0Fifth = target.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement2Second = target.$_get(2);
      const expectedElement2Second: number = 77;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const actualElement3Second = target.$_get(3);
      const expectedElement3Second: number = 88;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0410
     * @tc.name testFloat64ArrayViewExtension041
     * @tc.desc Verify set(Int32Array) at last valid offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const i32: Int32Array = new Int32Array([55]);
      target.set(i32, 2);
      const actualElement2Second = target.$_get(2);
      const expectedElement2Second: number = 55;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0420
     * @tc.name testFloat64ArrayViewExtension042
     * @tc.desc Verify set(Int32Array) offset 0 preserves further elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const i32: Int32Array = new Int32Array([10, 20]);
      target.set(i32, 0);
      const actualElement0Fifth = target.$_get(0);
      const expectedElement0Fifth: number = 10;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement1Third = target.$_get(1);
      const expectedElement1Third: number = 20;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Second = target.$_get(2);
      const expectedElement2Second: number = 3.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const actualElement3Second = target.$_get(3);
      const expectedElement3Second: number = 4.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0430
     * @tc.name testFloat64ArrayViewExtension043
     * @tc.desc Verify set(Int32Array) with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(2);
      const i32: Int32Array = new Int32Array([-1, -100]);
      target.set(i32);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = -1;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = -100;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0440
     * @tc.name testFloat64ArrayViewExtension044
     * @tc.desc Verify set(Int32Array) with large integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(2);
      const i32: Int32Array = new Int32Array([2147483647, -2147483648]);
      target.set(i32);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 2147483647;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = -2147483648;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0450
     * @tc.name testFloat64ArrayViewExtension045
     * @tc.desc Verify set(Int32Array) with zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const i32: Int32Array = new Int32Array([0, 0]);
      target.set(i32, 1);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = target.$_get(2);
      const expectedElement2Third: number = 0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0460
     * @tc.name testFloat64ArrayViewExtension046
     * @tc.desc Verify set(Uint8Array) at start of dest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(4);
      const u8: Uint8Array = new Uint8Array([1, 2]);
      target.set(u8, 0);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 1;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 2;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0470
     * @tc.name testFloat64ArrayViewExtension047
     * @tc.desc Verify set(Uint8Array) in middle of dest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const u8: Uint8Array = new Uint8Array([100, 200]);
      target.set(u8, 2);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 2.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = target.$_get(2);
      const expectedElement2Third: number = 100;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement3Third = target.$_get(3);
      const expectedElement3Third: number = 200;
      expect(actualElement3Third).assertEqual(expectedElement3Third);
      const actualElementAt4 = target.$_get(4);
      const expectedElementAt4: number = 5.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0480
     * @tc.name testFloat64ArrayViewExtension048
     * @tc.desc Verify set(Uint8Array) at end of dest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const u8: Uint8Array = new Uint8Array([50]);
      target.set(u8, 2);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 2.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = target.$_get(2);
      const expectedElement2Third: number = 50;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0490
     * @tc.name testFloat64ArrayViewExtension049
     * @tc.desc Verify set(Uint8Array) single element at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const u8: Uint8Array = new Uint8Array([255]);
      target.set(u8, 0);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 255;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 2.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0500
     * @tc.name testFloat64ArrayViewExtension050
     * @tc.desc Verify set(Uint8Array) multi-element at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const u8: Uint8Array = new Uint8Array([10, 20, 30]);
      target.set(u8, 0);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 10;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 20;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = target.$_get(2);
      const expectedElement2Third: number = 30;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement3Third = target.$_get(3);
      const expectedElement3Third: number = 4.0;
      expect(actualElement3Third).assertEqual(expectedElement3Third);
      const actualElementAt4 = target.$_get(4);
      const expectedElementAt4: number = 5.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0510
     * @tc.name testFloat64ArrayViewExtension051
     * @tc.desc Verify set(Uint8Array) covering entire dest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(3);
      const u8: Uint8Array = new Uint8Array([1, 2, 3]);
      target.set(u8);
      const actualElement0Eighth = target.$_get(0);
      const expectedElement0Eighth: number = 1;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = target.$_get(1);
      const expectedElement1Fourth: number = 2;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = target.$_get(2);
      const expectedElement2Third: number = 3;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0520
     * @tc.name testFloat64ArrayViewExtension052
     * @tc.desc Verify of() with large exponent 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e10);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1e10;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0530
     * @tc.name testFloat64ArrayViewExtension053
     * @tc.desc Verify of() with mixed exponents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e5, 1e-5, 1e15);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1e5;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 1e-5;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 1e15;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0540
     * @tc.name testFloat64ArrayViewExtension054
     * @tc.desc Verify of() with very large exponent 1e300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e300);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1e300;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0550
     * @tc.name testFloat64ArrayViewExtension055
     * @tc.desc Verify of() with very small exponent 1e-300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e-300);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1e-300;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0560
     * @tc.name testFloat64ArrayViewExtension056
     * @tc.desc Verify of() with alternating signs scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-1e10, 1e-10, -1e-5);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = -1e10;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 1e-10;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = -1e-5;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0570
     * @tc.name testFloat64ArrayViewExtension057
     * @tc.desc Verify constructor from mixed int and number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1, 2.5, 3, 4.75]);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 2.5;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 3.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement3Third = arr.$_get(3);
      const expectedElement3Third: number = 4.75;
      expect(actualElement3Third).assertEqual(expectedElement3Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0580
     * @tc.name testFloat64ArrayViewExtension058
     * @tc.desc Verify constructor from mixed array with negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1, 0.5, -3, 7.25]);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = -1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 0.5;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement3Third = arr.$_get(3);
      const expectedElement3Third: number = 7.25;
      expect(actualElement3Third).assertEqual(expectedElement3Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0590
     * @tc.name testFloat64ArrayViewExtension059
     * @tc.desc Verify constructor from mixed array with zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0, 0.0, -0.0, 1]);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 0.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 0.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 0.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement2Fourth = 1 / arr.$_get(2);
      const expectedElement2Fourth: number = -Infinity;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0600
     * @tc.name testFloat64ArrayViewExtension060
     * @tc.desc Verify constructor from mixed array with large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1000000, 3.14, 999999, 0.001]);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1000000;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 3.14;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement3Third = arr.$_get(3);
      const expectedElement3Third: number = 0.001;
      expect(actualElement3Third).assertEqual(expectedElement3Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0610
     * @tc.name testFloat64ArrayViewExtension061
     * @tc.desc Verify constructor from mixed array with small decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0, 0.001, 0, 0.0001]);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 0.001;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement3Third = arr.$_get(3);
      const expectedElement3Third: number = 0.0001;
      expect(actualElement3Third).assertEqual(expectedElement3Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0620
     * @tc.name testFloat64ArrayViewExtension062
     * @tc.desc Verify constructor from alternating int/number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1, 1.5, 2, 2.5, 3, 3.5]);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 6;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualElementAt5 = arr.$_get(5);
      const expectedElementAt5: number = 3.5;
      expect(actualElementAt5).assertEqual(expectedElementAt5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0630
     * @tc.name testFloat64ArrayViewExtension063
     * @tc.desc Verify from() with Int32Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array([10, 20]);
      const arr: Float64Array = Float64Array.from(src);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Ninth = arr.$_get(0);
      const expectedElement0Ninth: number = 10;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
      const actualElement1Fifth = arr.$_get(1);
      const expectedElement1Fifth: number = 20;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0640
     * @tc.name testFloat64ArrayViewExtension064
     * @tc.desc Verify from() with mapFn that doubles values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0], (v: number): number => v * 2.0);
      const actualElement0Ninth = arr.$_get(0);
      const expectedElement0Ninth: number = 2.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
      const actualElement2Fifth = arr.$_get(2);
      const expectedElement2Fifth: number = 6.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0650
     * @tc.name testFloat64ArrayViewExtension065
     * @tc.desc Verify from() mapFn receives the index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testFloat64ArrayViewExtension065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0],
        (v: number, index: number): number => v * 10.0 + index);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Ninth = arr.$_get(0);
      const expectedElement0Ninth: number = 10.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
      const actualElement1Fifth = arr.$_get(1);
      const expectedElement1Fifth: number = 21.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
      const actualElement2Fifth = arr.$_get(2);
      const expectedElement2Fifth: number = 32.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0660
     * @tc.name testFloat64ArrayViewExtension066
     * @tc.desc Verify from() with Float64Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const arr: Float64Array = Float64Array.from(src);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement1Fifth = arr.$_get(1);
      const expectedElement1Fifth: number = 2.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0670
     * @tc.name testFloat64ArrayViewExtension067
     * @tc.desc Verify from() with Float32Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.5, 2.5]);
      const arr: Float64Array = Float64Array.from(src);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Ninth = arr.$_get(0);
      const expectedElement0Ninth: number = 1.5;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0680
     * @tc.name testFloat64ArrayViewExtension068
     * @tc.desc Verify from() with large array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]);
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 8;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElementAt7 = arr.$_get(7);
      const expectedElementAt7: number = 8.0;
      expect(actualElementAt7).assertEqual(expectedElementAt7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0690
     * @tc.name testFloat64ArrayViewExtension069
     * @tc.desc Verify negative byteOffset -8 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        const arr: Float64Array = new Float64Array(buf, -8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0700
     * @tc.name testFloat64ArrayViewExtension070
     * @tc.desc Verify of() 0 params returns an empty Float64Array with zero-sized buffer metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of();
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 0;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 0;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
      const actualByteOffsetSixth = arr.byteOffset;
      const expectedByteOffsetSixth: int = 0;
      expect(actualByteOffsetSixth).assertEqual(expectedByteOffsetSixth);
      const actualByteLengthThird = arr.buffer.byteLength;
      const expectedByteLengthThird: int = 0;
      expect(actualByteLengthThird).assertEqual(expectedByteLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0710
     * @tc.name testFloat64ArrayViewExtension071
     * @tc.desc Verify two subarrays from same parent share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(0, 2);
      const s2 = parent.subarray(2, 4);
      s1.$_set(0, 99.0);
      const actualElement0Ninth = parent.$_get(0);
      const expectedElement0Ninth: number = 99.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
      s2.$_set(0, 88.0);
      const actualElement2Fifth = parent.$_get(2);
      const expectedElement2Fifth: number = 88.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0720
     * @tc.name testFloat64ArrayViewExtension072
     * @tc.desc Verify three subarrays from same parent share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const s1 = parent.subarray(0, 2);
      const s2 = parent.subarray(2, 4);
      const s3 = parent.subarray(4, 6);
      s1.$_set(1, 10.0);
      s2.$_set(1, 20.0);
      s3.$_set(1, 30.0);
      const actualElement1Fifth = parent.$_get(1);
      const expectedElement1Fifth: number = 10.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
      const actualElement3Fourth = parent.$_get(3);
      const expectedElement3Fourth: number = 20.0;
      expect(actualElement3Fourth).assertEqual(expectedElement3Fourth);
      const actualElementAt5Second = parent.$_get(5);
      const expectedElementAt5Second: number = 30.0;
      expect(actualElementAt5Second).assertEqual(expectedElementAt5Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0730
     * @tc.name testFloat64ArrayViewExtension073
     * @tc.desc Verify write via subarray 0 is visible via parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = parent.subarray(0, 2);
      sub.$_set(0, 77.0);
      const actualElement0Ninth = parent.$_get(0);
      const expectedElement0Ninth: number = 77.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0740
     * @tc.name testFloat64ArrayViewExtension074
     * @tc.desc Verify write via subarray 1 visible via subarray 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(0, 3);
      const s2 = parent.subarray(1, 3);
      s1.$_set(1, 44.0);
      const actualElement0Ninth = s2.$_get(0);
      const expectedElement0Ninth: number = 44.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0750
     * @tc.name testFloat64ArrayViewExtension075
     * @tc.desc Verify nested subarray still shares original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(1);
      const s2 = s1.subarray(1);
      s2.$_set(0, 33.0);
      const actualElement2Fifth = parent.$_get(2);
      const expectedElement2Fifth: number = 33.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0760
     * @tc.name testFloat64ArrayViewExtension076
     * @tc.desc Verify subarray(0) is full view of parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = parent.subarray(0);
      const actualLengthFourth = sub.length;
      const expectedLengthFourth: int = 4;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement3Fourth = sub.$_get(3);
      const expectedElement3Fourth: number = 4.0;
      expect(actualElement3Fourth).assertEqual(expectedElement3Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0770
     * @tc.name testFloat64ArrayViewExtension077
     * @tc.desc Verify two overlapping subarrays share data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const s1 = parent.subarray(1, 4);
      const s2 = parent.subarray(2, 5);
      s1.$_set(1, 99.0);
      const actualElement0Ninth = s2.$_get(0);
      const expectedElement0Ninth: number = 99.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0780
     * @tc.name testFloat64ArrayViewExtension078
     * @tc.desc Verify disjoint subarrays write independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(0, 2);
      const s2 = parent.subarray(2, 4);
      s1.fill(1.0);
      s2.fill(2.0);
      const actualElement0Ninth = parent.$_get(0);
      const expectedElement0Ninth: number = 1.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
      const actualElement3Fourth = parent.$_get(3);
      const expectedElement3Fourth: number = 2.0;
      expect(actualElement3Fourth).assertEqual(expectedElement3Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0790
     * @tc.name testFloat64ArrayViewExtension079
     * @tc.desc Verify set via parent visible in subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const sub: Float64Array = parent.subarray(1);
      const src: Float64Array = new Float64Array([99.0]);
      parent.set(src, 1);
      const actualElement0Tenth = sub.$_get(0);
      const expectedElement0Tenth: number = 99.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0800
     * @tc.name testFloat64ArrayViewExtension080
     * @tc.desc Verify subarray of subarray shares original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(0, 3);
      const s2 = s1.subarray(1, 3);
      s2.$_set(0, 88.0);
      const actualElement1Sixth = parent.$_get(1);
      const expectedElement1Sixth: number = 88.0;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0810
     * @tc.name testFloat64ArrayViewExtension081
     * @tc.desc Verify multiple subarrays mod parent independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(0, 2);
      const s2 = parent.subarray(2, 4);
      s1.$_set(1, 77.0);
      s2.$_set(0, 66.0);
      const actualElement1Sixth = parent.$_get(1);
      const expectedElement1Sixth: number = 77.0;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Sixth = parent.$_get(2);
      const expectedElement2Sixth: number = 66.0;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0820
     * @tc.name testFloat64ArrayViewExtension082
     * @tc.desc Verify slice from subarray has own buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = parent.subarray(1, 3);
      const sliced: Float64Array = sub.slice();
      expect(sliced.buffer).not().assertEqual(sub.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0830
     * @tc.name testFloat64ArrayViewExtension083
     * @tc.desc Verify slice from subarray independent when source modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = parent.subarray(1, 3);
      const sliced: Float64Array = sub.slice();
      sub.$_set(0, 99.0);
      const actualElement0Tenth = sliced.$_get(0);
      const expectedElement0Tenth: number = 2.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0840
     * @tc.name testFloat64ArrayViewExtension084
     * @tc.desc Verify modify slice dest does not affect subarray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = parent.subarray(1, 3);
      const sliced: Float64Array = sub.slice();
      sliced.$_set(0, 88.0);
      const actualElement0Tenth = sub.$_get(0);
      const expectedElement0Tenth: number = 2.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0850
     * @tc.name testFloat64ArrayViewExtension085
     * @tc.desc Verify slice from subarray has byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = parent.subarray(2);
      const sliced: Float64Array = sub.slice();
      const actualByteOffsetSeventh = sliced.byteOffset;
      const expectedByteOffsetSeventh: int = 0;
      expect(actualByteOffsetSeventh).assertEqual(expectedByteOffsetSeventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0860
     * @tc.name testFloat64ArrayViewExtension086
     * @tc.desc Verify slice from subarray with subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub: Float64Array = parent.subarray(0, 4);
      const sliced: Float64Array = sub.slice(1, 3);
      const actualLengthFifth = sliced.length;
      const expectedLengthFifth: int = 2;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualElement0Tenth = sliced.$_get(0);
      const expectedElement0Tenth: number = 2.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0870
     * @tc.name testFloat64ArrayViewExtension087
     * @tc.desc Verify slice of slice creates independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(0, 3);
      const s2 = s1.slice(1, 3);
      s1.$_set(1, 99.0);
      const actualElement0Tenth = s2.$_get(0);
      const expectedElement0Tenth: number = 2.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0880
     * @tc.name testFloat64ArrayViewExtension088
     * @tc.desc Verify slice from parent then subarray still shares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sliced: Float64Array = parent.slice(0, 2);
      const sub: Float64Array = sliced.subarray(0, 1);
      const actualElement0Tenth = sub.$_get(0);
      const expectedElement0Tenth: number = 1.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
      sub.$_set(0, 77.0);
      const actualElement0Eleventh = sliced.$_get(0);
      const expectedElement0Eleventh: number = 77.0;
      expect(actualElement0Eleventh).assertEqual(expectedElement0Eleventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0890
     * @tc.name testFloat64ArrayViewExtension089
     * @tc.desc Verify slice empty from subarray returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const sub: Float64Array = parent.subarray(1, 2);
      const sliced: Float64Array = sub.slice(1, 1);
      const actualLengthFifth = sliced.length;
      const expectedLengthFifth: int = 0;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0900
     * @tc.name testFloat64ArrayViewExtension090
     * @tc.desc Verify fill via original visible via alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const b = a;
      a.fill(5.0);
      const actualElement2Sixth = b.$_get(2);
      const expectedElement2Sixth: number = 5.0;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0910
     * @tc.name testFloat64ArrayViewExtension091
     * @tc.desc Verify subnormal Number.MIN_VALUE preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MIN_VALUE]);
      const actualElement0Tenth = arr.$_get(0);
      const expectedElement0Tenth: number = Number.MIN_VALUE;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0920
     * @tc.name testFloat64ArrayViewExtension092
     * @tc.desc Verify set(Int8Array) with various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(4);
      const i8: Int8Array = new Int8Array([1, -2, 127, -128]);
      target.set(i8);
      const actualElement0Tenth = target.$_get(0);
      const expectedElement0Tenth: number = 1;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
      const actualElement1Sixth = target.$_get(1);
      const expectedElement1Sixth: number = -2;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Sixth = target.$_get(2);
      const expectedElement2Sixth: number = 127;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
      const actualElement3Fifth = target.$_get(3);
      const expectedElement3Fifth: number = -128;
      expect(actualElement3Fifth).assertEqual(expectedElement3Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0930
     * @tc.name testFloat64ArrayViewExtension093
     * @tc.desc Verify set(Int8Array) negative values at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const i8: Int8Array = new Int8Array([-100, -50]);
      target.set(i8, 1);
      const actualElement0Tenth = target.$_get(0);
      const expectedElement0Tenth: number = 1.0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
      const actualElement1Sixth = target.$_get(1);
      const expectedElement1Sixth: number = -100;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Sixth = target.$_get(2);
      const expectedElement2Sixth: number = -50;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0940
     * @tc.name testFloat64ArrayViewExtension094
     * @tc.desc Verify set(Uint16Array) with various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(4);
      const u16: Uint16Array = new Uint16Array([1, 65535, 0, 32768]);
      target.set(u16);
      const actualElement0Tenth = target.$_get(0);
      const expectedElement0Tenth: number = 1;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
      const actualElement1Sixth = target.$_get(1);
      const expectedElement1Sixth: number = 65535;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement3Fifth = target.$_get(3);
      const expectedElement3Fifth: number = 32768;
      expect(actualElement3Fifth).assertEqual(expectedElement3Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0950
     * @tc.name testFloat64ArrayViewExtension095
     * @tc.desc Verify set(Uint16Array) with large values at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array([0.0, 0.0, 0.0]);
      const u16: Uint16Array = new Uint16Array([50000]);
      target.set(u16, 2);
      const actualElement2Sixth = target.$_get(2);
      const expectedElement2Sixth: number = 50000;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0960
     * @tc.name testFloat64ArrayViewExtension096
     * @tc.desc Verify misaligned offset 3 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      try {
        const arr: Float64Array = new Float64Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0970
     * @tc.name testFloat64ArrayViewExtension097
     * @tc.desc Verify set(Int32Array) with mix of positive and negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(4);
      const i32: Int32Array = new Int32Array([-1, 100, -200, 0]);
      target.set(i32);
      const actualElement0Tenth = target.$_get(0);
      const expectedElement0Tenth: number = -1;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
      const actualElement1Sixth = target.$_get(1);
      const expectedElement1Sixth: number = 100;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Sixth = target.$_get(2);
      const expectedElement2Sixth: number = -200;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
      const actualElement3Fifth = target.$_get(3);
      const expectedElement3Fifth: number = 0;
      expect(actualElement3Fifth).assertEqual(expectedElement3Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0980
     * @tc.name testFloat64ArrayViewExtension098
     * @tc.desc Verify set(Uint8Array) full range 0-255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(4);
      const u8: Uint8Array = new Uint8Array([0, 128, 255, 1]);
      target.set(u8);
      const actualElement0Tenth = target.$_get(0);
      const expectedElement0Tenth: number = 0;
      expect(actualElement0Tenth).assertEqual(expectedElement0Tenth);
      const actualElement1Sixth = target.$_get(1);
      const expectedElement1Sixth: number = 128;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Sixth = target.$_get(2);
      const expectedElement2Sixth: number = 255;
      expect(actualElement2Sixth).assertEqual(expectedElement2Sixth);
      const actualElement3Fifth = target.$_get(3);
      const expectedElement3Fifth: number = 1;
      expect(actualElement3Fifth).assertEqual(expectedElement3Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_0990
     * @tc.name testFloat64ArrayViewExtension099
     * @tc.desc Verify multiple views aliasing via buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const firstResult: Float64Array = new Float64Array(buf);
      const secondResult: Float64Array = new Float64Array(buf);
      firstResult.$_set(0, 42.0);
      const actualElement0Twelfth = secondResult.$_get(0);
      const expectedElement0Twelfth: number = 42.0;
      expect(actualElement0Twelfth).assertEqual(expectedElement0Twelfth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_1000
     * @tc.name testFloat64ArrayViewExtension100
     * @tc.desc Verify subnormal + normal mixed in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MIN_VALUE, 1.0, Number.MAX_VALUE]);
      const actualElement0Twelfth = arr.$_get(0);
      const expectedElement0Twelfth: number = Number.MIN_VALUE;
      expect(actualElement0Twelfth).assertEqual(expectedElement0Twelfth);
      const actualElement1Seventh = arr.$_get(1);
      const expectedElement1Seventh: number = 1.0;
      expect(actualElement1Seventh).assertEqual(expectedElement1Seventh);
      const actualElement2Seventh = arr.$_get(2);
      const expectedElement2Seventh: number = Number.MAX_VALUE;
      expect(actualElement2Seventh).assertEqual(expectedElement2Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_1010
     * @tc.name testFloat64ArrayViewExtension101
     * @tc.desc Verify subnormal through of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, 2e-308);
      const actualElement0Twelfth = arr.$_get(0);
      const expectedElement0Twelfth: number = Number.MIN_VALUE;
      expect(actualElement0Twelfth).assertEqual(expectedElement0Twelfth);
      const actualElement1Seventh = arr.$_get(1);
      const expectedElement1Seventh: number = 2e-308;
      expect(actualElement1Seventh).assertEqual(expectedElement1Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_1020
     * @tc.name testFloat64ArrayViewExtension102
     * @tc.desc Verify multiple set operations from different typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(6);
      const i32: Int32Array = new Int32Array([1, 2]);
      const u8: Uint8Array = new Uint8Array([3, 4]);
      const f32: Float32Array = new Float32Array([5.0, 6.0]);
      target.set(i32, 0);
      target.set(u8, 2);
      target.set(f32, 4);
      const actualElement0Twelfth = target.$_get(0);
      const expectedElement0Twelfth: number = 1;
      expect(actualElement0Twelfth).assertEqual(expectedElement0Twelfth);
      const actualElement1Seventh = target.$_get(1);
      const expectedElement1Seventh: number = 2;
      expect(actualElement1Seventh).assertEqual(expectedElement1Seventh);
      const actualElement2Seventh = target.$_get(2);
      const expectedElement2Seventh: number = 3;
      expect(actualElement2Seventh).assertEqual(expectedElement2Seventh);
      const actualElement3Sixth = target.$_get(3);
      const expectedElement3Sixth: number = 4;
      expect(actualElement3Sixth).assertEqual(expectedElement3Sixth);
      const actualElementAt4Second = target.$_get(4);
      const expectedElementAt4Second: number = 5.0;
      expect(actualElementAt4Second).assertEqual(expectedElementAt4Second);
      const actualElementAt5Third = target.$_get(5);
      const expectedElementAt5Third: number = 6.0;
      expect(actualElementAt5Third).assertEqual(expectedElementAt5Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_EXTENSION_1030
     * @tc.name testFloat64ArrayViewExtension103
     * @tc.desc Verify business call order chain across view and copy differs by mutation sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewExtension103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const shared = source.subarray(1, 4).fill(9.0, 1, 2);
      const copied = source.slice(1, 4).fill(7.0, 1, 2);
      const actualElement1Seventh = shared.$_get(1);
      const expectedElement1Seventh: number = 9.0;
      expect(actualElement1Seventh).assertEqual(expectedElement1Seventh);
      const actualElement1Eighth = copied.$_get(1);
      const expectedElement1Eighth: number = 7.0;
      expect(actualElement1Eighth).assertEqual(expectedElement1Eighth);
      const actualElement2Seventh = source.$_get(2);
      const expectedElement2Seventh: number = 9.0;
      expect(actualElement2Seventh).assertEqual(expectedElement2Seventh);
      const actualElement1Ninth = source.$_get(1);
      const expectedElement1Ninth: number = 2.0;
      expect(actualElement1Ninth).assertEqual(expectedElement1Ninth);
    });
  })
}
