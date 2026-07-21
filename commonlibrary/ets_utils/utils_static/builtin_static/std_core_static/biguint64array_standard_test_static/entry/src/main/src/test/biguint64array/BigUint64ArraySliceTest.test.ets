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
const UINT64_MODULUS_VALUE: bigint = 18446744073709551616n;
const WRAPPED_NEGATIVE_ONE_VALUE: bigint = 18446744073709551615n;
const WRAPPED_NEGATIVE_TWO_VALUE: bigint = 18446744073709551614n;

export default function biguint64arraySliceTest(): void {

  describe('BigUint64ArraySliceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0100
     * @tc.name testBigUint64ArraySlice001
     * @tc.desc Verify slice() on an empty array returns an empty copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.slice();
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0200
     * @tc.name testBigUint64ArraySlice002
     * @tc.desc Verify slice() copies every element of a multi element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n, 400n, 500n]);
      let resultArray = sourceArray.slice();
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual(100n);
      expect(resultArray[2]).assertEqual(300n);
      expect(resultArray[4]).assertEqual(500n);
      expect(sourceArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0300
     * @tc.name testBigUint64ArraySlice003
     * @tc.desc Verify slice() on a single element array keeps the only value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let resultArray = sourceArray.slice();
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(42n);
      expect(resultArray.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0400
     * @tc.name testBigUint64ArraySlice004
     * @tc.desc Verify slice(begin) skips elements before a positive begin index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let resultArray = sourceArray.slice(2);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0500
     * @tc.name testBigUint64ArraySlice005
     * @tc.desc Verify slice(begin) returns empty when begin equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.slice(sourceArray.length);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0600
     * @tc.name testBigUint64ArraySlice006
     * @tc.desc Verify slice(begin) clamps a large positive begin index to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.slice(2147483647);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0700
     * @tc.name testBigUint64ArraySlice007
     * @tc.desc Verify slice(negative begin) starts from the tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 8n, 9n]);
      let resultArray = sourceArray.slice(-1);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0800
     * @tc.name testBigUint64ArraySlice008
     * @tc.desc Verify slice(negative length begin) normalizes to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let resultArray = sourceArray.slice(-5);
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_0900
     * @tc.name testBigUint64ArraySlice009
     * @tc.desc Verify slice(very negative begin) normalizes to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.slice(-2147483647);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1000
     * @tc.name testBigUint64ArraySlice010
     * @tc.desc Verify slice(begin end) returns empty when begin equals end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([55n, 66n, 77n]);
      let resultArray = sourceArray.slice(0, 0);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1100
     * @tc.name testBigUint64ArraySlice011
     * @tc.desc Verify slice(begin end) copies an interior positive range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let resultArray = sourceArray.slice(1, 4);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1200
     * @tc.name testBigUint64ArraySlice012
     * @tc.desc Verify slice(begin end) returns empty when begin is greater than end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let resultArray = sourceArray.slice(2, 1);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1300
     * @tc.name testBigUint64ArraySlice013
     * @tc.desc Verify slice(begin end) clamps an end index beyond length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let resultArray = sourceArray.slice(0, 2147483647);
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[4]).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1400
     * @tc.name testBigUint64ArraySlice014
     * @tc.desc Verify slice(begin negative end) excludes elements from the tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let resultArray = sourceArray.slice(0, -1);
      expect(resultArray.length).assertEqual(4);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1500
     * @tc.name testBigUint64ArraySlice015
     * @tc.desc Verify slice(negative begin negative end) normalizes both indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let resultArray = sourceArray.slice(-4, -1);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1600
     * @tc.name testBigUint64ArraySlice016
     * @tc.desc Verify slice() preserves zero elements exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 100n, 0n, 200n, 0n]);
      let resultArray = sourceArray.slice(1, 4);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(100n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1700
     * @tc.name testBigUint64ArraySlice017
     * @tc.desc Verify slice() preserves max uint64 elements exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, MAX_UINT64_VALUE, 1n, MAX_UINT64_VALUE]);
      let resultArray = sourceArray.slice(1, 4);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1800
     * @tc.name testBigUint64ArraySlice018
     * @tc.desc Verify slice() copies modulo stored negative and overflow values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray[0] = -1n;
      sourceArray[1] = -2n;
      sourceArray[2] = UINT64_MODULUS_VALUE;
      sourceArray[3] = UINT64_MODULUS_VALUE + 1n;
      let resultArray = sourceArray.slice(0, 4);
      expect(resultArray[0]).assertEqual(WRAPPED_NEGATIVE_ONE_VALUE);
      expect(resultArray[1]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(resultArray[2]).assertEqual(0n);
      expect(resultArray[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_1900
     * @tc.name testBigUint64ArraySlice019
     * @tc.desc Verify modifying a slice result does not change the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([64n, 128n, 256n]);
      let resultArray = sourceArray.slice(0, 2);
      resultArray[0] = 999n;
      resultArray[1] = 888n;
      expect(sourceArray[0]).assertEqual(64n);
      expect(sourceArray[1]).assertEqual(128n);
      expect(resultArray[0]).assertEqual(999n);
      expect(resultArray[1]).assertEqual(888n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2000
     * @tc.name testBigUint64ArraySlice020
     * @tc.desc Verify modifying the source array after slice does not change the result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18n, 36n, 54n, 72n]);
      let resultArray = sourceArray.slice(1, 4);
      sourceArray[1] = 999n;
      sourceArray[3] = 777n;
      expect(resultArray[0]).assertEqual(36n);
      expect(resultArray[1]).assertEqual(54n);
      expect(resultArray[2]).assertEqual(72n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2100
     * @tc.name testBigUint64ArraySlice021
     * @tc.desc Verify slice() creates an independent buffer with zero byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([13n, 26n, 39n, 52n]);
      let resultArray = sourceArray.slice(0, 4);
      let hasDifferentBuffer: boolean = resultArray.buffer !== sourceArray.buffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(sourceArray.byteLength);
      expect(resultArray.byteLength).assertEqual(resultArray.length * resultArray.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2200
     * @tc.name testBigUint64ArraySlice022
     * @tc.desc Verify slice() from a byteOffset view copies values into a new zero offset buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let resultArray = offsetView.slice(0, 2);
      let hasDifferentBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
      expect(fullView[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2300
     * @tc.name testBigUint64ArraySlice023
     * @tc.desc Verify repeated slice() calls return independent copies
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n, 44n, 55n, 66n]);
      let firstSlice = sourceArray.slice(0, 3);
      let secondSlice = sourceArray.slice(3, 6);
      firstSlice[0] = 777n;
      secondSlice[0] = 888n;
      let slicesUseDifferentBuffers: boolean = firstSlice.buffer !== secondSlice.buffer;
      expect(slicesUseDifferentBuffers).assertTrue();
      expect(sourceArray[0]).assertEqual(11n);
      expect(sourceArray[3]).assertEqual(44n);
      expect(firstSlice[0]).assertEqual(777n);
      expect(secondSlice[0]).assertEqual(888n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2400
     * @tc.name testBigUint64ArraySlice024
     * @tc.desc Verify slicing a slice returns another independent copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([50n, 100n, 150n, 200n, 250n]);
      let firstSlice = sourceArray.slice(1, 5);
      let secondSlice = firstSlice.slice(0, 2);
      firstSlice[0] = 999n;
      let slicesUseDifferentBuffers: boolean = secondSlice.buffer !== firstSlice.buffer;
      expect(slicesUseDifferentBuffers).assertTrue();
      expect(secondSlice.length).assertEqual(2);
      expect(secondSlice[0]).assertEqual(100n);
      expect(secondSlice[1]).assertEqual(150n);
      expect(sourceArray[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2500
     * @tc.name testBigUint64ArraySlice025
     * @tc.desc Verify slice(begin: int) accepts binary literal 0b10 and copies elements from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let binaryBeginIndex: int = 0b10;
      let resultArray = sourceArray.slice(binaryBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2600
     * @tc.name testBigUint64ArraySlice026
     * @tc.desc Verify slice(begin: int) accepts octal literal 0o2 and copies elements from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let octalBeginIndex: int = 0o2;
      let resultArray = sourceArray.slice(octalBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2700
     * @tc.name testBigUint64ArraySlice027
     * @tc.desc Verify slice(begin: int) accepts hexadecimal literal 0x2 and copies elements from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let hexadecimalBeginIndex: int = 0x2;
      let resultArray = sourceArray.slice(hexadecimalBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2800
     * @tc.name testBigUint64ArraySlice028
     * @tc.desc Verify slice(begin: int, end: int) accepts binary literals 0b1 and 0b100 for range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let binaryBeginIndex: int = 0b1;
      let binaryEndIndex: int = 0b100;
      let resultArray = sourceArray.slice(binaryBeginIndex, binaryEndIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_2900
     * @tc.name testBigUint64ArraySlice029
     * @tc.desc Verify slice(begin: int, end: int) accepts octal literals 0o1 and 0o4 for range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let octalBeginIndex: int = 0o1;
      let octalEndIndex: int = 0o4;
      let resultArray = sourceArray.slice(octalBeginIndex, octalEndIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3000
     * @tc.name testBigUint64ArraySlice030
     * @tc.desc Verify slice(begin: int, end: int) accepts hexadecimal literals 0x1 and 0x4 for range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let hexadecimalBeginIndex: int = 0x1;
      let hexadecimalEndIndex: int = 0x4;
      let resultArray = sourceArray.slice(hexadecimalBeginIndex, hexadecimalEndIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3100
     * @tc.name testBigUint64ArraySlice031
     * @tc.desc Verify slice(begin: byte) accepts declared byte begin 2 and copies elements from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: byte = 2;
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3200
     * @tc.name testBigUint64ArraySlice032
     * @tc.desc Verify slice(begin: short) accepts declared short begin 2 and copies elements from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: short = 2;
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3300
     * @tc.name testBigUint64ArraySlice033
     * @tc.desc Verify slice(end: byte) accepts declared byte end 4 and returns range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let endIndex: byte = 4;
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3400
     * @tc.name testBigUint64ArraySlice034
     * @tc.desc Verify slice(end: short) accepts declared short end 4 and returns range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let endIndex: short = 4;
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3500
     * @tc.name testBigUint64ArraySlice035
     * @tc.desc Verify writing slice result from byteOffset view does not update the shared source buffer window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let resultArray = sourceView.slice(0, 2);
      let hasDifferentBuffer: boolean = resultArray.buffer !== sharedBuffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(2);
      resultArray[0] = 99n;
      expect(resultArray[0]).assertEqual(99n);
      expect(resultArray[1]).assertEqual(30n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3600
     * @tc.name testBigUint64ArraySlice036
     * @tc.desc Verify slicing a subarray target returns an independent copy after octal begin normalization
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sourceView = parentArray.subarray(1, 5);
      let octalBeginIndex: int = 0o1;
      let binaryEndIndex: int = 0b100;
      let resultArray = sourceView.slice(octalBeginIndex, binaryEndIndex);
      parentArray[2] = 99n;
      resultArray[0] = 77n;
      let hasDifferentBuffer: boolean = resultArray.buffer !== parentArray.buffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(77n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(5n);
      expect(parentArray[2]).assertEqual(99n);
      expect(parentArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3700
     * @tc.name testBigUint64ArraySlice037
     * @tc.desc Verify slice(begin: int) accepts decimal literal 2 and copies elements from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let decimalBeginIndex: int = 2;
      let resultArray = sourceArray.slice(decimalBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3800
     * @tc.name testBigUint64ArraySlice038
     * @tc.desc Verify slice returns empty when positive begin meets normalized negative end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let beginIndex: int = 4;
      let tailEndIndex: int = -2;
      let resultArray = sourceArray.slice(beginIndex, tailEndIndex);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_3900
     * @tc.name testBigUint64ArraySlice039
     * @tc.desc Verify subarray slice clamps underflow begin and overflow end inside the view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let sourceView = parentArray.subarray(2, 6);
      let underflowBeginIndex: int = -10;
      let overflowEndIndex: int = 10;
      let resultArray = sourceView.slice(underflowBeginIndex, overflowEndIndex);
      expect(resultArray.length).assertEqual(4);
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(5n);
      expect(resultArray[3]).assertEqual(6n);
      parentArray[2] = 99n;
      resultArray[0] = 77n;
      let hasDifferentBuffer: boolean = resultArray.buffer !== parentArray.buffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray[0]).assertEqual(77n);
      expect(parentArray[2]).assertEqual(99n);
      expect(parentArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4000
     * @tc.name testBigUint64ArraySlice040
     * @tc.desc Verify slice from a nested subarray of a byteOffset view copies the correct shared buffer window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(64);
      let fullView = new BigUint64Array(sourceBuffer, 0, 8);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      fullView[7] = 80n;
      let byteOffset: int = 8;
      let offsetLength: int = 6;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, offsetLength);
      let middleWindow = offsetView.subarray(1, 5);
      let nestedWindow = middleWindow.subarray(1, 4);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let resultArray = nestedWindow.slice(beginIndex, endIndex);
      fullView[4] = 500n;
      resultArray[0] = 77n;
      let hasDifferentBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(77n);
      expect(resultArray[1]).assertEqual(60n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(500n);
      expect(fullView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4100
     * @tc.name testBigUint64ArraySlice041
     * @tc.desc Verify byteOffset view slice captures current shared values and remains stable after source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let sourceView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      fullView[2] = 300n;
      let beginIndex: int = 0;
      let endIndex: int = 3;
      let resultArray = sourceView.slice(beginIndex, endIndex);
      fullView[2] = 33n;
      let hasDifferentBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(300n);
      expect(resultArray[2]).assertEqual(40n);
      expect(fullView[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4200
     * @tc.name testBigUint64ArraySlice042
     * @tc.desc Verify zero-length byteOffset view slice returns an empty independent copy and preserves source data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let beginIndex: int = 0;
      let endIndex: int = 0;
      let resultArray = zeroLengthView.slice(beginIndex, endIndex);
      let hasDifferentBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(hasDifferentBuffer).assertTrue();
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4300
     * @tc.name testBigUint64ArraySlice043
     * @tc.desc Verify slice accepts a declared negative byte begin and returns the last two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: byte = -2;
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4400
     * @tc.name testBigUint64ArraySlice044
     * @tc.desc Verify slice accepts a declared negative short begin and returns the last three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: short = -3;
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4500
     * @tc.name testBigUint64ArraySlice045
     * @tc.desc Verify long toInt conversion supplies begin index two before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let longBeginSource: long = 4294967298;
      let beginIndex: int = longBeginSource.toInt();
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4600
     * @tc.name testBigUint64ArraySlice046
     * @tc.desc Verify long toInt conversion supplies end index four before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let longEndSource: long = 4294967300;
      let endIndex: int = longEndSource.toInt();
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4700
     * @tc.name testBigUint64ArraySlice047
     * @tc.desc Verify float toInt conversion truncates begin one point nine before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let floatBeginSource: float = 1.9f;
      let beginIndex: int = floatBeginSource.toInt();
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4800
     * @tc.name testBigUint64ArraySlice048
     * @tc.desc Verify negative float toInt conversion truncates begin toward zero before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let floatBeginSource: float = -2.9f;
      let beginIndex: int = floatBeginSource.toInt();
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[1]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_4900
     * @tc.name testBigUint64ArraySlice049
     * @tc.desc Verify double toInt conversion truncates begin two point nine before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let doubleBeginSource: double = 2.9;
      let beginIndex: int = doubleBeginSource.toInt();
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5000
     * @tc.name testBigUint64ArraySlice050
     * @tc.desc Verify negative double toInt conversion truncates begin toward zero before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let doubleBeginSource: double = -3.9;
      let beginIndex: int = doubleBeginSource.toInt();
      let resultArray = sourceArray.slice(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5100
     * @tc.name testBigUint64ArraySlice051
     * @tc.desc Verify float toInt conversion truncates end four point nine before slicing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let floatEndSource: float = 4.9f;
      let endIndex: int = floatEndSource.toInt();
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5200
     * @tc.name testBigUint64ArraySlice052
     * @tc.desc Verify slice uses end -1 from double -1.9 toInt conversion and returns values 20n through 40n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let doubleEndSource: double = -1.9;
      let endIndex: int = doubleEndSource.toInt();
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5300
     * @tc.name testBigUint64ArraySlice053
     * @tc.desc Verify slice accepts a declared negative byte end and excludes the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let endIndex: byte = -1;
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5400
     * @tc.name testBigUint64ArraySlice054
     * @tc.desc Verify slice accepts a declared negative short end and excludes two tail elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 0;
      let endIndex: short = -2;
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5500
     * @tc.name testBigUint64ArraySlice055
     * @tc.desc Verify slice clamps minimum int begin to zero and returns a two-element copy ending before index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = -2147483648;
      let endIndex: int = 2;
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5600
     * @tc.name testBigUint64ArraySlice056
     * @tc.desc Verify length minus one begin and length end select the terminal element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = sourceArray.length - 1;
      let endIndex: int = sourceArray.length;
      let resultArray = sourceArray.slice(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5700
     * @tc.name testBigUint64ArraySlice057
     * @tc.desc Verify binary negative begin minus two copies the final two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.slice(-0b10);
      sourceArray[2] = 300n;
      expect(resultArray.join(',')).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5800
     * @tc.name testBigUint64ArraySlice058
     * @tc.desc Verify octal negative begin minus two copies the final two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.slice(-0o2);
      expect(resultArray.join(',')).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_5900
     * @tc.name testBigUint64ArraySlice059
     * @tc.desc Verify hexadecimal negative begin minus two copies the final two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.slice(-0x2);
      expect(resultArray.join(',')).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_6000
     * @tc.name testBigUint64ArraySlice060
     * @tc.desc Verify byte source converted by toInt supplies begin index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteBeginSource: byte = 2;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.slice(byteBeginSource.toInt());
      expect(resultArray.join(',')).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_6100
     * @tc.name testBigUint64ArraySlice061
     * @tc.desc Verify short source converted by toInt supplies exclusive end index three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortEndSource: short = 3;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.slice(1, shortEndSource.toInt());
      expect(resultArray.join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SLICE_6200
     * @tc.name testBigUint64ArraySlice062
     * @tc.desc Verify number source converted by toInt supplies truncated begin index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberBeginSource: number = 2.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.slice(numberBeginSource.toInt());
      expect(resultArray.join(',')).assertEqual('30,40');
    });

  });
}
