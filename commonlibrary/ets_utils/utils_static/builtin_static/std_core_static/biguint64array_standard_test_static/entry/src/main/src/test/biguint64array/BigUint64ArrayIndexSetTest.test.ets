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

export default function biguint64arrayIndexSetTest(): void {

  describe('BigUint64ArrayIndexSetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0100
     * @tc.name testBigUint64ArrayIndexSet001
     * @tc.desc Verify $_set(0, 42n) writes the first element and $_get reads it back
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      targetArray.$_set(0, 42n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0200
     * @tc.name testBigUint64ArrayIndexSet002
     * @tc.desc Verify $_set with an int variable index writes the selected middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(5);
      let selectedIndex: int = 2;
      targetArray.$_set(selectedIndex, 88n);
      let actualElement = targetArray.$_get(selectedIndex);
      expect(actualElement).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0300
     * @tc.name testBigUint64ArrayIndexSet003
     * @tc.desc Verify $_set(length-1, max uint64) writes the last element exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let targetArray = new BigUint64Array(4);
      let lastIndex: int = targetArray.length - 1;
      targetArray.$_set(lastIndex, maxUint64Value);
      let actualElement = targetArray.$_get(lastIndex);
      expect(actualElement).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0400
     * @tc.name testBigUint64ArrayIndexSet004
     * @tc.desc Verify $_set with expression index and BigInt expression value stores the computed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      targetArray.$_set(1 + 1, 30n + 20n);
      let actualElement = targetArray.$_get(2);
      expect(actualElement).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0500
     * @tc.name testBigUint64ArrayIndexSet005
     * @tc.desc Verify $_set writes all indexes independently in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      targetArray.$_set(0, 1n);
      targetArray.$_set(1, 2n);
      targetArray.$_set(2, 3n);
      targetArray.$_set(3, 4n);
      expect(targetArray.$_get(0)).assertEqual(1n);
      expect(targetArray.$_get(1)).assertEqual(2n);
      expect(targetArray.$_get(2)).assertEqual(3n);
      expect(targetArray.$_get(3)).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0600
     * @tc.name testBigUint64ArrayIndexSet006
     * @tc.desc Verify repeated $_set calls on the same index keep the last written value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 1n);
      targetArray.$_set(0, 2n);
      targetArray.$_set(0, 3n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0700
     * @tc.name testBigUint64ArrayIndexSet007
     * @tc.desc Verify $_set on the first index leaves later elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(10n, 20n, 30n);
      targetArray.$_set(0, 99n);
      expect(targetArray.$_get(1)).assertEqual(20n);
      expect(targetArray.$_get(2)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0800
     * @tc.name testBigUint64ArrayIndexSet008
     * @tc.desc Verify $_set on a single-element array writes the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(1);
      targetArray.$_set(0, 128n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(128n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_0900
     * @tc.name testBigUint64ArrayIndexSet009
     * @tc.desc Verify $_set does not change length or byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let lengthBefore: int = targetArray.length;
      let byteLengthBefore: int = targetArray.byteLength;
      targetArray.$_set(1, 77n);
      expect(targetArray.length).assertEqual(lengthBefore);
      expect(targetArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1000
     * @tc.name testBigUint64ArrayIndexSet010
     * @tc.desc Verify $_set on a copy constructed array does not mutate the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(12n, 24n, 48n);
      let copiedArray = new BigUint64Array(sourceArray);
      copiedArray.$_set(0, 99n);
      expect(copiedArray.$_get(0)).assertEqual(99n);
      expect(sourceArray.$_get(0)).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1100
     * @tc.name testBigUint64ArrayIndexSet011
     * @tc.desc Verify $_set on a zero-offset ArrayBuffer view writes the selected element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(buffer, 0, 3);
      targetArray.$_set(0, 55n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1200
     * @tc.name testBigUint64ArrayIndexSet012
     * @tc.desc Verify $_set on a byteOffset ArrayBuffer view writes the view-local first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(buffer, 8, 2);
      targetArray.$_set(0, 123n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1300
     * @tc.name testBigUint64ArrayIndexSet013
     * @tc.desc Verify two zero-offset views share $_set writes through the same ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let writerView = new BigUint64Array(buffer, 0, 2);
      let readerView = new BigUint64Array(buffer, 0, 2);
      writerView.$_set(1, 18446744073709551615n);
      let actualElement = readerView.$_get(1);
      expect(actualElement).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1400
     * @tc.name testBigUint64ArrayIndexSet014
     * @tc.desc Verify offset views observe $_set writes at the overlapping buffer element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer, 0, 3);
      let offsetView = new BigUint64Array(buffer, 8, 2);
      fullView.$_set(1, 77n);
      let actualElement = offsetView.$_get(0);
      expect(actualElement).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1500
     * @tc.name testBigUint64ArrayIndexSet015
     * @tc.desc Verify different byteOffset views keep independent byteOffset metadata after $_set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let firstView = new BigUint64Array(buffer, 0, 1);
      let secondView = new BigUint64Array(buffer, 8, 1);
      firstView.$_set(0, 10n);
      secondView.$_set(0, 20n);
      expect(firstView.byteOffset).assertEqual(0);
      expect(secondView.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1600
     * @tc.name testBigUint64ArrayIndexSet016
     * @tc.desc Verify $_set on a subarray updates the parent array through the shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let subView = parentArray.subarray(1, 3);
      subView.$_set(0, 99n);
      let actualElement = parentArray.$_get(1);
      expect(actualElement).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1700
     * @tc.name testBigUint64ArrayIndexSet017
     * @tc.desc Verify $_set writes 0n exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(1, 0n);
      let actualElement = targetArray.$_get(1);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1800
     * @tc.name testBigUint64ArrayIndexSet018
     * @tc.desc Verify $_set writes 1n exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 1n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_1900
     * @tc.name testBigUint64ArrayIndexSet019
     * @tc.desc Verify $_set preserves 2^32 as an in-range BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 4294967296n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2000
     * @tc.name testBigUint64ArrayIndexSet020
     * @tc.desc Verify $_set preserves signed long max as an in-range BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxSignedLongValue: bigint = 9223372036854775807n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, maxSignedLongValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(maxSignedLongValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2100
     * @tc.name testBigUint64ArrayIndexSet021
     * @tc.desc Verify $_set preserves 2^63 as an in-range unsigned BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unsignedHighBitValue: bigint = 9223372036854775808n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, unsignedHighBitValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(unsignedHighBitValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2200
     * @tc.name testBigUint64ArrayIndexSet022
     * @tc.desc Verify $_set preserves max uint64 minus one exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adjacentMaxUint64Value: bigint = 18446744073709551614n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, adjacentMaxUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(adjacentMaxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2300
     * @tc.name testBigUint64ArrayIndexSet023
     * @tc.desc Verify $_set preserves max uint64 exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, maxUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2400
     * @tc.name testBigUint64ArrayIndexSet024
     * @tc.desc Verify $_set wraps 2^64 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowUint64Value: bigint = 18446744073709551616n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, overflowUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2500
     * @tc.name testBigUint64ArrayIndexSet025
     * @tc.desc Verify $_set wraps 2^64 plus one to 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowPlusOneValue: bigint = 18446744073709551617n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, overflowPlusOneValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2600
     * @tc.name testBigUint64ArrayIndexSet026
     * @tc.desc Verify $_set wraps 2^64 plus forty two to 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowPlusOffsetValue: bigint = 18446744073709551616n + 42n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, overflowPlusOffsetValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2700
     * @tc.name testBigUint64ArrayIndexSet027
     * @tc.desc Verify $_set wraps two times 2^64 plus one to 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowTwicePlusOneValue: bigint = 18446744073709551616n * 2n + 1n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, overflowTwicePlusOneValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2800
     * @tc.name testBigUint64ArrayIndexSet028
     * @tc.desc Verify $_set wraps -1n to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -1n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_2900
     * @tc.name testBigUint64ArrayIndexSet029
     * @tc.desc Verify $_set wraps -2n to max uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -2n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3000
     * @tc.name testBigUint64ArrayIndexSet030
     * @tc.desc Verify $_set wraps -42n to 2^64 minus forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -42n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(18446744073709551574n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3100
     * @tc.name testBigUint64ArrayIndexSet031
     * @tc.desc Verify $_set wraps -2^63 to 2^63
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -9223372036854775808n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3200
     * @tc.name testBigUint64ArrayIndexSet032
     * @tc.desc Verify $_set wraps negative 2^63 plus one magnitude to signed long max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -9223372036854775809n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3300
     * @tc.name testBigUint64ArrayIndexSet033
     * @tc.desc Verify $_set wraps negative 2^64 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -18446744073709551616n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3400
     * @tc.name testBigUint64ArrayIndexSet034
     * @tc.desc Verify $_set wraps max uint64 plus one expression to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 18446744073709551615n + 1n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3500
     * @tc.name testBigUint64ArrayIndexSet035
     * @tc.desc Verify $_set wraps a large multiple of 2^64 plus 99n to 99n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 18446744073709551616n * 5n + 99n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3600
     * @tc.name testBigUint64ArrayIndexSet036
     * @tc.desc Verify $_set accepts a BigInt variable value and writes it exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      let replacementValue: bigint = 12345n;
      targetArray.$_set(0, replacementValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(replacementValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3700
     * @tc.name testBigUint64ArrayIndexSet037
     * @tc.desc Verify $_set accepts a max uint64 BigInt variable value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, maxUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3800
     * @tc.name testBigUint64ArrayIndexSet038
     * @tc.desc Verify $_set accepts an overflow BigInt variable and wraps it to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowUint64Value: bigint = 18446744073709551616n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, overflowUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_3900
     * @tc.name testBigUint64ArrayIndexSet039
     * @tc.desc Verify $_set accepts a negative BigInt variable and wraps it to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeValue: bigint = -1n;
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, negativeValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4000
     * @tc.name testBigUint64ArrayIndexSet040
     * @tc.desc Verify BigInt literal and variable values produce the same $_set result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literalArray = new BigUint64Array(2);
      let variableArray = new BigUint64Array(2);
      let replacementValue: bigint = 777n;
      literalArray.$_set(0, 777n);
      variableArray.$_set(0, replacementValue);
      expect(variableArray.$_get(0)).assertEqual(literalArray.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4100
     * @tc.name testBigUint64ArrayIndexSet041
     * @tc.desc Verify alternating literal and variable $_set calls update independent indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      let variableValue: bigint = 33n;
      targetArray.$_set(0, 11n);
      targetArray.$_set(1, variableValue);
      targetArray.$_set(2, 22n);
      targetArray.$_set(3, variableValue);
      expect(targetArray.$_get(0)).assertEqual(11n);
      expect(targetArray.$_get(1)).assertEqual(33n);
      expect(targetArray.$_get(2)).assertEqual(22n);
      expect(targetArray.$_get(3)).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4200
     * @tc.name testBigUint64ArrayIndexSet042
     * @tc.desc Verify $_set accepts an integer literal value and stores it as BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 42);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4300
     * @tc.name testBigUint64ArrayIndexSet043
     * @tc.desc Verify $_set accepts an int variable value and stores it as BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      let replacementValue: int = 256;
      targetArray.$_set(0, replacementValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4400
     * @tc.name testBigUint64ArrayIndexSet044
     * @tc.desc Verify $_set accepts an integer expression value and stores the computed BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 100 + 23);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4500
     * @tc.name testBigUint64ArrayIndexSet045
     * @tc.desc Verify $_set accepts integer zero and stores 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 0);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4600
     * @tc.name testBigUint64ArrayIndexSet046
     * @tc.desc Verify $_set accepts int max and stores it as BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      let maxIntValue: int = 2147483647;
      targetArray.$_set(0, maxIntValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4700
     * @tc.name testBigUint64ArrayIndexSet047
     * @tc.desc Verify $_set accepts negative int value and wraps it to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      let negativeIntegerValue: int = -1;
      targetArray.$_set(0, negativeIntegerValue);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4800
     * @tc.name testBigUint64ArrayIndexSet048
     * @tc.desc Verify $_set(length) throws RangeError and preserves existing elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(10n, 20n);
      try {
        targetArray.$_set(targetArray.length, 999n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(10n);
      expect(targetArray.$_get(1)).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_4900
     * @tc.name testBigUint64ArrayIndexSet049
     * @tc.desc Verify $_set(length+1) throws RangeError and preserves existing elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(15n, 25n);
      try {
        targetArray.$_set(targetArray.length + 1, 999n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(15n);
      expect(targetArray.$_get(1)).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5000
     * @tc.name testBigUint64ArrayIndexSet050
     * @tc.desc Verify $_set with a far positive out-of-bounds index throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(3n, 7n);
      try {
        targetArray.$_set(100, 999n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(3n);
      expect(targetArray.$_get(1)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5100
     * @tc.name testBigUint64ArrayIndexSet051
     * @tc.desc Verify $_set(-1) throws RangeError and does not use at() negative indexing semantics
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(2n, 4n);
      try {
        targetArray.$_set(-1, 999n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(2n);
      expect(targetArray.$_get(1)).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5200
     * @tc.name testBigUint64ArrayIndexSet052
     * @tc.desc Verify $_set(-length) throws RangeError and preserves existing elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(8n, 16n);
      try {
        targetArray.$_set(-targetArray.length, 999n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(8n);
      expect(targetArray.$_get(1)).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5300
     * @tc.name testBigUint64ArrayIndexSet053
     * @tc.desc Verify $_set on an empty array throws RangeError and keeps zero length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      try {
        targetArray.$_set(0, 42n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.length).assertEqual(0);
      expect(targetArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5400
     * @tc.name testBigUint64ArrayIndexSet054
     * @tc.desc Verify overflow value with out-of-bounds $_set throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(1n, 2n, 3n);
      try {
        targetArray.$_set(99, 18446744073709551616n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(1n);
      expect(targetArray.$_get(1)).assertEqual(2n);
      expect(targetArray.$_get(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5500
     * @tc.name testBigUint64ArrayIndexSet055
     * @tc.desc Verify variable value with out-of-bounds $_set throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(33n, 44n);
      let replacementValue: bigint = 999n;
      try {
        targetArray.$_set(50, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(33n);
      expect(targetArray.$_get(1)).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5600
     * @tc.name testBigUint64ArrayIndexSet056
     * @tc.desc Verify $_set result can be read through at() for a valid index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      targetArray.$_set(2, 7n);
      let actualElement = targetArray.at(2);
      expect(actualElement).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5700
     * @tc.name testBigUint64ArrayIndexSet057
     * @tc.desc Verify $_set followed by $_get returns a bigint typed runtime value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, -1n);
      let actualElement = targetArray.$_get(0);
      expect(typeof actualElement).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5800
     * @tc.name testBigUint64ArrayIndexSet058
     * @tc.desc Verify $_set does not change BYTES_PER_ELEMENT metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      targetArray.$_set(1, 42n);
      expect(targetArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_5900
     * @tc.name testBigUint64ArrayIndexSet059
     * @tc.desc Verify valid $_set still works after an out-of-bounds RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(11n, 22n, 33n);
      try {
        targetArray.$_set(10, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      targetArray.$_set(0, 44n);
      expect(targetArray.$_get(0)).assertEqual(44n);
      expect(targetArray.$_get(1)).assertEqual(22n);
      expect(targetArray.$_get(2)).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6000
     * @tc.name testBigUint64ArrayIndexSet060
     * @tc.desc Verify repeated out-of-bounds $_set calls throw RangeError and preserve array state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(4n, 9n);
      try {
        targetArray.$_set(10, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        targetArray.$_set(-1, 2n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(4n);
      expect(targetArray.$_get(1)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6100
     * @tc.name testBigUint64ArrayIndexSet061
     * @tc.desc Verify $_set of an overflow value does not change untouched elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(100n, 200n, 300n);
      targetArray.$_set(0, 18446744073709551617n);
      expect(targetArray.$_get(0)).assertEqual(1n);
      expect(targetArray.$_get(1)).assertEqual(200n);
      expect(targetArray.$_get(2)).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6200
     * @tc.name testBigUint64ArrayIndexSet062
     * @tc.desc Verify $_set(value: int) accepts binary literal 0b101010 at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let binaryReplacementValue: int = 0b101010;
      targetArray.$_set(targetIndex, binaryReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6300
     * @tc.name testBigUint64ArrayIndexSet063
     * @tc.desc Verify $_set(value: int) accepts octal literal 0o52 at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let octalReplacementValue: int = 0o52;
      targetArray.$_set(targetIndex, octalReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6400
     * @tc.name testBigUint64ArrayIndexSet064
     * @tc.desc Verify $_set(value: int) accepts hexadecimal literal 0x2A at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let hexadecimalReplacementValue: int = 0x2A;
      targetArray.$_set(targetIndex, hexadecimalReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6500
     * @tc.name testBigUint64ArrayIndexSet065
     * @tc.desc Verify $_set(value: byte) accepts declared byte value 12 and stores 12n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 0;
      let byteReplacementValue: byte = 12;
      targetArray.$_set(targetIndex, byteReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(12n);
      expect(targetArray.$_get(1)).assertEqual(1n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6600
     * @tc.name testBigUint64ArrayIndexSet066
     * @tc.desc Verify $_set(value: short) accepts declared short value 2048 and stores 2048n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let shortReplacementValue: short = 2048;
      targetArray.$_set(targetIndex, shortReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(2048n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6700
     * @tc.name testBigUint64ArrayIndexSet067
     * @tc.desc Verify $_set(value: long) accepts declared long value 10000000000 and stores 10000000000n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 2;
      let longReplacementValue: long = 10000000000;
      targetArray.$_set(targetIndex, longReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(1n);
      expect(targetArray.$_get(2)).assertEqual(10000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6800
     * @tc.name testBigUint64ArrayIndexSet068
     * @tc.desc Verify $_set(index: byte) accepts declared byte index 2 and writes the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: byte = 2;
      let replacementValue: bigint = 77n;
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(1n);
      expect(targetArray.$_get(2)).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_6900
     * @tc.name testBigUint64ArrayIndexSet069
     * @tc.desc Verify $_set(index: short) accepts declared short index 1 and writes the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: short = 1;
      let replacementValue: bigint = 88n;
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(88n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7000
     * @tc.name testBigUint64ArrayIndexSet070
     * @tc.desc Verify $_set(value: BigInt) accepts a value created from a hexadecimal number literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: BigInt = BigInt(0x2A);
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7100
     * @tc.name testBigUint64ArrayIndexSet071
     * @tc.desc Verify $_set(index: int, value: BigInt) writes through a byteOffset view with binary index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 2);
      let targetIndex: int = 0b1;
      let replacementValue: BigInt = BigInt(0o77);
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(20n);
      expect(targetArray.$_get(1)).assertEqual(63n);
      expect(sourceArray.$_get(2)).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7200
     * @tc.name testBigUint64ArrayIndexSet072
     * @tc.desc Verify $_set(index: int, value: int) writes through a subarray window with hexadecimal index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetArray = sourceArray.subarray(1, 4);
      let targetIndex: int = 0x02;
      let replacementValue: int = 0x58;
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(2)).assertEqual(88n);
      expect(sourceArray.$_get(3)).assertEqual(88n);
      expect(sourceArray.$_get(4)).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7300
     * @tc.name testBigUint64ArrayIndexSet073
     * @tc.desc Verify $_set(value: BigInt) accepts BigInt(42) and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: BigInt = BigInt(42);
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7400
     * @tc.name testBigUint64ArrayIndexSet074
     * @tc.desc Verify $_set(value: BigInt) accepts BigInt(0b101010) and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: BigInt = BigInt(0b101010);
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7500
     * @tc.name testBigUint64ArrayIndexSet075
     * @tc.desc Verify $_set(value: BigInt) accepts BigInt(0o52) and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let replacementValue: BigInt = BigInt(0o52);
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(0n);
      expect(targetArray.$_get(1)).assertEqual(42n);
      expect(targetArray.$_get(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7600
     * @tc.name testBigUint64ArrayIndexSet076
     * @tc.desc Verify byteOffset view tail $_set wraps negative value and preserves outside elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 2);
      let targetIndex: int = targetArray.length - 1;
      let replacementValue: bigint = -1n;
      targetArray.$_set(targetIndex, replacementValue);
      expect(targetArray.$_get(0)).assertEqual(20n);
      expect(targetArray.$_get(1)).assertEqual(18446744073709551615n);
      expect(sourceArray.$_get(0)).assertEqual(10n);
      expect(sourceArray.$_get(2)).assertEqual(18446744073709551615n);
      expect(sourceArray.$_get(3)).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7700
     * @tc.name testBigUint64ArrayIndexSet077
     * @tc.desc Verify subarray window first $_set wraps overflow value and preserves outside elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let targetArray = sourceArray.subarray(2, 5);
      let targetIndex: int = 0;
      let overflowReplacementValue: bigint = 18446744073709551616n + 7n;
      targetArray.$_set(targetIndex, overflowReplacementValue);
      expect(targetArray.$_get(0)).assertEqual(7n);
      expect(targetArray.$_get(1)).assertEqual(4n);
      expect(targetArray.$_get(2)).assertEqual(5n);
      expect(sourceArray.$_get(1)).assertEqual(2n);
      expect(sourceArray.$_get(2)).assertEqual(7n);
      expect(sourceArray.$_get(5)).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7800
     * @tc.name testBigUint64ArrayIndexSet078
     * @tc.desc Verify $_set on nested subarray window updates the shared buffer element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let offsetView = new BigUint64Array(sourceBuffer, 8, 6);
      let middleWindow = offsetView.subarray(1, 5);
      let nestedWindow = middleWindow.subarray(1, 3);
      let targetIndex: int = 0;
      let replacementValue: BigInt = 333n;
      nestedWindow.$_set(targetIndex, replacementValue);
      expect(nestedWindow.byteOffset).assertEqual(24);
      expect(nestedWindow.$_get(0)).assertEqual(replacementValue);
      expect(fullView.$_get(2)).assertEqual(30n);
      expect(fullView.$_get(3)).assertEqual(replacementValue);
      expect(fullView.$_get(5)).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_7900
     * @tc.name testBigUint64ArrayIndexSet079
     * @tc.desc Verify $_set on slice window does not mutate the source buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let sliceBeginIndex: int = 1;
      let sliceEndIndex: int = 3;
      let copiedWindow = offsetView.slice(sliceBeginIndex, sliceEndIndex);
      let targetIndex: int = 0;
      let replacementValue: BigInt = 777n;
      copiedWindow.$_set(targetIndex, replacementValue);
      expect(copiedWindow.byteOffset).assertEqual(0);
      expect(copiedWindow.$_get(0)).assertEqual(replacementValue);
      expect(fullView.$_get(2)).assertEqual(30n);
      expect(offsetView.$_get(1)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8000
     * @tc.name testBigUint64ArrayIndexSet080
     * @tc.desc Verify $_set on zero-length byteOffset view throws RangeError and keeps source data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let targetIndex: int = 0;
      let replacementValue: BigInt = 7n;
      expect(zeroLengthView.byteOffset).assertEqual(byteOffset);
      expect(zeroLengthView.length).assertEqual(0);
      try {
        zeroLengthView.$_set(targetIndex, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(fullView.$_get(1)).assertEqual(20n);
      expect(fullView.$_get(2)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8100
     * @tc.name testBigUint64ArrayIndexSet081
     * @tc.desc Verify byte index converted by toInt writes the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let targetIndex: byte = 2;
      targetArray.$_set(targetIndex.toInt(), 55n);
      expect(targetArray.$_get(2)).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8200
     * @tc.name testBigUint64ArrayIndexSet082
     * @tc.desc Verify short index converted by toInt writes the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let targetIndex: short = 1;
      targetArray.$_set(targetIndex.toInt(), 66n);
      expect(targetArray.$_get(1)).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8300
     * @tc.name testBigUint64ArrayIndexSet083
     * @tc.desc Verify long index converted by toInt writes index 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      let targetIndex: long = 3;
      targetArray.$_set(targetIndex.toInt(), 77n);
      expect(targetArray.$_get(3)).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8400
     * @tc.name testBigUint64ArrayIndexSet084
     * @tc.desc Verify float index 1.9f converted by toInt writes index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let targetIndex: float = 1.9f;
      targetArray.$_set(targetIndex.toInt(), 88n);
      expect(targetArray.$_get(1)).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8500
     * @tc.name testBigUint64ArrayIndexSet085
     * @tc.desc Verify double index 2.9 converted by toInt writes index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let targetIndex: double = 2.9;
      targetArray.$_set(targetIndex.toInt(), 99n);
      expect(targetArray.$_get(2)).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8600
     * @tc.name testBigUint64ArrayIndexSet086
     * @tc.desc Verify int minimum index throws RangeError and preserves all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let targetIndex: int = -2147483648;
      try {
        targetArray.$_set(targetIndex, 99n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(1n);
      expect(targetArray.$_get(1)).assertEqual(2n);
      expect(targetArray.$_get(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8700
     * @tc.name testBigUint64ArrayIndexSet087
     * @tc.desc Verify int maximum index throws RangeError and preserves all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let targetIndex: int = 2147483647;
      try {
        targetArray.$_set(targetIndex, 99n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      expect(targetArray.$_get(0)).assertEqual(1n);
      expect(targetArray.$_get(1)).assertEqual(2n);
      expect(targetArray.$_get(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_SET_8800
     * @tc.name testBigUint64ArrayIndexSet088
     * @tc.desc Verify an offset view out-of-bounds failure preserves every shared element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexSet088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let offsetView = new BigUint64Array(sourceArray.buffer, 8, 3);
      try {
        offsetView.$_set(3, 99n);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
      expect(sourceArray.$_get(0)).assertEqual(10n);
      expect(sourceArray.$_get(1)).assertEqual(20n);
      expect(sourceArray.$_get(2)).assertEqual(30n);
      expect(sourceArray.$_get(3)).assertEqual(40n);
      expect(sourceArray.$_get(4)).assertEqual(50n);
    });

  });
}
