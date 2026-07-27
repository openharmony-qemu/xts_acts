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

export default function typedUArraysFindLastIndex01(): void {
  describe('TypedUArraysFindLastIndex01', (): void => {
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
    it('testTypedUArraysFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0200
     * @tc.name testTypedUArraysFindLastIndex002
     * @tc.desc Verify 0 findLastIndex Uint8Array TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0300
     * @tc.name testTypedUArraysFindLastIndex003
     * @tc.desc Verify 0 findLastIndex Uint16Array TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0400
     * @tc.name testTypedUArraysFindLastIndex004
     * @tc.desc Verify 0 findLastIndex Uint32Array TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0500
     * @tc.name testTypedUArraysFindLastIndex005
     * @tc.desc Verify 0 findLastIndex BigUint64Array TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 0n);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0600
     * @tc.name testTypedUArraysFindLastIndex006
     * @tc.desc Verify predicate Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0700
     * @tc.name testTypedUArraysFindLastIndex007
     * @tc.desc Verify predicate Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0800
     * @tc.name testTypedUArraysFindLastIndex008
     * @tc.desc Verify predicate Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 20]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0900
     * @tc.name testTypedUArraysFindLastIndex009
     * @tc.desc Verify predicate Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30, 20]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1000
     * @tc.name testTypedUArraysFindLastIndex010
     * @tc.desc Verify predicate BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 20n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1100
     * @tc.name testTypedUArraysFindLastIndex011
     * @tc.desc Verify predicate thisArg Uint8ClampedArray this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const threshold = 15;
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1200
     * @tc.name testTypedUArraysFindLastIndex012
     * @tc.desc Verify predicate thisArg Uint8Array this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const threshold = 15;
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1300
     * @tc.name testTypedUArraysFindLastIndex013
     * @tc.desc Verify predicate thisArg Uint16Array this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const threshold = 15;
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1400
     * @tc.name testTypedUArraysFindLastIndex014
     * @tc.desc Verify predicate thisArg Uint32Array this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30]);
      const threshold = 15;
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1500
     * @tc.name testTypedUArraysFindLastIndex015
     * @tc.desc Verify predicate thisArg BigUint64Array this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const threshold = 15n;
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1600
     * @tc.name testTypedUArraysFindLastIndex016
     * @tc.desc Verify predicate Uint8Array TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1700
     * @tc.name testTypedUArraysFindLastIndex017
     * @tc.desc Verify predicate Uint32Array TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1800
     * @tc.name testTypedUArraysFindLastIndex018
     * @tc.desc Verify predicate value Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 50);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_1900
     * @tc.name testTypedUArraysFindLastIndex019
     * @tc.desc Verify predicate index Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, i: number, _array: Uint16Array): boolean => v >= 0 && i === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2000
     * @tc.name testTypedUArraysFindLastIndex020
     * @tc.desc Verify predicate array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, i: number, a: Uint32Array): boolean => v === 30 && i >= 0 && a.length >= 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2100
     * @tc.name testTypedUArraysFindLastIndex021
     * @tc.desc Verify predicate value BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 50n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 50n);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2200
     * @tc.name testTypedUArraysFindLastIndex022
     * @tc.desc Verify predicate Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 3, 1, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2300
     * @tc.name testTypedUArraysFindLastIndex023
     * @tc.desc Verify predicate Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 5, 3, 4, 2]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2400
     * @tc.name testTypedUArraysFindLastIndex024
     * @tc.desc Verify predicate false Uint16Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2500
     * @tc.name testTypedUArraysFindLastIndex025
     * @tc.desc Verify predicate false Uint32Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2600
     * @tc.name testTypedUArraysFindLastIndex026
     * @tc.desc Verify predicate false BigUint64Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 100n);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2700
     * @tc.name testTypedUArraysFindLastIndex027
     * @tc.desc Verify predicate Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, i: number, a: Uint8ClampedArray) => {
        if (i === 2) a[0] = 99;
        return v === 99;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2800
     * @tc.name testTypedUArraysFindLastIndex028
     * @tc.desc Verify predicate this thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 15, 25]);
      const threshold = 10;
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_2900
     * @tc.name testTypedUArraysFindLastIndex029
     * @tc.desc Verify predicate this thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 15, 25]);
      const min = 10;
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > min);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3000
     * @tc.name testTypedUArraysFindLastIndex030
     * @tc.desc Verify thisArg predicate this undefined Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3100
     * @tc.name testTypedUArraysFindLastIndex031
     * @tc.desc Verify thisArg 0 predicate this 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3200
     * @tc.name testTypedUArraysFindLastIndex032
     * @tc.desc Verify thisArg predicate this BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const target = 2n;
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === target);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3300
     * @tc.name testTypedUArraysFindLastIndex033
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 15, 25, 15]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 15);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3400
     * @tc.name testTypedUArraysFindLastIndex034
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 15, 25, 15]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 15);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3500
     * @tc.name testTypedUArraysFindLastIndex035
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 15, 25, 15]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 15);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3600
     * @tc.name testTypedUArraysFindLastIndex036
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 15, 25, 15]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 15);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3700
     * @tc.name testTypedUArraysFindLastIndex037
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 15n, 25n, 15n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 15n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3800
     * @tc.name testTypedUArraysFindLastIndex038
     * @tc.desc Verify -1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_3900
     * @tc.name testTypedUArraysFindLastIndex039
     * @tc.desc Verify -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4000
     * @tc.name testTypedUArraysFindLastIndex040
     * @tc.desc Verify -1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4100
     * @tc.name testTypedUArraysFindLastIndex041
     * @tc.desc Verify -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4200
     * @tc.name testTypedUArraysFindLastIndex042
     * @tc.desc Verify -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v > 100n);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4400
     * @tc.name testTypedUArraysFindLastIndex044
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 3, 1, 3]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4500
     * @tc.name testTypedUArraysFindLastIndex045
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 3, 1, 3]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4600
     * @tc.name testTypedUArraysFindLastIndex046
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3, 1, 3, 1, 3]);
      let result = findLastIndexUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4700
     * @tc.name testTypedUArraysFindLastIndex047
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 3n, 1n, 3n]);
      let result = findLastIndexBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 3n);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4800
     * @tc.name testTypedUArraysFindLastIndex048
     * @tc.desc Verify findLastIndex -1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let result = findLastIndexUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_4900
     * @tc.name testTypedUArraysFindLastIndex049
     * @tc.desc Verify findLastIndex -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      let result = findLastIndexUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_5000
     * @tc.name testTypedUArraysFindLastIndex050
     * @tc.desc Verify findLastIndex -1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = findLastIndexUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

  });
}
