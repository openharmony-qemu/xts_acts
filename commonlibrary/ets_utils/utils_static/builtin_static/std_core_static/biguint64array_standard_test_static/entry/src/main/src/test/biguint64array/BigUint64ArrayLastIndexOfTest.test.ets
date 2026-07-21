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


export default function biguint64arrayLastIndexOfTest(): void {

  describe('BigUint64ArrayLastIndexOfTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0100
     * @tc.name testBigUint64ArrayLastIndexOf001
     * @tc.desc Verify lastIndexOf(searchElement) searches from the end and returns the last matching index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([100n, 200n, 100n]);
      let searchIndex = targetArray.lastIndexOf(100n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0200
     * @tc.name testBigUint64ArrayLastIndexOf002
     * @tc.desc Verify lastIndexOf(searchElement, fromIndex) starts searching backward from the provided index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([100n, 200n, 100n, 300n]);
      let searchIndex = targetArray.lastIndexOf(100n, 1);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0300
     * @tc.name testBigUint64ArrayLastIndexOf003
     * @tc.desc Verify lastIndexOf(0n) returns the last zero index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.lastIndexOf(0n);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0400
     * @tc.name testBigUint64ArrayLastIndexOf004
     * @tc.desc Verify lastIndexOf(1n) returns the index of a unit BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.lastIndexOf(1n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0500
     * @tc.name testBigUint64ArrayLastIndexOf005
     * @tc.desc Verify lastIndexOf(42n) returns the index of a normal BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.lastIndexOf(42n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0600
     * @tc.name testBigUint64ArrayLastIndexOf006
     * @tc.desc Verify lastIndexOf() finds the max uint64 boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.lastIndexOf(18446744073709551615n);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0700
     * @tc.name testBigUint64ArrayLastIndexOf007
     * @tc.desc Verify lastIndexOf() finds the max uint64 minus one boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551614n, 18446744073709551615n]);
      let searchIndex = targetArray.lastIndexOf(18446744073709551614n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0800
     * @tc.name testBigUint64ArrayLastIndexOf008
     * @tc.desc Verify lastIndexOf() finds the signed long max boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 9223372036854775807n, 42n]);
      let searchIndex = targetArray.lastIndexOf(9223372036854775807n);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_0900
     * @tc.name testBigUint64ArrayLastIndexOf009
     * @tc.desc Verify lastIndexOf() returns negative one when a BigInt value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n]);
      let searchIndex = targetArray.lastIndexOf(999n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1000
     * @tc.name testBigUint64ArrayLastIndexOf010
     * @tc.desc Verify lastIndexOf() returns negative one for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      let searchIndex = targetArray.lastIndexOf(0n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1100
     * @tc.name testBigUint64ArrayLastIndexOf011
     * @tc.desc Verify lastIndexOf() returns negative one for a nonmatching single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n]);
      let searchIndex = targetArray.lastIndexOf(1n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1200
     * @tc.name testBigUint64ArrayLastIndexOf012
     * @tc.desc Verify lastIndexOf() returns negative one when the max uint64 value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n]);
      let searchIndex = targetArray.lastIndexOf(18446744073709551615n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1300
     * @tc.name testBigUint64ArrayLastIndexOf013
     * @tc.desc Verify lastIndexOf(-1n) wraps to the max uint64 value during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551615n, 1n, 18446744073709551615n]);
      let searchIndex = targetArray.lastIndexOf(-1n);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1400
     * @tc.name testBigUint64ArrayLastIndexOf014
     * @tc.desc Verify lastIndexOf(2^64) wraps to zero during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.lastIndexOf(18446744073709551616n);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1500
     * @tc.name testBigUint64ArrayLastIndexOf015
     * @tc.desc Verify lastIndexOf(0n) finds the last element in a zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let searchIndex = targetArray.lastIndexOf(0n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1600
     * @tc.name testBigUint64ArrayLastIndexOf016
     * @tc.desc Verify lastIndexOf(number zero) matches the last stored zero BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 0n]);
      let searchIndex = targetArray.lastIndexOf(0);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1700
     * @tc.name testBigUint64ArrayLastIndexOf017
     * @tc.desc Verify lastIndexOf(number one) matches a stored one BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.lastIndexOf(1);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1800
     * @tc.name testBigUint64ArrayLastIndexOf018
     * @tc.desc Verify lastIndexOf(number forty two) matches a stored normal BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.lastIndexOf(42);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_1900
     * @tc.name testBigUint64ArrayLastIndexOf019
     * @tc.desc Verify lastIndexOf(number) returns negative one when the numeric value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.lastIndexOf(999);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2000
     * @tc.name testBigUint64ArrayLastIndexOf020
     * @tc.desc Verify lastIndexOf(number int max) matches the stored BigInt boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 2147483647n]);
      let searchIndex = targetArray.lastIndexOf(2147483647);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2100
     * @tc.name testBigUint64ArrayLastIndexOf021
     * @tc.desc Verify lastIndexOf() returns the last index for duplicate BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 0n, 42n, 1n]);
      let searchIndex = targetArray.lastIndexOf(42n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2200
     * @tc.name testBigUint64ArrayLastIndexOf022
     * @tc.desc Verify lastIndexOf() can find an earlier duplicate when fromIndex limits the search range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 0n, 42n, 1n]);
      let searchIndex = targetArray.lastIndexOf(42n, 1);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2300
     * @tc.name testBigUint64ArrayLastIndexOf023
     * @tc.desc Verify lastIndexOf() returns negative one when fromIndex is before all matching duplicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 0n, 42n]);
      let searchIndex = targetArray.lastIndexOf(42n, 0);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2400
     * @tc.name testBigUint64ArrayLastIndexOf024
     * @tc.desc Verify lastIndexOf() returns the last index when every element matches the search value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 7n, 7n]);
      let searchIndex = targetArray.lastIndexOf(7n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2500
     * @tc.name testBigUint64ArrayLastIndexOf025
     * @tc.desc Verify lastIndexOf() returns zero for a matching single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n]);
      let searchIndex = targetArray.lastIndexOf(42n);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2600
     * @tc.name testBigUint64ArrayLastIndexOf026
     * @tc.desc Verify lastIndexOf() returns negative one when negative fromIndex skips the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n]);
      let searchIndex = targetArray.lastIndexOf(42n, -2);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2700
     * @tc.name testBigUint64ArrayLastIndexOf027
     * @tc.desc Verify fromIndex length minus one produces the same last-match index as the default search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 5n]);
      let defaultIndex = targetArray.lastIndexOf(5n);
      let tailIndex = targetArray.lastIndexOf(5n, targetArray.length - 1);
      expect(defaultIndex).assertEqual(2);
      expect(tailIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2800
     * @tc.name testBigUint64ArrayLastIndexOf028
     * @tc.desc Verify fromIndex zero restricts lastIndexOf() to the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let searchIndex = targetArray.lastIndexOf(10n, 0);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_2900
     * @tc.name testBigUint64ArrayLastIndexOf029
     * @tc.desc Verify fromIndex length minus one can find a matching element stored earlier
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let searchIndex = targetArray.lastIndexOf(20n, targetArray.length - 1);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3000
     * @tc.name testBigUint64ArrayLastIndexOf030
     * @tc.desc Verify fromIndex equal to length is clamped to the last index for a reverse search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 5n]);
      let searchIndex = targetArray.lastIndexOf(5n, targetArray.length);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3100
     * @tc.name testBigUint64ArrayLastIndexOf031
     * @tc.desc Verify fromIndex beyond length is clamped to the last index for a reverse search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n]);
      let searchIndex = targetArray.lastIndexOf(10n, targetArray.length + 1);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3200
     * @tc.name testBigUint64ArrayLastIndexOf032
     * @tc.desc Verify a very large positive fromIndex is clamped to the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n, 10n]);
      let searchIndex = targetArray.lastIndexOf(10n, 999);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3300
     * @tc.name testBigUint64ArrayLastIndexOf033
     * @tc.desc Verify lastIndexOf() with fromIndex -1 starts its backward search at index 4 and returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let searchIndex = targetArray.lastIndexOf(5n, -1);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3400
     * @tc.name testBigUint64ArrayLastIndexOf034
     * @tc.desc Verify fromIndex negative one can still find a matching value before the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let searchIndex = targetArray.lastIndexOf(3n, -1);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3500
     * @tc.name testBigUint64ArrayLastIndexOf035
     * @tc.desc Verify lastIndexOf() with fromIndex -2 starts its backward search at index 3 and returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let searchIndex = targetArray.lastIndexOf(40n, -2);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3600
     * @tc.name testBigUint64ArrayLastIndexOf036
     * @tc.desc Verify fromIndex negative two skips a matching last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let searchIndex = targetArray.lastIndexOf(50n, -2);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3700
     * @tc.name testBigUint64ArrayLastIndexOf037
     * @tc.desc Verify fromIndex negative two can find a matching value before the effective index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 0n, 3n, 42n]);
      let searchIndex = targetArray.lastIndexOf(0n, -2);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3800
     * @tc.name testBigUint64ArrayLastIndexOf038
     * @tc.desc Verify fromIndex negative length starts searching at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([100n, 200n, 300n]);
      let searchIndex = targetArray.lastIndexOf(100n, -targetArray.length);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_3900
     * @tc.name testBigUint64ArrayLastIndexOf039
     * @tc.desc Verify fromIndex less than negative length returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let searchIndex = targetArray.lastIndexOf(10n, -(targetArray.length + 1));
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4000
     * @tc.name testBigUint64ArrayLastIndexOf040
     * @tc.desc Verify a very large negative fromIndex returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 8n, 9n]);
      let searchIndex = targetArray.lastIndexOf(7n, -100);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4100
     * @tc.name testBigUint64ArrayLastIndexOf041
     * @tc.desc Verify lastIndexOf() on an empty array with fromIndex -1 returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      let searchIndex = targetArray.lastIndexOf(0n, -1);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4200
     * @tc.name testBigUint64ArrayLastIndexOf042
     * @tc.desc Verify lastIndexOf() with fromIndex -2 returns index 2 for max uint64 at the effective start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 18446744073709551615n, 42n]);
      let searchIndex = targetArray.lastIndexOf(18446744073709551615n, -2);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4300
     * @tc.name testBigUint64ArrayLastIndexOf043
     * @tc.desc Verify a negative fromIndex skips max uint64 when it is after the effective index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 18446744073709551615n, 42n]);
      let searchIndex = targetArray.lastIndexOf(18446744073709551615n, -3);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4400
     * @tc.name testBigUint64ArrayLastIndexOf044
     * @tc.desc Verify fromIndex int max is clamped to the last index for a reverse search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 0n]);
      let searchIndex = targetArray.lastIndexOf(0n, 2147483647);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4500
     * @tc.name testBigUint64ArrayLastIndexOf045
     * @tc.desc Verify fromIndex int min returns negative one for a reverse search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchIndex = targetArray.lastIndexOf(0n, -2147483648);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4600
     * @tc.name testBigUint64ArrayLastIndexOf046
     * @tc.desc Verify number searchElement with fromIndex finds an earlier zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.lastIndexOf(0, 2);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4700
     * @tc.name testBigUint64ArrayLastIndexOf047
     * @tc.desc Verify lastIndexOf() with number searchElement 42 and fromIndex -2 returns index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 18446744073709551615n, 0n]);
      let searchIndex = targetArray.lastIndexOf(42, -2);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4800
     * @tc.name testBigUint64ArrayLastIndexOf048
     * @tc.desc Verify a lastIndexOf result can read back the matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n, 10n]);
      let searchIndex = targetArray.lastIndexOf(10n);
      let matchedElement = targetArray[searchIndex];
      expect(searchIndex).assertEqual(3);
      expect(matchedElement).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_4900
     * @tc.name testBigUint64ArrayLastIndexOf049
     * @tc.desc Verify a lastIndexOf result can be used to locate the previous element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let searchIndex = targetArray.lastIndexOf(15n);
      let previousIndex = searchIndex - 1;
      expect(searchIndex).assertEqual(2);
      expect(targetArray[previousIndex]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5000
     * @tc.name testBigUint64ArrayLastIndexOf050
     * @tc.desc Verify repeated lastIndexOf calls on the same array return the same index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 2n]);
      let firstIndex = targetArray.lastIndexOf(2n);
      let secondIndex = targetArray.lastIndexOf(2n);
      expect(firstIndex).assertEqual(3);
      expect(secondIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5100
     * @tc.name testBigUint64ArrayLastIndexOf051
     * @tc.desc Verify lastIndexOf() does not change length byteLength or elements after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([75n, 85n, 95n]);
      let originalByteLength: int = targetArray.byteLength;
      let searchIndex = targetArray.lastIndexOf(85n);
      expect(searchIndex).assertEqual(1);
      expect(targetArray.length).assertEqual(3);
      expect(targetArray.byteLength).assertEqual(originalByteLength);
      expect(targetArray[0]).assertEqual(75n);
      expect(targetArray[1]).assertEqual(85n);
      expect(targetArray[2]).assertEqual(95n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5200
     * @tc.name testBigUint64ArrayLastIndexOf052
     * @tc.desc Verify lastIndexOf() does not change length or elements after a miss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([35n, 45n, 55n]);
      let searchIndex = targetArray.lastIndexOf(0n);
      expect(searchIndex).assertEqual(-1);
      expect(targetArray.length).assertEqual(3);
      expect(targetArray[0]).assertEqual(35n);
      expect(targetArray[1]).assertEqual(45n);
      expect(targetArray[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5300
     * @tc.name testBigUint64ArrayLastIndexOf053
     * @tc.desc Verify BYTES_PER_ELEMENT remains eight after lastIndexOf()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n]);
      let searchIndex = targetArray.lastIndexOf(1n);
      expect(searchIndex).assertEqual(0);
      expect(targetArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5400
     * @tc.name testBigUint64ArrayLastIndexOf054
     * @tc.desc Verify lastIndexOf() works on an ArrayBuffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(sourceBuffer, 0, 3);
      targetArray[0] = 52n;
      targetArray[1] = 104n;
      targetArray[2] = 52n;
      let searchIndex = targetArray.lastIndexOf(52n);
      expect(searchIndex).assertEqual(2);
      expect(targetArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5500
     * @tc.name testBigUint64ArrayLastIndexOf055
     * @tc.desc Verify a byteOffset view returns a lastIndexOf index relative to the view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 2n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let searchIndex = offsetView.lastIndexOf(2n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5600
     * @tc.name testBigUint64ArrayLastIndexOf056
     * @tc.desc Verify a subarray lastIndexOf result is relative to the subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 20n, 50n]);
      let subArray = parentArray.subarray(1, 4);
      let searchIndex = subArray.lastIndexOf(20n);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5700
     * @tc.name testBigUint64ArrayLastIndexOf057
     * @tc.desc Verify a subarray lastIndexOf miss returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 20n, 50n]);
      let subArray = parentArray.subarray(1, 4);
      let searchIndex = subArray.lastIndexOf(10n);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5800
     * @tc.name testBigUint64ArrayLastIndexOf058
     * @tc.desc Verify lastIndexOf() on a buffer view does not mutate shared buffer content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let firstView = new BigUint64Array(sourceBuffer, 0, 3);
      firstView[0] = 5n;
      firstView[1] = 10n;
      firstView[2] = 5n;
      let searchIndex = firstView.lastIndexOf(5n);
      let verifyView = new BigUint64Array(sourceBuffer, 0, 3);
      expect(searchIndex).assertEqual(2);
      expect(verifyView[0]).assertEqual(5n);
      expect(verifyView[1]).assertEqual(10n);
      expect(verifyView[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_5900
     * @tc.name testBigUint64ArrayLastIndexOf059
     * @tc.desc Verify byteOffset remains unchanged after lastIndexOf() on an offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(sourceBuffer, 8, 2);
      targetArray[0] = 7n;
      targetArray[1] = 14n;
      let originalByteOffset: int = targetArray.byteOffset;
      let searchIndex = targetArray.lastIndexOf(14n);
      expect(searchIndex).assertEqual(1);
      expect(targetArray.byteOffset).assertEqual(originalByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6000
     * @tc.name testBigUint64ArrayLastIndexOf060
     * @tc.desc Verify lastIndexOf(number negative one) wraps to the max uint64 value during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551615n, 1n, 18446744073709551615n]);
      let searchIndex = targetArray.lastIndexOf(-1);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6100
     * @tc.name testBigUint64ArrayLastIndexOf061
     * @tc.desc Verify lastIndexOf(number negative two) wraps to max uint64 minus one during search
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551614n, 18446744073709551615n, 18446744073709551614n]);
      let searchIndex = targetArray.lastIndexOf(-2);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6200
     * @tc.name testBigUint64ArrayLastIndexOf062
     * @tc.desc Verify lastIndexOf(searchElement: int) accepts binary literal 0b11111111 and returns last index of 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 255n, 255n]);
      let binarySearchElement: int = 0b11111111;
      let searchIndex = targetArray.lastIndexOf(binarySearchElement);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6300
     * @tc.name testBigUint64ArrayLastIndexOf063
     * @tc.desc Verify lastIndexOf(searchElement: int) accepts octal literal 0o377 and returns last index of 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 255n, 255n]);
      let octalSearchElement: int = 0o377;
      let searchIndex = targetArray.lastIndexOf(octalSearchElement);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6400
     * @tc.name testBigUint64ArrayLastIndexOf064
     * @tc.desc Verify lastIndexOf(searchElement: int) accepts hexadecimal literal 0xFF and returns last index of 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 255n, 255n]);
      let hexadecimalSearchElement: int = 0xFF;
      let searchIndex = targetArray.lastIndexOf(hexadecimalSearchElement);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6500
     * @tc.name testBigUint64ArrayLastIndexOf065
     * @tc.desc Verify lastIndexOf(searchElement: byte) accepts declared byte 42 and returns last index of 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n, 42n]);
      let searchElement: byte = 42;
      let searchIndex = targetArray.lastIndexOf(searchElement);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6600
     * @tc.name testBigUint64ArrayLastIndexOf066
     * @tc.desc Verify lastIndexOf(searchElement: short) accepts declared short 255 and returns last index of 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 255n, 42n, 255n]);
      let searchElement: short = 255;
      let searchIndex = targetArray.lastIndexOf(searchElement);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6700
     * @tc.name testBigUint64ArrayLastIndexOf067
     * @tc.desc Verify lastIndexOf(fromIndex: byte) accepts declared byte 2 and returns a match at the bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 42n]);
      let fromIndex: byte = 2;
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6800
     * @tc.name testBigUint64ArrayLastIndexOf068
     * @tc.desc Verify lastIndexOf(fromIndex: short) accepts declared short 2 and skips a later match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 7n, 42n]);
      let fromIndex: short = 2;
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_6900
     * @tc.name testBigUint64ArrayLastIndexOf069
     * @tc.desc Verify lastIndexOf(searchElement: int, fromIndex: int) accepts binary searchElement 0b101010 and hexadecimal fromIndex 0x02 to return a match at the bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n, 9n]);
      let binarySearchElement: int = 0b101010;
      let hexadecimalFromIndex: int = 0x02;
      let searchIndex = targetArray.lastIndexOf(binarySearchElement, hexadecimalFromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7000
     * @tc.name testBigUint64ArrayLastIndexOf070
     * @tc.desc Verify lastIndexOf(searchElement: int, fromIndex: int) accepts octal searchElement 0o52 and binary fromIndex 0b01 to skip a later match and return an earlier index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n]);
      let octalSearchElement: int = 0o52;
      let binaryFromIndex: int = 0b01;
      let searchIndex = targetArray.lastIndexOf(octalSearchElement, binaryFromIndex);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7100
     * @tc.name testBigUint64ArrayLastIndexOf071
     * @tc.desc Verify lastIndexOf(searchElement: BigInt) accepts a value created from hexadecimal number literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n]);
      let searchElement: BigInt = BigInt(0x2A);
      let searchIndex = targetArray.lastIndexOf(searchElement);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7200
     * @tc.name testBigUint64ArrayLastIndexOf072
     * @tc.desc Verify lastIndexOf() on a byteOffset view accepts BigInt number source and binary fromIndex
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 63n, 20n, 63n, 30n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 3);
      let searchElement: BigInt = BigInt(0o77);
      let fromIndex: int = 0b10;
      let searchIndex = targetArray.lastIndexOf(searchElement, fromIndex);
      expect(searchIndex).assertEqual(2);
      expect(sourceArray.$_get(3)).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7300
     * @tc.name testBigUint64ArrayLastIndexOf073
     * @tc.desc Verify lastIndexOf() on a subarray window accepts hexadecimal searchElement and fromIndex
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([42n, 7n, 42n, 9n, 42n]);
      let targetArray = parentArray.subarray(1, 4);
      let searchElement: int = 0x2A;
      let fromIndex: int = 0x02;
      let searchIndex = targetArray.lastIndexOf(searchElement, fromIndex);
      expect(searchIndex).assertEqual(1);
      expect(parentArray.$_get(4)).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7400
     * @tc.name testBigUint64ArrayLastIndexOf074
     * @tc.desc Verify lastIndexOf(searchElement: int) accepts decimal literal 255 and returns last index of stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 255n, 255n]);
      let decimalSearchElement: int = 255;
      let searchIndex = targetArray.lastIndexOf(decimalSearchElement);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7500
     * @tc.name testBigUint64ArrayLastIndexOf075
     * @tc.desc Verify byteOffset view lastIndexOf clamps fromIndex equal to view length within the local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 20n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 3);
      let fromIndex: int = targetArray.length;
      let searchIndex = targetArray.lastIndexOf(20n, fromIndex);
      expect(searchIndex).assertEqual(0);
      expect(targetArray.length).assertEqual(3);
      expect(sourceArray[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7600
     * @tc.name testBigUint64ArrayLastIndexOf076
     * @tc.desc Verify subarray lastIndexOf uses negative fromIndex relative to the local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n, 20n, 30n, 20n, 20n]);
      let targetArray = sourceArray.subarray(1, 4);
      let localStartIndex: int = -2;
      let searchIndex = targetArray.lastIndexOf(20n, localStartIndex);
      expect(searchIndex).assertEqual(0);
      expect(targetArray.length).assertEqual(3);
      expect(sourceArray[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7700
     * @tc.name testBigUint64ArrayLastIndexOf077
     * @tc.desc Verify lastIndexOf() returns a local last index inside a nested byteOffset subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let searchIndex = nestedWindow.lastIndexOf(30n);
      expect(searchIndex).assertEqual(2);
      expect(nestedWindow.byteOffset).assertEqual(16);
      expect(nestedWindow.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7800
     * @tc.name testBigUint64ArrayLastIndexOf078
     * @tc.desc Verify lastIndexOf() returns negative one on a zero-length byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let searchIndex = zeroLengthView.lastIndexOf(30n);
      expect(searchIndex).assertEqual(-1);
      expect(zeroLengthView.length).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
      expect(zeroLengthView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_7900
     * @tc.name testBigUint64ArrayLastIndexOf079
     * @tc.desc Verify byte toInt conversion supplies negative fromIndex minus two and returns index three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 42n, 20n, 42n, 50n]);
      let byteIndexSource: byte = -2;
      let fromIndex: int = byteIndexSource.toInt();
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8000
     * @tc.name testBigUint64ArrayLastIndexOf080
     * @tc.desc Verify short toInt conversion supplies fromIndex two and returns the bounded duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 42n, 42n]);
      let shortIndexSource: short = 2;
      let fromIndex: int = shortIndexSource.toInt();
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8100
     * @tc.name testBigUint64ArrayLastIndexOf081
     * @tc.desc Verify long toInt conversion supplies negative fromIndex minus three and returns index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 42n, 30n, 42n]);
      let longIndexSource: long = -3;
      let fromIndex: int = longIndexSource.toInt();
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8200
     * @tc.name testBigUint64ArrayLastIndexOf082
     * @tc.desc Verify float toInt conversion truncates fromIndex one point nine and returns index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 42n, 42n]);
      let floatIndexSource: float = 1.9f;
      let fromIndex: int = floatIndexSource.toInt();
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8300
     * @tc.name testBigUint64ArrayLastIndexOf083
     * @tc.desc Verify double toInt conversion truncates fromIndex two point nine and returns index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 255n, 20n, 255n]);
      let doubleIndexSource: double = 2.9;
      let fromIndex: int = doubleIndexSource.toInt();
      let searchIndex = targetArray.lastIndexOf(255n, fromIndex);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8400
     * @tc.name testBigUint64ArrayLastIndexOf084
     * @tc.desc Verify lastIndexOf returns the tail duplicate index for the signed 64-bit boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([9223372036854775808n, 10n, 9223372036854775808n, 20n,
        9223372036854775808n]);
      let searchIndex = targetArray.lastIndexOf(9223372036854775808n);
      expect(searchIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8500
     * @tc.name testBigUint64ArrayLastIndexOf085
     * @tc.desc Verify negative length plus one starts at index one and skips the later duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 42n, 20n, 42n]);
      let fromIndex: int = -targetArray.length + 1;
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8600
     * @tc.name testBigUint64ArrayLastIndexOf086
     * @tc.desc Verify negative length plus one returns negative one when the only match is later
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 42n]);
      let fromIndex: int = -targetArray.length + 1;
      let searchIndex = targetArray.lastIndexOf(42n, fromIndex);
      expect(searchIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8700
     * @tc.name testBigUint64ArrayLastIndexOf087
     * @tc.desc Verify an offset view returns local index one after an overlapping sibling writes a new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(40);
      let targetView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 2);
      let initialIndex = targetView.lastIndexOf(99n);
      siblingView[0] = 99n;
      let updatedIndex = targetView.lastIndexOf(99n);
      expect(initialIndex).assertEqual(-1);
      expect(updatedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8800
     * @tc.name testBigUint64ArrayLastIndexOf088
     * @tc.desc Verify a subarray returns local index two after a later parent write inside its window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetView = parentArray.subarray(1, 4);
      let initialIndex = targetView.lastIndexOf(99n);
      parentArray[3] = 99n;
      let updatedIndex = targetView.lastIndexOf(99n);
      expect(initialIndex).assertEqual(-1);
      expect(updatedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_8900
     * @tc.name testBigUint64ArrayLastIndexOf089
     * @tc.desc Verify local fromIndex one skips a later overlap duplicate and returns local index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let earlierView = new BigUint64Array(sharedBuffer, 8, 4);
      let laterView = new BigUint64Array(sharedBuffer, 24, 3);
      earlierView[2] = 66n;
      laterView[2] = 66n;
      let fromIndex: int = 1;
      let searchIndex = laterView.lastIndexOf(66n, fromIndex);
      expect(searchIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_9000
     * @tc.name testBigUint64ArrayLastIndexOf090
     * @tc.desc Verify binary negative fromIndex minus two returns the bounded tail duplicate index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.lastIndexOf(42n, -0b10)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_9100
     * @tc.name testBigUint64ArrayLastIndexOf091
     * @tc.desc Verify octal negative fromIndex minus two returns the bounded tail duplicate index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.lastIndexOf(42n, -0o2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_9200
     * @tc.name testBigUint64ArrayLastIndexOf092
     * @tc.desc Verify hexadecimal negative fromIndex minus two returns the bounded tail duplicate index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.lastIndexOf(42n, -0x2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_9300
     * @tc.name testBigUint64ArrayLastIndexOf093
     * @tc.desc Verify number source converted by toInt supplies fromIndex two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberIndexSource: number = 2.9;
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.lastIndexOf(42n, numberIndexSource.toInt())).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_9400
     * @tc.name testBigUint64ArrayLastIndexOf094
     * @tc.desc Verify float source converted by toInt supplies search element forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatSearchSource: float = 42.9f;
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.lastIndexOf(floatSearchSource.toInt())).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_LASTINDEXOF_9500
     * @tc.name testBigUint64ArrayLastIndexOf095
     * @tc.desc Verify double source converted by toInt supplies absent search element forty three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayLastIndexOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleSearchSource: double = 43.9;
      let targetArray = BigUint64Array.of(10n, 42n, 30n);
      expect(targetArray.lastIndexOf(doubleSearchSource.toInt())).assertEqual(-1);
    });

  });
}
