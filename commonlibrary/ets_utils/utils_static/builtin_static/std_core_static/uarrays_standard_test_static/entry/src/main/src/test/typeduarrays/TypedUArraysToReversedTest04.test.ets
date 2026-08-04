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

function reverseBigUint64ArrayValue(source: BigUint64Array): BigUint64Array {
  const result = new BigUint64Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint32ArrayValue(source: Uint32Array): Uint32Array {
  const result = new Uint32Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint8ClampedArrayValue(source: Uint8ClampedArray): Uint8ClampedArray {
  const result = new Uint8ClampedArray(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}


export default function typedUArraysToReversedTest04(): void {
  describe('TypedUArraysToReversedTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_0100
     * @tc.name testTypedUArraysToReversedPart201_001
     * @tc.desc Verify toReversed typeof object Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5100
     * @tc.name testTypedUArraysToReversedPart201_051
     * @tc.desc Verify toReversed byteLength 5 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5200
     * @tc.name testTypedUArraysToReversedPart201_052
     * @tc.desc Verify toReversed byteLength 40 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5300
     * @tc.name testTypedUArraysToReversedPart201_053
     * @tc.desc Verify toReversed byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5400
     * @tc.name testTypedUArraysToReversedPart201_054
     * @tc.desc Verify toReversed byteLength Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5500
     * @tc.name testTypedUArraysToReversedPart201_055
     * @tc.desc Verify toReversed byteLength Uint16Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5600
     * @tc.name testTypedUArraysToReversedPart201_056
     * @tc.desc Verify toReversed byteLength Uint32Array 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5700
     * @tc.name testTypedUArraysToReversedPart201_057
     * @tc.desc Verify toReversed byteLength BigUint64Array 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5800
     * @tc.name testTypedUArraysToReversedPart201_058
     * @tc.desc Verify toReversed byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_5900
     * @tc.name testTypedUArraysToReversedPart201_059
     * @tc.desc Verify toReversed byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6000
     * @tc.name testTypedUArraysToReversedPart201_060
     * @tc.desc Verify toReversed byteOffset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6100
     * @tc.name testTypedUArraysToReversedPart201_061
     * @tc.desc Verify toReversed byteOffset 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6200
     * @tc.name testTypedUArraysToReversedPart201_062
     * @tc.desc Verify toReversed byteOffset 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6300
     * @tc.name testTypedUArraysToReversedPart201_063
     * @tc.desc Verify toReversed byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 8);
      const ret = reverseUint8ArrayValue(view);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6400
     * @tc.name testTypedUArraysToReversedPart201_064
     * @tc.desc Verify toReversed byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint16Array(buf, 8, 4);
      const ret = reverseUint16ArrayValue(view);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6500
     * @tc.name testTypedUArraysToReversedPart201_065
     * @tc.desc Verify toReversed byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const view = new Uint32Array(buf, 16, 8);
      const ret = reverseUint32ArrayValue(view);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6600
     * @tc.name testTypedUArraysToReversedPart201_066
     * @tc.desc Verify toReversed buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.buffer !== arr.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6700
     * @tc.name testTypedUArraysToReversedPart201_067
     * @tc.desc Verify toReversed buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ret.buffer !== arr.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6800
     * @tc.name testTypedUArraysToReversedPart201_068
     * @tc.desc Verify toReversed buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ret.buffer !== arr.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_6900
     * @tc.name testTypedUArraysToReversedPart201_069
     * @tc.desc Verify toReversed buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ret.buffer !== arr.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7000
     * @tc.name testTypedUArraysToReversedPart201_070
     * @tc.desc Verify toReversed buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ret.buffer !== arr.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7100
     * @tc.name testTypedUArraysToReversedPart201_071
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 8);
      const ret = reverseUint8ArrayValue(view);
      expect(ret.buffer !== view.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7200
     * @tc.name testTypedUArraysToReversedPart201_072
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint16Array(buf, 8, 4);
      const ret = reverseUint16ArrayValue(view);
      expect(ret.buffer !== view.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7300
     * @tc.name testTypedUArraysToReversedPart201_073
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const view = new Uint32Array(buf, 16, 8);
      const ret = reverseUint32ArrayValue(view);
      expect(ret.buffer !== view.buffer).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7400
     * @tc.name testTypedUArraysToReversedPart201_074
     * @tc.desc Verify toReversed isView true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7500
     * @tc.name testTypedUArraysToReversedPart201_075
     * @tc.desc Verify toReversed isView true Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7600
     * @tc.name testTypedUArraysToReversedPart201_076
     * @tc.desc Verify toReversed isView true Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7700
     * @tc.name testTypedUArraysToReversedPart201_077
     * @tc.desc Verify toReversed isView true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7800
     * @tc.name testTypedUArraysToReversedPart201_078
     * @tc.desc Verify toReversed isView true BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_7900
     * @tc.name testTypedUArraysToReversedPart201_079
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      const val46 = arr[0];
      expect(val46).assertEqual(1);
      const val47 = arr[1];
      expect(val47).assertEqual(2);
      const val48 = arr[2];
      expect(val48).assertEqual(3);
      const val49 = arr[3];
      expect(val49).assertEqual(4);
      const val50 = arr[4];
      expect(val50).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8000
     * @tc.name testTypedUArraysToReversedPart201_080
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      const val51 = arr[0];
      expect(val51).assertEqual(1);
      const val52 = arr[1];
      expect(val52).assertEqual(2);
      const val53 = arr[2];
      expect(val53).assertEqual(3);
      const val54 = arr[3];
      expect(val54).assertEqual(4);
      const val55 = arr[4];
      expect(val55).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8100
     * @tc.name testTypedUArraysToReversedPart201_081
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = reverseUint32ArrayValue(arr);
      const val56 = arr[0];
      expect(val56).assertEqual(1);
      const val57 = arr[1];
      expect(val57).assertEqual(2);
      const val58 = arr[2];
      expect(val58).assertEqual(3);
      const val59 = arr[3];
      expect(val59).assertEqual(4);
      const val60 = arr[4];
      expect(val60).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8200
     * @tc.name testTypedUArraysToReversedPart201_082
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = reverseUint8ClampedArrayValue(arr);
      const val61 = arr[0];
      expect(val61).assertEqual(1);
      const val62 = arr[1];
      expect(val62).assertEqual(2);
      const val63 = arr[2];
      expect(val63).assertEqual(3);
      const val64 = arr[3];
      expect(val64).assertEqual(4);
      const val65 = arr[4];
      expect(val65).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8300
     * @tc.name testTypedUArraysToReversedPart201_083
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      const val66 = arr[0];
      expect(val66).assertEqual(1n);
      const val67 = arr[1];
      expect(val67).assertEqual(2n);
      const val68 = arr[2];
      expect(val68).assertEqual(3n);
      const val69 = arr[3];
      expect(val69).assertEqual(4n);
      const val70 = arr[4];
      expect(val70).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8400
     * @tc.name testTypedUArraysToReversedPart201_084
     * @tc.desc Verify toReversed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8500
     * @tc.name testTypedUArraysToReversedPart201_085
     * @tc.desc Verify toReversed byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8600
     * @tc.name testTypedUArraysToReversedPart201_086
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      const ret = reverseUint8ArrayValue(arr);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8700
     * @tc.name testTypedUArraysToReversedPart201_087
     * @tc.desc Verify toReversed byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      const ret = reverseUint8ArrayValue(arr);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8800
     * @tc.name testTypedUArraysToReversedPart201_088
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(Uint8Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_8900
     * @tc.name testTypedUArraysToReversedPart201_089
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      const val71 = ret[0];
      expect(val71).assertEqual(5);
      const val72 = ret[4];
      expect(val72).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9000
     * @tc.name testTypedUArraysToReversedPart201_090
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = reverseUint16ArrayValue(arr);
      const val73 = ret[0];
      expect(val73).assertEqual(5);
      const val74 = ret[4];
      expect(val74).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9100
     * @tc.name testTypedUArraysToReversedPart201_091
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = reverseBigUint64ArrayValue(arr);
      const val75 = ret[0];
      expect(val75).assertEqual(5n);
      const val76 = ret[4];
      expect(val76).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9200
     * @tc.name testTypedUArraysToReversedPart201_092
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9300
     * @tc.name testTypedUArraysToReversedPart201_093
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = reverseUint8ArrayValue(arr);
      const val77 = ret[0];
      expect(val77).assertEqual(5);
      const val78 = ret[2];
      expect(val78).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9400
     * @tc.name testTypedUArraysToReversedPart201_094
     * @tc.desc Verify toReversed buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8Array(buf);
      const child = new Uint8Array(buf, 0, 4);
      const ret = reverseUint8ArrayValue(child);
      const val79 = parent[0];
      expect(val79).assertEqual(0);
      const val80 = parent[3];
      expect(val80).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9500
     * @tc.name testTypedUArraysToReversedPart201_095
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Uint8Array(buf);
      const child = new Uint8Array(buf, 0, 4);
      const ret = reverseUint8ArrayValue(parent);
      const val81 = child[0];
      expect(val81).assertEqual(0);
      const val82 = child[3];
      expect(val82).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9600
     * @tc.name testTypedUArraysToReversedPart201_096
     * @tc.desc Verify buffer toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Uint8Array(buf, 0, 4);
      v1[0] = 10;
      v1[1] = 20;
      v1[2] = 30;
      v1[3] = 40;
      const v2 = new Uint8Array(buf, 4, 4);
      const ret = reverseUint8ArrayValue(v1);
      const val83 = v1[0];
      expect(val83).assertEqual(10);
      const val84 = ret[0];
      expect(val84).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9700
     * @tc.name testTypedUArraysToReversedPart201_097
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 4);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      const ret = reverseUint8ArrayValue(view);
      const val85 = view[0];
      expect(val85).assertEqual(1);
      const val86 = view[3];
      expect(val86).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9800
     * @tc.name testTypedUArraysToReversedPart201_098
     * @tc.desc Verify buffer toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf, 0, 4);
      a[0] = 1;
      a[1] = 2;
      a[2] = 3;
      a[3] = 4;
      const b = new Uint8Array(buf, 0, 4);
      const ret = reverseUint8ArrayValue(a);
      const val87 = b[0];
      expect(val87).assertEqual(1);
      const val88 = ret[0];
      expect(val88).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART201_9900
     * @tc.name testTypedUArraysToReversedPart201_099
     * @tc.desc Verify Uint8Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart201_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 127, 255]);
      const ret = reverseUint8ArrayValue(arr);
      const val89 = ret[0];
      expect(val89).assertEqual(255);
      const val90 = ret[1];
      expect(val90).assertEqual(127);
      const val91 = ret[2];
      expect(val91).assertEqual(0);
    });

  });
}
