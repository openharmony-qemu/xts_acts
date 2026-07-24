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
const WRAPPED_NEGATIVE_ONE_VALUE: bigint = 18446744073709551615n;
const WRAPPED_NEGATIVE_TWO_VALUE: bigint = 18446744073709551614n;

export default function biguint64arraySubarrayTest(): void {

  describe('BigUint64ArraySubarrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0100
     * @tc.name testBigUint64ArraySubarray001
     * @tc.desc Verify subarray() on an empty array returns an empty shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.subarray();
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0200
     * @tc.name testBigUint64ArraySubarray002
     * @tc.desc Verify subarray() without arguments returns a full range view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 11n, 12n, 13n, 14n);
      let resultArray = sourceArray.subarray();
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[4]).assertEqual(14n);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0300
     * @tc.name testBigUint64ArraySubarray003
     * @tc.desc Verify subarray() on a single element array keeps the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(42n);
      let resultArray = sourceArray.subarray();
      expect(resultArray.length).assertEqual(1);
      expect(resultArray.byteLength).assertEqual(8);
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0400
     * @tc.name testBigUint64ArraySubarray004
     * @tc.desc Verify subarray(begin) skips elements before a positive begin index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let resultArray = sourceArray.subarray(2);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0500
     * @tc.name testBigUint64ArraySubarray005
     * @tc.desc Verify subarray(begin) returns an empty view when begin equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n);
      let resultArray = sourceArray.subarray(sourceArray.length);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(24);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0600
     * @tc.name testBigUint64ArraySubarray006
     * @tc.desc Verify subarray(begin) clamps a large positive begin index to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let resultArray = sourceArray.subarray(2147483647);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(sourceArray.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0700
     * @tc.name testBigUint64ArraySubarray007
     * @tc.desc Verify subarray(negative begin) starts from the tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(7n, 8n, 9n);
      let resultArray = sourceArray.subarray(-1);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0800
     * @tc.name testBigUint64ArraySubarray008
     * @tc.desc Verify subarray(negative length begin) normalizes to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let resultArray = sourceArray.subarray(-5);
      expect(resultArray.length).assertEqual(5);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_0900
     * @tc.name testBigUint64ArraySubarray009
     * @tc.desc Verify subarray(very negative begin) clamps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let beginIndex: int = -2147483648;
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1000
     * @tc.name testBigUint64ArraySubarray010
     * @tc.desc Verify subarray(begin end) returns a full range view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 11n, 12n, 13n);
      let resultArray = sourceArray.subarray(0, 4);
      expect(resultArray.length).assertEqual(4);
      expect(resultArray.byteLength).assertEqual(32);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[3]).assertEqual(13n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1100
     * @tc.name testBigUint64ArraySubarray011
     * @tc.desc Verify subarray(begin end) returns an interior positive range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n, 25n);
      let resultArray = sourceArray.subarray(1, 4);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1200
     * @tc.name testBigUint64ArraySubarray012
     * @tc.desc Verify subarray(begin end) returns empty when begin equals end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(55n, 66n, 77n);
      let resultArray = sourceArray.subarray(1, 1);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1300
     * @tc.name testBigUint64ArraySubarray013
     * @tc.desc Verify subarray(begin end) returns empty when begin is greater than end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n);
      let resultArray = sourceArray.subarray(2, 1);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1400
     * @tc.name testBigUint64ArraySubarray014
     * @tc.desc Verify subarray(begin end) clamps an end index beyond length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n, 25n);
      let resultArray = sourceArray.subarray(0, 2147483647);
      expect(resultArray.length).assertEqual(5);
      expect(resultArray.byteLength).assertEqual(40);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[4]).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1500
     * @tc.name testBigUint64ArraySubarray015
     * @tc.desc Verify subarray(begin negative end) excludes elements from the tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n, 25n);
      let resultArray = sourceArray.subarray(0, -1);
      expect(resultArray.length).assertEqual(4);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1600
     * @tc.name testBigUint64ArraySubarray016
     * @tc.desc Verify subarray(negative begin negative end) normalizes both indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n);
      let resultArray = sourceArray.subarray(-4, -1);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1700
     * @tc.name testBigUint64ArraySubarray017
     * @tc.desc Verify subarray(positive begin negative end) excludes both edges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let resultArray = sourceArray.subarray(1, -1);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(200n);
      expect(resultArray[2]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1800
     * @tc.name testBigUint64ArraySubarray018
     * @tc.desc Verify subarray(negative begin positive end) can create an interior tail range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let resultArray = sourceArray.subarray(-3, 4);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(300n);
      expect(resultArray[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_1900
     * @tc.name testBigUint64ArraySubarray019
     * @tc.desc Verify subarray indexes that normalize to begin after end produce an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(200n, 201n, 202n, 203n, 204n, 205n);
      let resultArray = sourceArray.subarray(-1, 3);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2000
     * @tc.name testBigUint64ArraySubarray020
     * @tc.desc Verify subarray(end less than negative length) clamps end to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(200n, 201n, 202n, 203n);
      let resultArray = sourceArray.subarray(0, -100);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2100
     * @tc.name testBigUint64ArraySubarray021
     * @tc.desc Verify subarray() does not mutate the source array before any shared writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let byteOffsetBefore: int = sourceArray.byteOffset;
      sourceArray.subarray(1, 4);
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
      expect(sourceArray.byteOffset).assertEqual(byteOffsetBefore);
      expect(sourceArray.join()).assertEqual('100,200,300,400,500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2200
     * @tc.name testBigUint64ArraySubarray022
     * @tc.desc Verify source writes are visible through a subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1000n, 2000n, 3000n, 4000n);
      let resultArray = sourceArray.subarray(1, 3);
      sourceArray[1] = 2222n;
      sourceArray[2] = 3333n;
      expect(resultArray[0]).assertEqual(2222n);
      expect(resultArray[1]).assertEqual(3333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2300
     * @tc.name testBigUint64ArraySubarray023
     * @tc.desc Verify subarray writes are visible through the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1000n, 2000n, 3000n, 4000n);
      let resultArray = sourceArray.subarray(1, 4);
      resultArray[0] = 2222n;
      resultArray[2] = 4444n;
      expect(sourceArray[0]).assertEqual(1000n);
      expect(sourceArray[1]).assertEqual(2222n);
      expect(sourceArray[3]).assertEqual(4444n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2400
     * @tc.name testBigUint64ArraySubarray024
     * @tc.desc Verify writes outside a subarray window do not change view element mapping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1000n, 2000n, 3000n, 4000n, 5000n);
      let resultArray = sourceArray.subarray(2, 4);
      sourceArray[0] = 1111n;
      sourceArray[4] = 5555n;
      expect(resultArray[0]).assertEqual(3000n);
      expect(resultArray[1]).assertEqual(4000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2500
     * @tc.name testBigUint64ArraySubarray025
     * @tc.desc Verify overlapping subarray views observe writes to the shared window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1000n, 2000n, 3000n, 4000n, 5000n, 6000n);
      let firstView = sourceArray.subarray(0, 4);
      let secondView = sourceArray.subarray(2, 6);
      firstView[2] = 3333n;
      secondView[1] = 4444n;
      expect(secondView[0]).assertEqual(3333n);
      expect(firstView[3]).assertEqual(4444n);
      expect(sourceArray[3]).assertEqual(4444n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2600
     * @tc.name testBigUint64ArraySubarray026
     * @tc.desc Verify nonoverlapping subarray views update separate parent ranges
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1000n, 2000n, 3000n, 4000n, 5000n, 6000n);
      let firstView = sourceArray.subarray(0, 2);
      let secondView = sourceArray.subarray(4, 6);
      firstView[0] = 1111n;
      secondView[0] = 5555n;
      expect(sourceArray[0]).assertEqual(1111n);
      expect(sourceArray[4]).assertEqual(5555n);
      expect(firstView.buffer).assertEqual(secondView.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2700
     * @tc.name testBigUint64ArraySubarray027
     * @tc.desc Verify nested subarray views share the original buffer and accumulate byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let firstView = sourceArray.subarray(1, 5);
      let nestedView = firstView.subarray(1, 3);
      nestedView[0] = 777n;
      expect(nestedView.buffer).assertEqual(sourceArray.buffer);
      expect(nestedView.byteOffset).assertEqual(16);
      expect(sourceArray[2]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2800
     * @tc.name testBigUint64ArraySubarray028
     * @tc.desc Verify subarray from a nonzero byteOffset view accumulates the buffer relative offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let resultArray = offsetView.subarray(1, 3);
      expect(resultArray.buffer).assertEqual(sourceBuffer);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.byteLength).assertEqual(16);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_2900
     * @tc.name testBigUint64ArraySubarray029
     * @tc.desc Verify writes through a subarray from a nonzero byteOffset view update the full view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let resultArray = offsetView.subarray(1, 3);
      resultArray[0] = 333n;
      resultArray[1] = 444n;
      expect(fullView[2]).assertEqual(333n);
      expect(fullView[3]).assertEqual(444n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3000
     * @tc.name testBigUint64ArraySubarray030
     * @tc.desc Verify subarray() preserves max uint64 elements exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, MAX_UINT64_VALUE, 1n, MAX_UINT64_VALUE]);
      let resultArray = sourceArray.subarray(1, 4);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3100
     * @tc.name testBigUint64ArraySubarray031
     * @tc.desc Verify subarray() exposes modulo stored negative and overflow values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray[0] = -1n;
      sourceArray[1] = -2n;
      sourceArray[2] = UINT64_MODULUS_VALUE;
      sourceArray[3] = UINT64_MODULUS_VALUE + 1n;
      let resultArray = sourceArray.subarray(0, 4);
      expect(resultArray[0]).assertEqual(WRAPPED_NEGATIVE_ONE_VALUE);
      expect(resultArray[1]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(resultArray[2]).assertEqual(0n);
      expect(resultArray[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3200
     * @tc.name testBigUint64ArraySubarray032
     * @tc.desc Verify an empty subarray keeps a shared buffer and a valid computed byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1000n, 2000n, 3000n, 4000n, 5000n);
      let resultArray = sourceArray.subarray(4, 4);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(32);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3300
     * @tc.name testBigUint64ArraySubarray033
     * @tc.desc Verify subarray() result remains a typed ArrayBuffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n);
      let resultArray = sourceArray.subarray(0, 2);
      expect(ArrayBuffer.isView(resultArray)).assertTrue();
      expect(resultArray.name).assertEqual('BigUint64Array');
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3400
     * @tc.name testBigUint64ArraySubarray034
     * @tc.desc Verify subarray(begin: int) accepts binary literal 0b10 and returns a shared view from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let binaryBeginIndex: int = 0b10;
      let resultArray = sourceArray.subarray(binaryBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3500
     * @tc.name testBigUint64ArraySubarray035
     * @tc.desc Verify subarray(begin: int) accepts octal literal 0o2 and returns a shared view from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let octalBeginIndex: int = 0o2;
      let resultArray = sourceArray.subarray(octalBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3600
     * @tc.name testBigUint64ArraySubarray036
     * @tc.desc Verify subarray(begin: int) accepts hexadecimal literal 0x2 and returns a shared view from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let hexadecimalBeginIndex: int = 0x2;
      let resultArray = sourceArray.subarray(hexadecimalBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3700
     * @tc.name testBigUint64ArraySubarray037
     * @tc.desc Verify subarray(begin: int, end: int) accepts binary literals 0b1 and 0b100 for shared range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n, 25n);
      let binaryBeginIndex: int = 0b1;
      let binaryEndIndex: int = 0b100;
      let resultArray = sourceArray.subarray(binaryBeginIndex, binaryEndIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3800
     * @tc.name testBigUint64ArraySubarray038
     * @tc.desc Verify subarray(begin: int, end: int) accepts octal literals 0o1 and 0o4 for shared range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n, 25n);
      let octalBeginIndex: int = 0o1;
      let octalEndIndex: int = 0o4;
      let resultArray = sourceArray.subarray(octalBeginIndex, octalEndIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_3900
     * @tc.name testBigUint64ArraySubarray039
     * @tc.desc Verify subarray(begin: int, end: int) accepts hexadecimal literals 0x1 and 0x4 for shared range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n, 25n);
      let hexadecimalBeginIndex: int = 0x1;
      let hexadecimalEndIndex: int = 0x4;
      let resultArray = sourceArray.subarray(hexadecimalBeginIndex, hexadecimalEndIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4000
     * @tc.name testBigUint64ArraySubarray040
     * @tc.desc Verify subarray(begin: byte) accepts declared byte begin 2 and returns a shared view from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let beginIndex: byte = 2;
      let resultArray = sourceArray.subarray(beginIndex);
      resultArray[0] = 333n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(333n);
      expect(resultArray[2]).assertEqual(50n);
      expect(sourceArray[2]).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4100
     * @tc.name testBigUint64ArraySubarray041
     * @tc.desc Verify subarray(begin: short) accepts declared short begin 2 and returns a shared view from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(15n, 25n, 35n, 45n, 55n);
      let beginIndex: short = 2;
      let resultArray = sourceArray.subarray(beginIndex);
      resultArray[1] = 444n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(35n);
      expect(resultArray[1]).assertEqual(444n);
      expect(sourceArray[3]).assertEqual(444n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4200
     * @tc.name testBigUint64ArraySubarray042
     * @tc.desc Verify subarray(end: byte) accepts declared byte end 4 and returns shared range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let beginIndex: int = 1;
      let endIndex: byte = 4;
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      resultArray[1] = 333n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[1]).assertEqual(333n);
      expect(sourceArray[2]).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4300
     * @tc.name testBigUint64ArraySubarray043
     * @tc.desc Verify subarray(end: short) accepts declared short end 4 and returns shared range [1, 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(15n, 25n, 35n, 45n, 55n);
      let beginIndex: int = 1;
      let endIndex: short = 4;
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      resultArray[2] = 444n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[2]).assertEqual(444n);
      expect(sourceArray[3]).assertEqual(444n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4400
     * @tc.name testBigUint64ArraySubarray044
     * @tc.desc Verify subarray(begin: int) accepts decimal literal 2 and returns a shared view from index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let decimalBeginIndex: int = 2;
      let resultArray = sourceArray.subarray(decimalBeginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4500
     * @tc.name testBigUint64ArraySubarray045
     * @tc.desc Verify byteOffset view subarray returns empty when positive begin meets normalized negative end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sourceBuffer, 0, 7);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 5);
      let beginIndex: int = 4;
      let tailEndIndex: int = -1;
      let resultArray = offsetView.subarray(beginIndex, tailEndIndex);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(40);
      expect(resultArray.buffer).assertEqual(sourceBuffer);
      expect(fullView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4600
     * @tc.name testBigUint64ArraySubarray046
     * @tc.desc Verify subarray without arguments on a byteOffset view returns the full local shared window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let resultArray = offsetView.subarray();
      resultArray[0] = 111n;
      resultArray[3] = 444n;
      expect(resultArray.length).assertEqual(4);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.byteLength).assertEqual(32);
      expect(resultArray.buffer).assertEqual(sourceBuffer);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(111n);
      expect(fullView[4]).assertEqual(444n);
      expect(fullView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4700
     * @tc.name testBigUint64ArraySubarray047
     * @tc.desc Verify subarray without arguments on a zero-length byteOffset view returns an empty shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let resultArray = zeroLengthView.subarray();
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceBuffer);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4800
     * @tc.name testBigUint64ArraySubarray048
     * @tc.desc Verify subarray from a slice copy of a byteOffset view shares only the slice buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let sliceCopy = offsetView.slice(1, 4);
      let resultArray = sliceCopy.subarray(1, 3);
      resultArray[0] = 777n;
      let differsFromSourceBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(differsFromSourceBuffer).assertTrue();
      expect(resultArray.buffer).assertEqual(sliceCopy.buffer);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(777n);
      expect(resultArray[1]).assertEqual(50n);
      expect(sliceCopy[1]).assertEqual(777n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_4900
     * @tc.name testBigUint64ArraySubarray049
     * @tc.desc Verify subarray accepts a declared negative byte begin and returns the last two shared elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: byte = -2;
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5000
     * @tc.name testBigUint64ArraySubarray050
     * @tc.desc Verify subarray accepts a declared negative short begin and returns the last three shared elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: short = -3;
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5100
     * @tc.name testBigUint64ArraySubarray051
     * @tc.desc Verify long toInt conversion supplies begin index two before creating a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let longBeginSource: long = 4294967298;
      let beginIndex: int = longBeginSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5200
     * @tc.name testBigUint64ArraySubarray052
     * @tc.desc Verify long toInt conversion supplies end index four before creating a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let longEndSource: long = 4294967300;
      let endIndex: int = longEndSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5300
     * @tc.name testBigUint64ArraySubarray053
     * @tc.desc Verify float toInt conversion truncates begin one point nine before creating a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let floatBeginSource: float = 1.9f;
      let beginIndex: int = floatBeginSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5400
     * @tc.name testBigUint64ArraySubarray054
     * @tc.desc Verify negative float toInt conversion truncates begin toward zero before tail normalization
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let floatBeginSource: float = -2.9f;
      let beginIndex: int = floatBeginSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray.byteOffset).assertEqual(24);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[1]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5500
     * @tc.name testBigUint64ArraySubarray055
     * @tc.desc Verify double toInt conversion truncates begin two point nine before creating a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let doubleBeginSource: double = 2.9;
      let beginIndex: int = doubleBeginSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(16);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5600
     * @tc.name testBigUint64ArraySubarray056
     * @tc.desc Verify negative double toInt conversion truncates begin toward zero before tail normalization
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let doubleBeginSource: double = -3.9;
      let beginIndex: int = doubleBeginSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(24);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5700
     * @tc.name testBigUint64ArraySubarray057
     * @tc.desc Verify float toInt conversion truncates end four point nine before creating a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let floatEndSource: float = 4.9f;
      let endIndex: int = floatEndSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5800
     * @tc.name testBigUint64ArraySubarray058
     * @tc.desc Verify subarray uses end -1 from double -1.9 toInt conversion and returns a three-element view at byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let doubleEndSource: double = -1.9;
      let endIndex: int = doubleEndSource.toInt();
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_5900
     * @tc.name testBigUint64ArraySubarray059
     * @tc.desc Verify subarray accepts a declared negative byte end and excludes the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 1;
      let endIndex: byte = -1;
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(8);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6000
     * @tc.name testBigUint64ArraySubarray060
     * @tc.desc Verify subarray accepts a declared negative short end and excludes two tail elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let beginIndex: int = 0;
      let endIndex: short = -2;
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6100
     * @tc.name testBigUint64ArraySubarray061
     * @tc.desc Verify subarray clamps minimum int begin to zero and returns a two-element view at byteOffset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = -2147483648;
      let endIndex: int = 2;
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6200
     * @tc.name testBigUint64ArraySubarray062
     * @tc.desc Verify length minus one begin and length end select the terminal shared element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = sourceArray.length - 1;
      let endIndex: int = sourceArray.length;
      let resultArray = sourceArray.subarray(beginIndex, endIndex);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray.byteOffset).assertEqual(24);
      expect(resultArray[0]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6300
     * @tc.name testBigUint64ArraySubarray063
     * @tc.desc Verify a negative begin on a byteOffset view selects the local tail and writes through
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sourceBuffer, 0, 7);
      fullView.set([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let offsetView = new BigUint64Array(sourceBuffer, 8, 5);
      let beginIndex: int = -2;
      let resultArray = offsetView.subarray(beginIndex);
      resultArray[0] = 555n;
      expect(resultArray.byteOffset).assertEqual(32);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(555n);
      expect(resultArray[1]).assertEqual(60n);
      expect(fullView[4]).assertEqual(555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6400
     * @tc.name testBigUint64ArraySubarray064
     * @tc.desc Verify negative begin and end on a byteOffset view select one shared local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(64);
      let fullView = new BigUint64Array(sourceBuffer, 0, 8);
      fullView.set([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n]);
      let offsetView = new BigUint64Array(sourceBuffer, 8, 6);
      let beginIndex: int = -4;
      let endIndex: int = -1;
      let resultArray = offsetView.subarray(beginIndex, endIndex);
      resultArray[2] = 666n;
      expect(resultArray.byteOffset).assertEqual(24);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(666n);
      expect(fullView[5]).assertEqual(666n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6500
     * @tc.name testBigUint64ArraySubarray065
     * @tc.desc Verify a terminal empty subarray on a byteOffset view retains the original buffer end offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(56);
      let offsetView = new BigUint64Array(sourceBuffer, 16, 4);
      let beginIndex: int = offsetView.length;
      let resultArray = offsetView.subarray(beginIndex);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(48);
      expect(resultArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6600
     * @tc.name testBigUint64ArraySubarray066
     * @tc.desc Verify binary negative begin minus two creates a shared tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(-0b10);
      resultArray[0] = 300n;
      expect(sourceArray[2]).assertEqual(300n);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6700
     * @tc.name testBigUint64ArraySubarray067
     * @tc.desc Verify octal negative begin minus two creates a shared tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(-0o2);
      resultArray[1] = 400n;
      expect(sourceArray[3]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6800
     * @tc.name testBigUint64ArraySubarray068
     * @tc.desc Verify hexadecimal negative begin minus two creates a shared tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(-0x2);
      expect(resultArray.join(',')).assertEqual('30,40');
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_6900
     * @tc.name testBigUint64ArraySubarray069
     * @tc.desc Verify byte source converted by toInt supplies shared begin index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteBeginSource: byte = 2;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(byteBeginSource.toInt());
      resultArray[0] = 300n;
      expect(sourceArray[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_7000
     * @tc.name testBigUint64ArraySubarray070
     * @tc.desc Verify short source converted by toInt supplies shared exclusive end index three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortEndSource: short = 3;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(1, shortEndSource.toInt());
      resultArray[1] = 300n;
      expect(sourceArray[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_7100
     * @tc.name testBigUint64ArraySubarray071
     * @tc.desc Verify number source converted by toInt supplies truncated shared begin index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberBeginSource: number = 2.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(numberBeginSource.toInt());
      expect(resultArray.join(',')).assertEqual('30,40');
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_7200
     * @tc.name testBigUint64ArraySubarray072
     * @tc.desc Verify short source converted by toInt supplies begin index two for a shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortBeginSource: short = 2;
      let beginIndex: int = shortBeginSource.toInt();
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(beginIndex);
      sourceArray[2] = 300n;
      expect(resultArray[0]).assertEqual(300n);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SUBARRAY_7300
     * @tc.name testBigUint64ArraySubarray073
     * @tc.desc Verify byte source converted by toInt supplies exclusive end index three for a shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySubarray073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteEndSource: byte = 3;
      let endIndex: int = byteEndSource.toInt();
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let resultArray = sourceArray.subarray(1, endIndex);
      resultArray[1] = 300n;
      expect(sourceArray[2]).assertEqual(300n);
      expect(resultArray.buffer).assertEqual(sourceArray.buffer);
    });

  });
}
