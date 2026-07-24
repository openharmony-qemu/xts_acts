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

export default function biguint64arrayIndexGetTest(): void {

  describe('BigUint64ArrayIndexGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0100
     * @tc.name testBigUint64ArrayIndexGet001
     * @tc.desc Verify $_get(0) returns the first element from BigUint64Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0200
     * @tc.name testBigUint64ArrayIndexGet002
     * @tc.desc Verify $_get(1) returns the middle element from BigUint64Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let actualElement = sourceArray.$_get(1);
      expect(actualElement).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0300
     * @tc.name testBigUint64ArrayIndexGet003
     * @tc.desc Verify $_get(length-1) returns the last element from BigUint64Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let lastIndex: int = sourceArray.length - 1;
      let actualElement = sourceArray.$_get(lastIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0400
     * @tc.name testBigUint64ArrayIndexGet004
     * @tc.desc Verify $_get with an int variable index returns the selected element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n);
      let selectedIndex: int = 1;
      let actualElement = sourceArray.$_get(selectedIndex);
      expect(actualElement).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0500
     * @tc.name testBigUint64ArrayIndexGet005
     * @tc.desc Verify $_get with an arithmetic expression index returns the selected element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let actualElement = sourceArray.$_get(3 - 1);
      expect(actualElement).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0600
     * @tc.name testBigUint64ArrayIndexGet006
     * @tc.desc Verify $_get(0) on a single-element array returns the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(77n);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0700
     * @tc.name testBigUint64ArrayIndexGet007
     * @tc.desc Verify $_get(0) reads the zero element value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(0n);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0800
     * @tc.name testBigUint64ArrayIndexGet008
     * @tc.desc Verify $_get(0) preserves the max uint64 element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = BigUint64Array.of(maxUint64Value);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_0900
     * @tc.name testBigUint64ArrayIndexGet009
     * @tc.desc Verify $_get(1) preserves the max uint64 element in a multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = BigUint64Array.of(1n, maxUint64Value, 3n);
      let actualElement = sourceArray.$_get(1);
      expect(actualElement).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1000
     * @tc.name testBigUint64ArrayIndexGet010
     * @tc.desc Verify $_get(1) preserves the signed long max element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxSignedLongValue: bigint = 9223372036854775807n;
      let sourceArray = BigUint64Array.of(0n, maxSignedLongValue);
      let actualElement = sourceArray.$_get(1);
      expect(actualElement).assertEqual(maxSignedLongValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1100
     * @tc.name testBigUint64ArrayIndexGet011
     * @tc.desc Verify $_get(0) preserves the adjacent max uint64 minus one element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adjacentMaxUint64Value: bigint = 18446744073709551614n;
      let sourceArray = BigUint64Array.of(adjacentMaxUint64Value);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(adjacentMaxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1200
     * @tc.name testBigUint64ArrayIndexGet012
     * @tc.desc Verify $_get reads zero-initialized first element from int length construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3 as int);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1300
     * @tc.name testBigUint64ArrayIndexGet013
     * @tc.desc Verify $_get reads zero-initialized middle element from int length construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5 as int);
      let actualElement = sourceArray.$_get(2);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1400
     * @tc.name testBigUint64ArrayIndexGet014
     * @tc.desc Verify $_get reads zero-initialized last element from int length construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5 as int);
      let lastIndex: int = sourceArray.length - 1;
      let actualElement = sourceArray.$_get(lastIndex);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1500
     * @tc.name testBigUint64ArrayIndexGet015
     * @tc.desc Verify $_get reads zero-initialized element from number length construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      let actualElement = sourceArray.$_get(3);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1600
     * @tc.name testBigUint64ArrayIndexGet016
     * @tc.desc Verify $_get reads source order from Array BigInt construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<bigint> = [11n, 22n, 33n];
      let sourceArray = new BigUint64Array(sourceValues);
      let actualElement = sourceArray.$_get(2);
      expect(actualElement).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1700
     * @tc.name testBigUint64ArrayIndexGet017
     * @tc.desc Verify $_get reads source order from FixedArray BigInt construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<bigint> = [44n, 55n, 66n];
      let sourceArray = new BigUint64Array(sourceValues);
      let actualElement = sourceArray.$_get(1);
      expect(actualElement).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1800
     * @tc.name testBigUint64ArrayIndexGet018
     * @tc.desc Verify $_get reads source order from BigUint64Array.from Array input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<bigint> = [70n, 80n, 90n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let actualElement = sourceArray.$_get(0);
      expect(actualElement).assertEqual(70n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_1900
     * @tc.name testBigUint64ArrayIndexGet019
     * @tc.desc Verify $_get reads source order from copy construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = BigUint64Array.of(12n, 24n, 48n);
      let copiedArray = new BigUint64Array(originalArray);
      let actualElement = copiedArray.$_get(1);
      expect(actualElement).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2000
     * @tc.name testBigUint64ArrayIndexGet020
     * @tc.desc Verify copy construction keeps $_get result independent from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = BigUint64Array.of(12n, 24n);
      let copiedArray = new BigUint64Array(originalArray);
      originalArray.$_set(0, 99n);
      let actualElement = copiedArray.$_get(0);
      expect(actualElement).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2100
     * @tc.name testBigUint64ArrayIndexGet021
     * @tc.desc Verify $_set then $_get on the same index returns the written value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.$_set(0, 42n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2200
     * @tc.name testBigUint64ArrayIndexGet022
     * @tc.desc Verify subscript write then $_get on the same index returns the written value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      targetArray[1] = 77n;
      let actualElement = targetArray.$_get(1);
      expect(actualElement).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2300
     * @tc.name testBigUint64ArrayIndexGet023
     * @tc.desc Verify $_set of max uint64 then $_get preserves the max value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let targetArray = new BigUint64Array(1);
      targetArray.$_set(0, maxUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2400
     * @tc.name testBigUint64ArrayIndexGet024
     * @tc.desc Verify $_set of -1n then $_get observes modulo uint64 max value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(1);
      targetArray.$_set(0, -1n);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2500
     * @tc.name testBigUint64ArrayIndexGet025
     * @tc.desc Verify $_set of 2^64 then $_get observes modulo uint64 zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowUint64Value: bigint = 18446744073709551616n;
      let targetArray = new BigUint64Array(1);
      targetArray.$_set(0, overflowUint64Value);
      let actualElement = targetArray.$_get(0);
      expect(actualElement).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2600
     * @tc.name testBigUint64ArrayIndexGet026
     * @tc.desc Verify repeated $_get calls on the same index return the same element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(42n, 84n);
      let firstRead = sourceArray.$_get(0);
      let secondRead = sourceArray.$_get(0);
      expect(firstRead).assertEqual(42n);
      expect(secondRead).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2700
     * @tc.name testBigUint64ArrayIndexGet027
     * @tc.desc Verify $_get does not mutate other element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      sourceArray.$_get(0);
      expect(sourceArray.$_get(1)).assertEqual(20n);
      expect(sourceArray.$_get(2)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2800
     * @tc.name testBigUint64ArrayIndexGet028
     * @tc.desc Verify $_get does not change array length or byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n);
      let originalLength: int = sourceArray.length;
      let originalByteLength: int = sourceArray.byteLength;
      sourceArray.$_get(1);
      expect(sourceArray.length).assertEqual(originalLength);
      expect(sourceArray.byteLength).assertEqual(originalByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_2900
     * @tc.name testBigUint64ArrayIndexGet029
     * @tc.desc Verify ArrayBuffer view $_get(0) reads the first buffer element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer);
      fullView.$_set(0, 11n);
      fullView.$_set(1, 22n);
      fullView.$_set(2, 33n);
      let actualElement = fullView.$_get(0);
      expect(actualElement).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3000
     * @tc.name testBigUint64ArrayIndexGet030
     * @tc.desc Verify byteOffset view $_get(0) reads the element at the offset position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer);
      fullView.$_set(0, 11n);
      fullView.$_set(1, 22n);
      fullView.$_set(2, 33n);
      let offsetView = new BigUint64Array(buffer, 8);
      let actualElement = offsetView.$_get(0);
      expect(actualElement).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3100
     * @tc.name testBigUint64ArrayIndexGet031
     * @tc.desc Verify byteOffset and length view $_get(length-1) reads the last view element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer);
      fullView.$_set(0, 10n);
      fullView.$_set(1, 20n);
      fullView.$_set(2, 30n);
      fullView.$_set(3, 40n);
      let limitedView = new BigUint64Array(buffer, 8, 2);
      let lastIndex: int = limitedView.length - 1;
      let actualElement = limitedView.$_get(lastIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3200
     * @tc.name testBigUint64ArrayIndexGet032
     * @tc.desc Verify two views on the same buffer expose shared writes through $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(buffer, 0, 2);
      let secondView = new BigUint64Array(buffer, 0, 2);
      firstView.$_set(1, 88n);
      let actualElement = secondView.$_get(1);
      expect(actualElement).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3300
     * @tc.name testBigUint64ArrayIndexGet033
     * @tc.desc Verify subarray $_get(0) reads the parent element at the subarray start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let subarrayView = parentArray.subarray(1, 3);
      let actualElement = subarrayView.$_get(0);
      expect(actualElement).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3400
     * @tc.name testBigUint64ArrayIndexGet034
     * @tc.desc Verify parent write is visible through subarray $_get because the buffer is shared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let subarrayView = parentArray.subarray(1, 3);
      parentArray.$_set(1, 99n);
      let actualElement = subarrayView.$_get(0);
      expect(actualElement).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3500
     * @tc.name testBigUint64ArrayIndexGet035
     * @tc.desc Verify subarray write is visible through parent $_get because the buffer is shared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let subarrayView = parentArray.subarray(1, 3);
      subarrayView.$_set(0, 66n);
      let actualElement = parentArray.$_get(1);
      expect(actualElement).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3600
     * @tc.name testBigUint64ArrayIndexGet036
     * @tc.desc Verify slice copy $_get remains independent from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n);
      let slicedArray = sourceArray.slice(0, 2);
      sourceArray.$_set(0, 99n);
      let actualElement = slicedArray.$_get(0);
      expect(actualElement).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3700
     * @tc.name testBigUint64ArrayIndexGet037
     * @tc.desc Verify $_get result can be used in BigInt addition with another $_get result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n);
      let firstElement = sourceArray.$_get(0);
      let secondElement = sourceArray.$_get(1);
      let actualSum = firstElement + secondElement;
      expect(actualSum).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3800
     * @tc.name testBigUint64ArrayIndexGet038
     * @tc.desc Verify $_get(0) on an empty array throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0 as int);
      try {
        sourceArray.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_3900
     * @tc.name testBigUint64ArrayIndexGet039
     * @tc.desc Verify $_get(length) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n);
      try {
        sourceArray.$_get(sourceArray.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4000
     * @tc.name testBigUint64ArrayIndexGet040
     * @tc.desc Verify $_get(length+1) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n);
      let outOfBoundsIndex: int = sourceArray.length + 1;
      try {
        sourceArray.$_get(outOfBoundsIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4100
     * @tc.name testBigUint64ArrayIndexGet041
     * @tc.desc Verify $_get(-1) throws RangeError instead of reading from the end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      try {
        sourceArray.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4200
     * @tc.name testBigUint64ArrayIndexGet042
     * @tc.desc Verify $_get(-length) throws RangeError instead of reading the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let negativeLengthIndex: int = -sourceArray.length;
      try {
        sourceArray.$_get(negativeLengthIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4300
     * @tc.name testBigUint64ArrayIndexGet043
     * @tc.desc Verify $_get(index: byte) accepts declared byte index 2 and reads the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: byte = 2;
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4400
     * @tc.name testBigUint64ArrayIndexGet044
     * @tc.desc Verify $_get(index: short) accepts declared short index 1 and reads the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: short = 1;
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4500
     * @tc.name testBigUint64ArrayIndexGet045
     * @tc.desc Verify $_get(index: int) accepts binary literal 0b10 and reads the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: int = 0b10;
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4600
     * @tc.name testBigUint64ArrayIndexGet046
     * @tc.desc Verify $_get(index: int) accepts octal literal 0o1 inside a byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 2);
      let targetIndex: int = 0o1;
      let actualElement = targetArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4700
     * @tc.name testBigUint64ArrayIndexGet047
     * @tc.desc Verify $_get(index: int) accepts hexadecimal literal 0x02 inside a subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetArray = sourceArray.subarray(1, 4);
      let targetIndex: int = 0x02;
      let actualElement = targetArray.$_get(targetIndex);
      expect(actualElement).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4800
     * @tc.name testBigUint64ArrayIndexGet048
     * @tc.desc Verify $_get(index: int) accepts decimal literal 2 and reads the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: int = 2;
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_4900
     * @tc.name testBigUint64ArrayIndexGet049
     * @tc.desc Verify $_get(index: int) accepts octal literal 0o2 and reads the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: int = 0o2;
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5000
     * @tc.name testBigUint64ArrayIndexGet050
     * @tc.desc Verify $_get(index: int) accepts hexadecimal literal 0x02 and reads the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: int = 0x02;
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5100
     * @tc.name testBigUint64ArrayIndexGet051
     * @tc.desc Verify $_get on nested subarray window observes current shared buffer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let expectedElement: bigint = 333n;
      fullView[3] = expectedElement;
      let targetIndex: int = 0;
      let actualElement = nestedWindow.$_get(targetIndex);
      expect(nestedWindow.byteOffset).assertEqual(24);
      expect(actualElement).assertEqual(expectedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5200
     * @tc.name testBigUint64ArrayIndexGet052
     * @tc.desc Verify $_get on slice window reads copied value after source buffer mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let mutationValue: bigint = 999n;
      fullView[2] = mutationValue;
      let targetIndex: int = 0;
      let actualElement = copiedWindow.$_get(targetIndex);
      expect(copiedWindow.byteOffset).assertEqual(0);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5300
     * @tc.name testBigUint64ArrayIndexGet053
     * @tc.desc Verify $_get on zero-length byteOffset view throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let targetIndex: int = 0;
      expect(zeroLengthView.byteOffset).assertEqual(byteOffset);
      expect(zeroLengthView.length).assertEqual(0);
      try {
        zeroLengthView.$_get(targetIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5400
     * @tc.name testBigUint64ArrayIndexGet054
     * @tc.desc Verify $_get on Set-constructed array observes unique insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<bigint> = new Set<bigint>();
      sourceValues.add(7n);
      sourceValues.add(7n);
      sourceValues.add(11n);
      let constructedArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 1;
      let actualElement = constructedArray.$_get(targetIndex);
      expect(constructedArray.length).assertEqual(2);
      expect(actualElement).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5500
     * @tc.name testBigUint64ArrayIndexGet055
     * @tc.desc Verify $_get on iterator-constructed array starts from advanced iterator position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let constructedArray = new BigUint64Array(sourceIterator);
      let targetIndex: int = 0;
      let actualElement = constructedArray.$_get(targetIndex);
      expect(constructedArray.length).assertEqual(2);
      expect(actualElement).assertEqual(10n);
      expect(constructedArray.$_get(1)).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5600
     * @tc.name testBigUint64ArrayIndexGet056
     * @tc.desc Verify long toInt conversion narrows a large source to reachable index two before $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let longIndexSource: long = 4294967298;
      let targetIndex: int = longIndexSource.toInt();
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5700
     * @tc.name testBigUint64ArrayIndexGet057
     * @tc.desc Verify float toInt conversion truncates positive fractional index before $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let floatIndexSource: float = 1.9f;
      let targetIndex: int = floatIndexSource.toInt();
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5800
     * @tc.name testBigUint64ArrayIndexGet058
     * @tc.desc Verify double toInt conversion truncates positive fractional index before $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let doubleIndexSource: double = 2.9;
      let targetIndex: int = doubleIndexSource.toInt();
      let actualElement = sourceArray.$_get(targetIndex);
      expect(actualElement).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_5900
     * @tc.name testBigUint64ArrayIndexGet059
     * @tc.desc Verify $_get with Int.MIN_VALUE throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues = [10n, 20n, 30n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = Int.MIN_VALUE;
      try {
        sourceArray.$_get(targetIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEX_GET_6000
     * @tc.name testBigUint64ArrayIndexGet060
     * @tc.desc Verify $_get with Int.MAX_VALUE throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues = [10n, 20n, 30n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = Int.MAX_VALUE;
      try {
        sourceArray.$_get(targetIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(sourceArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6100
     * @tc.name testBigUint64ArrayIndexGet061
     * @tc.desc Verify binary index equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      try {
        sourceArray.$_get(0b11);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6200
     * @tc.name testBigUint64ArrayIndexGet062
     * @tc.desc Verify octal index equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      try {
        sourceArray.$_get(0o3);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6300
     * @tc.name testBigUint64ArrayIndexGet063
     * @tc.desc Verify hexadecimal index equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      try {
        sourceArray.$_get(0x3);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6400
     * @tc.name testBigUint64ArrayIndexGet064
     * @tc.desc Verify byte source converted by toInt supplies index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteIndexSource: byte = 2;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.$_get(byteIndexSource.toInt())).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6500
     * @tc.name testBigUint64ArrayIndexGet065
     * @tc.desc Verify short source converted by toInt supplies index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortIndexSource: short = 2;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.$_get(shortIndexSource.toInt())).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6600
     * @tc.name testBigUint64ArrayIndexGet066
     * @tc.desc Verify number source converted by toInt supplies truncated index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberIndexSource: number = 2.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.$_get(numberIndexSource.toInt())).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXGET_6700
     * @tc.name testBigUint64ArrayIndexGet067
     * @tc.desc Verify float source converted by toInt supplies index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexGet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatIndexSource: float = 2.9f;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.$_get(floatIndexSource.toInt())).assertEqual(30n);
    });
  });
}
