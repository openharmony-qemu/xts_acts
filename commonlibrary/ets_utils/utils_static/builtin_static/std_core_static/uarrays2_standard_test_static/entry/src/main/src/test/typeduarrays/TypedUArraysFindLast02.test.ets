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

// AUTO_FINDLAST_HELPERS_END

// AUTO_TYPED_ARRAY_HELPERS_START
function findLastUint8ArrayValue(source: Uint8Array, predicate: (value: number, index: number, array: Uint8Array) => boolean): number | undefined {
  for (let i: number = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

// AUTO_TYPED_ARRAY_HELPERS_END

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_0100
     * @tc.name testTypedUArraysFindLast001
     * @tc.desc Verify 0 findLast Uint8ClampedArray TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5100
     * @tc.name testTypedUArraysFindLast051
     * @tc.desc Verify findLast undefined Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5200
     * @tc.name testTypedUArraysFindLast052
     * @tc.desc Verify findLast undefined BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = findLastBigUint64ArrayValue(arr, (_value: bigint, _index: number, _array: BigUint64Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5300
     * @tc.name testTypedUArraysFindLast053
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 99]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5400
     * @tc.name testTypedUArraysFindLast054
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99, 1, 2]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5500
     * @tc.name testTypedUArraysFindLast055
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => true);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5600
     * @tc.name testTypedUArraysFindLast056
     * @tc.desc Verify undefined Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5700
     * @tc.name testTypedUArraysFindLast057
     * @tc.desc Verify Uint8ClampedArray 0 255 findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      const zeroVal = findLastUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v === 0);
      const maxVal = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(zeroVal).assertEqual(0);
      expect(maxVal).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5800
     * @tc.name testTypedUArraysFindLast058
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')]);
      let result = findLastBigUint64ArrayValue(arr, (_value: bigint, _index: number, _array: BigUint64Array): boolean => true);
      expect(result).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_5900
     * @tc.name testTypedUArraysFindLast059
     * @tc.desc Verify Uint16Array 65535 findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => true);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6000
     * @tc.name testTypedUArraysFindLast060
     * @tc.desc Verify Uint32Array 4294967295 findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483648, 4294967295]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6100
     * @tc.name testTypedUArraysFindLast061
     * @tc.desc Verify predicate this thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6200
     * @tc.name testTypedUArraysFindLast062
     * @tc.desc Verify predicate findLast Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30, 40]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6300
     * @tc.name testTypedUArraysFindLast063
     * @tc.desc Verify predicate true Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6400
     * @tc.name testTypedUArraysFindLast064
     * @tc.desc Verify predicate Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6500
     * @tc.name testTypedUArraysFindLast065
     * @tc.desc Verify predicate BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6600
     * @tc.name testTypedUArraysFindLast066
     * @tc.desc Verify predicate truthy Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = findLastUint8ClampedArrayValue(arr, (v: number, _index: number, _array: Uint8ClampedArray): boolean => v >= 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6700
     * @tc.name testTypedUArraysFindLast067
     * @tc.desc Verify predicate 0 falsy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let count = 0;
      findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => {
        count++;
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6800
     * @tc.name testTypedUArraysFindLast068
     * @tc.desc Verify predicate falsy Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let count = 0;
      findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => {
        count++;
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_6900
     * @tc.name testTypedUArraysFindLast069
     * @tc.desc Verify predicate truthy Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7000
     * @tc.name testTypedUArraysFindLast070
     * @tc.desc Verify predicate array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = findLastBigUint64ArrayValue(arr, (v: bigint, i: number, a: BigUint64Array): boolean => {
        if (i === 2) a[0] = 99n;
        return v === 99n;
      });
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7100
     * @tc.name testTypedUArraysFindLast071
     * @tc.desc Verify predicate Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7200
     * @tc.name testTypedUArraysFindLast072
     * @tc.desc Verify BigUint64Array predicate BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n, 400n]);
      let result = findLastBigUint64ArrayValue(arr, (v: bigint, _index: number, _array: BigUint64Array): boolean => v === 300n);
      expect(result).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7300
     * @tc.name testTypedUArraysFindLast073
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = findLastUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7400
     * @tc.name testTypedUArraysFindLast074
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = findLastUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7500
     * @tc.name testTypedUArraysFindLast075
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7600
     * @tc.name testTypedUArraysFindLast076
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result = findLastBigUint64ArrayValue(arr, (_value: bigint, _index: number, _array: BigUint64Array): boolean => true);
      expect(result).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7700
     * @tc.name testTypedUArraysFindLast077
     * @tc.desc Verify Uint8ClampedArray predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7800
     * @tc.name testTypedUArraysFindLast078
     * @tc.desc Verify Uint8ClampedArray predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_7900
     * @tc.name testTypedUArraysFindLast079
     * @tc.desc Verify Uint8Array 255 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8000
     * @tc.name testTypedUArraysFindLast080
     * @tc.desc Verify Uint16Array 65535 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 32768, 65535]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => true);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8100
     * @tc.name testTypedUArraysFindLast081
     * @tc.desc Verify Uint32Array 4294967295 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 2147483648, 4294967295]);
      let result = findLastUint32ArrayValue(arr, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8300
     * @tc.name testTypedUArraysFindLast083
     * @tc.desc Verify Uint8Array of findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8400
     * @tc.name testTypedUArraysFindLast084
     * @tc.desc Verify Uint32Array slice findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      const sliced = arr.slice(1, 3);
      let result = findLastUint32ArrayValue(sliced, (_value: number, _index: number, _array: Uint32Array): boolean => true);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8500
     * @tc.name testTypedUArraysFindLast085
     * @tc.desc Verify BigUint64Array subarray findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      const sub = arr.subarray(1, 4);
      let result = findLastBigUint64ArrayValue(sub, (_value: bigint, _index: number, _array: BigUint64Array): boolean => true);
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8600
     * @tc.name testTypedUArraysFindLast086
     * @tc.desc Verify Uint8ClampedArray findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r1 = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      const r2 = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(r1).assertEqual(5);
      expect(r2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8700
     * @tc.name testTypedUArraysFindLast087
     * @tc.desc Verify predicate index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = findLastUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8800
     * @tc.name testTypedUArraysFindLast088
     * @tc.desc Verify predicate array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastUint16ArrayValue(arr, (_value: number, _index: number, _array: Uint16Array): boolean => true);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_8900
     * @tc.name testTypedUArraysFindLast089
     * @tc.desc Verify predicate value index Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 15, 25, 35, 45]);
      let result = findLastUint32ArrayValue(arr, (v: number, _index: number, _array: Uint32Array): boolean => v === 35);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9000
     * @tc.name testTypedUArraysFindLast090
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      let result = findLastUint8ClampedArrayValue(arr, (_value: number, _index: number, _array: Uint8ClampedArray): boolean => true);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9100
     * @tc.name testTypedUArraysFindLast091
     * @tc.desc Verify Uint8Array undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9200
     * @tc.name testTypedUArraysFindLast092
     * @tc.desc Verify predicate boolean truthy Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = findLastUint8ArrayValue(arr, (v: number, _index: number, _array: Uint8Array): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9300
     * @tc.name testTypedUArraysFindLast093
     * @tc.desc Verify BigUint64Array predicate BigInt Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let result = findLastBigUint64ArrayValue(arr, (_value: bigint, _index: number, _array: BigUint64Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9400
     * @tc.name testTypedUArraysFindLast094
     * @tc.desc Verify BigUint64Array predicate typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n, 15n]);
      let allBigInt = true;
      findLastBigUint64ArrayValue(arr, (value: bigint, _index: number, _array: BigUint64Array): boolean => {
        allBigInt = allBigInt && (typeof value === 'bigint');
        return true;
      });
      expect(allBigInt).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9500
     * @tc.name testTypedUArraysFindLast095
     * @tc.desc Verify Uint8Array from findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30, 40]);
      let result = findLastUint8ArrayValue(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_9600
     * @tc.name testTypedUArraysFindLast096
     * @tc.desc Verify predicate findLast Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = findLastUint16ArrayValue(arr, (v: number, _index: number, _array: Uint16Array): boolean => v === 2);
      expect(result).assertEqual(2);
    });
  });
}

