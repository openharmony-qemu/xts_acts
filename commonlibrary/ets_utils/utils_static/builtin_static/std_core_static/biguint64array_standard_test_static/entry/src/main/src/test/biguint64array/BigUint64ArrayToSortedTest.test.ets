'use static';


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
const UINT64_MODULUS_VALUE: bigint = 18446744073709551616n;
const SIGNED_LONG_MAX_VALUE: bigint = 9223372036854775807n;
const HIGH_SIGNED_BOUNDARY_VALUE: bigint = 9223372036854775808n;
const SIGNED_LONG_MIN_AS_UINT64: bigint = 9223372036854775808n;

export default function biguint64arrayToSortedTest(): void {

  describe('BigUint64ArrayToSortedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0100
     * @tc.name testBigUint64ArrayToSorted001
     * @tc.desc Verify toSorted() on an empty array returns an empty independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.toSorted();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.toString()).assertEqual('');
      expect(usesDistinctArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0200
     * @tc.name testBigUint64ArrayToSorted002
     * @tc.desc Verify toSorted() on a single max uint64 element returns a copied element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE]);
      let resultArray = sourceArray.toSorted();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(resultArray.length).assertEqual(1);
      expect(resultArray.byteLength).assertEqual(8);
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(usesDistinctArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0300
     * @tc.name testBigUint64ArrayToSorted003
     * @tc.desc Verify toSorted() sorts a descending two element array without mutating source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 1n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0400
     * @tc.name testBigUint64ArrayToSorted004
     * @tc.desc Verify toSorted() orders the specification example array in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(3n, 1n, 2n);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0500
     * @tc.name testBigUint64ArrayToSorted005
     * @tc.desc Verify toSorted() on an already sorted array returns sorted values in a new array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n, 3n]);
      let resultArray = sourceArray.toSorted();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceArray.buffer;
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(2n);
      expect(resultArray[3]).assertEqual(3n);
      expect(usesDistinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0600
     * @tc.name testBigUint64ArrayToSorted006
     * @tc.desc Verify toSorted() groups duplicate values in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 3n, 5n, 3n, 1n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(3n);
      expect(resultArray[2]).assertEqual(3n);
      expect(resultArray[3]).assertEqual(5n);
      expect(resultArray[4]).assertEqual(5n);
      expect(sourceArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0700
     * @tc.name testBigUint64ArrayToSorted007
     * @tc.desc Verify toSorted() preserves default zero values created by the length constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      let resultArray = sourceArray.toSorted();
      expect(resultArray.length).assertEqual(4);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(0n);
      expect(resultArray[3]).assertEqual(0n);
      resultArray[0] = 9n;
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0800
     * @tc.name testBigUint64ArrayToSorted008
     * @tc.desc Verify toSorted() uses numeric order instead of lexicographic string order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 10n, 1n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_0900
     * @tc.name testBigUint64ArrayToSorted009
     * @tc.desc Verify toSorted() returns zero, one, and the maximum unsigned 64-bit integer in ascending order without modifying the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, 1n, 0n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1000
     * @tc.name testBigUint64ArrayToSorted010
     * @tc.desc Verify toSorted() orders adjacent max uint64 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, MAX_UINT64_VALUE - 1n, MAX_UINT64_VALUE - 2n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE - 2n);
      expect(resultArray[1]).assertEqual(MAX_UINT64_VALUE - 1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1100
     * @tc.name testBigUint64ArrayToSorted011
     * @tc.desc Verify toSorted() orders values around the signed long boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([HIGH_SIGNED_BOUNDARY_VALUE, SIGNED_LONG_MAX_VALUE, 0n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(SIGNED_LONG_MAX_VALUE);
      expect(resultArray[2]).assertEqual(HIGH_SIGNED_BOUNDARY_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1200
     * @tc.name testBigUint64ArrayToSorted012
     * @tc.desc Verify toSorted() orders modulo stored values from negative and overflow writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray[0] = UINT64_MODULUS_VALUE;
      sourceArray[1] = -1n;
      sourceArray[2] = 1n;
      sourceArray[3] = -2n;
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE - 1n);
      expect(resultArray[3]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1300
     * @tc.name testBigUint64ArrayToSorted013
     * @tc.desc Verify toSorted() handles signed long minimum stored as uint64 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-9223372036854775808n, 7n, 8n]);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(7n);
      expect(resultArray[1]).assertEqual(8n);
      expect(resultArray[2]).assertEqual(SIGNED_LONG_MIN_AS_UINT64);
      expect(sourceArray[0]).assertEqual(SIGNED_LONG_MIN_AS_UINT64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1400
     * @tc.name testBigUint64ArrayToSorted014
     * @tc.desc Verify toSorted() can order a larger array and map boundary indexes correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(20);
      for (let index: int = 0; index < 20; index++) {
        sourceArray[index] = BigInt(19 - index);
      }
      let resultArray = sourceArray.toSorted();
      expect(resultArray.length).assertEqual(20);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[9]).assertEqual(9n);
      expect(resultArray[10]).assertEqual(10n);
      expect(resultArray[19]).assertEqual(19n);
      expect(sourceArray[0]).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1500
     * @tc.name testBigUint64ArrayToSorted015
     * @tc.desc Verify toSorted() uses current values after direct index writes on a length constructed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 30n;
      sourceArray[1] = 10n;
      sourceArray[2] = 20n;
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
      expect(sourceArray[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1600
     * @tc.name testBigUint64ArrayToSorted016
     * @tc.desc Verify toSorted() works on a BigUint64Array.from(Array) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<bigint> = [40n, 20n, 30n, 10n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
      expect(resultArray[3]).assertEqual(40n);
      sourceValues[0] = 1n;
      expect(resultArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1700
     * @tc.name testBigUint64ArrayToSorted017
     * @tc.desc Verify toSorted() works on a BigUint64Array.from(FixedArray) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<bigint> = [9n, 3n, 6n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(6n);
      expect(resultArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1800
     * @tc.name testBigUint64ArrayToSorted018
     * @tc.desc Verify toSorted() works on a BigUint64Array.from(Set) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<bigint> = new Set<bigint>();
      sourceSet.add(30n);
      sourceSet.add(10n);
      sourceSet.add(20n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_1900
     * @tc.name testBigUint64ArrayToSorted019
     * @tc.desc Verify toSorted() result has typed-array properties and a new zero-offset buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let resultArray = sourceArray.toSorted();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceArray.buffer;
      expect(ArrayBuffer.isView(resultArray)).assertTrue();
      expect(resultArray.name).assertEqual('BigUint64Array');
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(24);
      expect(usesDistinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2000
     * @tc.name testBigUint64ArrayToSorted020
     * @tc.desc Verify modifying toSorted() result does not affect the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let resultArray = sourceArray.toSorted();
      resultArray[0] = 100n;
      resultArray[1] = 200n;
      resultArray[2] = 300n;
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2100
     * @tc.name testBigUint64ArrayToSorted021
     * @tc.desc Verify modifying source after toSorted() does not affect the returned array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let resultArray = sourceArray.toSorted();
      sourceArray[0] = 999n;
      sourceArray[1] = 777n;
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2200
     * @tc.name testBigUint64ArrayToSorted022
     * @tc.desc Verify toSorted() preserves source length byteLength byteOffset and buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let sourceArray = new BigUint64Array(sourceBuffer, 8, 3);
      sourceArray[0] = 30n;
      sourceArray[1] = 10n;
      sourceArray[2] = 20n;
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let byteOffsetBefore: int = sourceArray.byteOffset;
      let bufferBefore = sourceArray.buffer;
      sourceArray.toSorted();
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
      expect(sourceArray.byteOffset).assertEqual(byteOffsetBefore);
      expect(sourceArray.buffer).assertEqual(bufferBefore);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2300
     * @tc.name testBigUint64ArrayToSorted023
     * @tc.desc Verify toSorted() on an ArrayBuffer backed view returns an independent sorted array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer, 0, 3);
      sourceArray[0] = 30n;
      sourceArray[1] = 10n;
      sourceArray[2] = 20n;
      let resultArray = sourceArray.toSorted();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceBuffer;
      resultArray[0] = 900n;
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[1]).assertEqual(20n);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(20n);
      expect(usesDistinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2400
     * @tc.name testBigUint64ArrayToSorted024
     * @tc.desc Verify toSorted() on a nonzero byteOffset view only copies and sorts the selected window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 1n;
      fullView[1] = 30n;
      fullView[2] = 10n;
      fullView[3] = 20n;
      fullView[4] = 5n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let resultArray = offsetView.toSorted();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
      expect(fullView[1]).assertEqual(30n);
      expect(fullView[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2500
     * @tc.name testBigUint64ArrayToSorted025
     * @tc.desc Verify toSorted() on a subarray view copies and sorts only the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([5n, 30n, 10n, 20n, 1n]);
      let childView = parentArray.subarray(1, 4);
      let resultArray = childView.toSorted();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
      expect(parentArray[1]).assertEqual(30n);
      expect(parentArray[3]).assertEqual(20n);
      parentArray[1] = 99n;
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2600
     * @tc.name testBigUint64ArrayToSorted026
     * @tc.desc Verify repeated toSorted() calls produce equal values in independent buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let firstResult = sourceArray.toSorted();
      let secondResult = sourceArray.toSorted();
      let usesIndependentBuffers: boolean = firstResult.buffer !== secondResult.buffer;
      expect(firstResult[0]).assertEqual(secondResult[0]);
      expect(firstResult[1]).assertEqual(secondResult[1]);
      expect(firstResult[2]).assertEqual(secondResult[2]);
      expect(usesIndependentBuffers).assertTrue();
      expect(sourceArray[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2700
     * @tc.name testBigUint64ArrayToSorted027
     * @tc.desc Verify toSorted() is idempotent on an already sorted result and keeps arrays independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 1n, 3n, 2n]);
      let onceSortedArray = sourceArray.toSorted();
      let twiceSortedArray = onceSortedArray.toSorted();
      let usesDistinctBuffer: boolean = twiceSortedArray.buffer !== onceSortedArray.buffer;
      expect(twiceSortedArray[0]).assertEqual(1n);
      expect(twiceSortedArray[1]).assertEqual(2n);
      expect(twiceSortedArray[2]).assertEqual(3n);
      expect(twiceSortedArray[3]).assertEqual(4n);
      expect(usesDistinctBuffer).assertTrue();
      onceSortedArray[0] = 99n;
      expect(twiceSortedArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2800
     * @tc.name testBigUint64ArrayToSorted028
     * @tc.desc Verify toSorted() uses values written by fill and direct index writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.fill(7n);
      sourceArray[1] = 2n;
      sourceArray[2] = 9n;
      let resultArray = sourceArray.toSorted();
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(7n);
      expect(resultArray[2]).assertEqual(7n);
      expect(resultArray[3]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_2900
     * @tc.name testBigUint64ArrayToSorted029
     * @tc.desc Verify toSorted() result can be mutated by fill without affecting the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 1n, 3n, 2n, 4n]);
      let resultArray = sourceArray.toSorted();
      resultArray.fill(0n, 0, 2);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(3n);
      expect(resultArray[4]).assertEqual(5n);
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3000
     * @tc.name testBigUint64ArrayToSorted030
     * @tc.desc Verify toSorted() result can be consumed by join slice and set in sorted order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 1n, 3n, 2n]);
      let resultArray = sourceArray.toSorted();
      let slicedArray = resultArray.slice(1, 3);
      let targetArray = new BigUint64Array(4);
      targetArray.fill(9n);
      targetArray.set(resultArray, 0);
      expect(resultArray.join('|')).assertEqual('1|2|3|4');
      expect(slicedArray[0]).assertEqual(2n);
      expect(slicedArray[1]).assertEqual(3n);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[3]).assertEqual(4n);
      expect(sourceArray[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3100
     * @tc.name testBigUint64ArrayToSorted031
     * @tc.desc Verify toSorted() from byteOffset view returns an independent zero offset sorted copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 40n;
      fullView[2] = 20n;
      fullView[3] = 30n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let resultArray = offsetView.toSorted();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(usesDistinctBuffer).assertTrue();
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(40n);
      resultArray[2] = 99n;
      expect(resultArray[2]).assertEqual(99n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(40n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(30n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3200
     * @tc.name testBigUint64ArrayToSorted032
     * @tc.desc Verify toSorted() on a nested byteOffset subarray returns an independent sorted copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let resultArray = sourceView.toSorted();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sharedBuffer;
      expect(usesDistinctBuffer).assertTrue();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
      expect(fullView[2]).assertEqual(40n);
      expect(fullView[3]).assertEqual(20n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3300
     * @tc.name testBigUint64ArrayToSorted033
     * @tc.desc Verify toSorted() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 90n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 10n;
      fullView[4] = 80n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let sliceCopy = sourceView.slice(0, 3);
      sourceView[1] = 777n;
      let resultArray = sliceCopy.toSorted();
      let sliceUsesDistinctBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      let resultUsesDistinctBuffer: boolean = resultArray.buffer !== sliceCopy.buffer;
      expect(sliceUsesDistinctBuffer).assertTrue();
      expect(resultUsesDistinctBuffer).assertTrue();
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
      expect(sliceCopy[1]).assertEqual(30n);
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3400
     * @tc.name testBigUint64ArrayToSorted034
     * @tc.desc Verify toSorted() on a zero-length byteOffset view returns an empty zero-offset copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let resultArray = sourceView.toSorted();
      let usesDistinctArray: boolean = resultArray !== sourceView;
      expect(usesDistinctArray).assertTrue();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3500
     * @tc.name testBigUint64ArrayToSorted035
     * @tc.desc Verify toSorted() on Set-constructed array sorts unique values into a new array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<bigint> = new Set<bigint>();
      sourceValues.add(15n);
      sourceValues.add(7n);
      sourceValues.add(15n);
      sourceValues.add(11n);
      let sourceArray = new BigUint64Array(sourceValues);
      let resultArray = sourceArray.toSorted();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(usesDistinctArray).assertTrue();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(7n);
      expect(resultArray[1]).assertEqual(11n);
      expect(resultArray[2]).assertEqual(15n);
      expect(sourceArray[0]).assertEqual(15n);
      expect(sourceArray[1]).assertEqual(7n);
      expect(sourceArray[2]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3600
     * @tc.name testBigUint64ArrayToSorted036
     * @tc.desc Verify toSorted() on iterator-constructed array sorts values from the advanced iterator cursor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(20n, 5n, 15n, 10n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let targetArray = new BigUint64Array(sourceIterator);
      let resultArray = targetArray.toSorted();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(15n);
      expect(targetArray[0]).assertEqual(5n);
      expect(targetArray[1]).assertEqual(15n);
      expect(targetArray[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_SORTED_3700
     * @tc.name testBigUint64ArrayToSorted037
     * @tc.desc Verify sibling view writes after toSorted() do not change the returned sorted copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToSorted037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 40n;
      fullView[2] = 20n;
      fullView[3] = 30n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 2);
      let resultArray = sourceView.toSorted();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sharedBuffer;
      siblingView[0] = 200n;
      siblingView[1] = 300n;
      expect(usesDistinctBuffer).assertTrue();
      expect(sourceView[0]).assertEqual(40n);
      expect(sourceView[1]).assertEqual(200n);
      expect(sourceView[2]).assertEqual(300n);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(40n);
    });
  });
}
