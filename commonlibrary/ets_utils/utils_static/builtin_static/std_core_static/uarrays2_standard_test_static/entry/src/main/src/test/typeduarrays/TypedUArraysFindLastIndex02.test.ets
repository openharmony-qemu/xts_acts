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

// AUTO_FINDLAST_HELPERS_START

function findLastIndexBigUint64ArrayValue(source: BigUint64Array, predicate: (value: bigint, index: number, array: BigUint64Array) => boolean): number {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: bigint = source[i.toInt()];
    if (predicate(value, i, source)) {
      return i;
    }
  }
  return -1;
}

function findLastIndexUint8ClampedArrayValue(source: Uint8ClampedArray, predicate: (value: number, index: number, array: Uint8ClampedArray) => boolean): number {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return i;
    }
  }
  return -1;
}

// AUTO_FINDLAST_HELPERS_END

// AUTO_TYPED_ARRAY_HELPERS_START
function findLastIndexUint16ArrayValue(source: Uint16Array, predicate: (value: number, index: number, array: Uint16Array) => boolean): number {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return i;
    }
  }
  return -1;
}

function findLastIndexUint32ArrayValue(source: Uint32Array, predicate: (value: number, index: number, array: Uint32Array) => boolean): number {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return i;
    }
  }
  return -1;
}

function findLastIndexUint8ArrayValue(source: Uint8Array, predicate: (value: number, index: number, array: Uint8Array) => boolean): number {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return i;
    }
  }
  return -1;
}

// AUTO_TYPED_ARRAY_HELPERS_END

