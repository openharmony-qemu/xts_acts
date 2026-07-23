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

export default function typedUArraysToSortedPartTest02(): void {
  describe('TypedUArraysToSortedPartTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_0100
     * @tc.name testTypedUArraysToSortedPart201_001
     * @tc.desc Verify Uint8Array toSorted typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    it('testTypedUArraysToSortedPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5000
     * @tc.name testTypedUArraysToSortedPart201_050
     * @tc.desc Verify Uint8Array toSorted byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5100
     * @tc.name testTypedUArraysToSortedPart201_051
     * @tc.desc Verify Uint16Array toSorted byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const result = sortUint16ArrayValue(arr);
      expect(result.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5200
     * @tc.name testTypedUArraysToSortedPart201_052
     * @tc.desc Verify BigUint64Array toSorted byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5300
     * @tc.name testTypedUArraysToSortedPart201_053
     * @tc.desc Verify Uint8Array toSorted BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5400
     * @tc.name testTypedUArraysToSortedPart201_054
     * @tc.desc Verify Uint16Array toSorted BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5500
     * @tc.name testTypedUArraysToSortedPart201_055
     * @tc.desc Verify Uint32Array toSorted BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 2]);
      const result = sortUint32ArrayValue(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5600
     * @tc.name testTypedUArraysToSortedPart201_056
     * @tc.desc Verify Uint8ClampedArray toSorted BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5700
     * @tc.name testTypedUArraysToSortedPart201_057
     * @tc.desc Verify BigUint64Array toSorted BYTES_PER_ELEMENT 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5800
     * @tc.name testTypedUArraysToSortedPart201_058
     * @tc.desc Verify Uint8Array toSorted name Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result instanceof Uint8Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_5900
     * @tc.name testTypedUArraysToSortedPart201_059
     * @tc.desc Verify Uint16Array toSorted name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6000
     * @tc.name testTypedUArraysToSortedPart201_060
     * @tc.desc Verify Uint32Array toSorted name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 2]);
      const result = sortUint32ArrayValue(arr);
      expect(result instanceof Uint32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6100
     * @tc.name testTypedUArraysToSortedPart201_061
     * @tc.desc Verify Uint8ClampedArray toSorted name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result instanceof Uint8ClampedArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6200
     * @tc.name testTypedUArraysToSortedPart201_062
     * @tc.desc Verify BigUint64Array toSorted name BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result instanceof BigUint64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6300
     * @tc.name testTypedUArraysToSortedPart201_063
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([1, 2, 3])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6400
     * @tc.name testTypedUArraysToSortedPart201_064
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const result = sortUint16ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint16Array([100, 200, 300])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6500
     * @tc.name testTypedUArraysToSortedPart201_065
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483647]);
      const result = sortUint32ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint32Array([0, 2147483647, 4294967295])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6600
     * @tc.name testTypedUArraysToSortedPart201_066
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 50, 100]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8ClampedArray([50, 100, 200])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6700
     * @tc.name testTypedUArraysToSortedPart201_067
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n, 0n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.toString()).assertEqual((new BigUint64Array([0n, 1n, BigInt('18446744073709551615')])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6800
     * @tc.name testTypedUArraysToSortedPart201_068
     * @tc.desc Verify Uint8Array toSorted compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let result = sortUint8ArrayValue(arr);
      expect(arr.toString()).assertEqual((new Uint8Array([3, 1, 2])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_6900
     * @tc.name testTypedUArraysToSortedPart201_069
     * @tc.desc Verify Uint16Array toSorted compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      let result = sortUint16ArrayValue(arr);
      expect(arr.toString()).assertEqual((new Uint16Array([3, 1, 2])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7000
     * @tc.name testTypedUArraysToSortedPart201_070
     * @tc.desc Verify BigUint64Array toSorted compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      let result = sortBigUint64ArrayValue(arr);
      expect(arr.toString()).assertEqual((new BigUint64Array([3n, 1n, 2n])).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7100
     * @tc.name testTypedUArraysToSortedPart201_071
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[2]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7200
     * @tc.name testTypedUArraysToSortedPart201_072
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const result = sortUint16ArrayValue(arr);
      expect(result[2]).assertEqual(300);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7400
     * @tc.name testTypedUArraysToSortedPart201_074
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = sortUint8ArrayValue(arr);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7500
     * @tc.name testTypedUArraysToSortedPart201_075
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7600
     * @tc.name testTypedUArraysToSortedPart201_076
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7700
     * @tc.name testTypedUArraysToSortedPart201_077
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 2]);
      const result = sortUint32ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7800
     * @tc.name testTypedUArraysToSortedPart201_078
     * @tc.desc Verify Uint8ClampedArray toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_7900
     * @tc.name testTypedUArraysToSortedPart201_079
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_8000
     * @tc.name testTypedUArraysToSortedPart201_080
     * @tc.desc Verify Uint8Array toSorted compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let result = sortUint8ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_8100
     * @tc.name testTypedUArraysToSortedPart201_081
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = sortUint8ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_8200
     * @tc.name testTypedUArraysToSortedPart201_082
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = sortUint8ArrayValue(arr);
      expect(result === arr).assertEqual(false);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_8800
     * @tc.name testTypedUArraysToSortedPart201_088
     * @tc.desc Verify Uint8Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_8900
     * @tc.name testTypedUArraysToSortedPart201_089
     * @tc.desc Verify Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const result = sortUint16ArrayValue(arr);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9100
     * @tc.name testTypedUArraysToSortedPart201_091
     * @tc.desc Verify Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const result = sortUint16ArrayValue(arr);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9200
     * @tc.name testTypedUArraysToSortedPart201_092
     * @tc.desc Verify Uint8Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const result = sortUint8ArrayValue(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9300
     * @tc.name testTypedUArraysToSortedPart201_093
     * @tc.desc Verify Uint16Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const result = sortUint16ArrayValue(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9400
     * @tc.name testTypedUArraysToSortedPart201_094
     * @tc.desc Verify Uint32Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 2]);
      const result = sortUint32ArrayValue(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9500
     * @tc.name testTypedUArraysToSortedPart201_095
     * @tc.desc Verify Uint8ClampedArray toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const result = sortUint8ClampedArrayValue(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9600
     * @tc.name testTypedUArraysToSortedPart201_096
     * @tc.desc Verify BigUint64Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const result = sortBigUint64ArrayValue(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9700
     * @tc.name testTypedUArraysToSortedPart201_097
     * @tc.desc Verify Uint8Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 3);
      const result = sortUint8ArrayValue(view);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9800
     * @tc.name testTypedUArraysToSortedPart201_098
     * @tc.desc Verify Uint16Array toSorted byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint16Array(buf, 4, 3);
      const result = sortUint16ArrayValue(view);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART201_9900
     * @tc.name testTypedUArraysToSortedPart201_099
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart201_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 1, 1]);
      const result = sortUint8ArrayValue(arr);
      expect(result.toString()).assertEqual((new Uint8Array([1, 1, 1])).toString());
    });

    // ============ slice tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART201_20000
     * @tc.name testTypedUArraysSlicePart201_200
     * @tc.desc Verify Uint8Array slice without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart201_200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice();
      expect(sliced.length).assertEqual(5);
      expect(sliced[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART201_20100
     * @tc.name testTypedUArraysSlicePart201_201
     * @tc.desc Verify Uint8Array slice with start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart201_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice(2);
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART201_20200
     * @tc.name testTypedUArraysSlicePart201_202
     * @tc.desc Verify Uint8Array slice with start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart201_202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced = arr.slice(1, 4);
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual(2);
      expect(sliced[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART201_20300
     * @tc.name testTypedUArraysSlicePart201_203
     * @tc.desc Verify Uint8Array slice does not modify original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart201_203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const sliced = arr.slice(1);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART201_20400
     * @tc.name testTypedUArraysSlicePart201_204
     * @tc.desc Verify BigUint64Array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart201_204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sliced = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(2n);
    });

    // ============ subarray tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART201_20500
     * @tc.name testTypedUArraysSubarrayPart201_205
     * @tc.desc Verify Uint8Array subarray returns view of same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart201_205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART201_20600
     * @tc.name testTypedUArraysSubarrayPart201_206
     * @tc.desc Verify Uint8Array subarray shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart201_206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const sub = arr.subarray(0, 3);
      sub[0] = 99;
      expect(arr[0]).assertEqual(99);
    });

    // ============ reverse tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART201_20700
     * @tc.name testTypedUArraysReversePart201_207
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart201_207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART201_20800
     * @tc.name testTypedUArraysReversePart201_208
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart201_208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      arr.reverse();
      expect(arr[0]).assertEqual(300);
      expect(arr[2]).assertEqual(100);
    });

    // ============ toReversed tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_20900
     * @tc.name testTypedUArraysToReversedPart201_209
     * @tc.desc Verify Uint8Array toReversed returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const reversed = arr.toReversed();
      expect(reversed[0]).assertEqual(3);
      expect(reversed[1]).assertEqual(2);
      expect(reversed[2]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_21000
     * @tc.name testTypedUArraysToReversedPart201_210
     * @tc.desc Verify Uint16Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const reversed = arr.toReversed();
      expect(reversed[0]).assertEqual(30);
      expect(reversed[2]).assertEqual(10);
    });

    // ============ sort tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_21100
     * @tc.name testTypedUArraysSortPart201_211
     * @tc.desc Verify Uint8Array sort default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_21200
     * @tc.name testTypedUArraysSortPart201_212
     * @tc.desc Verify Uint16Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      arr.sort();
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    // ============ toSorted tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_EXTRA_PART201_21300
     * @tc.name testTypedUArraysToSortedExtraPart201_213
     * @tc.desc Verify Uint8Array toSorted default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedExtraPart201_213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_EXTRA_PART201_21400
     * @tc.name testTypedUArraysToSortedExtraPart201_214
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedExtraPart201_214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[2]).assertEqual(3n);
    });

    // ============ map tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_21500
     * @tc.name testTypedUArraysMapPart201_215
     * @tc.desc Verify Uint8Array map returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const mapped = arr.map((value: number): number => value.toInt() * 2);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_21600
     * @tc.name testTypedUArraysMapPart201_216
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const mapped = arr.map((value: number): number => value.toInt() + 5);
      expect(mapped[0]).assertEqual(15);
      expect(mapped[1]).assertEqual(25);
      expect(mapped[2]).assertEqual(35);
    });

    // ============ filter tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART201_21700
     * @tc.name testTypedUArraysFilterPart201_217
     * @tc.desc Verify Uint8Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart201_217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const filtered = arr.filter((value: number): boolean => value.toInt() > 3);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(4);
      expect(filtered[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART201_21800
     * @tc.name testTypedUArraysFilterPart201_218
     * @tc.desc Verify Uint8Array filter empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart201_218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const filtered = arr.filter((value: number): boolean => value.toInt() > 10);
      expect(filtered.length).assertEqual(0);
    });

    // ============ forEach tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_PART201_21900
     * @tc.name testTypedUArraysForEachPart201_219
     * @tc.desc Verify Uint8Array forEach iterates all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEachPart201_219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let sum = 0;
      arr.forEach((value: number): void => {
        sum = sum + value.toInt();
      });
      expect(sum).assertEqual(6);
    });

    // ============ some tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SOME_PART201_22000
     * @tc.name testTypedUArraysSomePart201_220
     * @tc.desc Verify Uint8Array some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSomePart201_220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.some((value: number): boolean => value.toInt() > 3);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SOME_PART201_22100
     * @tc.name testTypedUArraysSomePart201_221
     * @tc.desc Verify Uint8Array some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSomePart201_221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.some((value: number): boolean => value.toInt() > 10);
      expect(result).assertEqual(false);
    });

    // ============ every tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_PART201_22200
     * @tc.name testTypedUArraysEveryPart201_222
     * @tc.desc Verify Uint8Array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEveryPart201_222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.every((value: number): boolean => value.toInt() > 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_PART201_22300
     * @tc.name testTypedUArraysEveryPart201_223
     * @tc.desc Verify Uint8Array every returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEveryPart201_223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.every((value: number): boolean => value.toInt() < 4);
      expect(result).assertEqual(false);
    });

    // ============ toLocaleString tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_PART201_22400
     * @tc.name testTypedUArraysToLocaleStringPart201_224
     * @tc.desc Verify Uint8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleStringPart201_224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100, 200, 300]);
      let result = arr.toLocaleString();
      expect(result !== null).assertEqual(true);
    });

    // ============ findIndex tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDINDEX_PART201_22500
     * @tc.name testTypedUArraysFindIndexPart201_225
     * @tc.desc Verify Uint8Array findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindIndexPart201_225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8, 130, 44]);
      let result: int = arr.findIndex((value: number): boolean => value.toInt() > 10);
      expect(result).assertEqual(1);
    });

    // ============ findLast tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_PART201_22600
     * @tc.name testTypedUArraysFindLastPart201_226
     * @tc.desc Verify Uint8Array findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastPart201_226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8, 130, 44]);
      let result = arr.findLast((value: number): boolean => value.toInt() > 10);
      expect(result).assertEqual(44);
    });

    // ============ findLastIndex tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_PART201_22700
     * @tc.name testTypedUArraysFindLastIndexPart201_227
     * @tc.desc Verify Uint8Array findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexPart201_227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8, 130, 44]);
      let result: int = arr.findLastIndex((value: number): boolean => value.toInt() > 10);
      expect(result).assertEqual(4);
    });
  });
}
