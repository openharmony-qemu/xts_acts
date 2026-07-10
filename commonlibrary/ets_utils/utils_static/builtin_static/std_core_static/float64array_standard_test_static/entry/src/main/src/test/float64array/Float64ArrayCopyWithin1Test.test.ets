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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function Float64ArrayCopyWithin1Test(): void {
  describe('Float64ArrayCopyWithin1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0100
     * @tc.name testFloat64ArrayCopyWithin001
     * @tc.desc Verify copyWithin with target=0 start=2 end=100 truncated to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const num255Value: number = 255;
      const twentysixValue: number = 26;
      const num222Value: number = 222;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(0, 2, 100);
      expect(result[0]).assertEqual(num255Value);
      expect(result[1]).assertEqual(twentysixValue);
      expect(result[2]).assertEqual(num222Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0200
     * @tc.name testFloat64ArrayCopyWithin002
     * @tc.desc Verify copyWithin with target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const negative99Point99: number = -99.99;
      const arr = new Float64Array([0.5, 1.5, piApprox, -99.99]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(piApprox);
      expect(result[1]).assertEqual(negative99Point99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0300
     * @tc.name testFloat64ArrayCopyWithin003
     * @tc.desc Verify copyWithin with target=1 start=3 end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const int16NegMaxValue: number = -32767;
      const arr = Float64Array.of(-32768, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(1, 3, 5);
      expect(result[1]).assertEqual(negativeOne);
      expect(result[2]).assertEqual(int16NegMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0400
     * @tc.name testFloat64ArrayCopyWithin004
     * @tc.desc Verify copyWithin with target=0 start=0 end=2 copy first two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const int16MaxValue: number = 32767;
      const num32768Value: number = 32768;
      const num255Value: number = 255;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(0, 0, 2);
      expect(result[0]).assertEqual(int16MaxValue);
      expect(result[1]).assertEqual(num32768Value);
      expect(result[2]).assertEqual(num255Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0500
     * @tc.name testFloat64ArrayCopyWithin005
     * @tc.desc Verify copyWithin with target=0 start=2 omitted end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const negative99Point99: number = -99.99;
      const arr = new Float64Array([0.5, 1.5, piApprox, -99.99]);
      const result = arr.copyWithin(0, 2);
      expect(result[0]).assertEqual(piApprox);
      expect(result[1]).assertEqual(negative99Point99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0600
     * @tc.name testFloat64ArrayCopyWithin006
     * @tc.desc Verify copyWithin with target beyond positive bound no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const int16NegMaxValue: number = -32767;
      const arr = Float64Array.of(int16MinValue, -128, -2147483648, -1, -32767);
      arr.copyWithin(10, 0, 2);
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[1]).assertEqual(int8MinValue);
      expect(arr[2]).assertEqual(int32MinValue);
      expect(arr[3]).assertEqual(negativeOne);
      expect(arr[4]).assertEqual(int16NegMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0700
     * @tc.name testFloat64ArrayCopyWithin007
     * @tc.desc Verify copyWithin with start beyond positive bound no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(0, 10, 12);
      expect(arr[0]).assertEqual(hexValue7FFF);
      expect(arr[1]).assertEqual(hexValue8000);
      expect(arr[2]).assertEqual(hexValueFF);
      expect(arr[3]).assertEqual(hexValue1A);
      expect(arr[4]).assertEqual(hexValueDE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0800
     * @tc.name testFloat64ArrayCopyWithin008
     * @tc.desc Verify copyWithin with target beyond negative bound truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const negative99Point99: number = -99.99;
      const arr = new Float64Array([0.5, 1.5, piApprox, -99.99]);
      const result = arr.copyWithin(-10, 2, 4);
      expect(result[0]).assertEqual(piApprox);
      expect(result[1]).assertEqual(negative99Point99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_0900
     * @tc.name testFloat64ArrayCopyWithin009
     * @tc.desc Verify copyWithin with start beyond negative bound truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(3, -10, 3);
      expect(result[3]).assertEqual(int16MinValue);
      expect(result[4]).assertEqual(int8MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1000
     * @tc.name testFloat64ArrayCopyWithin010
     * @tc.desc Verify copyWithin with single target parameter copies from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const int16MaxValue: number = 32767;
      const num32768Value: number = 32768;
      const num255Value: number = 255;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(2);
      expect(result[2]).assertEqual(int16MaxValue);
      expect(result[3]).assertEqual(num32768Value);
      expect(result[4]).assertEqual(num255Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1100
     * @tc.name testFloat64ArrayCopyWithin011
     * @tc.desc Verify copyWithin with start>end empty range unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const piApprox: number = 3.14;
      const arr = new Float64Array([pointFive, onePointFive, piApprox, -99.99]);
      arr.copyWithin(0, 4, 2);
      expect(arr[0]).assertEqual(pointFive);
      expect(arr[1]).assertEqual(onePointFive);
      expect(arr[2]).assertEqual(piApprox);
      expect(arr[3]).assertEqual(-99.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1200
     * @tc.name testFloat64ArrayCopyWithin012
     * @tc.desc Verify copyWithin in-place overwrite when target<start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const int32MinValue: number = -2147483648;
      const int16NegMaxValue: number = -32767;
      const arr = Float64Array.of(int16MinValue, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(1, 0, 3);
      expect(result[0]).assertEqual(int16MinValue);
      expect(result[1]).assertEqual(int16MinValue);
      expect(result[2]).assertEqual(int8MinValue);
      expect(result[3]).assertEqual(int32MinValue);
      expect(result[4]).assertEqual(int16NegMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1300
     * @tc.name testFloat64ArrayCopyWithin013
     * @tc.desc Verify copyWithin with target=start no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(2, 2, 4);
      expect(arr[0]).assertEqual(hexValue7FFF);
      expect(arr[1]).assertEqual(hexValue8000);
      expect(arr[2]).assertEqual(hexValueFF);
      expect(arr[3]).assertEqual(hexValue1A);
      expect(arr[4]).assertEqual(hexValueDE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1400
     * @tc.name testFloat64ArrayCopyWithin014
     * @tc.desc Verify copyWithin on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.copyWithin(0, 0, 0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1500
     * @tc.name testFloat64ArrayCopyWithin015
     * @tc.desc Verify copyWithin on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const oneValue: number = 1;
      const arr = Float64Array.of(maxSafeInteger);
      const result = arr.copyWithin(0, 0, 1);
      expect(result[0]).assertEqual(maxSafeInteger);
      expect(result.length).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1600
     * @tc.name testFloat64ArrayCopyWithin016
     * @tc.desc Verify copyWithin with negative target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive, 3.14, -99.99);
      const result = arr.copyWithin(-2, 0, 3);
      expect(result[2]).assertEqual(pointFive);
      expect(result[3]).assertEqual(onePointFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1700
     * @tc.name testFloat64ArrayCopyWithin017
     * @tc.desc Verify copyWithin with all negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const int16NegMaxValue: number = -32767;
      const arr = Float64Array.of(int16MinValue, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(-5, -5, 5);
      expect(result[0]).assertEqual(int16MinValue);
      expect(result[1]).assertEqual(int8MinValue);
      expect(result[2]).assertEqual(int32MinValue);
      expect(result[3]).assertEqual(negativeOne);
      expect(result[4]).assertEqual(int16NegMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1800
     * @tc.name testFloat64ArrayCopyWithin018
     * @tc.desc Verify copyWithin modifies original array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const num255Value: number = 255;
      const twentysixValue: number = 26;
      const num222Value: number = 222;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(twentysixValue);
      expect(arr[2]).assertEqual(num255Value);
      expect(arr[3]).assertEqual(twentysixValue);
      expect(arr[4]).assertEqual(num222Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_1900
     * @tc.name testFloat64ArrayCopyWithin019
     * @tc.desc Verify copyWithin preserves original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 3.14, -99.99]);
      const originalLength = arr.length;
      arr.copyWithin(0, 2);
      const expectVal = originalLength;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2000
     * @tc.name testFloat64ArrayCopyWithin020
     * @tc.desc Verify copyWithin return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = Float64Array.of(-32768, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(0, 2, 4);
      const expectVal = fiveValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2100
     * @tc.name testFloat64ArrayCopyWithin021
     * @tc.desc Verify copyWithin returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(hexValueFF);
      expect(arr[1]).assertEqual(hexValue1A);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2200
     * @tc.name testFloat64ArrayCopyWithin022
     * @tc.desc Verify copyWithin preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 3.14, -99.99]);
      const originalByteLength = arr.byteLength;
      arr.copyWithin(0, 2, 4);
      const expectVal = originalByteLength;
      expect(arr.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2300
     * @tc.name testFloat64ArrayCopyWithin023
     * @tc.desc Verify copyWithin on array from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const fifteenValue: number = 15;
      const fa: FixedArray<number> = [0xAD, 0x7F, 0x80, 0b1010, 0b1111];
      const arr = new Float64Array(fa);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(tenValue);
      expect(arr[1]).assertEqual(fifteenValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2400
     * @tc.name testFloat64ArrayCopyWithin024
     * @tc.desc Verify copyWithin on array from Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const twoPointZero: number = 2.0;
      const a: Array<number> =
        [Number.MAX_VALUE, Number.MAX_VALUE / 2.0, Number.MIN_VALUE, Number.MIN_VALUE * 2.0, Number.MAX_VALUE];
      const arr = new Float64Array(a);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(numberMinValue);
      expect(arr[1]).assertEqual(numberMinValue * twoPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2500
     * @tc.name testFloat64ArrayCopyWithin025
     * @tc.desc Verify copyWithin from Float64Array source independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int32MinValue: number = -2147483648;
      const src = new Float64Array([int16MinValue, -128, -2147483648, -1, -32767]);
      const arr = new Float64Array(src);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(src[0]).assertEqual(int16MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2600
     * @tc.name testFloat64ArrayCopyWithin026
     * @tc.desc Verify copyWithin on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num255Value: number = 255;
      const twentysixValue: number = 26;
      const buf = new ArrayBuffer(48);
      const arr = new Float64Array(buf, 8, 5);
      arr[0] = 0x7FFF;
      arr[1] = 0x8000;
      arr[2] = 0xFF;
      arr[3] = 0x1A;
      arr[4] = 0xDE;
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(twentysixValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2700
     * @tc.name testFloat64ArrayCopyWithin027
     * @tc.desc Verify copyWithin with ArrayBuffer preserves buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(40);
      const arr = new Float64Array(buffer, 0, 5);
      arr[0] = 0.5;
      arr[1] = 1.5;
      arr[2] = 3.14;
      arr[3] = -99.99;
      arr[4] = 0.0;
      const originalBuffer = arr.buffer;
      arr.copyWithin(0, 2);
      const expectVal = originalBuffer;
      expect(arr.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2800
     * @tc.name testFloat64ArrayCopyWithin028
     * @tc.desc Verify child view copyWithin visible in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourPointZero: number = 4.0;
      const buf = new ArrayBuffer(40);
      const parent = new Float64Array(buf, 0, 5);
      parent[0] = 1.0;
      parent[1] = 2.0;
      parent[2] = 3.0;
      parent[3] = 4.0;
      parent[4] = 5.0;
      const child = new Float64Array(buf, 16, 2);
      child.copyWithin(0, 1, 2);
      const expectVal = fourPointZero;
      expect(parent[2]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2900
     * @tc.name testFloat64ArrayCopyWithin029
     * @tc.desc Verify parent copyWithin visible in child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const buf = new ArrayBuffer(40);
      const parent = new Float64Array(buf, 0, 5);
      parent[0] = 1.0;
      parent[1] = 2.0;
      parent[2] = 3.0;
      parent[3] = 4.0;
      parent[4] = 5.0;
      const child = new Float64Array(buf, 16, 2);
      parent.copyWithin(0, 2, 4);
      expect(child[0]).assertEqual(threePointZero);
      expect(child[1]).assertEqual(fourPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3000
     * @tc.name testFloat64ArrayCopyWithin030
     * @tc.desc Verify reverse then copyWithin chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const num222Value: number = 222;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.reverse().copyWithin(2, 0, 2);
      const expectVal = num222Value;
      expect(arr[2]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3100
     * @tc.name testFloat64ArrayCopyWithin031
     * @tc.desc Verify fill then copyWithin chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array(5);
      arr.fill(ninePointZero, 0, 3).copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(ninePointZero);
      expect(arr[4]).assertEqual(ninePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3200
     * @tc.name testFloat64ArrayCopyWithin032
     * @tc.desc Verify copyWithin on 50-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfivePointzero: number = 25.0;
      const fortyninePointzero: number = 49.0;
      const arr = new Float64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = i * 1.0;
      }
      arr.copyWithin(0, 25, 50);
      expect(arr[0]).assertEqual(twentyfivePointzero);
      expect(arr[24]).assertEqual(fortyninePointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3300
     * @tc.name testFloat64ArrayCopyWithin033
     * @tc.desc Verify copyWithin on 200-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fillValue99: number = 99.0;
      const arr = new Float64Array(200);
      for (let i = 0; i < 200; i++) {
        arr[i] = i * 1.0;
      }
      arr.copyWithin(100, 0, 100);
      expect(arr[100]).assertEqual(zeroPointZero);
      expect(arr[199]).assertEqual(fillValue99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3400
     * @tc.name testFloat64ArrayCopyWithin034
     * @tc.desc Verify copyWithin with all-negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negthreePointzero: number = -3.0;
      const negfourPointzero: number = -4.0;
      const arr = new Float64Array([-1.0, -2.0, -3.0, -4.0, -5.0]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(negthreePointzero);
      expect(arr[1]).assertEqual(negfourPointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3500
     * @tc.name testFloat64ArrayCopyWithin035
     * @tc.desc Verify copyWithin with decimal fraction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointThree: number = 0.3;
      const pointFour: number = 0.4;
      const arr = new Float64Array([0.1, 0.2, pointThree, pointFour, 0.5]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(pointThree);
      expect(arr[1]).assertEqual(pointFour);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3600
     * @tc.name testFloat64ArrayCopyWithin036
     * @tc.desc Verify copyWithin with alternating positive-negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const negtwoPointzero: number = -2.0;
      const arr = new Float64Array([1.0, -2.0, threePointZero, -4.0, 5.0]);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(negtwoPointzero);
      expect(arr[1]).assertEqual(threePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3700
     * @tc.name testFloat64ArrayCopyWithin037
     * @tc.desc Verify copyWithin on preallocated zero-initialized array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array(5);
      arr[3] = 9.0;
      arr[4] = 9.0;
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(ninePointZero);
      expect(arr[1]).assertEqual(ninePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3800
     * @tc.name testFloat64ArrayCopyWithin038
     * @tc.desc Verify copyWithin with target=-0 equals target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const num255Value: number = 255;
      const twentysixValue: number = 26;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(-0, 2, 4);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(twentysixValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_3900
     * @tc.name testFloat64ArrayCopyWithin039
     * @tc.desc Verify copyWithin all-zero params empty range unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(0, 0, 0);
      expect(arr[0]).assertEqual(hexValue7FFF);
      expect(arr[1]).assertEqual(hexValue8000);
      expect(arr[2]).assertEqual(hexValueFF);
      expect(arr[3]).assertEqual(hexValue1A);
      expect(arr[4]).assertEqual(hexValueDE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4000
     * @tc.name testFloat64ArrayCopyWithin040
     * @tc.desc Verify copyWithin output element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(hexValueFF);
      expect(arr[1]).assertEqual(hexValue1A);
      expect(arr[2]).assertEqual(hexValueFF);
      expect(arr[3]).assertEqual(hexValue1A);
      expect(arr[4]).assertEqual(hexValueDE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4100
     * @tc.name testFloat64ArrayCopyWithin041
     * @tc.desc Verify copyWithin updates element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const piApprox: number = 3.14;
      const arr = new Float64Array([pointFive, 1.5, piApprox, -99.99]);
      arr.copyWithin(1, 3, 5);
      expect(arr[0]).assertEqual(pointFive);
      expect(arr[1]).assertEqual(-99.99);
      expect(arr[2]).assertEqual(piApprox);
      expect(arr[3]).assertEqual(-99.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4200
     * @tc.name testFloat64ArrayCopyWithin042
     * @tc.desc Verify copyWithin on ArrayBuffer byteOffset view preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(80);
      const arr = new Float64Array(buffer, 8, 5);
      const originalOffset = arr.byteOffset;
      arr.copyWithin(0, 2);
      const expectVal = originalOffset;
      expect(arr.byteOffset).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4300
     * @tc.name testFloat64ArrayCopyWithin043
     * @tc.desc Verify copyWithin with extreme values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const arr =
        new Float64Array([numberMaxValue, numberMaxValue / 2.0, numberMaxValue, numberMinValue, numberMaxValue]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(numberMaxValue);
      expect(result[1]).assertEqual(numberMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4400
     * @tc.name testFloat64ArrayCopyWithin044
     * @tc.desc Verify copyWithin with tiny values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const twoPointZero: number = 2.0;
      const arr =
        new Float64Array([numberMinValue, numberMinValue * twoPointZero, numberMinValue, numberMinValue * twoPointZero,
          numberMinValue]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(numberMinValue);
      expect(result[1]).assertEqual(numberMinValue * twoPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4500
     * @tc.name testFloat64ArrayCopyWithin045
     * @tc.desc Verify copyWithin with NaN and Infinity values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([nanValue, negativeInfinity, positiveInfinity, -0.0, nanValue]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(positiveInfinity);
      expect(result[1]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4600
     * @tc.name testFloat64ArrayCopyWithin046
     * @tc.desc Verify copyWithin with negative boundary values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-32768, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(int32MinValue);
      expect(result[1]).assertEqual(negativeOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4700
     * @tc.name testFloat64ArrayCopyWithin047
     * @tc.desc Verify copyWithin with hex literal values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const num255Value: number = 255;
      const twentysixValue: number = 26;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(num255Value);
      expect(result[1]).assertEqual(twentysixValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4800
     * @tc.name testFloat64ArrayCopyWithin048
     * @tc.desc Verify copyWithin with binary literal values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue1111: number = 0b1111;
      const binaryValue1: number = 0b1;
      const binaryMax31Bit: number = 0b1111111111111111111111111111111;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = new Float64Array([binaryValue1010, binaryValue1111, binaryValue1, binaryMax31Bit]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(oneValue);
      expect(result[1]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_4900
     * @tc.name testFloat64ArrayCopyWithin049
     * @tc.desc Verify copyWithin with safe integer values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const arr = new Float64Array([maxSafeInteger, minSafeInteger, maxSafeInteger, minSafeInteger]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(maxSafeInteger);
      expect(result[1]).assertEqual(minSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5000
     * @tc.name testFloat64ArrayCopyWithin050
     * @tc.desc Verify single-param copyWithin negative target keeps original tail values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const piApprox: number = 3.14;
      const negative99Point99: number = -99.99;
      const arr = Float64Array.of(pointFive, onePointFive, piApprox, negative99Point99);
      const result = arr.copyWithin(-2);
      expect(result).assertEqual(arr);
      expect(result[2]).assertEqual(piApprox);
      expect(result[3]).assertEqual(negative99Point99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5100
     * @tc.name testFloat64ArrayCopyWithin051
     * @tc.desc Verify copyWithin with hex values 0xAD 0x7F 0x80 0x7FFF 0x8000 target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueAD: number = 0xAD;
      const hexValue7F: number = 0x7F;
      const hexValue80: number = 0x80;
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const num128Value: number = 128;
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([hexValueAD, hexValue7F, hexValue80, hexValue7FFF, hexValue8000]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(num128Value);
      expect(result[1]).assertEqual(int16MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5200
     * @tc.name testFloat64ArrayCopyWithin052
     * @tc.desc Verify copyWithin with negative and positive boundary values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, int32MaxValue, -1, -32767]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(int32MaxValue);
      expect(result[1]).assertEqual(negativeOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5300
     * @tc.name testFloat64ArrayCopyWithin053
     * @tc.desc Verify copyWithin with extreme values on 4-element array target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const arr = new Float64Array([numberMaxValue, numberMaxValue / 2.0, numberMaxValue, numberMinValue]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(numberMaxValue);
      expect(result[1]).assertEqual(numberMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5400
     * @tc.name testFloat64ArrayCopyWithin054
     * @tc.desc Verify copyWithin with tiny values on 4-element array target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const twoPointZero: number = 2.0;
      const arr =
        Float64Array.of(numberMinValue, numberMinValue * twoPointZero, numberMinValue, numberMinValue * twoPointZero);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(numberMinValue);
      expect(result[1]).assertEqual(numberMinValue * twoPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5500
     * @tc.name testFloat64ArrayCopyWithin055
     * @tc.desc Verify copyWithin with NaN and Infinity on 4-element array target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(nanValue, negativeInfinity, positiveInfinity, -0.0);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(positiveInfinity);
      expect(result[1]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5600
     * @tc.name testFloat64ArrayCopyWithin056
     * @tc.desc Verify copyWithin with NaN and Infinity values target=1 start=3 end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([nanValue, negativeInfinity, positiveInfinity, -0.0, nanValue]);
      const result = arr.copyWithin(1, 3, 5);
      const actualFirstIsNaN = Number.isNaN(result[0]);
      const expectedFirstIsNaN = true;
      expect(actualFirstIsNaN).assertEqual(expectedFirstIsNaN);
      expect(result[1]).assertEqual(zeroPointZero);
      const actualThirdIsNaN = Number.isNaN(result[2]);
      const expectedThirdIsNaN = true;
      expect(actualThirdIsNaN).assertEqual(expectedThirdIsNaN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5700
     * @tc.name testFloat64ArrayCopyWithin057
     * @tc.desc Verify copyWithin with hex literal values target=1 start=3 end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const twentysixValue: number = 26;
      const num222Value: number = 222;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(1, 3, 5);
      expect(result[1]).assertEqual(twentysixValue);
      expect(result[2]).assertEqual(num222Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5800
     * @tc.name testFloat64ArrayCopyWithin058
     * @tc.desc Verify copyWithin with binary literal values on 5-element array target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue1111: number = 0b1111;
      const binaryValue1: number = 0b1;
      const binaryMax31Bit: number = 0b1111111111111111111111111111111;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(binaryValue1010, binaryValue1111, binaryValue1, binaryMax31Bit, binaryValue1010);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(oneValue);
      expect(result[1]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_5900
     * @tc.name testFloat64ArrayCopyWithin059
     * @tc.desc Verify copyWithin with extreme values mixed with MIN_VALUE target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const arr =
        new Float64Array([numberMaxValue, numberMaxValue / 2.0, numberMinValue, numberMaxValue, numberMinValue]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(numberMinValue);
      expect(result[1]).assertEqual(numberMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6000
     * @tc.name testFloat64ArrayCopyWithin060
     * @tc.desc Verify copyWithin with mixed precision values target=0 start=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const tinyValue1e20: number = 1e-20;
      const tinyValue1e21: number = 1e-21;
      const arr = new Float64Array([pointOne, 9007199254740991, tinyValue1e20, tinyValue1e21, pointOne]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(tinyValue1e20);
      expect(result[1]).assertEqual(tinyValue1e21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6100
     * @tc.name testFloat64ArrayCopyWithin061
     * @tc.desc Verify copyWithin with hex literal values target=0 start=0 end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const int16MaxValue: number = 32767;
      const num32768Value: number = 32768;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      const result = arr.copyWithin(0, 0, 2);
      expect(result[0]).assertEqual(int16MaxValue);
      expect(result[1]).assertEqual(num32768Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6200
     * @tc.name testFloat64ArrayCopyWithin062
     * @tc.desc Verify copyWithin with undefined end parameter treated as length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const int16NegMaxValue: number = -32767;
      const arr = Float64Array.of(-32768, -128, -2147483648, -1, -32767);
      const result = arr.copyWithin(0, 2, undefined);
      expect(result[0]).assertEqual(int32MinValue);
      expect(result[1]).assertEqual(negativeOne);
      expect(result[2]).assertEqual(int16NegMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6300
     * @tc.name testFloat64ArrayCopyWithin063
     * @tc.desc Verify copyWithin with target=0 alone keeps array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const hexValue8000: number = 0x8000;
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const hexValueDE: number = 0xDE;
      const arr = new Float64Array([hexValue7FFF, hexValue8000, hexValueFF, hexValue1A, hexValueDE]);
      arr.copyWithin(0);
      expect(arr[0]).assertEqual(hexValue7FFF);
      expect(arr[1]).assertEqual(hexValue8000);
      expect(arr[2]).assertEqual(hexValueFF);
      expect(arr[3]).assertEqual(hexValue1A);
      expect(arr[4]).assertEqual(hexValueDE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6400
     * @tc.name testFloat64ArrayCopyWithin064
     * @tc.desc Verify copyWithin with target=1 alone copies leading elements to tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const piApprox: number = 3.14;
      const arr = new Float64Array([pointFive, onePointFive, piApprox, -99.99]);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(pointFive);
      expect(arr[1]).assertEqual(pointFive);
      expect(arr[2]).assertEqual(onePointFive);
      expect(arr[3]).assertEqual(piApprox);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6500
     * @tc.name testFloat64ArrayCopyWithin065
     * @tc.desc Verify copyWithin with extreme values and negative target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const arr =
        new Float64Array([numberMaxValue, numberMaxValue / 2.0, numberMaxValue, numberMinValue, numberMaxValue]);
      const result = arr.copyWithin(-5, 2, 4);
      expect(result[0]).assertEqual(numberMaxValue);
      expect(result[1]).assertEqual(numberMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_6600
     * @tc.name testFloat64ArrayCopyWithin066
     * @tc.desc Verify copyWithin with NaN and Infinity values and negative target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(nanValue, negativeInfinity, positiveInfinity, -0.0);
      const result = arr.copyWithin(-4, 2, 4);
      expect(result[0]).assertEqual(positiveInfinity);
      expect(result[1]).assertEqual(zeroPointZero);
    });

  })
}
