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

export default function Float64ArrayTruncationAlignmentTest(): void {
  describe('Float64ArrayTruncationAlignmentTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0100
     * @tc.name testFloat64ArrayTruncationAlignment001
     * @tc.desc Verify length 3.9 truncated to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3.9);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 24;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0200
     * @tc.name testFloat64ArrayTruncationAlignment002
     * @tc.desc Verify length 0.9 truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0.9);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0300
     * @tc.name testFloat64ArrayTruncationAlignment003
     * @tc.desc Verify too-large fractional length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(2147483647.5);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0400
     * @tc.name testFloat64ArrayTruncationAlignment004
     * @tc.desc Verify length 1.5 truncated to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1.5);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 8;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0500
     * @tc.name testFloat64ArrayTruncationAlignment005
     * @tc.desc Verify byteOffset 0.9 truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0.9);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualLength = arr.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0600
     * @tc.name testFloat64ArrayTruncationAlignment006
     * @tc.desc Verify byteOffset 15.9 truncates to unaligned offset and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(24);
        new Float64Array(buf, 15.9);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0700
     * @tc.name testFloat64ArrayTruncationAlignment007
     * @tc.desc Verify undefined byteOffset defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, undefined, undefined);
      const actualByteOffset = view.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0800
     * @tc.name testFloat64ArrayTruncationAlignment008
     * @tc.desc Verify undefined byteOffset with defined length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, undefined, 1);
      const actualByteOffset = view.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualLength = view.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_0900
     * @tc.name testFloat64ArrayTruncationAlignment009
     * @tc.desc Verify undefined length uses remaining buffer space from offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, 0, undefined);
      const actualLength = view.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1000
     * @tc.name testFloat64ArrayTruncationAlignment010
     * @tc.desc Verify undefined length uses remaining buffer space from offset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, 8, undefined);
      const actualLength = view.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1100
     * @tc.name testFloat64ArrayTruncationAlignment011
     * @tc.desc Verify undefined length from offset 8 on 24-byte buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 8, undefined);
      const actualLength = view.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = view.byteLength;
      const expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1200
     * @tc.name testFloat64ArrayTruncationAlignment012
     * @tc.desc Verify byteOffset 8 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 8);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 8;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1300
     * @tc.name testFloat64ArrayTruncationAlignment013
     * @tc.desc Verify byteOffset 24 is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 24);
      const actualByteOffset = arr.byteOffset;
      const expectedByteOffset: int = 24;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1400
     * @tc.name testFloat64ArrayTruncationAlignment014
     * @tc.desc Verify byteOffset 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const arr = new Float64Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1500
     * @tc.name testFloat64ArrayTruncationAlignment015
     * @tc.desc Verify 0.1 + 0.2 != 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr.$_set(0, 0.1 + 0.2);
      const actualResult = arr[0];
      const expectedResult: number = 0.3;
      expect(actualResult).not().assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1600
     * @tc.name testFloat64ArrayTruncationAlignment016
     * @tc.desc Verify 0.1 + 0.2 equals 0.30000000000000004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr.$_set(0, 0.1 + 0.2);
      const actualResult = arr[0];
      const expectedResult: number = 0.30000000000000004;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1700
     * @tc.name testFloat64ArrayTruncationAlignment017
     * @tc.desc Verify 1.0 / 3.0 * 3.0 rounds to 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr.$_set(0, 1.0 / 3.0 * 3.0);
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1800
     * @tc.name testFloat64ArrayTruncationAlignment018
     * @tc.desc Verify MAX_SAFE_INTEGER exact representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr.$_set(0, 9007199254740991);
      const actualResult = arr[0];
      const expectedResult: number = 9007199254740991;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_1900
     * @tc.name testFloat64ArrayTruncationAlignment019
     * @tc.desc Verify out-of-range MAX_VALUE literal rounds to MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr.$_set(0, 1.7976931348623158e+308);
      const maxValue: number = 1.7976931348623157e+308;
      expect(arr[0]).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2000
     * @tc.name testFloat64ArrayTruncationAlignment020
     * @tc.desc Verify MIN_SAFE_INTEGER exact representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr.$_set(0, -9007199254740991);
      const actualResultSecond = arr[0];
      const expectedResultSecond: number = -9007199254740991;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2100
     * @tc.name testFloat64ArrayTruncationAlignment021
     * @tc.desc Verify subarray write affects parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float64Array.of(1.0, 2.0, 3.0);
      const child = parent.subarray(1, 3);
      child[0] = 999.0;
      const actualResultSecond = parent[1];
      const expectedResultSecond: number = 999.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2200
     * @tc.name testFloat64ArrayTruncationAlignment022
     * @tc.desc Verify parent write affects subarray child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float64Array.of(1.0, 2.0, 3.0);
      const child = parent.subarray(1, 3);
      parent[1] = 888.0;
      const actualResultSecond = child[0];
      const expectedResultSecond: number = 888.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2300
     * @tc.name testFloat64ArrayTruncationAlignment023
     * @tc.desc Verify multilevel subarray shares buffer with root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const child1 = parent.subarray(1, 4);
      const child2 = child1.subarray(1, 3);
      child2[0] = 777.0;
      const actualResultSecond = parent[2];
      const expectedResultSecond: number = 777.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2400
     * @tc.name testFloat64ArrayTruncationAlignment024
     * @tc.desc Verify multiple overlapping subarray views affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float64Array.of(1.0, 2.0, 3.0);
      const view1 = parent.subarray(0, 2);
      const view2 = parent.subarray(1, 3);
      view1[1] = 500.0;
      const actualResultSecond = view2[0];
      const expectedResultSecond: number = 500.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      view2[1] = 600.0;
      const actualResultThird = parent[2];
      const expectedResultThird: number = 600.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2500
     * @tc.name testFloat64ArrayTruncationAlignment025
     * @tc.desc Verify $_set 0.1 preserves double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0.1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.1;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2600
     * @tc.name testFloat64ArrayTruncationAlignment026
     * @tc.desc Verify $_set 0.1 + 0.2 equals classic double precision issue 0.30000000000000004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0.1 + 0.2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.30000000000000004;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2700
     * @tc.name testFloat64ArrayTruncationAlignment027
     * @tc.desc Verify $_set 2^53 = 9007199254740992 preserves exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 9007199254740992);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740992;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2800
     * @tc.name testFloat64ArrayTruncationAlignment028
     * @tc.desc Verify $_set 2^53+1 = 9007199254740993 truncates to 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 9007199254740993);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740992;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_2900
     * @tc.name testFloat64ArrayTruncationAlignment029
     * @tc.desc Verify $_set 2^53+2 = 9007199254740994 is exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 9007199254740994);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740994;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3000
     * @tc.name testFloat64ArrayTruncationAlignment030
     * @tc.desc Verify $_set 2^53+3 = 9007199254740995 rounds to 9007199254740996
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 9007199254740995);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740996;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3100
     * @tc.name testFloat64ArrayTruncationAlignment031
     * @tc.desc Verify $_set 2^53-1 = 9007199254740991 is exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 9007199254740991);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740991;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3200
     * @tc.name testFloat64ArrayTruncationAlignment032
     * @tc.desc Verify a value above the maximum finite double becomes positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, Number.MAX_VALUE * 1.001);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3300
     * @tc.name testFloat64ArrayTruncationAlignment033
     * @tc.desc Verify a value below the minimum finite double becomes negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -Number.MAX_VALUE * 1.001);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3400
     * @tc.name testFloat64ArrayTruncationAlignment034
     * @tc.desc Verify $_set Number.MIN_VALUE is exactly representable (5e-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, Number.MIN_VALUE);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3500
     * @tc.name testFloat64ArrayTruncationAlignment035
     * @tc.desc Verify $_set Number.MIN_VALUE / 2 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, Number.MIN_VALUE / 2);
      const actualElement0 = 1 / arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3600
     * @tc.name testFloat64ArrayTruncationAlignment036
     * @tc.desc Verify $_set -Number.MIN_VALUE / 2 underflows to -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -Number.MIN_VALUE / 2);
      const actualElement0 = 1 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3700
     * @tc.name testFloat64ArrayTruncationAlignment037
     * @tc.desc Verify with index 0 truncates 2^53+1 to 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const r: Float64Array = arr.with(0, 9007199254740993);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 9007199254740992;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3800
     * @tc.name testFloat64ArrayTruncationAlignment038
     * @tc.desc Verify fill 2^53+1 truncates all elements to 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(9007199254740993);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740992;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 9007199254740992;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_3900
     * @tc.name testFloat64ArrayTruncationAlignment039
     * @tc.desc Verify fill 0.1+0.2 fills all elements with double precision sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      arr.fill(0.1 + 0.2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.30000000000000004;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.30000000000000004;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4000
     * @tc.name testFloat64ArrayTruncationAlignment040
     * @tc.desc Verify set copies 2^53+1 with truncation to 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = new Float64Array([9007199254740993]);
      const dst: Float64Array = new Float64Array(1);
      dst.set(src);
      const actualElement0Third = dst.$_get(0);
      const expectedElement0Third: number = 9007199254740992;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4100
     * @tc.name testFloat64ArrayTruncationAlignment041
     * @tc.desc Verify copyWithin propagates truncated double precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.1 + 0.2, 0.0, 0.0]);
      arr.copyWithin(1, 0, 1);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 0.30000000000000004;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4200
     * @tc.name testFloat64ArrayTruncationAlignment042
     * @tc.desc Verify of(2^53+1) truncates to 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9007199254740993);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 9007199254740992;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4300
     * @tc.name testFloat64ArrayTruncationAlignment043
     * @tc.desc Verify of(0.1 + 0.2) preserves double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1 + 0.2);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 0.30000000000000004;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4400
     * @tc.name testFloat64ArrayTruncationAlignment044
     * @tc.desc Verify Number.MAX_VALUE is stored and read exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, Number.MAX_VALUE);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = Number.MAX_VALUE;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4500
     * @tc.name testFloat64ArrayTruncationAlignment045
     * @tc.desc Verify -Number.MAX_VALUE is stored and read exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -Number.MAX_VALUE);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = -Number.MAX_VALUE;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4600
     * @tc.name testFloat64ArrayTruncationAlignment046
     * @tc.desc Verify $_set large int 4294967296 (2^32) exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 4294967296);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 4294967296;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4700
     * @tc.name testFloat64ArrayTruncationAlignment047
     * @tc.desc Verify $_set int 2147483647 exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 2147483647);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 2147483647;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4800
     * @tc.name testFloat64ArrayTruncationAlignment048
     * @tc.desc Verify $_set int -2147483648 exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -2147483648);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = -2147483648;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_4900
     * @tc.name testFloat64ArrayTruncationAlignment049
     * @tc.desc Verify assigning hexadecimal literal 0x9 produces 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0x9);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 9.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_5000
     * @tc.name testFloat64ArrayTruncationAlignment050
     * @tc.desc Verify $_set 1.0e3 preserves 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 1.0e3);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 1000;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_5100
     * @tc.name testFloat64ArrayTruncationAlignment051
     * @tc.desc Verify from array 0.1 preserves double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([0.1]);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 0.1;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_5200
     * @tc.name testFloat64ArrayTruncationAlignment052
     * @tc.desc Verify from array 2^53+1 truncates to 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([9007199254740993]);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 9007199254740992;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TRUNCATION_ALIGNMENT_5300
     * @tc.name testFloat64ArrayTruncationAlignment053
     * @tc.desc Verify business call order with integer index produces normal negative no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayTruncationAlignment053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inventory: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN);
      const before = inventory.join(',');
      const adjusted = inventory.slice(0).fill(9.0, 1, 1);
      expect(adjusted.join(',')).assertEqual(before);
      expect(inventory.join(',')).assertEqual(before);
    });
  })
}