export default function typedUArraysFindLastIndex02(): void {
  describe('TypedUArraysFindLastIndex02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0100
     * @tc.name testTypedUArraysFindLastIndex001
     * @tc.desc Verify 0 findLastIndex Uint8ClampedArray TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5100
     * @tc.name testTypedUArraysFindLastIndex051
     * @tc.desc Verify findLastIndex -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5200
     * @tc.name testTypedUArraysFindLastIndex052
     * @tc.desc Verify findLastIndex -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 0n);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5300
     * @tc.name testTypedUArraysFindLastIndex053
     * @tc.desc Verify len-1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 99]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5400
     * @tc.name testTypedUArraysFindLastIndex054
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99, 1, 2]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 99);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5500
     * @tc.name testTypedUArraysFindLastIndex055
     * @tc.desc Verify 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5600
     * @tc.name testTypedUArraysFindLastIndex056
     * @tc.desc Verify -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 43);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5700
     * @tc.name testTypedUArraysFindLastIndex057
     * @tc.desc Verify Uint8ClampedArray 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      let zeroIdx = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 0);
      let maxIdx = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 255);
      expect(zeroIdx).assertEqual(0);
      expect(maxIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5800
     * @tc.name testTypedUArraysFindLastIndex058
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')])
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === BigInt('18446744073709551615'))
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5900
     * @tc.name testTypedUArraysFindLastIndex059
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6000
     * @tc.name testTypedUArraysFindLastIndex060
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483648, 4294967295]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 4294967295);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6100
     * @tc.name testTypedUArraysFindLastIndex061
     * @tc.desc Verify predicate this thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const threshold = 2;
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6200
     * @tc.name testTypedUArraysFindLastIndex062
     * @tc.desc Verify predicate findLastIndex Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6300
     * @tc.name testTypedUArraysFindLastIndex063
     * @tc.desc Verify predicate true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (_v: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6400
     * @tc.name testTypedUArraysFindLastIndex064
     * @tc.desc Verify predicate Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const visited: number[] = [];
      findLastIndexUint8ArrayValue(arr, (v: number, i: number, _array: Uint8Array): boolean => {
        visited.push(i);
        return v === 1;
      });
      expect(visited.join(',')).assertEqual('4,3,2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6500
     * @tc.name testTypedUArraysFindLastIndex065
     * @tc.desc Verify predicate BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const visited: number[] = [];
      findLastIndexBigUint64ArrayValue(arr, (v: bigint, i: number, _array: BigUint64Array): boolean => {
        visited.push(i);
        return v === 10n;
      });
      expect(visited.join(',')).assertEqual('2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6600
     * @tc.name testTypedUArraysFindLastIndex066
     * @tc.desc Verify predicate truthy 2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (_v: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6700
     * @tc.name testTypedUArraysFindLastIndex067
     * @tc.desc Verify predicate 0 falsy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let count = 0;
      findLastIndexUint8ArrayValue(arr, (_v: number, i: number, _array: Uint8Array): boolean => {
        if (i >= 0) {
          count++;
        }
        return false;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6800
     * @tc.name testTypedUArraysFindLastIndex068
     * @tc.desc Verify predicate falsy Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let count = 0;
      findLastIndexUint16ArrayValue(arr, (_v: number, i: number, _array: Uint16Array): boolean => {
        if (i >= 0) {
          count++;
        }
        return false;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6900
     * @tc.name testTypedUArraysFindLastIndex069
     * @tc.desc Verify predicate Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7000
     * @tc.name testTypedUArraysFindLastIndex070
     * @tc.desc Verify predicate array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, i: number, a: BigUint64Array) => {
        if (i === 2) a[0] = 99n;
        return v === 99n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7100
     * @tc.name testTypedUArraysFindLastIndex071
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const threshold = 25;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > threshold);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7200
     * @tc.name testTypedUArraysFindLastIndex072
     * @tc.desc Verify BigUint64Array predicate BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n, 400n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 250n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7300
     * @tc.name testTypedUArraysFindLastIndex073
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7400
     * @tc.name testTypedUArraysFindLastIndex074
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v < 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7500
     * @tc.name testTypedUArraysFindLastIndex075
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7600
     * @tc.name testTypedUArraysFindLastIndex076
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 30n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7700
     * @tc.name testTypedUArraysFindLastIndex077
     * @tc.desc Verify Uint8ClampedArray predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 42;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7800
     * @tc.name testTypedUArraysFindLastIndex078
     * @tc.desc Verify Uint8ClampedArray 0 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_7900
     * @tc.name testTypedUArraysFindLastIndex079
     * @tc.desc Verify Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 255);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8000
     * @tc.name testTypedUArraysFindLastIndex080
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 32768, 65535]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8100
     * @tc.name testTypedUArraysFindLastIndex081
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 2147483648, 4294967295]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 4294967295);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8300
     * @tc.name testTypedUArraysFindLastIndex083
     * @tc.desc Verify Uint8Array of findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 35);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8400
     * @tc.name testTypedUArraysFindLastIndex084
     * @tc.desc Verify Uint32Array slice findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      const sliced = arr.slice(1, 3);
      let result = findLastIndexUint32ArrayValue(sliced, (v: number, _index: number, _array: Uint32Array): boolean => v === 300);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8500
     * @tc.name testTypedUArraysFindLastIndex085
     * @tc.desc Verify BigUint64Array subarray findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const sub = arr.subarray(1, 4);
      let result = findLastIndexBigUint64ArrayValue(sub, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 40n);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8600
     * @tc.name testTypedUArraysFindLastIndex086
     * @tc.desc Verify findLastIndex Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let r1 = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 4);
      let r2 = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 4);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8700
     * @tc.name testTypedUArraysFindLastIndex087
     * @tc.desc Verify predicate index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, i: number, _array: Uint8Array): boolean => v >= 0 && i === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8800
     * @tc.name testTypedUArraysFindLastIndex088
     * @tc.desc Verify predicate array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, i: number, a: Uint16Array): boolean => v === 3 && i >= 0 && a.length >= 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8900
     * @tc.name testTypedUArraysFindLastIndex089
     * @tc.desc Verify predicate value index Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 15, 25, 35, 45]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, i: number, _array: Uint32Array): boolean => v === 35 && i >= 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9000
     * @tc.name testTypedUArraysFindLastIndex090
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9100
     * @tc.name testTypedUArraysFindLastIndex091
     * @tc.desc Verify -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9200
     * @tc.name testTypedUArraysFindLastIndex092
     * @tc.desc Verify predicate boolean truthy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9300
     * @tc.name testTypedUArraysFindLastIndex093
     * @tc.desc Verify BigUint64Array predicate BigInt Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 100n);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9400
     * @tc.name testTypedUArraysFindLastIndex094
     * @tc.desc Verify BigUint64Array predicate typeof BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let allBigInt = true;
      findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => {
        if (typeof v !== 'bigint') allBigInt = false;
        return false;
      });
      expect(allBigInt).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9500
     * @tc.name testTypedUArraysFindLastIndex095
     * @tc.desc Verify Uint8Array from findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30, 40]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 35);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9600
     * @tc.name testTypedUArraysFindLastIndex096
     * @tc.desc Verify predicate findLastIndex Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_9700
     * @tc.name testTypedUArraysFindLastIndex097
     * @tc.desc Verify predicate findLastIndex Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, i: number, a: Uint8ClampedArray) => {
        if (i === 2) a[1] = 99;
        return v === 99;
      });
      expect(result).assertEqual(1);
    });

  });
}
