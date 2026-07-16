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

export default function biguint64arrayReverseTest(): void {

  describe('BigUint64ArrayReverseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0100
     * @tc.name testBigUint64ArrayReverse001
     * @tc.desc Verify reverse() on an empty array returns the receiver and keeps length zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray.length).assertEqual(0);
      expect(returnedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0200
     * @tc.name testBigUint64ArrayReverse002
     * @tc.desc Verify reverse() on a single element array keeps the element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray[0]).assertEqual(42n);
      expect(returnedArray.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0300
     * @tc.name testBigUint64ArrayReverse003
     * @tc.desc Verify reverse() swaps two elements in place
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0400
     * @tc.name testBigUint64ArrayReverse004
     * @tc.desc Verify reverse() on an odd length array swaps ends and preserves the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(50n);
      expect(sourceArray[1]).assertEqual(40n);
      expect(sourceArray[2]).assertEqual(30n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0500
     * @tc.name testBigUint64ArrayReverse005
     * @tc.desc Verify reverse() on an even length array reverses every element position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(6n);
      expect(sourceArray[1]).assertEqual(5n);
      expect(sourceArray[2]).assertEqual(4n);
      expect(sourceArray[3]).assertEqual(3n);
      expect(sourceArray[4]).assertEqual(2n);
      expect(sourceArray[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0600
     * @tc.name testBigUint64ArrayReverse006
     * @tc.desc Verify reverse() preserves all zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0700
     * @tc.name testBigUint64ArrayReverse007
     * @tc.desc Verify reverse() moves max uint64 from the end to the start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([0n, 1n, maxUint64Value]);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(maxUint64Value);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0800
     * @tc.name testBigUint64ArrayReverse008
     * @tc.desc Verify reverse() preserves adjacent max uint64 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value, maxUint64Value - 1n, maxUint64Value - 2n]);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(maxUint64Value - 2n);
      expect(sourceArray[1]).assertEqual(maxUint64Value - 1n);
      expect(sourceArray[2]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_0900
     * @tc.name testBigUint64ArrayReverse009
     * @tc.desc Verify reverse() preserves values greater than signed long max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let highBoundaryValue: bigint = 9223372036854775808n;
      let sourceArray = new BigUint64Array([10n, highBoundaryValue, 30n]);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(highBoundaryValue);
      expect(sourceArray[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1000
     * @tc.name testBigUint64ArrayReverse010
     * @tc.desc Verify reverse() preserves modulo stored values for negative BigInt writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = -1n;
      sourceArray[1] = 0n;
      sourceArray[2] = -2n;
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(18446744073709551614n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1100
     * @tc.name testBigUint64ArrayReverse011
     * @tc.desc Verify reverse() preserves modulo stored values for overflow BigInt writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 18446744073709551616n;
      sourceArray[1] = 42n;
      sourceArray[2] = 18446744073709551617n;
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(42n);
      expect(sourceArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1200
     * @tc.name testBigUint64ArrayReverse012
     * @tc.desc Verify reverse() can be applied after values are written through set()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.set(new BigUint64Array([10n, 20n, 30n, 40n]));
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(40n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(20n);
      expect(sourceArray[3]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1300
     * @tc.name testBigUint64ArrayReverse013
     * @tc.desc Verify reverse() on a copied typed array does not modify the source copy origin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([7n, 8n, 9n]);
      let copiedArray = new BigUint64Array(originalArray);
      copiedArray.reverse();
      expect(copiedArray[0]).assertEqual(9n);
      expect(copiedArray[2]).assertEqual(7n);
      expect(originalArray[0]).assertEqual(7n);
      expect(originalArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1400
     * @tc.name testBigUint64ArrayReverse014
     * @tc.desc Verify double reverse restores the original element order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n, 8n]);
      sourceArray.reverse();
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(6n);
      expect(sourceArray[2]).assertEqual(7n);
      expect(sourceArray[3]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1500
     * @tc.name testBigUint64ArrayReverse015
     * @tc.desc Verify chained reverse() calls keep returning the same receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let returnedArray = sourceArray.reverse().reverse().reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1600
     * @tc.name testBigUint64ArrayReverse016
     * @tc.desc Verify reverse() keeps length byteLength byteOffset and BYTES_PER_ELEMENT stable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let sourceArray = new BigUint64Array(sourceBuffer, 8, 3);
      sourceArray[0] = 1n;
      sourceArray[1] = 2n;
      sourceArray[2] = 3n;
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let byteOffsetBefore: int = sourceArray.byteOffset;
      let returnedArray = sourceArray.reverse();
      expect(returnedArray.length).assertEqual(lengthBefore);
      expect(returnedArray.byteLength).assertEqual(byteLengthBefore);
      expect(returnedArray.byteOffset).assertEqual(byteOffsetBefore);
      expect(returnedArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1700
     * @tc.name testBigUint64ArrayReverse017
     * @tc.desc Verify reverse() mutates an ArrayBuffer backed view in place
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer, 0, 3);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray[2] = 300n;
      sourceArray.reverse();
      let viewArray = new BigUint64Array(sourceBuffer, 0, 3);
      expect(viewArray[0]).assertEqual(300n);
      expect(viewArray[1]).assertEqual(200n);
      expect(viewArray[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1800
     * @tc.name testBigUint64ArrayReverse018
     * @tc.desc Verify reverse() only mutates the selected nonzero byteOffset view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 1n;
      fullView[1] = 10n;
      fullView[2] = 20n;
      fullView[3] = 30n;
      fullView[4] = 5n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      offsetView.reverse();
      expect(fullView[0]).assertEqual(1n);
      expect(fullView[1]).assertEqual(30n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(10n);
      expect(fullView[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_1900
     * @tc.name testBigUint64ArrayReverse019
     * @tc.desc Verify reverse() on a subarray view writes through to the parent buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let childView = parentArray.subarray(1, 4);
      childView.reverse();
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(4n);
      expect(parentArray[2]).assertEqual(3n);
      expect(parentArray[3]).assertEqual(2n);
      expect(parentArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2000
     * @tc.name testBigUint64ArrayReverse020
     * @tc.desc Verify reverse() result remains a typed ArrayBuffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n]);
      let returnedArray = sourceArray.reverse();
      expect(ArrayBuffer.isView(returnedArray)).assertTrue();
      expect(returnedArray.name).assertEqual('BigUint64Array');
      expect(returnedArray.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2100
     * @tc.name testBigUint64ArrayReverse021
     * @tc.desc Verify reverse() can be applied to a large array and maps boundary indexes correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(20);
      for (let index: int = 0; index < 20; index++) {
        sourceArray[index] = BigInt(index);
      }
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(19n);
      expect(sourceArray[9]).assertEqual(10n);
      expect(sourceArray[10]).assertEqual(9n);
      expect(sourceArray[19]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2200
     * @tc.name testBigUint64ArrayReverse022
     * @tc.desc Verify reverse() uses the current values after fill and direct index writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.fill(7n);
      sourceArray[1] = 8n;
      sourceArray[2] = 9n;
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(9n);
      expect(sourceArray[2]).assertEqual(8n);
      expect(sourceArray[3]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2300
     * @tc.name testBigUint64ArrayReverse023
     * @tc.desc Verify reverse() can be followed by join and toString using the reversed order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray.join('|')).assertEqual('3|2|1');
      expect(returnedArray.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2400
     * @tc.name testBigUint64ArrayReverse024
     * @tc.desc Verify reverse() keeps equivalent modulo zero values indistinguishable from normal zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(2);
      sourceArray[0] = 18446744073709551616n;
      sourceArray[1] = 42n;
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(42n);
      expect(sourceArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2500
     * @tc.name testBigUint64ArrayReverse025
     * @tc.desc Verify reverse() mutates a BigUint64Array.of() source and returns the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(11n, 22n, 33n);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(33n);
      expect(sourceArray[1]).assertEqual(22n);
      expect(sourceArray[2]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2600
     * @tc.name testBigUint64ArrayReverse026
     * @tc.desc Verify reverse() mutates a BigUint64Array.from(Set) source in insertion-order reverse
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(9n);
      sourceSet.add(18n);
      sourceSet.add(27n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(27n);
      expect(sourceArray[1]).assertEqual(18n);
      expect(sourceArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2700
     * @tc.name testBigUint64ArrayReverse027
     * @tc.desc Verify reverse() mutates a FixedArray<BigInt> constructed source in element-order reverse
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [4n, 8n, 16n];
      let sourceArray = new BigUint64Array(sourceValues);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray[0]).assertEqual(16n);
      expect(sourceArray[1]).assertEqual(8n);
      expect(sourceArray[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2800
     * @tc.name testBigUint64ArrayReverse028
     * @tc.desc Verify reverse() mutates the receiver while toReversed() leaves an equal source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mutableSource = new BigUint64Array([1n, 2n, 3n]);
      let immutableSource = new BigUint64Array([1n, 2n, 3n]);
      let mutableResult = mutableSource.reverse();
      let immutableResult = immutableSource.toReversed();
      expect(mutableResult).assertEqual(mutableSource);
      expect(mutableSource[0]).assertEqual(3n);
      expect(mutableSource[1]).assertEqual(2n);
      expect(mutableSource[2]).assertEqual(1n);
      expect(immutableResult[0]).assertEqual(3n);
      expect(immutableResult[1]).assertEqual(2n);
      expect(immutableResult[2]).assertEqual(1n);
      expect(immutableSource[0]).assertEqual(1n);
      expect(immutableSource[1]).assertEqual(2n);
      expect(immutableSource[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_2900
     * @tc.name testBigUint64ArrayReverse029
     * @tc.desc Verify reverse() on byteOffset view returns the receiver and returned writes update the shared source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let returnedView = sourceView.reverse();
      expect(returnedView).assertEqual(sourceView);
      expect(fullView[1]).assertEqual(40n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(20n);
      returnedView[0] = 99n;
      expect(sourceView[0]).assertEqual(99n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(99n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_3000
     * @tc.name testBigUint64ArrayReverse030
     * @tc.desc Verify reverse() on a nested byteOffset subarray mutates only the local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let returnedArray = sourceView.reverse();
      expect(returnedArray).assertEqual(sourceView);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(3);
      expect(fullView[0]).assertEqual(60n);
      expect(fullView[1]).assertEqual(10n);
      expect(fullView[2]).assertEqual(50n);
      expect(fullView[3]).assertEqual(20n);
      expect(fullView[4]).assertEqual(40n);
      expect(fullView[5]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_3100
     * @tc.name testBigUint64ArrayReverse031
     * @tc.desc Verify reverse() on a slice copy from byteOffset view ignores the source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 90n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 10n;
      fullView[4] = 80n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let sliceCopy = sourceView.slice(0, 3);
      let returnedArray = sliceCopy.reverse();
      let sharesSliceBuffer: boolean = sliceCopy.buffer === sharedBuffer;
      expect(returnedArray).assertEqual(sliceCopy);
      expect(sharesSliceBuffer).assertFalse();
      expect(sliceCopy[0]).assertEqual(10n);
      expect(sliceCopy[1]).assertEqual(30n);
      expect(sliceCopy[2]).assertEqual(20n);
      expect(sourceView[0]).assertEqual(20n);
      expect(sourceView[1]).assertEqual(30n);
      expect(sourceView[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_3200
     * @tc.name testBigUint64ArrayReverse032
     * @tc.desc Verify reverse() on a zero-length byteOffset view returns the same empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let returnedArray = sourceView.reverse();
      expect(returnedArray).assertEqual(sourceView);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.byteLength).assertEqual(0);
      expect(sourceView.length).assertEqual(0);
      expect(sourceView.buffer).assertEqual(sharedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_3300
     * @tc.name testBigUint64ArrayReverse033
     * @tc.desc Verify reverse() on Set-constructed array uses unique insertion order before reversing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(7n);
      sourceValues.add(11n);
      sourceValues.add(7n);
      sourceValues.add(15n);
      let sourceArray = new BigUint64Array(sourceValues);
      let returnedArray = sourceArray.reverse();
      expect(returnedArray).assertEqual(sourceArray);
      expect(sourceArray.length).assertEqual(3);
      expect(sourceArray[0]).assertEqual(15n);
      expect(sourceArray[1]).assertEqual(11n);
      expect(sourceArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_3400
     * @tc.name testBigUint64ArrayReverse034
     * @tc.desc Verify reverse() on iterator-constructed array starts from advanced iterator position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let targetArray = new BigUint64Array(sourceIterator);
      targetArray.reverse();
      expect(targetArray.length).assertEqual(3);
      expect(targetArray[0]).assertEqual(20n);
      expect(targetArray[1]).assertEqual(15n);
      expect(targetArray[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_REVERSE_3500
     * @tc.name testBigUint64ArrayReverse035
     * @tc.desc Verify reverse() writes through to an overlapping sibling view on the shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayReverse035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 3);
      let returnedArray = sourceView.reverse();
      expect(returnedArray).assertEqual(sourceView);
      expect(sourceView[0]).assertEqual(40n);
      expect(sourceView[1]).assertEqual(30n);
      expect(sourceView[2]).assertEqual(20n);
      expect(siblingView[0]).assertEqual(30n);
      expect(siblingView[1]).assertEqual(20n);
      expect(siblingView[2]).assertEqual(50n);
    });
  });
}
