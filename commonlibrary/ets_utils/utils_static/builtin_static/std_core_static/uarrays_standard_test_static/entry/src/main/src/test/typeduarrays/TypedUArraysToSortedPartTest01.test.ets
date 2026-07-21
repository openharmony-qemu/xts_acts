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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

// AUTO_TYPED_ARRAY_HELPERS_START
function sortBigUint64ArrayValue(source: BigUint64Array): BigUint64Array {
  const result = new BigUint64Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: BigInt = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint32ArrayValue(source: Uint32Array): Uint32Array {
  const result = new Uint32Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint8ClampedArrayValue(source: Uint8ClampedArray): Uint8ClampedArray {
  const result = new Uint8ClampedArray(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

// AUTO_TYPED_ARRAY_HELPERS_END

export default function typedUArraysToSortedPartTest01(): void {
  describe('TypedUArraysToSortedPartTest01', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_0100
     * @tc.name testTypedUArraysToSortedPart101_001
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5000
     * @tc.name testTypedUArraysToSortedPart101_050
     * @tc.desc Verify Uint8Array compareFn toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([42])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5100
     * @tc.name testTypedUArraysToSortedPart101_051
     * @tc.desc Verify Uint16Array compareFn toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32768]);
      let result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([32768])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5200
     * @tc.name testTypedUArraysToSortedPart101_052
     * @tc.desc Verify Uint8Array 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 128]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0, 128, 255])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5300
     * @tc.name testTypedUArraysToSortedPart101_053
     * @tc.desc Verify Uint8Array 0x00 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x00, 0x80]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0x00, 0x80, 0xFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5400
     * @tc.name testTypedUArraysToSortedPart101_054
     * @tc.desc Verify Uint8Array 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x80, 0, 0xFF]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0, 0x80, 0xFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5500
     * @tc.name testTypedUArraysToSortedPart101_055
     * @tc.desc Verify Uint8Array 127 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127, 1, 0]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0, 1, 127])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5600
     * @tc.name testTypedUArraysToSortedPart101_056
     * @tc.desc Verify Uint8Array 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 0]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0, 1])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5700
     * @tc.name testTypedUArraysToSortedPart101_057
     * @tc.desc Verify Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0, 0, 0])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5800
     * @tc.name testTypedUArraysToSortedPart101_058
     * @tc.desc Verify Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([255, 255, 255])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_5900
     * @tc.name testTypedUArraysToSortedPart101_059
     * @tc.desc Verify Uint8Array 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([128, 128, 128]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([128, 128, 128])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6000
     * @tc.name testTypedUArraysToSortedPart101_060
     * @tc.desc Verify Uint16Array 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 32768]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0, 32768, 65535])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6100
     * @tc.name testTypedUArraysToSortedPart101_061
     * @tc.desc Verify Uint16Array 0x0000 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x0000, 0x8000]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0x0000, 0x8000, 0xFFFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6200
     * @tc.name testTypedUArraysToSortedPart101_062
     * @tc.desc Verify Uint16Array 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000, 0, 0xFFFF]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0, 0x8000, 0xFFFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6300
     * @tc.name testTypedUArraysToSortedPart101_063
     * @tc.desc Verify Uint16Array 32767 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767, 1, 0]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0, 1, 32767])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6400
     * @tc.name testTypedUArraysToSortedPart101_064
     * @tc.desc Verify Uint16Array 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 0]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0, 1])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6500
     * @tc.name testTypedUArraysToSortedPart101_065
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0, 0, 0])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6600
     * @tc.name testTypedUArraysToSortedPart101_066
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535, 65535]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([65535, 65535, 65535])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6700
     * @tc.name testTypedUArraysToSortedPart101_067
     * @tc.desc Verify Uint16Array 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32768, 32768, 32768]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([32768, 32768, 32768])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6800
     * @tc.name testTypedUArraysToSortedPart101_068
     * @tc.desc Verify Uint32Array 0 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483648]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 2147483648, 4294967295])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_6900
     * @tc.name testTypedUArraysToSortedPart101_069
     * @tc.desc Verify Uint32Array 0x00000000 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x00000000, 0x80000000]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0x00000000, 0x80000000, 0xFFFFFFFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7000
     * @tc.name testTypedUArraysToSortedPart101_070
     * @tc.desc Verify Uint32Array 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000, 0, 0xFFFFFFFF]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 0x80000000, 0xFFFFFFFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7100
     * @tc.name testTypedUArraysToSortedPart101_071
     * @tc.desc Verify Uint32Array 2147483647 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647, 1, 0]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 1, 2147483647])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7200
     * @tc.name testTypedUArraysToSortedPart101_072
     * @tc.desc Verify Uint32Array 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 0]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 1])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7300
     * @tc.name testTypedUArraysToSortedPart101_073
     * @tc.desc Verify Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 0, 0])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7400
     * @tc.name testTypedUArraysToSortedPart101_074
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([4294967295, 4294967295, 4294967295])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7500
     * @tc.name testTypedUArraysToSortedPart101_075
     * @tc.desc Verify Uint32Array 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483648, 2147483648, 2147483648]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([2147483648, 2147483648, 2147483648])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7600
     * @tc.name testTypedUArraysToSortedPart101_076
     * @tc.desc Verify Uint8ClampedArray 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 128]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0, 128, 255])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7700
     * @tc.name testTypedUArraysToSortedPart101_077
     * @tc.desc Verify Uint8ClampedArray 0x00 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x00, 0x80]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0x00, 0x80, 0xFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7800
     * @tc.name testTypedUArraysToSortedPart101_078
     * @tc.desc Verify Uint8ClampedArray 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x80, 0, 0xFF]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0, 0x80, 0xFF])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_7900
     * @tc.name testTypedUArraysToSortedPart101_079
     * @tc.desc Verify Uint8ClampedArray 127 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 1, 0]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0, 1, 127])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8000
     * @tc.name testTypedUArraysToSortedPart101_080
     * @tc.desc Verify Uint8ClampedArray 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0, 1])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8100
     * @tc.name testTypedUArraysToSortedPart101_081
     * @tc.desc Verify Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0, 0, 0])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8200
     * @tc.name testTypedUArraysToSortedPart101_082
     * @tc.desc Verify Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([255, 255, 255])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8300
     * @tc.name testTypedUArraysToSortedPart101_083
     * @tc.desc Verify Uint8ClampedArray 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 128, 128]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([128, 128, 128])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8400
     * @tc.name testTypedUArraysToSortedPart101_084
     * @tc.desc Verify BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 9223372036854775807n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, 9223372036854775807n, BigInt('18446744073709551615')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8500
     * @tc.name testTypedUArraysToSortedPart101_085
     * @tc.desc Verify BigUint64Array 0n BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, BigInt('9223372036854775808')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8600
     * @tc.name testTypedUArraysToSortedPart101_086
     * @tc.desc Verify BigUint64Array BigInt('9223372036854775808')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('9223372036854775808'), 0n, BigInt('18446744073709551615')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8700
     * @tc.name testTypedUArraysToSortedPart101_087
     * @tc.desc Verify BigUint64Array 1n 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, 1n])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8800
     * @tc.name testTypedUArraysToSortedPart101_088
     * @tc.desc Verify BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, 0n, 0n])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_8900
     * @tc.name testTypedUArraysToSortedPart101_089
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9000
     * @tc.name testTypedUArraysToSortedPart101_090
     * @tc.desc Verify BigUint64Array BigInt('9223372036854775808')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('9223372036854775808'), BigInt('9223372036854775808'), BigInt('9223372036854775808')]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([BigInt('9223372036854775808'), BigInt('9223372036854775808'), BigInt('9223372036854775808')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9100
     * @tc.name testTypedUArraysToSortedPart101_091
     * @tc.desc Verify Uint8Array 0 128 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([128, 255, 0]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([0, 128, 255])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9200
     * @tc.name testTypedUArraysToSortedPart101_092
     * @tc.desc Verify Uint16Array 0 32768 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32768, 65535, 0]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([0, 32768, 65535])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9300
     * @tc.name testTypedUArraysToSortedPart101_093
     * @tc.desc Verify Uint32Array 0 2147483648 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483648, 4294967295, 0]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 2147483648, 4294967295])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9400
     * @tc.name testTypedUArraysToSortedPart101_094
     * @tc.desc Verify Uint8ClampedArray 0 128 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 255, 0]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([0, 128, 255])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9500
     * @tc.name testTypedUArraysToSortedPart101_095
     * @tc.desc Verify BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('9223372036854775808'), BigInt('18446744073709551615'), 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9600
     * @tc.name testTypedUArraysToSortedPart101_096
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 3, 2, 1]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([1, 1, 2, 3, 3])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9700
     * @tc.name testTypedUArraysToSortedPart101_097
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 300, 200, 100]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([100, 100, 200, 300, 300])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9800
     * @tc.name testTypedUArraysToSortedPart101_098
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([300000000, 100000000, 300000000, 200000000, 100000000]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([100000000, 100000000, 200000000, 300000000, 300000000])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART101_9900
     * @tc.name testTypedUArraysToSortedPart101_099
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 3, 2, 1]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([1, 1, 2, 3, 3])).toString());
    });

    // ============ BYTES_PER_ELEMENT tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10000
     * @tc.name testTypedUArraysPropertyPart101_100
     * @tc.desc Verify Uint8Array BYTES_PER_ELEMENT is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10100
     * @tc.name testTypedUArraysPropertyPart101_101
     * @tc.desc Verify Uint16Array BYTES_PER_ELEMENT is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10200
     * @tc.name testTypedUArraysPropertyPart101_102
     * @tc.desc Verify Uint32Array BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10300
     * @tc.name testTypedUArraysPropertyPart101_103
     * @tc.desc Verify Uint8ClampedArray BYTES_PER_ELEMENT is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10400
     * @tc.name testTypedUArraysPropertyPart101_104
     * @tc.desc Verify BigUint64Array BYTES_PER_ELEMENT is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    // ============ name property tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10500
     * @tc.name testTypedUArraysPropertyPart101_105
     * @tc.desc Verify Uint8Array name is 'Uint8Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10600
     * @tc.name testTypedUArraysPropertyPart101_106
     * @tc.desc Verify Uint16Array name is 'Uint16Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1]);
      expect(arr.name).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10700
     * @tc.name testTypedUArraysPropertyPart101_107
     * @tc.desc Verify Uint32Array name is 'Uint32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1]);
      expect(arr.name).assertEqual('Uint32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10800
     * @tc.name testTypedUArraysPropertyPart101_108
     * @tc.desc Verify Uint8ClampedArray name is 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_10900
     * @tc.name testTypedUArraysPropertyPart101_109
     * @tc.desc Verify BigUint64Array name is 'BigUint64Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n]);
      expect(arr.name).assertEqual('BigUint64Array');
    });

    // ============ length property tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11000
     * @tc.name testTypedUArraysPropertyPart101_110
     * @tc.desc Verify Uint8Array length reflects element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11100
     * @tc.name testTypedUArraysPropertyPart101_111
     * @tc.desc Verify Uint8Array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11200
     * @tc.name testTypedUArraysPropertyPart101_112
     * @tc.desc Verify Uint16Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11300
     * @tc.name testTypedUArraysPropertyPart101_113
     * @tc.desc Verify Uint32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11400
     * @tc.name testTypedUArraysPropertyPart101_114
     * @tc.desc Verify Uint8ClampedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11500
     * @tc.name testTypedUArraysPropertyPart101_115
     * @tc.desc Verify BigUint64Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(6);
      expect(arr.length).assertEqual(6);
    });

    // ============ byteLength property tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11600
     * @tc.name testTypedUArraysPropertyPart101_116
     * @tc.desc Verify Uint8Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11700
     * @tc.name testTypedUArraysPropertyPart101_117
     * @tc.desc Verify Uint16Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11800
     * @tc.name testTypedUArraysPropertyPart101_118
     * @tc.desc Verify Uint32Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      expect(arr.byteLength).assertEqual(8);
    });

    // ============ buffer property tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_11900
     * @tc.name testTypedUArraysPropertyPart101_119
     * @tc.desc Verify Uint8Array buffer is ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const buf = arr.buffer;
      expect(buf !== null).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTY_PART101_12000
     * @tc.name testTypedUArraysPropertyPart101_120
     * @tc.desc Verify byteOffset is 0 for default construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyPart101_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    // ============ Subscript access tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_PART101_12100
     * @tc.name testTypedUArraysSubscriptPart101_121
     * @tc.desc Verify Uint8Array subscript read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscriptPart101_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_PART101_12200
     * @tc.name testTypedUArraysSubscriptPart101_122
     * @tc.desc Verify Uint8Array subscript write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscriptPart101_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 255;
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_PART101_12300
     * @tc.name testTypedUArraysSubscriptPart101_123
     * @tc.desc Verify Uint16Array subscript read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscriptPart101_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 65535]);
      expect(arr[0]).assertEqual(100);
      arr[1] = 300;
      expect(arr[1]).assertEqual(300);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_PART101_12400
     * @tc.name testTypedUArraysSubscriptPart101_124
     * @tc.desc Verify Uint32Array subscript read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscriptPart101_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 4294967295]);
      expect(arr[0]).assertEqual(1000);
      arr[1] = 2000;
      expect(arr[1]).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_PART101_12500
     * @tc.name testTypedUArraysSubscriptPart101_125
     * @tc.desc Verify Uint8ClampedArray subscript with clamping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscriptPart101_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = -1;
      arr[1] = 256;
      arr[2] = 128;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_PART101_12600
     * @tc.name testTypedUArraysSubscriptPart101_126
     * @tc.desc Verify BigUint64Array subscript read/write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscriptPart101_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, BigInt('18446744073709551615')]);
      expect(arr[0]).assertEqual(1n);
      arr[1] = 42n;
      expect(arr[1]).assertEqual(42n);
    });

    // ============ set tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_12700
     * @tc.name testTypedUArraysSetPart101_127
     * @tc.desc Verify Uint8Array set from same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.set(new Uint8Array([1, 2, 3]), 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_12800
     * @tc.name testTypedUArraysSetPart101_128
     * @tc.desc Verify Uint8Array set with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      arr.set(new Uint8Array([10, 20]), 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_12900
     * @tc.name testTypedUArraysSetPart101_129
     * @tc.desc Verify Uint16Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.set(new Uint16Array([100, 200, 300]), 0);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART101_13000
     * @tc.name testTypedUArraysSetPart101_130
     * @tc.desc Verify BigUint64Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart101_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(2);
      arr.set(new BigUint64Array([42n, 99n]), 0);
      expect(arr[0]).assertEqual(42n);
      expect(arr[1]).assertEqual(99n);
    });

    // ============ fill tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_13100
     * @tc.name testTypedUArraysFillPart101_131
     * @tc.desc Verify Uint8Array fill all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.fill(42);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(42);
      expect(arr[2]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_13200
     * @tc.name testTypedUArraysFillPart101_132
     * @tc.desc Verify Uint8Array fill with start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(99, 1, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
      expect(arr[3]).assertEqual(99);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_13300
     * @tc.name testTypedUArraysFillPart101_133
     * @tc.desc Verify Uint16Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.fill(65535);
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_13400
     * @tc.name testTypedUArraysFillPart101_134
     * @tc.desc Verify BigUint64Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      arr.fill(0n);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
    });

    // ============ includes tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_PART101_13500
     * @tc.name testTypedUArraysIncludesPart101_135
     * @tc.desc Verify Uint8Array includes returns true for existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesPart101_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.includes(3)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_PART101_13600
     * @tc.name testTypedUArraysIncludesPart101_136
     * @tc.desc Verify Uint8Array includes returns false for missing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesPart101_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.includes(99)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_PART101_13700
     * @tc.name testTypedUArraysIncludesPart101_137
     * @tc.desc Verify BigUint64Array includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesPart101_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.includes(2n)).assertEqual(true);
    });

    // ============ indexOf tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF_PART101_13800
     * @tc.name testTypedUArraysIndexOfPart101_138
     * @tc.desc Verify Uint8Array indexOf finds element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfPart101_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20]);
      expect(arr.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF_PART101_13900
     * @tc.name testTypedUArraysIndexOfPart101_139
     * @tc.desc Verify Uint8Array indexOf returns -1 for missing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfPart101_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF_PART101_14000
     * @tc.name testTypedUArraysIndexOfPart101_140
     * @tc.desc Verify BigUint64Array indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfPart101_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 2n]);
      let result: int = arr.indexOf(2n);
      expect(result).assertEqual(1);
    });

    // ============ copyWithin tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_14100
     * @tc.name testTypedUArraysCopyWithinPart101_141
     * @tc.desc Verify Uint8Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_14200
     * @tc.name testTypedUArraysCopyWithinPart101_142
     * @tc.desc Verify Uint16Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    // ============ join tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_PART101_14300
     * @tc.name testTypedUArraysJoinPart101_143
     * @tc.desc Verify Uint8Array join with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinPart101_143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = expect(arr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_PART101_14400
     * @tc.name testTypedUArraysJoinPart101_144
     * @tc.desc Verify Uint8Array join with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinPart101_144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = expect(arr.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_PART101_14500
     * @tc.name testTypedUArraysJoinPart101_145
     * @tc.desc Verify Uint8Array join empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinPart101_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = expect(arr.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_PART101_14600
     * @tc.name testTypedUArraysJoinPart101_146
     * @tc.desc Verify BigUint64Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinPart101_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = expect(arr.join()).assertEqual('1,2,3');
    });

    // ============ toString tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING_PART101_14700
     * @tc.name testTypedUArraysToStringPart101_147
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToStringPart101_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING_PART101_14800
     * @tc.name testTypedUArraysToStringPart101_148
     * @tc.desc Verify Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToStringPart101_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = expect(arr.toString()).assertEqual('100,200,300');
    });

    // ============ valueOf tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF_PART101_14900
     * @tc.name testTypedUArraysValueOfPart101_149
     * @tc.desc Verify Uint8Array valueOf returns same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOfPart101_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const val = arr.valueOf();
      expect(val[0]).assertEqual(1);
      expect(val[1]).assertEqual(2);
      expect(val[2]).assertEqual(3);
    });

    // ============ of static method tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART101_15000
     * @tc.name testTypedUArraysOfPart101_150
     * @tc.desc Verify Uint8Array.of creates correct array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart101_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART101_15100
     * @tc.name testTypedUArraysOfPart101_151
     * @tc.desc Verify Uint8Array.of with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart101_151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART101_15200
     * @tc.name testTypedUArraysOfPart101_152
     * @tc.desc Verify BigUint64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart101_152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    // ============ from static method tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART101_15300
     * @tc.name testTypedUArraysFromPart101_153
     * @tc.desc Verify Uint8Array.from from same-type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart101_153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from(new Uint8Array([5, 6, 7]));
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(6);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART101_15400
     * @tc.name testTypedUArraysFromPart101_154
     * @tc.desc Verify Uint8Array.from from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart101_154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array([10, 20, 30]);
      const arr = Uint8Array.from(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    // ============ keys / values / entries tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_15500
     * @tc.name testTypedUArraysKeysPart101_155
     * @tc.desc Verify Uint8Array keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter !== null).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_15600
     * @tc.name testTypedUArraysValuesPart101_156
     * @tc.desc Verify Uint8Array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.values();
      expect(iter !== null).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ENTRIES_PART101_15700
     * @tc.name testTypedUArraysEntriesPart101_157
     * @tc.desc Verify Uint8Array entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEntriesPart101_157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      expect(iter !== null).assertEqual(true);
    });

    // ============ find tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART101_15800
     * @tc.name testTypedUArraysFindPart101_158
     * @tc.desc Verify Uint8Array find returns matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart101_158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8, 130, 44]);
      let result = arr.find((value: number): boolean => value.toInt() > 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART101_15900
     * @tc.name testTypedUArraysFindPart101_159
     * @tc.desc Verify Uint8Array find returns undefined for no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart101_159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8]);
      let result = arr.find((value: number): boolean => value.toInt() > 200);
      expect(result).assertEqual(undefined);
    });

    // ============ reduce tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_16000
     * @tc.name testTypedUArraysReducePart101_160
     * @tc.desc Verify Uint8Array reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result: int = arr.reduce((acc: number, val: number): number => acc.toInt() + val.toInt(), 0).toInt();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_16100
     * @tc.name testTypedUArraysReducePart101_161
     * @tc.desc Verify Uint16Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result: int = arr.reduce((acc: number, val: number): number => acc.toInt() + val.toInt(), 0).toInt();
      expect(result).assertEqual(60);
    });

    // ============ reduceRight tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_16200
     * @tc.name testTypedUArraysReduceRightPart101_162
     * @tc.desc Verify Uint8Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result: int = arr.reduceRight((acc: number, val: number): number => acc.toInt() + val.toInt(), 0).toInt();
      expect(result).assertEqual(10);
    });
  });
}
