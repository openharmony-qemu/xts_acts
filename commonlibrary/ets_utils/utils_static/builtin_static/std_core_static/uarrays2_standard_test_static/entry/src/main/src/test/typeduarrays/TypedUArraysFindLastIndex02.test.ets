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
     * @tc.name testTypedUArraysFindLastIndexFileB001
     * @tc.desc Verify 0 findLastIndex Uint8ClampedArray TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0200
     * @tc.name testTypedUArraysFindLastIndexFileB002
     * @tc.desc Verify findLastIndex -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0300
     * @tc.name testTypedUArraysFindLastIndexFileB003
     * @tc.desc Verify findLastIndex -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 0n);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0400
     * @tc.name testTypedUArraysFindLastIndexFileB004
     * @tc.desc Verify len-1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 99]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0500
     * @tc.name testTypedUArraysFindLastIndexFileB005
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99, 1, 2]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 99);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0600
     * @tc.name testTypedUArraysFindLastIndexFileB006
     * @tc.desc Verify 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0700
     * @tc.name testTypedUArraysFindLastIndexFileB007
     * @tc.desc Verify -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 43);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0800
     * @tc.name testTypedUArraysFindLastIndexFileB008
     * @tc.desc Verify Uint8ClampedArray 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      let zeroIdx = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 0);
      let maxIdx = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 255);
      expect(zeroIdx).assertEqual(0);
      expect(maxIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0900
     * @tc.name testTypedUArraysFindLastIndexFileB009
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')])
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === BigInt('18446744073709551615'))
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1000
     * @tc.name testTypedUArraysFindLastIndexFileB010
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1100
     * @tc.name testTypedUArraysFindLastIndexFileB011
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483648, 4294967295]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 4294967295);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1200
     * @tc.name testTypedUArraysFindLastIndexFileB012
     * @tc.desc Verify predicate this thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const threshold = 2;
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1300
     * @tc.name testTypedUArraysFindLastIndexFileB013
     * @tc.desc Verify predicate findLastIndex Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1400
     * @tc.name testTypedUArraysFindLastIndexFileB014
     * @tc.desc Verify predicate true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (_v: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1500
     * @tc.name testTypedUArraysFindLastIndexFileB015
     * @tc.desc Verify predicate Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const visited: number[] = [];
      findLastIndexUint8ArrayValue(arr, (v: number, i: number, _array: Uint8Array): boolean => {
        visited.push(i);
        return v === 1;
      });
      expect(visited.join(',')).assertEqual('4,3,2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1600
     * @tc.name testTypedUArraysFindLastIndexFileB016
     * @tc.desc Verify predicate BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const visited: number[] = [];
      findLastIndexBigUint64ArrayValue(arr, (v: bigint, i: number, _array: BigUint64Array): boolean => {
        visited.push(i);
        return v === 10n;
      });
      expect(visited.join(',')).assertEqual('2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1700
     * @tc.name testTypedUArraysFindLastIndexFileB017
     * @tc.desc Verify predicate truthy 2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (_v: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1800
     * @tc.name testTypedUArraysFindLastIndexFileB018
     * @tc.desc Verify predicate 0 falsy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1900
     * @tc.name testTypedUArraysFindLastIndexFileB019
     * @tc.desc Verify predicate falsy Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2000
     * @tc.name testTypedUArraysFindLastIndexFileB020
     * @tc.desc Verify predicate Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2100
     * @tc.name testTypedUArraysFindLastIndexFileB021
     * @tc.desc Verify predicate array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, i: number, a: BigUint64Array) => {
        if (i === 2) a[0] = 99n;
        return v === 99n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2200
     * @tc.name testTypedUArraysFindLastIndexFileB022
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const threshold = 25;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > threshold);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2300
     * @tc.name testTypedUArraysFindLastIndexFileB023
     * @tc.desc Verify BigUint64Array predicate BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n, 400n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 250n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2400
     * @tc.name testTypedUArraysFindLastIndexFileB024
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2500
     * @tc.name testTypedUArraysFindLastIndexFileB025
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v < 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2600
     * @tc.name testTypedUArraysFindLastIndexFileB026
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2700
     * @tc.name testTypedUArraysFindLastIndexFileB027
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 30n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2800
     * @tc.name testTypedUArraysFindLastIndexFileB028
     * @tc.desc Verify Uint8ClampedArray predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 42;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2900
     * @tc.name testTypedUArraysFindLastIndexFileB029
     * @tc.desc Verify Uint8ClampedArray 0 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3000
     * @tc.name testTypedUArraysFindLastIndexFileB030
     * @tc.desc Verify Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 255);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3100
     * @tc.name testTypedUArraysFindLastIndexFileB031
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 32768, 65535]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3200
     * @tc.name testTypedUArraysFindLastIndexFileB032
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 2147483648, 4294967295]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 4294967295);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_8200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3300
     * @tc.name testTypedUArraysFindLastIndexFileB033
     * @tc.desc Verify Uint8Array of findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 35);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3400
     * @tc.name testTypedUArraysFindLastIndexFileB034
     * @tc.desc Verify Uint32Array slice findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      const sliced = arr.slice(1, 3);
      let result = findLastIndexUint32ArrayValue(sliced, (v: number, _index: number, _array: Uint32Array): boolean => v === 300);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3500
     * @tc.name testTypedUArraysFindLastIndexFileB035
     * @tc.desc Verify BigUint64Array subarray findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const sub = arr.subarray(1, 4);
      let result = findLastIndexBigUint64ArrayValue(sub, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 40n);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3600
     * @tc.name testTypedUArraysFindLastIndexFileB036
     * @tc.desc Verify findLastIndex Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let r1 = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 4);
      let r2 = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 4);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3700
     * @tc.name testTypedUArraysFindLastIndexFileB037
     * @tc.desc Verify predicate index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, i: number, _array: Uint8Array): boolean => v >= 0 && i === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3800
     * @tc.name testTypedUArraysFindLastIndexFileB038
     * @tc.desc Verify predicate array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, i: number, a: Uint16Array): boolean => v === 3 && i >= 0 && a.length >= 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3900
     * @tc.name testTypedUArraysFindLastIndexFileB039
     * @tc.desc Verify predicate value index Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 15, 25, 35, 45]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, i: number, _array: Uint32Array): boolean => v === 35 && i >= 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4000
     * @tc.name testTypedUArraysFindLastIndexFileB040
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4100
     * @tc.name testTypedUArraysFindLastIndexFileB041
     * @tc.desc Verify -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4200
     * @tc.name testTypedUArraysFindLastIndexFileB042
     * @tc.desc Verify predicate boolean truthy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4300
     * @tc.name testTypedUArraysFindLastIndexFileB043
     * @tc.desc Verify BigUint64Array predicate BigInt Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 100n);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4400
     * @tc.name testTypedUArraysFindLastIndexFileB044
     * @tc.desc Verify BigUint64Array predicate typeof BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let allBigInt = true;
      findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => {
        if (typeof v !== 'bigint') allBigInt = false;
        return false;
      });
      expect(allBigInt).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4500
     * @tc.name testTypedUArraysFindLastIndexFileB045
     * @tc.desc Verify Uint8Array from findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30, 40]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 35);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4600
     * @tc.name testTypedUArraysFindLastIndexFileB046
     * @tc.desc Verify predicate findLastIndex Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4700
     * @tc.name testTypedUArraysFindLastIndexFileB047
     * @tc.desc Verify predicate findLastIndex Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndexFileB047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, i: number, a: Uint8ClampedArray) => {
        if (i === 2) a[1] = 99;
        return v === 99;
      });
      expect(result).assertEqual(1);
    });

  });
}

