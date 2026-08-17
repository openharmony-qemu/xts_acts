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

function findLastBigUint64ArrayValue(source: BigUint64Array, predicate: (value: bigint, index: number, array: BigUint64Array) => boolean): bigint | undefined {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: bigint = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

function findLastUint16ArrayValue(source: Uint16Array, predicate: (value: number, index: number, array: Uint16Array) => boolean): number | undefined {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

function findLastUint32ArrayValue(source: Uint32Array, predicate: (value: number, index: number, array: Uint32Array) => boolean): number | undefined {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

function findLastUint8ClampedArrayValue(source: Uint8ClampedArray, predicate: (value: number, index: number, array: Uint8ClampedArray) => boolean): number | undefined {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

function findLastUint8ArrayValue(source: Uint8Array, predicate: (value: number, index: number, array: Uint8Array) => boolean): number | undefined {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

export default function typedUArraysFindLast02(): void {
  describe('TypedUArraysFindLast02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0100
     * @tc.name testTypedUArraysFindLastFileB001
     * @tc.desc Verify 0 findLast Uint8ClampedArray TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = findLastUint16ArrayValue(arr, (value: number, _index: number, _array: Uint16Array): boolean => typeof value !== 'number');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0200
     * @tc.name testTypedUArraysFindLastFileB002
     * @tc.desc Verify findLast undefined Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      let result = findLastUint32ArrayValue(arr, (value: number, _index: number, _array: Uint32Array): boolean => value < 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0300
     * @tc.name testTypedUArraysFindLastFileB003
     * @tc.desc Verify findLast undefined BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => value < 0n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0400
     * @tc.name testTypedUArraysFindLastFileB004
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 99]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0500
     * @tc.name testTypedUArraysFindLastFileB005
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99, 1, 2]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0600
     * @tc.name testTypedUArraysFindLastFileB006
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => true);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0700
     * @tc.name testTypedUArraysFindLastFileB007
     * @tc.desc Verify undefined Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = findLastUint32ArrayValue(arr, (value: number, _index: number, _array: Uint32Array): boolean => typeof value !== 'number');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0800
     * @tc.name testTypedUArraysFindLastFileB008
     * @tc.desc Verify Uint8ClampedArray 0 255 findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      const zeroVal = findLastUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 0);
      const maxVal = findLastUint8ClampedArrayValue(arr, (value: number, _index: number, _array: Uint8ClampedArray): boolean => typeof value === 'number');
      expect(zeroVal).assertEqual(0);
      expect(maxVal).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_0900
     * @tc.name testTypedUArraysFindLastFileB009
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')]);
      let result = findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => typeof value === 'bigint');
      expect(result).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1000
     * @tc.name testTypedUArraysFindLastFileB010
     * @tc.desc Verify Uint16Array 65535 findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => true);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1100
     * @tc.name testTypedUArraysFindLastFileB011
     * @tc.desc Verify Uint32Array 4294967295 findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483648, 4294967295]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1200
     * @tc.name testTypedUArraysFindLastFileB012
     * @tc.desc Verify predicate this thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1300
     * @tc.name testTypedUArraysFindLastFileB013
     * @tc.desc Verify predicate findLast Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30, 40]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1400
     * @tc.name testTypedUArraysFindLastFileB014
     * @tc.desc Verify predicate true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1500
     * @tc.name testTypedUArraysFindLastFileB015
     * @tc.desc Verify predicate Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const visited: number[] = [];
      findLastUint8ArrayValue(arr, (value: number, _index: number, _array: Uint8Array): boolean => {
        visited.push(value);
        return false;
      });
      expect(visited.length).assertEqual(5);
      expect(visited[0]).assertEqual(5);
      expect(visited[1]).assertEqual(4);
      expect(visited[2]).assertEqual(3);
      expect(visited[3]).assertEqual(2);
      expect(visited[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1600
     * @tc.name testTypedUArraysFindLastFileB016
     * @tc.desc Verify predicate BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const visited: bigint[] = [];
      findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => {
        visited.push(value);
        return false;
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(30n);
      expect(visited[1]).assertEqual(20n);
      expect(visited[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1700
     * @tc.name testTypedUArraysFindLastFileB017
     * @tc.desc Verify predicate truthy Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v >= 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1800
     * @tc.name testTypedUArraysFindLastFileB018
     * @tc.desc Verify predicate 0 falsy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let count = 0;
      findLastUint8ArrayValue(arr, (value: number, _index: number, _array: Uint8Array): boolean => {
        count += (typeof value === 'number') ? 1 : 0;
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_1900
     * @tc.name testTypedUArraysFindLastFileB019
     * @tc.desc Verify predicate falsy Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let count = 0;
      findLastUint16ArrayValue(arr, (value: number, _index: number, _array: Uint16Array): boolean => {
        count += (typeof value === 'number') ? 1 : 0;
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2000
     * @tc.name testTypedUArraysFindLastFileB020
     * @tc.desc Verify predicate truthy Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2100
     * @tc.name testTypedUArraysFindLastFileB021
     * @tc.desc Verify predicate array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = findLastBigUint64ArrayValue(arr, (v: bigint, i: number, a: BigUint64Array): boolean => {
        if (i === 2) a[0] = 99n;
        return v === 99n;
      });
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2200
     * @tc.name testTypedUArraysFindLastFileB022
     * @tc.desc Verify predicate Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2300
     * @tc.name testTypedUArraysFindLastFileB023
     * @tc.desc Verify BigUint64Array predicate BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n, 400n]);
      let result = findLastBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 300n);
      expect(result).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2400
     * @tc.name testTypedUArraysFindLastFileB024
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = findLastUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2500
     * @tc.name testTypedUArraysFindLastFileB025
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = findLastUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2600
     * @tc.name testTypedUArraysFindLastFileB026
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = findLastUint32ArrayValue(arr, (value: number, _index: number, _array: Uint32Array): boolean => typeof value === 'number');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2700
     * @tc.name testTypedUArraysFindLastFileB027
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result = findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => typeof value === 'bigint');
      expect(result).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2800
     * @tc.name testTypedUArraysFindLastFileB028
     * @tc.desc Verify Uint8ClampedArray predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_2900
     * @tc.name testTypedUArraysFindLastFileB029
     * @tc.desc Verify Uint8ClampedArray predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      let result = findLastUint8ClampedArrayValue(arr, (value: number, _index: number, _array: Uint8ClampedArray): boolean => typeof value === 'number');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3000
     * @tc.name testTypedUArraysFindLastFileB030
     * @tc.desc Verify Uint8Array 255 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3100
     * @tc.name testTypedUArraysFindLastFileB031
     * @tc.desc Verify Uint16Array 65535 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 32768, 65535]);
      let result = findLastUint16ArrayValue(arr, (value: number, _index: number, _array: Uint16Array): boolean => typeof value === 'number');
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3200
     * @tc.name testTypedUArraysFindLastFileB032
     * @tc.desc Verify Uint32Array 4294967295 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 2147483648, 4294967295]);
      let result = findLastUint32ArrayValue(arr, (value: number, _index: number, _array: Uint32Array): boolean => typeof value === 'number');
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3300
     * @tc.name testTypedUArraysFindLastFileB033
     * @tc.desc Verify Uint8Array of findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      let result = findLastUint8ArrayValue(arr, (value: number, _index: number, _array: Uint8Array): boolean => typeof value === 'number');
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3400
     * @tc.name testTypedUArraysFindLastFileB034
     * @tc.desc Verify Uint32Array slice findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      const sliced = arr.slice(1, 3);
      let result = findLastUint32ArrayValue(sliced, (value: number, _index: number, _array: Uint32Array): boolean => typeof value === 'number');
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3500
     * @tc.name testTypedUArraysFindLastFileB035
     * @tc.desc Verify BigUint64Array subarray findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const sub = arr.subarray(1, 4);
      let result = findLastBigUint64ArrayValue(sub, (value: bigint, _index: number, _array: BigUint64Array): boolean => typeof value === 'bigint');
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3600
     * @tc.name testTypedUArraysFindLastFileB036
     * @tc.desc Verify Uint8ClampedArray findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r1 = findLastUint8ClampedArrayValue(arr, (value: number, _index: number, _array: Uint8ClampedArray): boolean => typeof value === 'number');
      const r2 = findLastUint8ClampedArrayValue(arr, (value: number, _index: number, _array: Uint8ClampedArray): boolean => typeof value === 'number');
      expect(r1).assertEqual(5);
      expect(r2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3700
     * @tc.name testTypedUArraysFindLastFileB037
     * @tc.desc Verify predicate index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = findLastUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3800
     * @tc.name testTypedUArraysFindLastFileB038
     * @tc.desc Verify predicate array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastUint16ArrayValue(arr, (value: number, _index: number, _array: Uint16Array): boolean => typeof value === 'number');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_3900
     * @tc.name testTypedUArraysFindLastFileB039
     * @tc.desc Verify predicate value index Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 15, 25, 35, 45]);
      let result = findLastUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 35);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4000
     * @tc.name testTypedUArraysFindLastFileB040
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      let result = findLastUint8ClampedArrayValue(arr, (value: number, _index: number, _array: Uint8ClampedArray): boolean => typeof value === 'number');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4100
     * @tc.name testTypedUArraysFindLastFileB041
     * @tc.desc Verify Uint8Array undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = findLastUint8ArrayValue(arr, (value: number, _index: number, _array: Uint8Array): boolean => typeof value !== 'number');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4200
     * @tc.name testTypedUArraysFindLastFileB042
     * @tc.desc Verify predicate boolean truthy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4300
     * @tc.name testTypedUArraysFindLastFileB043
     * @tc.desc Verify BigUint64Array predicate BigInt Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let result = findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => typeof value !== 'bigint');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4400
     * @tc.name testTypedUArraysFindLastFileB044
     * @tc.desc Verify BigUint64Array predicate typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let allBigInt = true;
      findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => {
        allBigInt = allBigInt && (typeof value === 'bigint');
        return true;
      });
      expect(allBigInt).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4500
     * @tc.name testTypedUArraysFindLastFileB045
     * @tc.desc Verify Uint8Array from findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30, 40]);
      let result = findLastUint8ArrayValue(arr, (value: number, _index: number, _array: Uint8Array): boolean => typeof value === 'number');
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST02_4600
     * @tc.name testTypedUArraysFindLastFileB046
     * @tc.desc Verify predicate findLast Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 2);
      expect(result).assertEqual(2);
    });
  });
}
