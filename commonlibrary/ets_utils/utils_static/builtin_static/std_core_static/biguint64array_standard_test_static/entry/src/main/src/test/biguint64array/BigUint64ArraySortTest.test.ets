'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

const MAX_UINT64_VALUE: bigint = 18446744073709551615n;
const HIGH_SIGNED_BOUNDARY_VALUE: bigint = 9223372036854775808n;
const SIGNED_LONG_MAX_VALUE: bigint = 9223372036854775807n;
const MAX_SAFE_INTEGER_VALUE: bigint = 9007199254740991n;

function compareAscending(leftValue: bigint, rightValue: bigint): int {
  if (leftValue < rightValue) {
    return -1;
  }
  if (leftValue > rightValue) {
    return 1;
  }
  return 0;
}

function compareDescending(leftValue: bigint, rightValue: bigint): int {
  if (leftValue > rightValue) {
    return -1;
  }
  if (leftValue < rightValue) {
    return 1;
  }
  return 0;
}

export default function biguint64arraySortTest(): void {

  describe('BigUint64ArraySortTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0100
     * @tc.name testBigUint64ArraySort001
     * @tc.desc Verify sort() on an empty array returns the receiver and keeps zero metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let returnedArray = sourceArray.sort();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray.length).assertEqual(0);
      expect(returnedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0200
     * @tc.name testBigUint64ArraySort002
     * @tc.desc Verify sort() on a single max uint64 element keeps the element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE]);
      let returnedArray = sourceArray.sort();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0300
     * @tc.name testBigUint64ArraySort003
     * @tc.desc Verify sort() swaps a descending two element array into ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 1n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0400
     * @tc.name testBigUint64ArraySort004
     * @tc.desc Verify sort() orders the specification example array in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(3n, 1n, 2n);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0500
     * @tc.name testBigUint64ArraySort005
     * @tc.desc Verify repeated sort() calls keep an already sorted array stable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 1n, 3n, 2n]);
      sourceArray.sort();
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0600
     * @tc.name testBigUint64ArraySort006
     * @tc.desc Verify sort() groups duplicate values in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 3n, 5n, 3n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(3n);
      expect(sourceArray[2]).assertEqual(5n);
      expect(sourceArray[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0700
     * @tc.name testBigUint64ArraySort007
     * @tc.desc Verify sort() preserves default zero values created by the length constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0800
     * @tc.name testBigUint64ArraySort008
     * @tc.desc Verify sort() preserves repeated max uint64 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, MAX_UINT64_VALUE, MAX_UINT64_VALUE]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[1]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_0900
     * @tc.name testBigUint64ArraySort009
     * @tc.desc Verify sort() uses numeric order instead of lexicographic string order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 10n, 1n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1000
     * @tc.name testBigUint64ArraySort010
     * @tc.desc Verify sort() orders zero, one, and the maximum unsigned 64-bit integer in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, 1n, 0n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1100
     * @tc.name testBigUint64ArraySort011
     * @tc.desc Verify sort() orders adjacent max uint64 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, MAX_UINT64_VALUE - 1n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE - 1n);
      expect(sourceArray[1]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1200
     * @tc.name testBigUint64ArraySort012
     * @tc.desc Verify sort() orders values around the signed long boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([HIGH_SIGNED_BOUNDARY_VALUE, SIGNED_LONG_MAX_VALUE]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(SIGNED_LONG_MAX_VALUE);
      expect(sourceArray[1]).assertEqual(HIGH_SIGNED_BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1300
     * @tc.name testBigUint64ArraySort013
     * @tc.desc Verify sort() orders modulo stored values from negative and overflow writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 18446744073709551616n;
      sourceArray[1] = -1n;
      sourceArray[2] = 1n;
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1400
     * @tc.name testBigUint64ArraySort014
     * @tc.desc Verify sort() can order a larger array and map boundary indexes correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(20);
      for (let index: int = 0; index < 20; index++) {
        sourceArray[index] = BigInt(19 - index);
      }
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[9]).assertEqual(9n);
      expect(sourceArray[10]).assertEqual(10n);
      expect(sourceArray[19]).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1500
     * @tc.name testBigUint64ArraySort015
     * @tc.desc Verify sort() returns the same receiver and writes through the returned reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let returnedArray = sourceArray.sort();
      returnedArray[0] = 99n;
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(99n);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1600
     * @tc.name testBigUint64ArraySort016
     * @tc.desc Verify sort() supports chained reverse() on the same receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let returnedArray = sourceArray.sort().reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1700
     * @tc.name testBigUint64ArraySort017
     * @tc.desc Verify sort() keeps length byteLength byteOffset bytes per element and buffer stable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let sourceArray = new BigUint64Array(sourceBuffer, 8, 3);
      sourceArray[0] = 30n;
      sourceArray[1] = 10n;
      sourceArray[2] = 20n;
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let byteOffsetBefore: int = sourceArray.byteOffset;
      let bufferBefore = sourceArray.buffer;
      let returnedArray = sourceArray.sort();
      expect(returnedArray.length).assertEqual(lengthBefore);
      expect(returnedArray.byteLength).assertEqual(byteLengthBefore);
      expect(returnedArray.byteOffset).assertEqual(byteOffsetBefore);
      expect(returnedArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(returnedArray.buffer).assertEqual(bufferBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1800
     * @tc.name testBigUint64ArraySort018
     * @tc.desc Verify sort() mutates an ArrayBuffer backed full view in place
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer, 0, 3);
      sourceArray[0] = 30n;
      sourceArray[1] = 10n;
      sourceArray[2] = 20n;
      sourceArray.sort();
      let viewArray = new BigUint64Array(sourceBuffer, 0, 3);
      expect(viewArray[0]).assertEqual(10n);
      expect(viewArray[1]).assertEqual(20n);
      expect(viewArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_1900
     * @tc.name testBigUint64ArraySort019
     * @tc.desc Verify sort() only mutates the selected nonzero byteOffset view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 1n;
      fullView[1] = 30n;
      fullView[2] = 10n;
      fullView[3] = 20n;
      fullView[4] = 5n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      offsetView.sort();
      expect(fullView[0]).assertEqual(1n);
      expect(fullView[1]).assertEqual(10n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(30n);
      expect(fullView[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2000
     * @tc.name testBigUint64ArraySort020
     * @tc.desc Verify sort() on a subarray view writes the sorted window back to the parent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([5n, 30n, 10n, 20n, 1n]);
      let childView = parentArray.subarray(1, 4);
      childView.sort();
      expect(parentArray[0]).assertEqual(5n);
      expect(parentArray[1]).assertEqual(10n);
      expect(parentArray[2]).assertEqual(20n);
      expect(parentArray[3]).assertEqual(30n);
      expect(parentArray[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2100
     * @tc.name testBigUint64ArraySort021
     * @tc.desc Verify sort() on a copied typed array does not mutate the original source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([3n, 1n, 2n]);
      let copiedArray = new BigUint64Array(originalArray);
      copiedArray.sort();
      expect(originalArray[0]).assertEqual(3n);
      expect(originalArray[1]).assertEqual(1n);
      expect(originalArray[2]).assertEqual(2n);
      expect(copiedArray[0]).assertEqual(1n);
      expect(copiedArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2200
     * @tc.name testBigUint64ArraySort022
     * @tc.desc Verify sort() orders a BigUint64Array created through from()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.from([4n, 2n, 3n, 1n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2300
     * @tc.name testBigUint64ArraySort023
     * @tc.desc Verify sort(compareFn) on an empty array does not call the comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let returnedArray = sourceArray.sort((_leftValue: bigint, _rightValue: bigint): int => {
        callCount++;
        return 0;
      });
      expect(returnedArray).assertEqual(sourceArray);
      expect(callCount).assertEqual(0);
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2400
     * @tc.name testBigUint64ArraySort024
     * @tc.desc Verify sort(compareFn) on a single element array does not call the comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let callCount: int = 0;
      sourceArray.sort((_leftValue: bigint, _rightValue: bigint): int => {
        callCount++;
        return 0;
      });
      expect(callCount).assertEqual(0);
      expect(sourceArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2500
     * @tc.name testBigUint64ArraySort025
     * @tc.desc Verify sort(compareFn) can order values in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        return compareAscending(leftValue, rightValue);
      });
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2600
     * @tc.name testBigUint64ArraySort026
     * @tc.desc Verify sort(compareFn) can order values in descending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        return compareDescending(leftValue, rightValue);
      });
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2700
     * @tc.name testBigUint64ArraySort027
     * @tc.desc Verify sort(compareFn) returning zero keeps comparator equality order unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 2n, 4n, 2n]);
      sourceArray.sort((_leftValue: bigint, _rightValue: bigint): int => {
        return 0;
      });
      expect(sourceArray[0]).assertEqual(4n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(4n);
      expect(sourceArray[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2800
     * @tc.name testBigUint64ArraySort028
     * @tc.desc Verify sort(compareFn) treats non one positive and negative int values by sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        if (leftValue < rightValue) {
          return -5;
        }
        if (leftValue > rightValue) {
          return 5;
        }
        return 0;
      });
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_2900
     * @tc.name testBigUint64ArraySort029
     * @tc.desc Verify sort(compareFn) accepts int boundary return values by sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 1n, 5n]);
      sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        if (leftValue < rightValue) {
          return -2147483648;
        }
        if (leftValue > rightValue) {
          return 2147483647;
        }
        return 0;
      });
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3000
     * @tc.name testBigUint64ArraySort030
     * @tc.desc Verify sort(compareFn) receives precise BigInt arguments for small element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 1n]);
      let sawExpectedPair: boolean = false;
      sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        if ((leftValue === 1n && rightValue === 2n) || (leftValue === 2n && rightValue === 1n)) {
          sawExpectedPair = true;
        }
        return compareAscending(leftValue, rightValue);
      });
      expect(sawExpectedPair).assertTrue();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3100
     * @tc.name testBigUint64ArraySort031
     * @tc.desc Verify sort(compareFn) can update external state and read receiver metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let callCount: int = 0;
      let observedLength: int = 0;
      sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        callCount++;
        observedLength = sourceArray.length;
        return compareAscending(leftValue, rightValue);
      });
      expect(callCount > 0).assertTrue();
      expect(observedLength).assertEqual(3);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3200
     * @tc.name testBigUint64ArraySort032
     * @tc.desc Verify sort(compareFn) propagates an Error thrown by the comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let callCount: int = 0;
      try {
        sourceArray.sort((_leftValue: bigint, _rightValue: bigint): int => {
          callCount++;
          throw new Error('comparator error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3300
     * @tc.name testBigUint64ArraySort033
     * @tc.desc Verify sort(compareFn) returns this for chained fill() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let returnedArray = sourceArray.sort(compareAscending).fill(0n);
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3400
     * @tc.name testBigUint64ArraySort034
     * @tc.desc Verify sort(compareFn) orders max safe integer values with BigInt comparator arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_SAFE_INTEGER_VALUE, 1n, 2n]);
      sourceArray.sort(compareAscending);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(MAX_SAFE_INTEGER_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3500
     * @tc.name testBigUint64ArraySort035
     * @tc.desc Verify sort() mutates its receiver while toSorted() keeps the same input unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues = [3n, 1n, 2n];
      let mutableArray = new BigUint64Array(sourceValues);
      let immutableArray = new BigUint64Array(sourceValues);
      let returnedArray = mutableArray.sort();
      let sortedResult = immutableArray.toSorted();
      expect(returnedArray).assertEqual(mutableArray);
      expect(mutableArray[0]).assertEqual(1n);
      expect(mutableArray[1]).assertEqual(2n);
      expect(mutableArray[2]).assertEqual(3n);
      expect(sortedResult === immutableArray).assertFalse();
      expect(sortedResult[0]).assertEqual(1n);
      expect(sortedResult[1]).assertEqual(2n);
      expect(sortedResult[2]).assertEqual(3n);
      expect(immutableArray[0]).assertEqual(3n);
      expect(immutableArray[1]).assertEqual(1n);
      expect(immutableArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3600
     * @tc.name testBigUint64ArraySort036
     * @tc.desc Verify sort(compareFn) mutates only the byteOffset view window and returns the same view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 7n;
      fullView[1] = 10n;
      fullView[2] = 30n;
      fullView[3] = 20n;
      fullView[4] = 5n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let returnedArray = offsetView.sort(compareDescending);
      expect(returnedArray).assertEqual(offsetView);
      expect(returnedArray.byteOffset).assertEqual(8);
      expect(returnedArray.buffer).assertEqual(sourceBuffer);
      expect(fullView[0]).assertEqual(7n);
      expect(fullView[1]).assertEqual(30n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(10n);
      expect(fullView[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3700
     * @tc.name testBigUint64ArraySort037
     * @tc.desc Verify sort() respects byteOffset and length parameters declared with base literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 70n;
      fullView[1] = 30n;
      fullView[2] = 10n;
      fullView[3] = 20n;
      fullView[4] = 50n;
      let byteOffset: int = 0x08;
      let viewLength: int = 0b11;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let returnedArray = offsetView.sort();
      expect(returnedArray).assertEqual(offsetView);
      expect(offsetView.byteOffset).assertEqual(8);
      expect(offsetView.length).assertEqual(3);
      expect(fullView[0]).assertEqual(70n);
      expect(fullView[1]).assertEqual(10n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(30n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3800
     * @tc.name testBigUint64ArraySort038
     * @tc.desc Verify sort() on a negative index subarray writes the sorted window back
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([90n, 40n, 10n, 30n, 20n, 80n]);
      let beginIndex: int = -5;
      let endIndex: int = -1;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let returnedArray = sourceView.sort();
      expect(returnedArray).assertEqual(sourceView);
      expect(sourceView.length).assertEqual(4);
      expect(parentArray[0]).assertEqual(90n);
      expect(parentArray[1]).assertEqual(10n);
      expect(parentArray[2]).assertEqual(20n);
      expect(parentArray[3]).assertEqual(30n);
      expect(parentArray[4]).assertEqual(40n);
      expect(parentArray[5]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_3900
     * @tc.name testBigUint64ArraySort039
     * @tc.desc Verify sort(compareFn) on a subarray mutates the parent window and returns the subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([5n, 12n, 33n, 21n, 9n]);
      let beginIndex: int = 1;
      let endIndex: int = 4;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let observedByteOffset: int = -1;
      let observedLength: int = 0;
      let returnedArray = sourceView.sort((leftValue: bigint, rightValue: bigint): int => {
        observedByteOffset = sourceView.byteOffset;
        observedLength = sourceView.length;
        return compareDescending(leftValue, rightValue);
      });
      expect(returnedArray).assertEqual(sourceView);
      expect(observedByteOffset).assertEqual(8);
      expect(observedLength).assertEqual(3);
      expect(parentArray[0]).assertEqual(5n);
      expect(parentArray[1]).assertEqual(33n);
      expect(parentArray[2]).assertEqual(21n);
      expect(parentArray[3]).assertEqual(12n);
      expect(parentArray[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4000
     * @tc.name testBigUint64ArraySort040
     * @tc.desc Verify sort() orders a decimal int value converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalSourceValue: int = 255;
      let sourceArray = new BigUint64Array([BigInt(decimalSourceValue), 42n, 1n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4100
     * @tc.name testBigUint64ArraySort041
     * @tc.desc Verify sort() orders an octal int value converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalSourceValue: int = 0o377;
      let sourceArray = new BigUint64Array([BigInt(octalSourceValue), 42n, 1n]);
      sourceArray.sort();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4200
     * @tc.name testBigUint64ArraySort042
     * @tc.desc Verify sort() on a nested byteOffset subarray mutates only the local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer, 0, 6);
      fullView[0] = 60n;
      fullView[1] = 10n;
      fullView[2] = 40n;
      fullView[3] = 20n;
      fullView[4] = 50n;
      fullView[5] = 30n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 1;
      let endIndex: int = 4;
      let sourceView = byteOffsetView.subarray(beginIndex, endIndex);
      let returnedArray = sourceView.sort();
      expect(returnedArray).assertEqual(sourceView);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(3);
      expect(fullView[0]).assertEqual(60n);
      expect(fullView[1]).assertEqual(10n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
      expect(fullView[5]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4300
     * @tc.name testBigUint64ArraySort043
     * @tc.desc Verify sort() on a slice copy from byteOffset view ignores the source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 90n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 10n;
      fullView[4] = 80n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let sliceCopy = sourceView.slice(0, 3);
      let returnedArray = sliceCopy.sort();
      let sharesSliceBuffer: boolean = sliceCopy.buffer === sharedBuffer;
      expect(returnedArray).assertEqual(sliceCopy);
      expect(sharesSliceBuffer).assertFalse();
      expect(sliceCopy[0]).assertEqual(10n);
      expect(sliceCopy[1]).assertEqual(20n);
      expect(sliceCopy[2]).assertEqual(30n);
      expect(sourceView[0]).assertEqual(20n);
      expect(sourceView[1]).assertEqual(30n);
      expect(sourceView[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4400
     * @tc.name testBigUint64ArraySort044
     * @tc.desc Verify sort() on a zero-length byteOffset view returns the same empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let returnedArray = sourceView.sort();
      expect(returnedArray).assertEqual(sourceView);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.byteLength).assertEqual(0);
      expect(sourceView.length).assertEqual(0);
      expect(sourceView.buffer).assertEqual(sharedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4500
     * @tc.name testBigUint64ArraySort045
     * @tc.desc Verify sort() on Set-constructed array sorts unique values from insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(15n);
      sourceValues.add(7n);
      sourceValues.add(15n);
      sourceValues.add(11n);
      let sourceArray = new BigUint64Array(sourceValues);
      let returnedArray = sourceArray.sort();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray.length).assertEqual(3);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(11n);
      expect(sourceArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4600
     * @tc.name testBigUint64ArraySort046
     * @tc.desc Verify sort() on iterator-constructed array sorts values from the advanced iterator cursor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(20n, 5n, 15n, 10n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let targetArray = new BigUint64Array(sourceIterator);
      targetArray.sort();
      expect(targetArray.length).assertEqual(3);
      expect(targetArray[0]).assertEqual(5n);
      expect(targetArray[1]).assertEqual(10n);
      expect(targetArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4700
     * @tc.name testBigUint64ArraySort047
     * @tc.desc Verify sort(compareFn) propagates a TypeError thrown by the comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 1n]);
      let callCount: int = 0;
      try {
        sourceArray.sort((_leftValue: bigint, _rightValue: bigint): int => {
          callCount++;
          throw new TypeError('comparator type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4800
     * @tc.name testBigUint64ArraySort048
     * @tc.desc Verify a later sort comparator observes a shared buffer write through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 4);
      let siblingView = new BigUint64Array(sharedBuffer, 24, 1);
      sourceView[0] = 4n;
      sourceView[1] = 3n;
      sourceView[2] = 2n;
      sourceView[3] = 1n;
      let callCount: int = 0;
      let observedSiblingValue: bigint = 0n;
      sourceView.sort((leftValue: bigint, rightValue: bigint): int => {
        callCount = callCount + 1;
        if (callCount === 1) {
          siblingView[0] = 9n;
        } else if (callCount === 2) {
          observedSiblingValue = siblingView[0];
        }
        return compareAscending(leftValue, rightValue);
      });
      expect(callCount > 1).assertTrue();
      expect(observedSiblingValue).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_4900
     * @tc.name testBigUint64ArraySort049
     * @tc.desc Verify sort(compareFn) accepts BigInt negative zero and positive return values by sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues = [3n, 1n, 2n];
      let sourceArray = new BigUint64Array(sourceValues);
      let returnedArray = sourceArray.sort((leftValue: bigint, rightValue: bigint): bigint => {
        if (leftValue < rightValue) {
          return -1n;
        }
        if (leftValue > rightValue) {
          return 1n;
        }
        return 0n;
      });
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SORT_5000
     * @tc.name testBigUint64ArraySort050
     * @tc.desc Verify sort(compareFn) receives precise max and near max uint64 callback values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySort050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMaxUint64Value: bigint = MAX_UINT64_VALUE - 1n;
      let sourceValues = [MAX_UINT64_VALUE, nearMaxUint64Value];
      let sourceArray = new BigUint64Array(sourceValues);
      let sawMaxUint64Value: boolean = false;
      let sawNearMaxUint64Value: boolean = false;
      let returnedArray = sourceArray.sort((leftValue: bigint, rightValue: bigint): int => {
        if (leftValue === MAX_UINT64_VALUE || rightValue === MAX_UINT64_VALUE) {
          sawMaxUint64Value = true;
        }
        if (leftValue === nearMaxUint64Value || rightValue === nearMaxUint64Value) {
          sawNearMaxUint64Value = true;
        }
        return compareAscending(leftValue, rightValue);
      });
      expect(sawMaxUint64Value).assertTrue();
      expect(sawNearMaxUint64Value).assertTrue();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(nearMaxUint64Value);
      expect(sourceArray[1]).assertEqual(MAX_UINT64_VALUE);
    });
  });
}
