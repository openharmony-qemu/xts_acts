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


export default function biguint64arrayIndexOfTest(): void {

  describe('BigUint64ArrayIndexOfTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0100
     * @tc.name testBigUint64ArrayIndexOf001
     * @tc.desc Verify indexOf(searchElement) uses default fromIndex zero and finds the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([100n, 200n]);
      let searchIndex = targetArray.indexOf(100n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0200
     * @tc.name testBigUint64ArrayIndexOf002
     * @tc.desc Verify indexOf(searchElement, fromIndex) starts searching from the provided index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([100n, 200n, 300n]);
      let searchIndex = targetArray.indexOf(200n, 1);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0300
     * @tc.name testBigUint64ArrayIndexOf003
     * @tc.desc Verify indexOf(0n) returns index zero when zero is the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(0n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0400
     * @tc.name testBigUint64ArrayIndexOf004
     * @tc.desc Verify indexOf(1n) returns the index of a unit BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(1n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0500
     * @tc.name testBigUint64ArrayIndexOf005
     * @tc.desc Verify indexOf(42n) returns the index of a normal BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(42n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0600
     * @tc.name testBigUint64ArrayIndexOf006
     * @tc.desc Verify indexOf() finds the max uint64 boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(18446744073709551615n);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0700
     * @tc.name testBigUint64ArrayIndexOf007
     * @tc.desc Verify indexOf() finds the max uint64 minus one boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551614n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(18446744073709551614n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0800
     * @tc.name testBigUint64ArrayIndexOf008
     * @tc.desc Verify indexOf() finds the signed long max boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 9223372036854775807n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(9223372036854775807n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_0900
     * @tc.name testBigUint64ArrayIndexOf009
     * @tc.desc Verify indexOf() returns negative one when a BigInt value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(999n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1000
     * @tc.name testBigUint64ArrayIndexOf010
     * @tc.desc Verify indexOf() returns negative one for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      let searchIndex = targetArray.indexOf(0n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1100
     * @tc.name testBigUint64ArrayIndexOf011
     * @tc.desc Verify indexOf() returns negative one for a nonmatching single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n]);
      let searchIndex = targetArray.indexOf(1n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1200
     * @tc.name testBigUint64ArrayIndexOf012
     * @tc.desc Verify indexOf() returns negative one when the max uint64 value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n]);
      let searchIndex = targetArray.indexOf(18446744073709551615n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1300
     * @tc.name testBigUint64ArrayIndexOf013
     * @tc.desc Verify indexOf(-1n) wraps to the max uint64 value during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(-1n);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1400
     * @tc.name testBigUint64ArrayIndexOf014
     * @tc.desc Verify indexOf(2^64) wraps to zero during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(18446744073709551616n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1500
     * @tc.name testBigUint64ArrayIndexOf015
     * @tc.desc Verify indexOf(0n) finds the first element in a zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let searchIndex = targetArray.indexOf(0n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1600
     * @tc.name testBigUint64ArrayIndexOf016
     * @tc.desc Verify indexOf(number zero) matches a stored zero BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.indexOf(0);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1700
     * @tc.name testBigUint64ArrayIndexOf017
     * @tc.desc Verify indexOf(number one) matches a stored one BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.indexOf(1);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1800
     * @tc.name testBigUint64ArrayIndexOf018
     * @tc.desc Verify indexOf(number forty two) matches a stored normal BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.indexOf(42);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_1900
     * @tc.name testBigUint64ArrayIndexOf019
     * @tc.desc Verify indexOf(number) returns negative one when the numeric value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.indexOf(999);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2000
     * @tc.name testBigUint64ArrayIndexOf020
     * @tc.desc Verify indexOf(number int max) matches the stored BigInt boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 2147483647n]);
      let searchIndex = targetArray.indexOf(2147483647);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2100
     * @tc.name testBigUint64ArrayIndexOf021
     * @tc.desc Verify indexOf() returns the first index for duplicate BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 0n, 42n, 1n]);
      let searchIndex = targetArray.indexOf(42n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2200
     * @tc.name testBigUint64ArrayIndexOf022
     * @tc.desc Verify indexOf() can find a later duplicate after skipping the first match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 0n, 42n, 1n]);
      let searchIndex = targetArray.indexOf(42n, 1);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2300
     * @tc.name testBigUint64ArrayIndexOf023
     * @tc.desc Verify indexOf() returns negative one when fromIndex starts after all duplicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 0n, 42n, 1n]);
      let searchIndex = targetArray.indexOf(42n, 3);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2400
     * @tc.name testBigUint64ArrayIndexOf024
     * @tc.desc Verify indexOf() returns zero when every element matches the search value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 7n, 7n]);
      let searchIndex = targetArray.indexOf(7n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2500
     * @tc.name testBigUint64ArrayIndexOf025
     * @tc.desc Verify indexOf() returns zero for a matching single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n]);
      let searchIndex = targetArray.indexOf(42n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2600
     * @tc.name testBigUint64ArrayIndexOf026
     * @tc.desc Verify indexOf() returns negative one when fromIndex skips the only matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n]);
      let searchIndex = targetArray.indexOf(42n, 1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2700
     * @tc.name testBigUint64ArrayIndexOf027
     * @tc.desc Verify fromIndex zero produces the same first-match index as the default search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 5n]);
      let defaultIndex = targetArray.indexOf(5n);
      let zeroIndex = targetArray.indexOf(5n, 0);
      expect(defaultIndex).assertEqual(0);
      expect(zeroIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2800
     * @tc.name testBigUint64ArrayIndexOf028
     * @tc.desc Verify fromIndex length minus one can find the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let searchIndex = targetArray.indexOf(40n, targetArray.length - 1);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_2900
     * @tc.name testBigUint64ArrayIndexOf029
     * @tc.desc Verify fromIndex length minus one skips a matching element stored earlier
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let searchIndex = targetArray.indexOf(20n, targetArray.length - 1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3000
     * @tc.name testBigUint64ArrayIndexOf030
     * @tc.desc Verify fromIndex equal to length returns negative one even when the value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n]);
      let searchIndex = targetArray.indexOf(5n, targetArray.length);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3100
     * @tc.name testBigUint64ArrayIndexOf031
     * @tc.desc Verify fromIndex beyond length returns negative one even when the value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n]);
      let searchIndex = targetArray.indexOf(10n, targetArray.length + 1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3200
     * @tc.name testBigUint64ArrayIndexOf032
     * @tc.desc Verify a very large positive fromIndex returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n]);
      let searchIndex = targetArray.indexOf(10n, 999);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3300
     * @tc.name testBigUint64ArrayIndexOf033
     * @tc.desc Verify indexOf() with fromIndex -1 starts its forward search at index 4 and returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let searchIndex = targetArray.indexOf(5n, -1);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3400
     * @tc.name testBigUint64ArrayIndexOf034
     * @tc.desc Verify fromIndex negative one skips a matching value before the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let searchIndex = targetArray.indexOf(3n, -1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3500
     * @tc.name testBigUint64ArrayIndexOf035
     * @tc.desc Verify indexOf() with fromIndex -2 starts its forward search at index 3 and returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let searchIndex = targetArray.indexOf(40n, -2);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3600
     * @tc.name testBigUint64ArrayIndexOf036
     * @tc.desc Verify fromIndex negative two can find a matching last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let searchIndex = targetArray.indexOf(50n, -2);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3700
     * @tc.name testBigUint64ArrayIndexOf037
     * @tc.desc Verify fromIndex negative two skips values before the effective start index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 0n, 3n, 42n]);
      let searchIndex = targetArray.indexOf(0n, -2);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3800
     * @tc.name testBigUint64ArrayIndexOf038
     * @tc.desc Verify fromIndex negative length starts searching from index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([100n, 200n, 300n]);
      let searchIndex = targetArray.indexOf(100n, -targetArray.length);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_3900
     * @tc.name testBigUint64ArrayIndexOf039
     * @tc.desc Verify fromIndex less than negative length is clamped to index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let searchIndex = targetArray.indexOf(30n, -(targetArray.length + 1));
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4000
     * @tc.name testBigUint64ArrayIndexOf040
     * @tc.desc Verify a very large negative fromIndex is clamped to index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 8n, 9n]);
      let searchIndex = targetArray.indexOf(7n, -100);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4100
     * @tc.name testBigUint64ArrayIndexOf041
     * @tc.desc Verify indexOf() on an empty array with fromIndex -1 returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      let searchIndex = targetArray.indexOf(0n, -1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4200
     * @tc.name testBigUint64ArrayIndexOf042
     * @tc.desc Verify indexOf() with fromIndex -2 returns index 2 for max uint64 at the effective start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 18446744073709551615n, 42n]);
      let searchIndex = targetArray.indexOf(18446744073709551615n, -2);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4300
     * @tc.name testBigUint64ArrayIndexOf043
     * @tc.desc Verify fromIndex negative one skips max uint64 when it is before the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 18446744073709551615n, 42n]);
      let searchIndex = targetArray.indexOf(18446744073709551615n, -1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4400
     * @tc.name testBigUint64ArrayIndexOf044
     * @tc.desc Verify fromIndex int max returns negative one even when the value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.indexOf(0n, 2147483647);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4500
     * @tc.name testBigUint64ArrayIndexOf045
     * @tc.desc Verify fromIndex int min is clamped to zero for a forward search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.indexOf(0n, -2147483648);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4600
     * @tc.name testBigUint64ArrayIndexOf046
     * @tc.desc Verify number searchElement with fromIndex can find a later zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.indexOf(0, 1);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4700
     * @tc.name testBigUint64ArrayIndexOf047
     * @tc.desc Verify indexOf() with number searchElement 42 and fromIndex -3 returns index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.indexOf(42, -3);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4800
     * @tc.name testBigUint64ArrayIndexOf048
     * @tc.desc Verify an indexOf result can read back the matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let searchIndex = targetArray.indexOf(15n);
      let matchedElement = targetArray[searchIndex];
      expect(searchIndex).assertEqual(2);
      expect(matchedElement).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_4900
     * @tc.name testBigUint64ArrayIndexOf049
     * @tc.desc Verify an indexOf result can be used to locate the next element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let searchIndex = targetArray.indexOf(10n);
      let nextIndex = searchIndex + 1;
      expect(searchIndex).assertEqual(1);
      expect(targetArray[nextIndex]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5000
     * @tc.name testBigUint64ArrayIndexOf050
     * @tc.desc Verify repeated indexOf calls on the same array return the same index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let firstIndex = targetArray.indexOf(2n);
      let secondIndex = targetArray.indexOf(2n);
      expect(firstIndex).assertEqual(1);
      expect(secondIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5100
     * @tc.name testBigUint64ArrayIndexOf051
     * @tc.desc Verify indexOf() does not change length byteLength or elements after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([75n, 85n, 95n]);
      let originalByteLength: int = targetArray.byteLength;
      let searchIndex = targetArray.indexOf(85n);
      expect(searchIndex).assertEqual(1);
      expect(targetArray.length).assertEqual(3);
      expect(targetArray.byteLength).assertEqual(originalByteLength);
      expect(targetArray[0]).assertEqual(75n);
      expect(targetArray[1]).assertEqual(85n);
      expect(targetArray[2]).assertEqual(95n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5200
     * @tc.name testBigUint64ArrayIndexOf052
     * @tc.desc Verify indexOf() does not change length or elements after a miss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([35n, 45n, 55n]);
      let searchIndex = targetArray.indexOf(0n);
      expect(searchIndex).assertEqual(-1);
      expect(targetArray.length).assertEqual(3);
      expect(targetArray[0]).assertEqual(35n);
      expect(targetArray[1]).assertEqual(45n);
      expect(targetArray[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5300
     * @tc.name testBigUint64ArrayIndexOf053
     * @tc.desc Verify BYTES_PER_ELEMENT remains eight after indexOf()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n]);
      let searchIndex = targetArray.indexOf(1n);
      expect(searchIndex).assertEqual(0);
      expect(targetArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5400
     * @tc.name testBigUint64ArrayIndexOf054
     * @tc.desc Verify indexOf() works on an ArrayBuffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(sourceBuffer, 0, 3);
      targetArray[0] = 52n;
      targetArray[1] = 104n;
      targetArray[2] = 208n;
      let searchIndex = targetArray.indexOf(104n);
      expect(searchIndex).assertEqual(1);
      expect(targetArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5500
     * @tc.name testBigUint64ArrayIndexOf055
     * @tc.desc Verify a byteOffset view returns an index relative to the view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      let searchIndex = offsetView.indexOf(3n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5600
     * @tc.name testBigUint64ArrayIndexOf056
     * @tc.desc Verify a subarray indexOf result is relative to the subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subArray = parentArray.subarray(1, 4);
      let searchIndex = subArray.indexOf(30n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5700
     * @tc.name testBigUint64ArrayIndexOf057
     * @tc.desc Verify a subarray indexOf miss returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subArray = parentArray.subarray(1, 4);
      let searchIndex = subArray.indexOf(10n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5800
     * @tc.name testBigUint64ArrayIndexOf058
     * @tc.desc Verify indexOf() on a buffer view does not mutate shared buffer content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let firstView = new BigUint64Array(sourceBuffer, 0, 3);
      firstView[0] = 5n;
      firstView[1] = 10n;
      firstView[2] = 15n;
      let searchIndex = firstView.indexOf(10n);
      let verifyView = new BigUint64Array(sourceBuffer, 0, 3);
      expect(searchIndex).assertEqual(1);
      expect(verifyView[0]).assertEqual(5n);
      expect(verifyView[1]).assertEqual(10n);
      expect(verifyView[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_5900
     * @tc.name testBigUint64ArrayIndexOf059
     * @tc.desc Verify byteOffset remains unchanged after indexOf() on an offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(sourceBuffer, 8, 2);
      targetArray[0] = 7n;
      targetArray[1] = 14n;
      let originalByteOffset: int = targetArray.byteOffset;
      let searchIndex = targetArray.indexOf(14n);
      expect(searchIndex).assertEqual(1);
      expect(targetArray.byteOffset).assertEqual(originalByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6000
     * @tc.name testBigUint64ArrayIndexOf060
     * @tc.desc Verify indexOf(number negative one) wraps to the max uint64 value during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551615n, 1n]);
      let searchIndex = targetArray.indexOf(-1);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6100
     * @tc.name testBigUint64ArrayIndexOf061
     * @tc.desc Verify indexOf(number negative two) wraps to max uint64 minus one during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551614n, 18446744073709551615n]);
      let searchIndex = targetArray.indexOf(-2);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6200
     * @tc.name testBigUint64ArrayIndexOf062
     * @tc.desc Verify indexOf(searchElement: int) accepts binary literal 0b11111111 and returns index of stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let binarySearchElement: int = 0b11111111;
      let searchIndex = targetArray.indexOf(binarySearchElement);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6300
     * @tc.name testBigUint64ArrayIndexOf063
     * @tc.desc Verify indexOf(searchElement: int) accepts octal literal 0o377 and returns index of stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let octalSearchElement: int = 0o377;
      let searchIndex = targetArray.indexOf(octalSearchElement);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6400
     * @tc.name testBigUint64ArrayIndexOf064
     * @tc.desc Verify indexOf(searchElement: int) accepts hexadecimal literal 0xFF and returns index of stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let hexadecimalSearchElement: int = 0xFF;
      let searchIndex = targetArray.indexOf(hexadecimalSearchElement);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6500
     * @tc.name testBigUint64ArrayIndexOf065
     * @tc.desc Verify indexOf(searchElement: byte) accepts declared byte 42 and returns index of stored 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let searchElement: byte = 42;
      let searchIndex = targetArray.indexOf(searchElement);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6600
     * @tc.name testBigUint64ArrayIndexOf066
     * @tc.desc Verify indexOf(searchElement: short) accepts declared short 255 and returns index of stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let searchElement: short = 255;
      let searchIndex = targetArray.indexOf(searchElement);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6700
     * @tc.name testBigUint64ArrayIndexOf067
     * @tc.desc Verify indexOf(fromIndex: byte) accepts declared byte 2 and returns a later duplicate index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 7n, 42n]);
      let fromIndex: byte = 2;
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6800
     * @tc.name testBigUint64ArrayIndexOf068
     * @tc.desc Verify indexOf(fromIndex: short) accepts declared short 2 and skips an earlier match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 7n, 9n]);
      let fromIndex: short = 2;
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_6900
     * @tc.name testBigUint64ArrayIndexOf069
     * @tc.desc Verify indexOf(searchElement: int, fromIndex: int) accepts binary searchElement 0b101010 and hexadecimal fromIndex 0x02 to return a later duplicate index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n, 9n]);
      let binarySearchElement: int = 0b101010;
      let hexadecimalFromIndex: int = 0x02;
      let searchIndex = targetArray.indexOf(binarySearchElement, hexadecimalFromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7000
     * @tc.name testBigUint64ArrayIndexOf070
     * @tc.desc Verify indexOf(searchElement: int, fromIndex: int) accepts octal searchElement 0o52 and binary fromIndex 0b11 to return negative one after skipping every match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n]);
      let octalSearchElement: int = 0o52;
      let binaryFromIndex: int = 0b11;
      let searchIndex = targetArray.indexOf(octalSearchElement, binaryFromIndex);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7100
     * @tc.name testBigUint64ArrayIndexOf071
     * @tc.desc Verify indexOf(searchElement) matches a BigInt created from a hexadecimal number literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 42n, 255n]);
      let searchElement: BigInt = BigInt(0x2A);
      let searchIndex = targetArray.indexOf(searchElement);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7200
     * @tc.name testBigUint64ArrayIndexOf072
     * @tc.desc Verify indexOf(fromIndex: int) accepts binary fromIndex inside a byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 4);
      let binaryFromIndex: int = 0b10;
      let searchIndex = targetArray.indexOf(40n, binaryFromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7300
     * @tc.name testBigUint64ArrayIndexOf073
     * @tc.desc Verify indexOf(searchElement, fromIndex) uses local indices in a subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetArray = sourceArray.subarray(1, 4);
      let searchElement: BigInt = BigInt(0b11110);
      let hexadecimalFromIndex: int = 0x01;
      let searchIndex = targetArray.indexOf(searchElement, hexadecimalFromIndex);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7400
     * @tc.name testBigUint64ArrayIndexOf074
     * @tc.desc Verify indexOf(searchElement: int) accepts decimal literal 255 and returns index of stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let decimalSearchElement: int = 255;
      let searchIndex = targetArray.indexOf(decimalSearchElement);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7500
     * @tc.name testBigUint64ArrayIndexOf075
     * @tc.desc Verify byteOffset view indexOf does not search parent tail when fromIndex equals view length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 20n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 3);
      let fromIndex: int = targetArray.length;
      let searchIndex = targetArray.indexOf(20n, fromIndex);
      expect(searchIndex).assertEqual(-1);
      expect(targetArray.length).assertEqual(3);
      expect(sourceArray[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7600
     * @tc.name testBigUint64ArrayIndexOf076
     * @tc.desc Verify subarray indexOf uses negative fromIndex relative to the local window tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 20n, 50n]);
      let targetArray = sourceArray.subarray(1, 4);
      let localTailIndex: int = -1;
      let searchIndex = targetArray.indexOf(20n, localTailIndex);
      expect(searchIndex).assertEqual(2);
      expect(targetArray.length).assertEqual(3);
      expect(sourceArray[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7700
     * @tc.name testBigUint64ArrayIndexOf077
     * @tc.desc Verify indexOf() returns a local index inside a nested byteOffset subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 30n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let nestedWindow = offsetView.subarray(1, 4);
      let fromIndex: int = 1;
      let searchIndex = nestedWindow.indexOf(30n, fromIndex);
      expect(searchIndex).assertEqual(2);
      expect(nestedWindow.byteOffset).assertEqual(16);
      expect(nestedWindow.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7800
     * @tc.name testBigUint64ArrayIndexOf078
     * @tc.desc Verify indexOf() on a slice copy from a byteOffset view does not observe later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      fullView[2] = 777n;
      let copiedValueIndex = sliceCopy.indexOf(30n);
      let sourceWriteIndex = sliceCopy.indexOf(777n);
      let differsFromSourceBuffer: boolean = sliceCopy.buffer !== sourceBuffer;
      expect(copiedValueIndex).assertEqual(0);
      expect(sourceWriteIndex).assertEqual(-1);
      expect(differsFromSourceBuffer).assertTrue();
      expect(fullView[2]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_7900
     * @tc.name testBigUint64ArrayIndexOf079
     * @tc.desc Verify indexOf() returns negative one on a zero-length byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let searchIndex = zeroLengthView.indexOf(30n);
      expect(searchIndex).assertEqual(-1);
      expect(zeroLengthView.length).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
      expect(zeroLengthView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8000
     * @tc.name testBigUint64ArrayIndexOf080
     * @tc.desc Verify byte source converted by toInt supplies negative fromIndex -2 and returns index 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let byteIndexSource: byte = -2;
      let fromIndex: int = byteIndexSource.toInt();
      let searchIndex = targetArray.indexOf(40n, fromIndex);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8100
     * @tc.name testBigUint64ArrayIndexOf081
     * @tc.desc Verify short source converted by toInt supplies fromIndex 2 and returns later duplicate index 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n, 42n, 50n]);
      let shortIndexSource: short = 2;
      let fromIndex: int = shortIndexSource.toInt();
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8200
     * @tc.name testBigUint64ArrayIndexOf082
     * @tc.desc Verify long source converted by toInt supplies negative fromIndex -3 and returns index 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 42n, 20n, 30n, 42n]);
      let longIndexSource: long = -3;
      let fromIndex: int = longIndexSource.toInt();
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8300
     * @tc.name testBigUint64ArrayIndexOf083
     * @tc.desc Verify float source 1.9f converted by toInt supplies fromIndex 1 and returns index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 42n, 50n]);
      let floatIndexSource: float = 1.9f;
      let fromIndex: int = floatIndexSource.toInt();
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8400
     * @tc.name testBigUint64ArrayIndexOf084
     * @tc.desc Verify double source 2.9 converted by toInt skips an earlier match and returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 42n, 20n, 30n]);
      let doubleIndexSource: double = 2.9;
      let fromIndex: int = doubleIndexSource.toInt();
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8500
     * @tc.name testBigUint64ArrayIndexOf085
     * @tc.desc Verify indexOf returns index 1 for the signed 64-bit boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 9223372036854775808n, 2n]);
      let searchIndex = targetArray.indexOf(9223372036854775808n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8600
     * @tc.name testBigUint64ArrayIndexOf086
     * @tc.desc Verify fromIndex negative length plus one skips index zero and returns later duplicate index 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n, 42n, 50n]);
      let fromIndex: int = -targetArray.length + 1;
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8700
     * @tc.name testBigUint64ArrayIndexOf087
     * @tc.desc Verify indexOf returns -1 when fromIndex negative length plus one excludes the only match at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n, 30n, 50n]);
      let fromIndex: int = -targetArray.length + 1;
      let searchIndex = targetArray.indexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8800
     * @tc.name testBigUint64ArrayIndexOf088
     * @tc.desc Verify an offset view returns local index 1 after an overlapping sibling writes a new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(40);
      let targetView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 2);
      let initialIndex = targetView.indexOf(99n);
      siblingView[0] = 99n;
      let updatedIndex = targetView.indexOf(99n);
      expect(initialIndex).assertEqual(-1);
      expect(updatedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_8900
     * @tc.name testBigUint64ArrayIndexOf089
     * @tc.desc Verify negative fromIndex -2 returns local index 2 inside an offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let targetView = new BigUint64Array(sourceArray.buffer, 8, 4);
      let searchIndex = targetView.indexOf(40n, -2);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_9000
     * @tc.name testBigUint64ArrayIndexOf090
     * @tc.desc Verify a subarray returns local index 2 after a later parent write inside its window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetView = parentArray.subarray(1, 4);
      let initialIndex = targetView.indexOf(99n);
      parentArray[3] = 99n;
      let updatedIndex = targetView.indexOf(99n);
      expect(initialIndex).assertEqual(-1);
      expect(updatedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_9100
     * @tc.name testBigUint64ArrayIndexOf091
     * @tc.desc Verify a nested view returns local index zero after a buffer write inside the nested window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer);
      let offsetView = new BigUint64Array(sharedBuffer, 8, 4);
      let nestedView = offsetView.subarray(1, 3);
      fullView[2] = 77n;
      let searchIndex = nestedView.indexOf(77n);
      expect(searchIndex).assertEqual(0);
      expect(nestedView.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INDEXOF_9200
     * @tc.name testBigUint64ArrayIndexOf092
     * @tc.desc Verify local fromIndex one skips an overlap value at index zero of the later view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIndexOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let earlierView = new BigUint64Array(sharedBuffer, 8, 4);
      let laterView = new BigUint64Array(sharedBuffer, 24, 3);
      earlierView[2] = 66n;
      let searchIndex = laterView.indexOf(66n, 1);
      expect(searchIndex).assertEqual(-1);
      expect(laterView[0]).assertEqual(66n);
    });

  });
}
