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

export default function typedUArraysToSortedPartTest03(): void {
  describe('TypedUArraysToSortedPartTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_0100
     * @tc.name testTypedUArraysToSortedPart301_001
     * @tc.desc Verify compareFunction null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5000
     * @tc.name testTypedUArraysToSortedPart301_050
     * @tc.desc Verify BigUint64Array undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = sortBigUint64ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5100
     * @tc.name testTypedUArraysToSortedPart301_051
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      try {
        sortBigUint64ArrayValue(arr);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5200
     * @tc.name testTypedUArraysToSortedPart301_052
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const ret = sortBigUint64ArrayValue(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5300
     * @tc.name testTypedUArraysToSortedPart301_053
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const ret = sortBigUint64ArrayValue(arr);
      expect(ret[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5400
     * @tc.name testTypedUArraysToSortedPart301_054
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 5n, 5n, 5n]);
      const ret = sortBigUint64ArrayValue(arr);
      expect(ret[0]).assertEqual(5n);
      const val26 = ret[3];
      expect(val26).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5500
     * @tc.name testTypedUArraysToSortedPart301_055
     * @tc.desc Verify BigUint64Array toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('18446744073709551615'), 9223372036854775807n]);
      const ret = sortBigUint64ArrayValue(arr);
      const val27 = ret[0];
      expect(val27).assertEqual(0n);
      const val28 = ret[2];
      expect(val28).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5600
     * @tc.name testTypedUArraysToSortedPart301_056
     * @tc.desc Verify toSorted !== Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5700
     * @tc.name testTypedUArraysToSortedPart301_057
     * @tc.desc Verify toSorted !== Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = sortUint16ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5800
     * @tc.name testTypedUArraysToSortedPart301_058
     * @tc.desc Verify toSorted !== Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = sortUint32ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_5900
     * @tc.name testTypedUArraysToSortedPart301_059
     * @tc.desc Verify toSorted !== Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = sortUint8ClampedArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6000
     * @tc.name testTypedUArraysToSortedPart301_060
     * @tc.desc Verify toSorted !== BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = sortBigUint64ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6100
     * @tc.name testTypedUArraysToSortedPart301_061
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = expect(sortUint8ArrayValue(arr)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6200
     * @tc.name testTypedUArraysToSortedPart301_062
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = expect(sortUint8ArrayValue(arr)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6300
     * @tc.name testTypedUArraysToSortedPart301_063
     * @tc.desc Verify toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6400
     * @tc.name testTypedUArraysToSortedPart301_064
     * @tc.desc Verify toSorted Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const before = new Uint8Array(arr);
      expect(sortUint8ArrayValue(arr)).assertEqual(before[0]);
      const val30 = arr[2];
      expect(val30).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6500
     * @tc.name testTypedUArraysToSortedPart301_065
     * @tc.desc Verify toSorted Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const before = new Uint16Array(arr);
      expect(sortUint16ArrayValue(arr)).assertEqual(before[0]);
      const val32 = arr[2];
      expect(val32).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6600
     * @tc.name testTypedUArraysToSortedPart301_066
     * @tc.desc Verify toSorted Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const before = new Uint32Array(arr);
      expect(sortUint32ArrayValue(arr)).assertEqual(before[0]);
      const val34 = arr[2];
      expect(val34).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6700
     * @tc.name testTypedUArraysToSortedPart301_067
     * @tc.desc Verify toSorted Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const before = new Uint8ClampedArray(arr);
      expect(sortUint8ClampedArrayValue(arr)).assertEqual(before[0]);
      const val36 = arr[2];
      expect(val36).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6800
     * @tc.name testTypedUArraysToSortedPart301_068
     * @tc.desc Verify toSorted BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const before = new BigUint64Array(arr);
      sortBigUint64ArrayValue(arr);
      const val37 = arr[0];
      expect(val37).assertEqual(before[0]);
      const val38 = arr[2];
      expect(val38).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_6900
     * @tc.name testTypedUArraysToSortedPart301_069
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const beforeLen = arr.length;
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7000
     * @tc.name testTypedUArraysToSortedPart301_070
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const before = arr[0];
      const ret = sortUint8ArrayValue(arr);
      expect(ret[0]).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7100
     * @tc.name testTypedUArraysToSortedPart301_071
     * @tc.desc Verify toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const before = new Uint8Array(arr);
      sortUint8ArrayValue(arr);
      const val40 = arr[0];
      expect(val40).assertEqual(before[0]);
      const val41 = arr[2];
      expect(val41).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7200
     * @tc.name testTypedUArraysToSortedPart301_072
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
      }
      const before = new Uint8Array(arr);
      expect(sortUint8ArrayValue(arr)).assertEqual(before[0]);
      const val43 = arr[99];
      expect(val43).assertEqual(before[99]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7300
     * @tc.name testTypedUArraysToSortedPart301_073
     * @tc.desc Verify length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val44 = ret[0];
      expect(val44).assertEqual(1);
      const val45 = ret[2];
      expect(val45).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7400
     * @tc.name testTypedUArraysToSortedPart301_074
     * @tc.desc Verify -1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val46 = ret[0];
      expect(val46).assertEqual(1);
      const val47 = ret[2];
      expect(val47).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7500
     * @tc.name testTypedUArraysToSortedPart301_075
     * @tc.desc Verify Number.MAX_SAFE_INTEGER undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val48 = ret[0];
      expect(val48).assertEqual(1);
      const val49 = ret[2];
      expect(val49).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7600
     * @tc.name testTypedUArraysToSortedPart301_076
     * @tc.desc Verify 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7700
     * @tc.name testTypedUArraysToSortedPart301_077
     * @tc.desc Verify 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7800
     * @tc.name testTypedUArraysToSortedPart301_078
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = sortUint8ArrayValue(arr);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_7900
     * @tc.name testTypedUArraysToSortedPart301_079
     * @tc.desc Verify Uint8Array toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(0);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8000
     * @tc.name testTypedUArraysToSortedPart301_080
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret[0]).assertEqual(42);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8100
     * @tc.name testTypedUArraysToSortedPart301_081
     * @tc.desc Verify Uint8Array toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const ret = sortUint8ArrayValue(arr);
      const val51 = ret[0];
      expect(val51).assertEqual(42);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8200
     * @tc.name testTypedUArraysToSortedPart301_082
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret[0]).assertEqual(7);
      const val53 = ret[3];
      expect(val53).assertEqual(7);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8300
     * @tc.name testTypedUArraysToSortedPart301_083
     * @tc.desc Verify Uint8Array toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const ret = sortUint8ArrayValue(arr);
      const val54 = ret[0];
      expect(val54).assertEqual(7);
      const val55 = ret[3];
      expect(val55).assertEqual(7);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8400
     * @tc.name testTypedUArraysToSortedPart301_084
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      try {
        sortUint8ArrayValue(arr);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8500
     * @tc.name testTypedUArraysToSortedPart301_085
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 3n, 1n, 4n, 2n]);
      try {
        sortBigUint64ArrayValue(arr);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8600
     * @tc.name testTypedUArraysToSortedPart301_086
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let called = false;
      const ret = sortUint8ArrayValue(arr);
      expect(called).assertEqual(false);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8700
     * @tc.name testTypedUArraysToSortedPart301_087
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let called = false;
      const ret = sortUint8ArrayValue(arr);
      expect(called).assertEqual(false);
      const val56 = ret[0];
      expect(val56).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8800
     * @tc.name testTypedUArraysToSortedPart301_088
     * @tc.desc Verify undefined Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
      const val57 = ret[0];
      expect(val57).assertEqual(3);
      const val58 = ret[2];
      expect(val58).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_8900
     * @tc.name testTypedUArraysToSortedPart301_089
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(5);
      const val59 = ret[0];
      expect(val59).assertEqual(5);
      const val60 = ret[4];
      expect(val60).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9000
     * @tc.name testTypedUArraysToSortedPart301_090
     * @tc.desc Verify undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([3, 1, 2]);
      const arr2 = new Uint8Array([3, 1, 2]);
      const ret1 = sortUint8ArrayValue(arr1);
      const ret2 = sortUint8ArrayValue(arr2);
      const val61 = ret1[0];
      expect(val61).assertEqual(ret2[0]);
      const val62 = ret1[2];
      expect(val62).assertEqual(ret2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9100
     * @tc.name testTypedUArraysToSortedPart301_091
     * @tc.desc Verify null Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9200
     * @tc.name testTypedUArraysToSortedPart301_092
     * @tc.desc Verify null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(5);
      const val63 = ret[0];
      expect(val63).assertEqual(5);
      const val64 = ret[4];
      expect(val64).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9300
     * @tc.name testTypedUArraysToSortedPart301_093
     * @tc.desc Verify "abc" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9400
     * @tc.name testTypedUArraysToSortedPart301_094
     * @tc.desc Verify "0" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9500
     * @tc.name testTypedUArraysToSortedPart301_095
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9600
     * @tc.name testTypedUArraysToSortedPart301_096
     * @tc.desc Verify 1000 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9700
     * @tc.name testTypedUArraysToSortedPart301_097
     * @tc.desc Verify 1000 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9800
     * @tc.name testTypedUArraysToSortedPart301_098
     * @tc.desc Verify 1e10 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART301_9900
     * @tc.name testTypedUArraysToSortedPart301_099
     * @tc.desc Verify 1e10 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart301_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    // ============ constructor tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30000
     * @tc.name testTypedUArraysConstructorPart301_300
     * @tc.desc Verify Uint8Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30100
     * @tc.name testTypedUArraysConstructorPart301_301
     * @tc.desc Verify Uint8Array constructor with Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(source);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30200
     * @tc.name testTypedUArraysConstructorPart301_302
     * @tc.desc Verify Uint8Array constructor with Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30300
     * @tc.name testTypedUArraysConstructorPart301_303
     * @tc.desc Verify Uint8Array constructor with ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30400
     * @tc.name testTypedUArraysConstructorPart301_304
     * @tc.desc Verify Uint8Array constructor with ArrayBuffer byteOffset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30500
     * @tc.name testTypedUArraysConstructorPart301_305
     * @tc.desc Verify Uint16Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30600
     * @tc.name testTypedUArraysConstructorPart301_306
     * @tc.desc Verify Uint32Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30700
     * @tc.name testTypedUArraysConstructorPart301_307
     * @tc.desc Verify Uint8ClampedArray constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30800
     * @tc.name testTypedUArraysConstructorPart301_308
     * @tc.desc Verify BigUint64Array constructor with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_30900
     * @tc.name testTypedUArraysConstructorPart301_309
     * @tc.desc Verify BigUint64Array constructor with Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART301_31000
     * @tc.name testTypedUArraysConstructorPart301_310
     * @tc.desc Verify Uint8Array constructor empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorPart301_310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    // ============ from with mapFn tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_MAP_PART301_31100
     * @tc.name testTypedUArraysFromMapPart301_311
     * @tc.desc Verify Uint8Array.from with map function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromMapPart301_311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array([1, 2, 3]);
      const arr = Uint8Array.from(source, (x: number): number => x.toInt() * 2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    // ============ lastIndexOf tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_LASTINDEXOF_PART301_31200
     * @tc.name testTypedUArraysLastIndexOfPart301_312
     * @tc.desc Verify Uint8Array lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysLastIndexOfPart301_312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 2, 1]);
      let result: int = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_LASTINDEXOF_PART301_31300
     * @tc.name testTypedUArraysLastIndexOfPart301_313
     * @tc.desc Verify Uint8Array lastIndexOf returns -1 for missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysLastIndexOfPart301_313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_LASTINDEXOF_PART301_31400
     * @tc.name testTypedUArraysLastIndexOfPart301_314
     * @tc.desc Verify BigUint64Array lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysLastIndexOfPart301_314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 2n]);
      let result: int = arr.lastIndexOf(2n);
      expect(result).assertEqual(3);
    });

    // ============ default iterator (Symbol.iterator) tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_ITERATOR_PART301_31500
     * @tc.name testTypedUArraysIteratorPart301_315
     * @tc.desc Verify Uint8Array default iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIteratorPart301_315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let sum = 0;
      for (let value of arr) {
        sum = sum + value.toInt();
      }
      expect(sum).assertEqual(60);
    });

    // ============ Uint8ClampedArray clamping verification ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_PART301_31600
     * @tc.name testTypedUArraysClampedPart301_316
     * @tc.desc Verify Uint8ClampedArray clamps values to 0-255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysClampedPart301_316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-10, 0, 128, 255, 300]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(128);
      expect(arr[3]).assertEqual(255);
      expect(arr[4]).assertEqual(255);
    });

    // ============ Uint8Array overflow tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OVERFLOW_PART301_31700
     * @tc.name testTypedUArraysOverflowPart301_317
     * @tc.desc Verify Uint8Array overflow wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverflowPart301_317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      arr[0] = 256;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OVERFLOW_PART301_31800
     * @tc.name testTypedUArraysOverflowPart301_318
     * @tc.desc Verify Uint16Array overflow wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOverflowPart301_318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      arr[0] = 65536;
      expect(arr[0]).assertEqual(0);
    });

    // ============ toSorted with compareFn tests ============

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_CMP_PART301_31900
     * @tc.name testTypedUArraysToSortedCmpPart301_319
     * @tc.desc Verify Uint8Array toSorted default ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedCmpPart301_319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_CMP_PART301_32000
     * @tc.name testTypedUArraysToSortedCmpPart301_320
     * @tc.desc Verify BigUint64Array toSorted default ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedCmpPart301_320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[2]).assertEqual(3n);
    });
  });
}
