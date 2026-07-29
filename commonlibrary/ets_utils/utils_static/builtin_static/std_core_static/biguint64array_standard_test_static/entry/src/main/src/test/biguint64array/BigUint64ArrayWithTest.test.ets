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
const WRAPPED_NEGATIVE_TWO_VALUE: bigint = 18446744073709551614n;
const HIGH_SIGNED_BOUNDARY_VALUE: bigint = 9223372036854775808n;

export default function biguint64arrayWithTest(): void {

  describe('BigUint64ArrayWithTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0010
     * @tc.name testBigUint64ArrayWith001
     * @tc.desc Verify with() replaces the first element and keeps the original unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(0, 99n);
      expect(replacedArray[0]).assertEqual(99n);
      expect(replacedArray[1]).assertEqual(20n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0020
     * @tc.name testBigUint64ArrayWith002
     * @tc.desc Verify with() replaces a middle element and preserves adjacent values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(1, 77n);
      expect(replacedArray[0]).assertEqual(10n);
      expect(replacedArray[1]).assertEqual(77n);
      expect(replacedArray[2]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0030
     * @tc.name testBigUint64ArrayWith003
     * @tc.desc Verify with() replaces the last element through a length based index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let lastIndex: int = sourceArray.length - 1;
      let replacedArray = sourceArray.with(lastIndex, 55n);
      expect(replacedArray[lastIndex]).assertEqual(55n);
      expect(replacedArray[0]).assertEqual(10n);
      expect(sourceArray[lastIndex]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0040
     * @tc.name testBigUint64ArrayWith004
     * @tc.desc Verify with() replaces the only element at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      let replacedArray = sourceArray.with(0, 42n);
      expect(replacedArray[0]).assertEqual(42n);
      expect(replacedArray.length).assertEqual(1);
      expect(sourceArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0050
     * @tc.name testBigUint64ArrayWith005
     * @tc.desc Verify with() accepts an int value and stores it as BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacementValue: int = 7;
      let replacedArray = sourceArray.with(1, replacementValue);
      expect(replacedArray[1]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0060
     * @tc.name testBigUint64ArrayWith006
     * @tc.desc Verify with() stores zero BigInt values exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(0, 0n);
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0070
     * @tc.name testBigUint64ArrayWith007
     * @tc.desc Verify with() stores the max uint64 BigInt value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(1, MAX_UINT64_VALUE);
      expect(replacedArray[1]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0080
     * @tc.name testBigUint64ArrayWith008
     * @tc.desc Verify with() stores the near max uint64 BigInt value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(0, MAX_UINT64_VALUE - 1n);
      expect(replacedArray[0]).assertEqual(MAX_UINT64_VALUE - 1n);
      expect(replacedArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0090
     * @tc.name testBigUint64ArrayWith009
     * @tc.desc Verify with() stores values above signed long range exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(1, HIGH_SIGNED_BOUNDARY_VALUE);
      expect(replacedArray[1]).assertEqual(HIGH_SIGNED_BOUNDARY_VALUE);
      expect(replacedArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0100
     * @tc.name testBigUint64ArrayWith010
     * @tc.desc Verify with() wraps two power sixty four BigInt values to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(0, UINT64_MODULUS_VALUE);
      expect(replacedArray[0]).assertEqual(0n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0110
     * @tc.name testBigUint64ArrayWith011
     * @tc.desc Verify with() wraps two power sixty four plus one BigInt values to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(1, UINT64_MODULUS_VALUE + 1n);
      expect(replacedArray[1]).assertEqual(1n);
      expect(replacedArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0120
     * @tc.name testBigUint64ArrayWith012
     * @tc.desc Verify with() wraps negative one BigInt values to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(0, -1n);
      expect(replacedArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0130
     * @tc.name testBigUint64ArrayWith013
     * @tc.desc Verify with() wraps negative two BigInt values to max uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(1, -2n);
      expect(replacedArray[1]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0140
     * @tc.name testBigUint64ArrayWith014
     * @tc.desc Verify with() wraps expression values modulo uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacementValue: bigint = UINT64_MODULUS_VALUE + 42n;
      let replacedArray = sourceArray.with(0, replacementValue);
      expect(replacedArray[0]).assertEqual(42n);
      expect(replacedArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0150
     * @tc.name testBigUint64ArrayWith015
     * @tc.desc Verify with() result preserves length byteLength and element byte size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let replacedArray = sourceArray.with(2, 99n);
      expect(replacedArray.length).assertEqual(sourceArray.length);
      expect(replacedArray.byteLength).assertEqual(sourceArray.byteLength);
      expect(replacedArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0160
     * @tc.name testBigUint64ArrayWith016
     * @tc.desc Verify with() result owns an independent buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let replacedArray = sourceArray.with(1, 99n);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(sameBuffer).assertFalse();
      expect(replacedArray.buffer.byteLength).assertEqual(sourceArray.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0170
     * @tc.name testBigUint64ArrayWith017
     * @tc.desc Verify with() on an offset view returns a zero offset copy of the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      let replacedArray = offsetView.with(0, 99n);
      expect(replacedArray[0]).assertEqual(99n);
      expect(replacedArray[1]).assertEqual(30n);
      expect(replacedArray.byteOffset).assertEqual(0);
      expect(fullView[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0180
     * @tc.name testBigUint64ArrayWith018
     * @tc.desc Verify with() does not modify original source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      sourceArray.with(2, 99n);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
      expect(sourceArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0190
     * @tc.name testBigUint64ArrayWith019
     * @tc.desc Verify with() preserves every non replaced element in the result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let replacedArray = sourceArray.with(2, 99n);
      expect(replacedArray[0]).assertEqual(10n);
      expect(replacedArray[1]).assertEqual(20n);
      expect(replacedArray[2]).assertEqual(99n);
      expect(replacedArray[3]).assertEqual(40n);
      expect(replacedArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0200
     * @tc.name testBigUint64ArrayWith020
     * @tc.desc Verify modifying the with() result does not affect the original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(0, 99n);
      replacedArray[1] = 888n;
      expect(replacedArray[1]).assertEqual(888n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0210
     * @tc.name testBigUint64ArrayWith021
     * @tc.desc Verify modifying the original array does not affect an existing with() result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(0, 99n);
      sourceArray[1] = 888n;
      expect(sourceArray[1]).assertEqual(888n);
      expect(replacedArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0220
     * @tc.name testBigUint64ArrayWith022
     * @tc.desc Verify replacing with the same value still returns an independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let replacedArray = sourceArray.with(0, 10n);
      replacedArray[0] = 99n;
      expect(sourceArray[0]).assertEqual(10n);
      expect(replacedArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0230
     * @tc.name testBigUint64ArrayWith023
     * @tc.desc Verify separate with() calls return independent result arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let firstArray = sourceArray.with(0, 99n);
      let secondArray = sourceArray.with(0, 99n);
      firstArray[1] = 777n;
      expect(secondArray[1]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0240
     * @tc.name testBigUint64ArrayWith024
     * @tc.desc Verify chained with() calls replace different indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(0, 111n).with(2, 333n);
      expect(replacedArray[0]).assertEqual(111n);
      expect(replacedArray[1]).assertEqual(20n);
      expect(replacedArray[2]).assertEqual(333n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0250
     * @tc.name testBigUint64ArrayWith025
     * @tc.desc Verify chained with() calls on the same index keep the final value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(0, 111n).with(0, 222n);
      expect(replacedArray[0]).assertEqual(222n);
      expect(replacedArray[1]).assertEqual(20n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0260
     * @tc.name testBigUint64ArrayWith026
     * @tc.desc Verify with() on a length constructed array replaces one zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let replacedArray = sourceArray.with(1, 55n);
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(55n);
      expect(replacedArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0270
     * @tc.name testBigUint64ArrayWith027
     * @tc.desc Verify with() on a from() result keeps source order around the replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.from([1n, 2n, 3n]);
      let replacedArray = sourceArray.with(1, 99n);
      expect(replacedArray[0]).assertEqual(1n);
      expect(replacedArray[1]).assertEqual(99n);
      expect(replacedArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0280
     * @tc.name testBigUint64ArrayWith028
     * @tc.desc Verify with() on a copied array is independent from later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([1n, 2n, 3n]);
      let copiedArray = new BigUint64Array(originalArray);
      let replacedArray = copiedArray.with(0, 99n);
      originalArray[1] = 200n;
      expect(replacedArray[0]).assertEqual(99n);
      expect(replacedArray[1]).assertEqual(2n);
      expect(copiedArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0290
     * @tc.name testBigUint64ArrayWith029
     * @tc.desc Verify with() on a whole ArrayBuffer view returns an independent copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer);
      sourceArray[0] = 10n;
      sourceArray[1] = 20n;
      sourceArray[2] = 30n;
      let replacedArray = sourceArray.with(1, 99n);
      sourceArray[1] = 200n;
      expect(replacedArray[0]).assertEqual(10n);
      expect(replacedArray[1]).assertEqual(99n);
      expect(replacedArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0300
     * @tc.name testBigUint64ArrayWith030
     * @tc.desc Verify with() on a subarray view copies only the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let childView = sourceArray.subarray(1, 3);
      let replacedArray = childView.with(0, 99n);
      expect(replacedArray.length).assertEqual(2);
      expect(replacedArray[0]).assertEqual(99n);
      expect(replacedArray[1]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0310
     * @tc.name testBigUint64ArrayWith031
     * @tc.desc Verify with() on a slice result keeps the slice copy independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let slicedArray = sourceArray.slice(1, 3);
      let replacedArray = slicedArray.with(1, 99n);
      sourceArray[2] = 300n;
      expect(replacedArray[0]).assertEqual(20n);
      expect(replacedArray[1]).assertEqual(99n);
      expect(slicedArray[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0320
     * @tc.name testBigUint64ArrayWith032
     * @tc.desc Verify with() throws RangeError when index equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      try {
        sourceArray.with(sourceArray.length, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0330
     * @tc.name testBigUint64ArrayWith033
     * @tc.desc Verify with() throws RangeError when negative index is below negative length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      try {
        sourceArray.with(-sourceArray.length - 1, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0340
     * @tc.name testBigUint64ArrayWith034
     * @tc.desc Verify with() throws RangeError for index zero on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      try {
        sourceArray.with(0, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0350
     * @tc.name testBigUint64ArrayWith035
     * @tc.desc Verify with() throws RangeError for index one on a single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n]);
      try {
        sourceArray.with(1, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0360
     * @tc.name testBigUint64ArrayWith036
     * @tc.desc Verify an out of range with call throws RangeError and leaves the source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      try {
        sourceArray.with(5, MAX_UINT64_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sourceArray[0]).assertEqual(10n);
        expect(sourceArray[1]).assertEqual(20n);
        expect(sourceArray[2]).assertEqual(30n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0370
     * @tc.name testBigUint64ArrayWith037
     * @tc.desc Verify with(index: int, value: int) returns independent-buffer copy: decimal literal 42 becomes 42n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let decimalValue: int = 42;
      let replacedArray = sourceArray.with(targetIndex, decimalValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(42n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0380
     * @tc.name testBigUint64ArrayWith038
     * @tc.desc Verify with(index: int, value: int) returns independent-buffer copy: binary literal 0b101010 becomes 42n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let binaryValue: int = 0b101010;
      let replacedArray = sourceArray.with(targetIndex, binaryValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(42n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0390
     * @tc.name testBigUint64ArrayWith039
     * @tc.desc Verify with(index: int, value: int) returns independent-buffer copy: octal literal 0o52 becomes 42n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let octalValue: int = 0o52;
      let replacedArray = sourceArray.with(targetIndex, octalValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(42n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0400
     * @tc.name testBigUint64ArrayWith040
     * @tc.desc Verify with(index: int, value: int) returns independent-buffer copy: hexadecimal literal 0x2A becomes 42n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let hexadecimalValue: int = 0x2A;
      let replacedArray = sourceArray.with(targetIndex, hexadecimalValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(42n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0410
     * @tc.name testBigUint64ArrayWith041
     * @tc.desc Verify with(index: int, value: BigInt) returns independent-buffer copy: BigInt(0b11111111) becomes 255n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let binarySourceValue: int = 0b11111111;
      let convertedValue: bigint = BigInt(binarySourceValue);
      let replacedArray = sourceArray.with(targetIndex, convertedValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(255n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0420
     * @tc.name testBigUint64ArrayWith042
     * @tc.desc Verify with(index: int, value: BigInt) returns independent-buffer copy: BigInt(0o377) becomes 255n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let octalSourceValue: int = 0o377;
      let convertedValue: bigint = BigInt(octalSourceValue);
      let replacedArray = sourceArray.with(targetIndex, convertedValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(255n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0430
     * @tc.name testBigUint64ArrayWith043
     * @tc.desc Verify with(index: int, value: BigInt) returns independent-buffer copy: BigInt(0xFF) becomes 255n at index 1 and source index 1 stays 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let hexadecimalSourceValue: int = 0xFF;
      let convertedValue: bigint = BigInt(hexadecimalSourceValue);
      let replacedArray = sourceArray.with(targetIndex, convertedValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(255n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0440
     * @tc.name testBigUint64ArrayWith044
     * @tc.desc Verify with(index: int, value: byte) stores declared byte value 12 as 12n and leaves the source element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: byte = 12;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[1]).assertEqual(12n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0450
     * @tc.name testBigUint64ArrayWith045
     * @tc.desc Verify with(index: int, value: short) stores declared short value 2048 as 2048n and leaves the source element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: short = 2048;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[1]).assertEqual(2048n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0460
     * @tc.name testBigUint64ArrayWith046
     * @tc.desc Verify with(index: int, value: long) stores declared long value 10000000000 as 10000000000n and leaves the source element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: long = 10000000000;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[1]).assertEqual(10000000000n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0470
     * @tc.name testBigUint64ArrayWith047
     * @tc.desc Verify with(index: byte, value: BigInt) accepts declared byte index 2 and returns an independent tail replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: byte = 2;
      let replacementValue: bigint = 77n;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(1n);
      expect(replacedArray[2]).assertEqual(77n);
      expect(sourceArray[2]).assertEqual(2n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0480
     * @tc.name testBigUint64ArrayWith048
     * @tc.desc Verify with(index: short, value: BigInt) accepts declared short index 1 and returns an independent middle replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: short = 1;
      let replacementValue: bigint = 88n;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(88n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0490
     * @tc.name testBigUint64ArrayWith049
     * @tc.desc Verify with() on a byteOffset view returns an independent zero offset copy after result writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let replacedArray = offsetView.with(1, 99n);
      let sharesSourceBuffer: boolean = replacedArray.buffer === sourceBuffer;
      replacedArray[0] = 77n;
      expect(sharesSourceBuffer).assertFalse();
      expect(replacedArray.byteOffset).assertEqual(0);
      expect(replacedArray.length).assertEqual(3);
      expect(replacedArray[0]).assertEqual(77n);
      expect(replacedArray[1]).assertEqual(99n);
      expect(replacedArray[2]).assertEqual(40n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0500
     * @tc.name testBigUint64ArrayWith050
     * @tc.desc Verify with() on a subarray view accepts binary index and BigInt hexadecimal source without mutating parent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let sourceView = parentArray.subarray(1, 5);
      let binaryIndex: int = 0b10;
      let hexadecimalSourceValue: int = 0x2A;
      let replacementValue: bigint = BigInt(hexadecimalSourceValue);
      let replacedArray = sourceView.with(binaryIndex, replacementValue);
      let sharesParentBuffer: boolean = replacedArray.buffer === parentArray.buffer;
      replacedArray[0] = 77n;
      expect(sharesParentBuffer).assertFalse();
      expect(replacedArray.byteOffset).assertEqual(0);
      expect(replacedArray.length).assertEqual(4);
      expect(replacedArray[0]).assertEqual(77n);
      expect(replacedArray[1]).assertEqual(30n);
      expect(replacedArray[2]).assertEqual(42n);
      expect(replacedArray[3]).assertEqual(50n);
      expect(parentArray[1]).assertEqual(20n);
      expect(parentArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0510
     * @tc.name testBigUint64ArrayWith051
     * @tc.desc Verify with() on a byteOffset view accepts hexadecimal index and BigInt octal source without mutating full view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let hexadecimalIndex: int = 0x2;
      let octalSourceValue: int = 0o77;
      let replacementValue: bigint = BigInt(octalSourceValue);
      let replacedArray = offsetView.with(hexadecimalIndex, replacementValue);
      let sharesSourceBuffer: boolean = replacedArray.buffer === sourceBuffer;
      fullView[3] = 44n;
      expect(sharesSourceBuffer).assertFalse();
      expect(replacedArray.byteOffset).assertEqual(0);
      expect(replacedArray.length).assertEqual(4);
      expect(replacedArray[0]).assertEqual(20n);
      expect(replacedArray[1]).assertEqual(30n);
      expect(replacedArray[2]).assertEqual(63n);
      expect(replacedArray[3]).assertEqual(50n);
      expect(fullView[3]).assertEqual(44n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0520
     * @tc.name testBigUint64ArrayWith052
     * @tc.desc Verify with(index: int, value: BigInt) accepts BigInt created from decimal number source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let decimalSourceValue: int = 255;
      let replacementValue: bigint = BigInt(decimalSourceValue);
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      let sameBuffer: boolean = replacedArray.buffer === sourceArray.buffer;
      expect(replacedArray[0]).assertEqual(0n);
      expect(replacedArray[1]).assertEqual(255n);
      expect(replacedArray[2]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0530
     * @tc.name testBigUint64ArrayWith053
     * @tc.desc Verify with() wraps a declared negative byte replacement to maximum uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let targetIndex: int = 0;
      let replacementValue: byte = -1;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(replacedArray[1]).assertEqual(20n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0540
     * @tc.name testBigUint64ArrayWith054
     * @tc.desc Verify with() wraps a declared negative short replacement to maximum uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let targetIndex: int = 1;
      let replacementValue: short = -2;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[0]).assertEqual(10n);
      expect(replacedArray[1]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0550
     * @tc.name testBigUint64ArrayWith055
     * @tc.desc Verify with() wraps a declared negative int replacement to maximum uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let targetIndex: int = 2;
      let replacementValue: int = -1;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[1]).assertEqual(20n);
      expect(replacedArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0560
     * @tc.name testBigUint64ArrayWith056
     * @tc.desc Verify with() wraps a declared negative long replacement to maximum uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let targetIndex: int = 0;
      let replacementValue: long = -2;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[0]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(replacedArray[1]).assertEqual(20n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0570
     * @tc.name testBigUint64ArrayWith057
     * @tc.desc Verify long toInt conversion supplies positive index two before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let longIndexSource: long = 4294967298;
      let targetIndex: int = longIndexSource.toInt();
      let replacementValue: bigint = 77n;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[1]).assertEqual(20n);
      expect(replacedArray[2]).assertEqual(77n);
      expect(replacedArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0580
     * @tc.name testBigUint64ArrayWith058
     * @tc.desc Verify float toInt conversion truncates positive index one point nine before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let floatIndexSource: float = 1.9f;
      let targetIndex: int = floatIndexSource.toInt();
      let replacementValue: bigint = 77n;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[0]).assertEqual(10n);
      expect(replacedArray[1]).assertEqual(77n);
      expect(replacedArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0590
     * @tc.name testBigUint64ArrayWith059
     * @tc.desc Verify double toInt conversion truncates positive index two point nine before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let doubleIndexSource: double = 2.9;
      let targetIndex: int = doubleIndexSource.toInt();
      let replacementValue: bigint = 77n;
      let replacedArray = sourceArray.with(targetIndex, replacementValue);
      expect(replacedArray[1]).assertEqual(20n);
      expect(replacedArray[2]).assertEqual(77n);
      expect(replacedArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0600
     * @tc.name testBigUint64ArrayWith060
     * @tc.desc Verify with throws RangeError for Int maximum index and keeps the source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: int = 2147483647;
      let replacementValue: bigint = 99n;
      try {
        sourceArray.with(targetIndex, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sourceArray[0]).assertEqual(10n);
        expect(sourceArray[1]).assertEqual(20n);
        expect(sourceArray[2]).assertEqual(30n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0610
     * @tc.name testBigUint64ArrayWith061
     * @tc.desc Verify long toInt conversion reaches an out of range maximum index and throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let longIndexSource: long = 2147483647;
      let targetIndex: int = longIndexSource.toInt();
      let replacementValue: bigint = 99n;
      try {
        sourceArray.with(targetIndex, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sourceArray[1]).assertEqual(20n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0620
     * @tc.name testBigUint64ArrayWith062
     * @tc.desc Verify double toInt conversion reaches an out of range maximum index and throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let doubleIndexSource: double = 2147483647.0;
      let targetIndex: int = doubleIndexSource.toInt();
      let replacementValue: bigint = 99n;
      try {
        sourceArray.with(targetIndex, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sourceArray[1]).assertEqual(20n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0630
     * @tc.name testBigUint64ArrayWith063
     * @tc.desc Verify binary index one returns an independent replacement array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(0b1, 42n);
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0640
     * @tc.name testBigUint64ArrayWith064
     * @tc.desc Verify octal index one returns an independent replacement array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(0o1, 42n);
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0650
     * @tc.name testBigUint64ArrayWith065
     * @tc.desc Verify hexadecimal index one returns an independent replacement array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(0x1, 42n);
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0660
     * @tc.name testBigUint64ArrayWith066
     * @tc.desc Verify byte source converted by toInt supplies replacement index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteIndexSource: byte = 1;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(byteIndexSource.toInt(), 55n);
      expect(replacedArray[1]).assertEqual(55n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0670
     * @tc.name testBigUint64ArrayWith067
     * @tc.desc Verify short source converted by toInt supplies replacement index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortIndexSource: short = 1;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(shortIndexSource.toInt(), 55n);
      expect(replacedArray[1]).assertEqual(55n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0680
     * @tc.name testBigUint64ArrayWith068
     * @tc.desc Verify number source converted by toInt supplies truncated replacement index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberIndexSource: number = 1.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(numberIndexSource.toInt(), 55n);
      expect(replacedArray[1]).assertEqual(55n);
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0690
     * @tc.name testBigUint64ArrayWith069
     * @tc.desc Verify long source converted by toInt supplies replacement index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longIndexSource: long = 1;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(longIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,55,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0700
     * @tc.name testBigUint64ArrayWith070
     * @tc.desc Verify double source converted by toInt supplies replacement index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleIndexSource: double = 1.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(doubleIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,55,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0710
     * @tc.name testBigUint64ArrayWith071
     * @tc.desc Verify byte source converted by toInt supplies replacement value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteValueSource: byte = 42;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(1, byteValueSource.toInt());
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0720
     * @tc.name testBigUint64ArrayWith072
     * @tc.desc Verify short source converted by toInt supplies replacement value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortValueSource: short = 42;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(1, shortValueSource.toInt());
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0730
     * @tc.name testBigUint64ArrayWith073
     * @tc.desc Verify long source converted by toInt supplies replacement value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValueSource: long = 42;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(1, longValueSource.toInt());
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0740
     * @tc.name testBigUint64ArrayWith074
     * @tc.desc Verify float source converted by toInt supplies truncated replacement value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatValueSource: float = 42.9f;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(1, floatValueSource.toInt());
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0750
     * @tc.name testBigUint64ArrayWith075
     * @tc.desc Verify double source converted by toInt supplies truncated replacement value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleValueSource: double = 42.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let replacedArray = sourceArray.with(1, doubleValueSource.toInt());
      expect(replacedArray.join(',')).assertEqual('10,42,30');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0760
     * @tc.name testBigUint64ArrayWith076
     * @tc.desc Verify with() accepts negative index minus one for the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-1, 88n);
      expect(replacedArray[3]).assertEqual(88n);
      expect(replacedArray[0]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0770
     * @tc.name testBigUint64ArrayWith077
     * @tc.desc Verify with() accepts negative length index for the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-sourceArray.length, 66n);
      expect(replacedArray[0]).assertEqual(66n);
      expect(replacedArray[3]).assertEqual(40n);
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0780
     * @tc.name testBigUint64ArrayWith078
     * @tc.desc Verify with() replaces the only element with negative index minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      let replacedArray = sourceArray.with(-1, 24n);
      expect(replacedArray[0]).assertEqual(24n);
      expect(sourceArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0790
     * @tc.name testBigUint64ArrayWith079
     * @tc.desc Verify with() maps negative index minus two to an interior element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-2, 77n);
      expect(replacedArray.join(',')).assertEqual('10,20,77,40');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0800
     * @tc.name testBigUint64ArrayWith080
     * @tc.desc Verify with() maps negative index minus one relative to a subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let sourceView = parentArray.subarray(1, 4);
      let replacedArray = sourceView.with(-1, 99n);
      let sharesParentBuffer: boolean = replacedArray.buffer === parentArray.buffer;
      expect(replacedArray.join(',')).assertEqual('20,30,99');
      expect(replacedArray.byteOffset).assertEqual(0);
      expect(sharesParentBuffer).assertFalse();
      expect(sourceView.join(',')).assertEqual('20,30,40');
      expect(parentArray.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0810
     * @tc.name testBigUint64ArrayWith081
     * @tc.desc Verify with() maps negative view length to the first element of a byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sourceBuffer, 8, 3);
      let replacedArray = sourceView.with(-sourceView.length, 88n);
      let sharesSourceBuffer: boolean = replacedArray.buffer === sourceBuffer;
      expect(replacedArray.join(',')).assertEqual('88,30,40');
      expect(replacedArray.byteOffset).assertEqual(0);
      expect(sharesSourceBuffer).assertFalse();
      expect(sourceView.join(',')).assertEqual('20,30,40');
      expect(fullView.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0820
     * @tc.name testBigUint64ArrayWith082
     * @tc.desc Verify with() throws RangeError for negative index minus one on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      try {
        sourceArray.with(-1, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0830
     * @tc.name testBigUint64ArrayWith083
     * @tc.desc Verify byte source converted by toInt supplies negative index minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteIndexSource: byte = -1;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(byteIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0840
     * @tc.name testBigUint64ArrayWith084
     * @tc.desc Verify short source converted by toInt supplies negative index minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortIndexSource: short = -1;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(shortIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0850
     * @tc.name testBigUint64ArrayWith085
     * @tc.desc Verify long source converted by toInt supplies negative index minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longIndexSource: long = -1;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(longIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0860
     * @tc.name testBigUint64ArrayWith086
     * @tc.desc Verify number source truncates to negative index minus one before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberIndexSource: number = -1.9;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(numberIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0870
     * @tc.name testBigUint64ArrayWith087
     * @tc.desc Verify float source truncates to negative index minus one before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatIndexSource: float = -1.9f;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(floatIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0880
     * @tc.name testBigUint64ArrayWith088
     * @tc.desc Verify double source truncates to negative index minus one before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleIndexSource: double = -1.9;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(doubleIndexSource.toInt(), 55n);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0890
     * @tc.name testBigUint64ArrayWith089
     * @tc.desc Verify long toInt narrowing reaches negative index minus one before with replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longIndexSource: long = 4294967295;
      let targetIndex: int = longIndexSource.toInt();
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(targetIndex, 55n);
      expect(targetIndex).assertEqual(-1);
      expect(replacedArray.join(',')).assertEqual('10,20,55');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0900
     * @tc.name testBigUint64ArrayWith090
     * @tc.desc Verify negative index normalization with the long replacement value overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacementValue: long = 88;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let replacedArray = sourceArray.with(-1, replacementValue);
      expect(replacedArray.join(',')).assertEqual('10,20,88');
      expect(sourceArray.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0910
     * @tc.name testBigUint64ArrayWith091
     * @tc.desc Verify chained with() calls normalize negative last and first boundaries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-1, 88n).with(-sourceArray.length, 66n);
      expect(replacedArray.join(',')).assertEqual('66,20,30,88');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0920
     * @tc.name testBigUint64ArrayWith092
     * @tc.desc Verify binary negative index minus one replaces the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-0b1, 88n);
      expect(replacedArray.join(',')).assertEqual('10,20,30,88');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0930
     * @tc.name testBigUint64ArrayWith093
     * @tc.desc Verify octal negative index minus one replaces the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-0o1, 88n);
      expect(replacedArray.join(',')).assertEqual('10,20,30,88');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0940
     * @tc.name testBigUint64ArrayWith094
     * @tc.desc Verify hexadecimal negative index minus one replaces the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-0x1, 88n);
      expect(replacedArray.join(',')).assertEqual('10,20,30,88');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0950
     * @tc.name testBigUint64ArrayWith095
     * @tc.desc Verify binary negative length index replaces the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-0b100, 66n);
      expect(replacedArray.join(',')).assertEqual('66,20,30,40');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0960
     * @tc.name testBigUint64ArrayWith096
     * @tc.desc Verify octal negative length index replaces the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-0o4, 66n);
      expect(replacedArray.join(',')).assertEqual('66,20,30,40');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0970
     * @tc.name testBigUint64ArrayWith097
     * @tc.desc Verify hexadecimal negative length index replaces the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let replacedArray = sourceArray.with(-0x4, 66n);
      expect(replacedArray.join(',')).assertEqual('66,20,30,40');
      expect(sourceArray.join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0980
     * @tc.name testBigUint64ArrayWith098
     * @tc.desc Verify binary negative index minus one replaces the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      let replacedArray = sourceArray.with(-0b1, 24n);
      expect(replacedArray[0]).assertEqual(24n);
      expect(sourceArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_0990
     * @tc.name testBigUint64ArrayWith099
     * @tc.desc Verify octal negative index minus one replaces the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      let replacedArray = sourceArray.with(-0o1, 24n);
      expect(replacedArray[0]).assertEqual(24n);
      expect(sourceArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_WITH_1000
     * @tc.name testBigUint64ArrayWith100
     * @tc.desc Verify hexadecimal negative index minus one replaces the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayWith100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      let replacedArray = sourceArray.with(-0x1, 24n);
      expect(replacedArray[0]).assertEqual(24n);
      expect(sourceArray[0]).assertEqual(100n);
    });
  });
}
