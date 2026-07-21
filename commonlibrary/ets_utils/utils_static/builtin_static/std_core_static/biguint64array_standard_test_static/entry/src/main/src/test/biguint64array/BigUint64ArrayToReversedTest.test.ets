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
const WRAPPED_NEGATIVE_TWO_VALUE: bigint = 18446744073709551614n;
const SIGNED_LONG_MIN_AS_UINT64: bigint = 9223372036854775808n;

export default function biguint64arrayToReversedTest(): void {

  describe('BigUint64ArrayToReversedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0100
     * @tc.name testBigUint64ArrayToReversed001
     * @tc.desc Verify toReversed() on an empty array returns an empty independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.toReversed();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(usesDistinctArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0200
     * @tc.name testBigUint64ArrayToReversed002
     * @tc.desc Verify toReversed() on a single element array copies the element and leaves source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let resultArray = sourceArray.toReversed();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(resultArray.length).assertEqual(1);
      expect(resultArray.byteLength).assertEqual(8);
      expect(resultArray[0]).assertEqual(42n);
      expect(sourceArray[0]).assertEqual(42n);
      expect(usesDistinctArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0300
     * @tc.name testBigUint64ArrayToReversed003
     * @tc.desc Verify toReversed() swaps two elements in the returned array only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(1n);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0400
     * @tc.name testBigUint64ArrayToReversed004
     * @tc.desc Verify toReversed() on an odd length array swaps ends and preserves the middle value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(50n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(30n);
      expect(resultArray[3]).assertEqual(20n);
      expect(resultArray[4]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0500
     * @tc.name testBigUint64ArrayToReversed005
     * @tc.desc Verify toReversed() preserves all zero elements in a new array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      let resultArray = sourceArray.toReversed();
      expect(resultArray.length).assertEqual(4);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(0n);
      expect(resultArray[3]).assertEqual(0n);
      resultArray[0] = 9n;
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0600
     * @tc.name testBigUint64ArrayToReversed006
     * @tc.desc Verify toReversed() moves max uint64 from the end to the start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, MAX_UINT64_VALUE]);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0700
     * @tc.name testBigUint64ArrayToReversed007
     * @tc.desc Verify toReversed() preserves adjacent uint64 maximum boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, MAX_UINT64_VALUE - 1n, MAX_UINT64_VALUE - 2n]);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE - 2n);
      expect(resultArray[1]).assertEqual(MAX_UINT64_VALUE - 1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0800
     * @tc.name testBigUint64ArrayToReversed008
     * @tc.desc Verify toReversed() preserves values greater than signed long max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let highBoundaryValue: bigint = 9223372036854775808n;
      let sourceArray = new BigUint64Array([10n, highBoundaryValue, 30n]);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(highBoundaryValue);
      expect(resultArray[2]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(highBoundaryValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_0900
     * @tc.name testBigUint64ArrayToReversed009
     * @tc.desc Verify toReversed() preserves modulo stored values for negative BigInt writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = -1n;
      sourceArray[1] = 0n;
      sourceArray[2] = -2n;
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1000
     * @tc.name testBigUint64ArrayToReversed010
     * @tc.desc Verify toReversed() preserves modulo stored values for overflow BigInt writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = UINT64_MODULUS_VALUE;
      sourceArray[1] = 42n;
      sourceArray[2] = UINT64_MODULUS_VALUE + 1n;
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(42n);
      expect(resultArray[2]).assertEqual(0n);
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1100
     * @tc.name testBigUint64ArrayToReversed011
     * @tc.desc Verify toReversed() handles signed long minimum stored as uint64 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-9223372036854775808n, 7n, 8n]);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(8n);
      expect(resultArray[1]).assertEqual(7n);
      expect(resultArray[2]).assertEqual(SIGNED_LONG_MIN_AS_UINT64);
      expect(sourceArray[0]).assertEqual(SIGNED_LONG_MIN_AS_UINT64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1200
     * @tc.name testBigUint64ArrayToReversed012
     * @tc.desc Verify toReversed() can be applied after values are written through set()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.set(new BigUint64Array([10n, 20n, 30n, 40n]));
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(20n);
      expect(resultArray[3]).assertEqual(10n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1300
     * @tc.name testBigUint64ArrayToReversed013
     * @tc.desc Verify toReversed() works on a BigUint64Array.of() result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(10n);
      expect(resultArray[3]).assertEqual(5n);
      expect(sourceArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1400
     * @tc.name testBigUint64ArrayToReversed014
     * @tc.desc Verify toReversed() works on a BigUint64Array.from(Array) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n, 4n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(4n);
      expect(resultArray[3]).assertEqual(1n);
      sourceValues[0] = 99n;
      expect(resultArray[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1500
     * @tc.name testBigUint64ArrayToReversed015
     * @tc.desc Verify toReversed() works on a BigUint64Array.from(FixedArray) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [100n, 200n, 300n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(300n);
      expect(resultArray[1]).assertEqual(200n);
      expect(resultArray[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1600
     * @tc.name testBigUint64ArrayToReversed016
     * @tc.desc Verify toReversed() works on a BigUint64Array.from(Set) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(11n);
      sourceSet.add(22n);
      sourceSet.add(33n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(33n);
      expect(resultArray[1]).assertEqual(22n);
      expect(resultArray[2]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1700
     * @tc.name testBigUint64ArrayToReversed017
     * @tc.desc Verify toReversed() works on a BigUint64Array.from(Array mapfn) result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let sourceArray = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        return element * 10n;
      });
      let resultArray = sourceArray.toReversed();
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1800
     * @tc.name testBigUint64ArrayToReversed018
     * @tc.desc Verify toReversed() result has typed-array properties and a new zero-offset buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.toReversed();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceArray.buffer;
      expect(ArrayBuffer.isView(resultArray)).assertTrue();
      expect(resultArray.name).assertEqual('BigUint64Array');
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(24);
      expect(usesDistinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_1900
     * @tc.name testBigUint64ArrayToReversed019
     * @tc.desc Verify modifying toReversed() result does not affect the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.toReversed();
      resultArray[0] = 100n;
      resultArray[1] = 200n;
      resultArray[2] = 300n;
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2000
     * @tc.name testBigUint64ArrayToReversed020
     * @tc.desc Verify modifying source after toReversed() does not affect the returned array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.toReversed();
      sourceArray[0] = 999n;
      sourceArray[2] = 777n;
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2100
     * @tc.name testBigUint64ArrayToReversed021
     * @tc.desc Verify toReversed() preserves source length byteLength byteOffset and buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let sourceArray = new BigUint64Array(sourceBuffer, 8, 3);
      sourceArray[0] = 10n;
      sourceArray[1] = 20n;
      sourceArray[2] = 30n;
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let byteOffsetBefore: int = sourceArray.byteOffset;
      let bufferBefore = sourceArray.buffer;
      sourceArray.toReversed();
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
      expect(sourceArray.byteOffset).assertEqual(byteOffsetBefore);
      expect(sourceArray.buffer).assertEqual(bufferBefore);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2200
     * @tc.name testBigUint64ArrayToReversed022
     * @tc.desc Verify toReversed() on an ArrayBuffer backed view returns an independent zero-offset array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer, 0, 3);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray[2] = 300n;
      let resultArray = sourceArray.toReversed();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceBuffer;
      resultArray[0] = 900n;
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[1]).assertEqual(200n);
      expect(sourceArray[0]).assertEqual(100n);
      expect(sourceArray[2]).assertEqual(300n);
      expect(usesDistinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2300
     * @tc.name testBigUint64ArrayToReversed023
     * @tc.desc Verify toReversed() on a nonzero byteOffset view only copies the selected window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 1n;
      fullView[1] = 10n;
      fullView[2] = 20n;
      fullView[3] = 30n;
      fullView[4] = 5n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let resultArray = offsetView.toReversed();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(10n);
      expect(fullView[1]).assertEqual(10n);
      expect(fullView[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2400
     * @tc.name testBigUint64ArrayToReversed024
     * @tc.desc Verify toReversed() on a subarray view copies only the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let childView = parentArray.subarray(1, 4);
      let resultArray = childView.toReversed();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(4n);
      expect(resultArray[1]).assertEqual(3n);
      expect(resultArray[2]).assertEqual(2n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[3]).assertEqual(4n);
      parentArray[3] = 99n;
      expect(resultArray[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2500
     * @tc.name testBigUint64ArrayToReversed025
     * @tc.desc Verify double toReversed() restores element order in a distinct array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n, 8n]);
      let resultArray = sourceArray.toReversed().toReversed();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(6n);
      expect(resultArray[2]).assertEqual(7n);
      expect(resultArray[3]).assertEqual(8n);
      expect(usesDistinctArray).assertTrue();
      resultArray[0] = 500n;
      expect(sourceArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2600
     * @tc.name testBigUint64ArrayToReversed026
     * @tc.desc Verify repeated toReversed() calls do not mutate the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstResult = sourceArray.toReversed();
      let secondResult = sourceArray.toReversed();
      let usesIndependentBuffers: boolean = firstResult.buffer !== secondResult.buffer;
      expect(firstResult[0]).assertEqual(3n);
      expect(secondResult[0]).assertEqual(3n);
      expect(usesIndependentBuffers).assertTrue();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2700
     * @tc.name testBigUint64ArrayToReversed027
     * @tc.desc Verify toReversed() can be applied to a larger array and maps boundary indexes correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(20);
      for (let index: int = 0; index < 20; index++) {
        sourceArray[index] = BigInt(index);
      }
      let resultArray = sourceArray.toReversed();
      expect(resultArray.length).assertEqual(20);
      expect(resultArray[0]).assertEqual(19n);
      expect(resultArray[9]).assertEqual(10n);
      expect(resultArray[10]).assertEqual(9n);
      expect(resultArray[19]).assertEqual(0n);
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[19]).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2800
     * @tc.name testBigUint64ArrayToReversed028
     * @tc.desc Verify toReversed() result can be mutated by fill without affecting the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.toReversed();
      resultArray.fill(0n, 0, 2);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(3n);
      expect(resultArray[4]).assertEqual(1n);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_2900
     * @tc.name testBigUint64ArrayToReversed029
     * @tc.desc Verify toReversed() result can be consumed by join slice and set in reversed order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.toReversed();
      let slicedArray = resultArray.slice(1, 3);
      let targetArray = new BigUint64Array(4);
      targetArray.fill(9n);
      targetArray.set(resultArray, 0);
      expect(resultArray.join('|')).assertEqual('4|3|2|1');
      expect(slicedArray[0]).assertEqual(3n);
      expect(slicedArray[1]).assertEqual(2n);
      expect(targetArray[0]).assertEqual(4n);
      expect(targetArray[3]).assertEqual(1n);
      expect(sourceArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3000
     * @tc.name testBigUint64ArrayToReversed030
     * @tc.desc Verify toReversed() from byteOffset view returns an independent zero offset reversed copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let resultArray = offsetView.toReversed();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sourceBuffer;
      expect(usesDistinctBuffer).assertTrue();
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(20n);
      resultArray[0] = 99n;
      expect(resultArray[0]).assertEqual(99n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3100
     * @tc.name testBigUint64ArrayToReversed031
     * @tc.desc Verify toReversed() on a nested byteOffset subarray returns an independent reversed copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let resultArray = sourceView.toReversed();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sharedBuffer;
      expect(usesDistinctBuffer).assertTrue();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(50n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(40n);
      expect(fullView[2]).assertEqual(40n);
      expect(fullView[3]).assertEqual(20n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3200
     * @tc.name testBigUint64ArrayToReversed032
     * @tc.desc Verify toReversed() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let resultArray = sliceCopy.toReversed();
      let sliceUsesDistinctBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      let resultUsesDistinctBuffer: boolean = resultArray.buffer !== sliceCopy.buffer;
      expect(sliceUsesDistinctBuffer).assertTrue();
      expect(resultUsesDistinctBuffer).assertTrue();
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(20n);
      expect(sliceCopy[1]).assertEqual(30n);
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3300
     * @tc.name testBigUint64ArrayToReversed033
     * @tc.desc Verify toReversed() on a zero-length byteOffset view returns an empty zero-offset copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let resultArray = sourceView.toReversed();
      let usesDistinctArray: boolean = resultArray !== sourceView;
      expect(usesDistinctArray).assertTrue();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3400
     * @tc.name testBigUint64ArrayToReversed034
     * @tc.desc Verify toReversed() on Set-constructed array reverses unique insertion order into a new array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(7n);
      sourceValues.add(11n);
      sourceValues.add(7n);
      sourceValues.add(15n);
      let sourceArray = new BigUint64Array(sourceValues);
      let resultArray = sourceArray.toReversed();
      let usesDistinctArray: boolean = resultArray !== sourceArray;
      expect(usesDistinctArray).assertTrue();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(15n);
      expect(resultArray[1]).assertEqual(11n);
      expect(resultArray[2]).assertEqual(7n);
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(11n);
      expect(sourceArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3500
     * @tc.name testBigUint64ArrayToReversed035
     * @tc.desc Verify toReversed() on iterator-constructed array starts from advanced iterator position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let targetArray = new BigUint64Array(sourceIterator);
      let resultArray = targetArray.toReversed();
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(10n);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(15n);
      expect(targetArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TO_REVERSED_3600
     * @tc.name testBigUint64ArrayToReversed036
     * @tc.desc Verify sibling view writes after toReversed() do not change the returned reversed copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 2);
      let resultArray = sourceView.toReversed();
      let usesDistinctBuffer: boolean = resultArray.buffer !== sharedBuffer;
      siblingView[0] = 300n;
      siblingView[1] = 400n;
      expect(usesDistinctBuffer).assertTrue();
      expect(sourceView[0]).assertEqual(20n);
      expect(sourceView[1]).assertEqual(300n);
      expect(sourceView[2]).assertEqual(400n);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOREVERSED_3700
     * @tc.name testBigUint64ArrayToReversed037
     * @tc.desc Verify toReversed copies binary integer values into reversed order without mutating source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0b101010), 1n);
      let resultArray = sourceArray.toReversed();
      expect(resultArray.join(',')).assertEqual('1,42');
      expect(sourceArray.join(',')).assertEqual('42,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOREVERSED_3800
     * @tc.name testBigUint64ArrayToReversed038
     * @tc.desc Verify toReversed copies octal integer values into reversed order without mutating source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0o52), 1n);
      let resultArray = sourceArray.toReversed();
      expect(resultArray.join(',')).assertEqual('1,42');
      expect(sourceArray.join(',')).assertEqual('42,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOREVERSED_3900
     * @tc.name testBigUint64ArrayToReversed039
     * @tc.desc Verify toReversed copies hexadecimal integer values into reversed order without mutating source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToReversed039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0x2A), 1n);
      let resultArray = sourceArray.toReversed();
      expect(resultArray.join(',')).assertEqual('1,42');
      expect(sourceArray.join(',')).assertEqual('42,1');
    });
  });
}
