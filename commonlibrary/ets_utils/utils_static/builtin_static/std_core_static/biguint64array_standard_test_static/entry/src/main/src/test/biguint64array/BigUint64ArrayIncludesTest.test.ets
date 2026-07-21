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


export default function biguint64arrayIncludesTest(): void {

  describe('BigUint64ArrayIncludesTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0100
     * @tc.name testBigUint64ArrayIncludes001
     * @tc.desc Verify includes(searchElement) returns true when a BigInt value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchResult = targetArray.includes(1n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0200
     * @tc.name testBigUint64ArrayIncludes002
     * @tc.desc Verify includes(searchElement) returns false when a BigInt value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let searchResult = targetArray.includes(42n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0300
     * @tc.name testBigUint64ArrayIncludes003
     * @tc.desc Verify includes(searchElement) returns false for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0400
     * @tc.name testBigUint64ArrayIncludes004
     * @tc.desc Verify includes(0n) returns true for a fresh zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(5);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0500
     * @tc.name testBigUint64ArrayIncludes005
     * @tc.desc Verify includes(1n) returns false for a fresh zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(5);
      let searchResult = targetArray.includes(1n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0600
     * @tc.name testBigUint64ArrayIncludes006
     * @tc.desc Verify includes(0n) finds zero at the first index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0700
     * @tc.name testBigUint64ArrayIncludes007
     * @tc.desc Verify includes(0n) finds zero at a middle index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 0n, 42n]);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0800
     * @tc.name testBigUint64ArrayIncludes008
     * @tc.desc Verify includes(0n) finds zero at the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 0n]);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_0900
     * @tc.name testBigUint64ArrayIncludes009
     * @tc.desc Verify includes(0n) returns false when no zero value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 100n]);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1000
     * @tc.name testBigUint64ArrayIncludes010
     * @tc.desc Verify includes(42n) finds a normal BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchResult = targetArray.includes(42n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1100
     * @tc.name testBigUint64ArrayIncludes011
     * @tc.desc Verify includes(42n) returns false when the normal value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 100n]);
      let searchResult = targetArray.includes(42n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1200
     * @tc.name testBigUint64ArrayIncludes012
     * @tc.desc Verify includes() finds the signed long max boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 9223372036854775807n, 42n]);
      let searchResult = targetArray.includes(9223372036854775807n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1300
     * @tc.name testBigUint64ArrayIncludes013
     * @tc.desc Verify includes() returns false when the signed long max value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 100n]);
      let searchResult = targetArray.includes(9223372036854775807n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1400
     * @tc.name testBigUint64ArrayIncludes014
     * @tc.desc Verify includes() finds the max uint64 boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551615n, 42n]);
      let searchResult = targetArray.includes(18446744073709551615n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1500
     * @tc.name testBigUint64ArrayIncludes015
     * @tc.desc Verify includes() returns false when the max uint64 boundary is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 100n]);
      let searchResult = targetArray.includes(18446744073709551615n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1600
     * @tc.name testBigUint64ArrayIncludes016
     * @tc.desc Verify includes() finds the max uint64 minus one boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551614n, 42n]);
      let searchResult = targetArray.includes(18446744073709551614n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1700
     * @tc.name testBigUint64ArrayIncludes017
     * @tc.desc Verify includes() returns false when max uint64 minus one is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 18446744073709551615n]);
      let searchResult = targetArray.includes(18446744073709551614n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1800
     * @tc.name testBigUint64ArrayIncludes018
     * @tc.desc Verify includes() finds a large BigInt value below uint64 max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1000000000000000n, 2000000000000000n]);
      let searchResult = targetArray.includes(1000000000000000n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_1900
     * @tc.name testBigUint64ArrayIncludes019
     * @tc.desc Verify includes() finds the first duplicate value from index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 0n]);
      let searchResult = targetArray.includes(42n, 0);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2000
     * @tc.name testBigUint64ArrayIncludes020
     * @tc.desc Verify includes() can find a later duplicate after skipping the first one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 0n]);
      let searchResult = targetArray.includes(42n, 1);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2100
     * @tc.name testBigUint64ArrayIncludes021
     * @tc.desc Verify includes() returns false when fromIndex starts after all duplicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 42n, 0n]);
      let searchResult = targetArray.includes(42n, 3);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2200
     * @tc.name testBigUint64ArrayIncludes022
     * @tc.desc Verify includes() returns true when all elements equal the searched value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 7n, 7n]);
      let searchResult = targetArray.includes(7n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2300
     * @tc.name testBigUint64ArrayIncludes023
     * @tc.desc Verify includes() returns false when all elements differ from the searched value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 7n, 7n]);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2400
     * @tc.name testBigUint64ArrayIncludes024
     * @tc.desc Verify includes() returns true for a matching single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([123n]);
      let searchResult = targetArray.includes(123n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2500
     * @tc.name testBigUint64ArrayIncludes025
     * @tc.desc Verify includes() returns false for a nonmatching single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([123n]);
      let searchResult = targetArray.includes(42n);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2600
     * @tc.name testBigUint64ArrayIncludes026
     * @tc.desc Verify includes(number zero) matches a stored zero BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchResult = targetArray.includes(0);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2700
     * @tc.name testBigUint64ArrayIncludes027
     * @tc.desc Verify includes(number one) matches a stored one BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 1n, 8n]);
      let searchResult = targetArray.includes(1);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2800
     * @tc.name testBigUint64ArrayIncludes028
     * @tc.desc Verify includes(number) returns false when the numeric value is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 14n, 21n]);
      let searchResult = targetArray.includes(999);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_2900
     * @tc.name testBigUint64ArrayIncludes029
     * @tc.desc Verify includes() matches a computed zero BigInt search value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let computedZero = 1n - 1n;
      let searchResult = targetArray.includes(computedZero);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3000
     * @tc.name testBigUint64ArrayIncludes030
     * @tc.desc Verify fromIndex zero matches the default search start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 0n]);
      let defaultResult = targetArray.includes(42n);
      let indexedResult = targetArray.includes(42n, 0);
      expect(defaultResult).assertTrue();
      expect(indexedResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3100
     * @tc.name testBigUint64ArrayIncludes031
     * @tc.desc Verify fromIndex one skips a value stored only at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchResult = targetArray.includes(0n, 1);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3200
     * @tc.name testBigUint64ArrayIncludes032
     * @tc.desc Verify fromIndex one includes a value stored at index one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 0n]);
      let searchResult = targetArray.includes(1n, 1);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3300
     * @tc.name testBigUint64ArrayIncludes033
     * @tc.desc Verify fromIndex one can find a later value after the start index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 0n]);
      let searchResult = targetArray.includes(0n, 1);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3400
     * @tc.name testBigUint64ArrayIncludes034
     * @tc.desc Verify fromIndex length minus one finds the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 0n]);
      let searchResult = targetArray.includes(0n, targetArray.length - 1);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3500
     * @tc.name testBigUint64ArrayIncludes035
     * @tc.desc Verify fromIndex length minus one skips a previous matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 0n, 42n]);
      let searchResult = targetArray.includes(0n, targetArray.length - 1);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3600
     * @tc.name testBigUint64ArrayIncludes036
     * @tc.desc Verify fromIndex equal to length returns false even when the value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let searchResult = targetArray.includes(1n, targetArray.length);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3700
     * @tc.name testBigUint64ArrayIncludes037
     * @tc.desc Verify fromIndex beyond length returns false even when the value exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let searchResult = targetArray.includes(1n, targetArray.length + 1);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3800
     * @tc.name testBigUint64ArrayIncludes038
     * @tc.desc Verify a very large positive fromIndex returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      let searchResult = targetArray.includes(2n, 999);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_3900
     * @tc.name testBigUint64ArrayIncludes039
     * @tc.desc Verify fromIndex negative one searches the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 0n]);
      let searchResult = targetArray.includes(0n, -1);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4000
     * @tc.name testBigUint64ArrayIncludes040
     * @tc.desc Verify fromIndex negative one skips a value that is not at the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n]);
      let searchResult = targetArray.includes(0n, -1);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4100
     * @tc.name testBigUint64ArrayIncludes041
     * @tc.desc Verify fromIndex negative two searches the second-to-last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 0n, 42n, 100n]);
      let searchResult = targetArray.includes(42n, -2);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4200
     * @tc.name testBigUint64ArrayIncludes042
     * @tc.desc Verify fromIndex negative two can still find the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 0n, 42n]);
      let searchResult = targetArray.includes(42n, -2);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4300
     * @tc.name testBigUint64ArrayIncludes043
     * @tc.desc Verify fromIndex negative two skips a matching element before the effective start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 0n, 3n, 42n]);
      let searchResult = targetArray.includes(0n, -2);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4400
     * @tc.name testBigUint64ArrayIncludes044
     * @tc.desc Verify fromIndex negative length starts from index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 42n, 100n]);
      let searchResult = targetArray.includes(0n, -targetArray.length);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4500
     * @tc.name testBigUint64ArrayIncludes045
     * @tc.desc Verify fromIndex less than negative length is clamped to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 0n]);
      let searchResult = targetArray.includes(42n, -(targetArray.length + 1));
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4600
     * @tc.name testBigUint64ArrayIncludes046
     * @tc.desc Verify a very large negative fromIndex is clamped to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 0n]);
      let searchResult = targetArray.includes(0n, -100);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4700
     * @tc.name testBigUint64ArrayIncludes047
     * @tc.desc Verify an empty array with negative fromIndex still returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(0);
      let searchResult = targetArray.includes(0n, -100);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4800
     * @tc.name testBigUint64ArrayIncludes048
     * @tc.desc Verify includes() with fromIndex -2 returns true for max uint64 at the second-to-last position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 18446744073709551615n, 42n]);
      let searchResult = targetArray.includes(18446744073709551615n, -2);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_4900
     * @tc.name testBigUint64ArrayIncludes049
     * @tc.desc Verify fromIndex negative two finds max uint64 at the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 18446744073709551615n]);
      let searchResult = targetArray.includes(18446744073709551615n, -2);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5000
     * @tc.name testBigUint64ArrayIncludes050
     * @tc.desc Verify includes() works on an ArrayBuffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let targetArray = new BigUint64Array(sourceBuffer, 0, 3);
      targetArray[0] = 52n;
      targetArray[1] = 104n;
      targetArray[2] = 208n;
      let searchResult = targetArray.includes(104n);
      expect(searchResult).assertTrue();
      expect(targetArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5100
     * @tc.name testBigUint64ArrayIncludes051
     * @tc.desc Verify includes() does not change array length or elements after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([75n, 85n, 95n]);
      let originalByteLength: int = targetArray.byteLength;
      let searchResult = targetArray.includes(85n);
      expect(searchResult).assertTrue();
      expect(targetArray.length).assertEqual(3);
      expect(targetArray.byteLength).assertEqual(originalByteLength);
      expect(targetArray[0]).assertEqual(75n);
      expect(targetArray[1]).assertEqual(85n);
      expect(targetArray[2]).assertEqual(95n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5200
     * @tc.name testBigUint64ArrayIncludes052
     * @tc.desc Verify includes() does not change array length after a miss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([35n, 45n, 55n]);
      let searchResult = targetArray.includes(0n);
      expect(searchResult).assertFalse();
      expect(targetArray.length).assertEqual(3);
      expect(targetArray[0]).assertEqual(35n);
      expect(targetArray[1]).assertEqual(45n);
      expect(targetArray[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5300
     * @tc.name testBigUint64ArrayIncludes053
     * @tc.desc Verify includes() observes values written after an earlier miss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([49n, 98n, 147n]);
      let beforeWriteResult = targetArray.includes(999n);
      targetArray[1] = 999n;
      let afterWriteResult = targetArray.includes(999n);
      expect(beforeWriteResult).assertFalse();
      expect(afterWriteResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5400
     * @tc.name testBigUint64ArrayIncludes054
     * @tc.desc Verify includes() can query max uint64 and zero in consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([18446744073709551615n, 0n, 1n]);
      let maxSearchResult = targetArray.includes(18446744073709551615n);
      let zeroSearchResult = targetArray.includes(0n);
      expect(maxSearchResult).assertTrue();
      expect(zeroSearchResult).assertTrue();
      expect(targetArray[0]).assertEqual(18446744073709551615n);
      expect(targetArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5500
     * @tc.name testBigUint64ArrayIncludes055
     * @tc.desc Verify includes(searchElement: int) accepts binary literal 0b11111111 and matches stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let binarySearchElement: int = 0b11111111;
      let searchResult = targetArray.includes(binarySearchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5600
     * @tc.name testBigUint64ArrayIncludes056
     * @tc.desc Verify includes(searchElement: int) accepts octal literal 0o377 and matches stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let octalSearchElement: int = 0o377;
      let searchResult = targetArray.includes(octalSearchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5700
     * @tc.name testBigUint64ArrayIncludes057
     * @tc.desc Verify includes(searchElement: int) accepts hexadecimal literal 0xFF and matches stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let hexadecimalSearchElement: int = 0xFF;
      let searchResult = targetArray.includes(hexadecimalSearchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5800
     * @tc.name testBigUint64ArrayIncludes058
     * @tc.desc Verify includes(searchElement: byte) accepts declared byte 42 and matches stored 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let searchElement: byte = 42;
      let searchResult = targetArray.includes(searchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_5900
     * @tc.name testBigUint64ArrayIncludes059
     * @tc.desc Verify includes(searchElement: short) accepts declared short 255 and matches stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let searchElement: short = 255;
      let searchResult = targetArray.includes(searchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6000
     * @tc.name testBigUint64ArrayIncludes060
     * @tc.desc Verify includes(searchElement: long) accepts declared long 42 and matches stored 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let searchElement: long = 42;
      let searchResult = targetArray.includes(searchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6100
     * @tc.name testBigUint64ArrayIncludes061
     * @tc.desc Verify includes(fromIndex: byte) accepts declared byte 2 and finds a later duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 7n, 42n]);
      let fromIndex: byte = 2;
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6200
     * @tc.name testBigUint64ArrayIncludes062
     * @tc.desc Verify includes(fromIndex: short) accepts declared short 2 and skips an earlier match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 1n, 7n, 9n]);
      let fromIndex: short = 2;
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6300
     * @tc.name testBigUint64ArrayIncludes063
     * @tc.desc Verify includes(searchElement: int, fromIndex: int) accepts binary searchElement 0b101010 and hexadecimal fromIndex 0x02 to find a later duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n, 9n]);
      let binarySearchElement: int = 0b101010;
      let hexadecimalFromIndex: int = 0x02;
      let searchResult = targetArray.includes(binarySearchElement, hexadecimalFromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6400
     * @tc.name testBigUint64ArrayIncludes064
     * @tc.desc Verify includes(searchElement: int, fromIndex: int) accepts octal searchElement 0o52 and binary fromIndex 0b11 to skip every matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 7n, 42n]);
      let octalSearchElement: int = 0o52;
      let binaryFromIndex: int = 0b11;
      let searchResult = targetArray.includes(octalSearchElement, binaryFromIndex);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6500
     * @tc.name testBigUint64ArrayIncludes065
     * @tc.desc Verify includes(searchElement) matches a BigInt created from a hexadecimal number literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 42n, 255n]);
      let searchElement: BigInt = BigInt(0x2A);
      let searchResult = targetArray.includes(searchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6600
     * @tc.name testBigUint64ArrayIncludes066
     * @tc.desc Verify includes() searches only the byteOffset view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 2);
      let insideResult = targetArray.includes(30n);
      let outsideResult = targetArray.includes(10n);
      expect(insideResult).assertTrue();
      expect(outsideResult).assertFalse();
      expect(targetArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6700
     * @tc.name testBigUint64ArrayIncludes067
     * @tc.desc Verify includes() uses local fromIndex inside a subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetArray = sourceArray.subarray(1, 4);
      let skippedResult = targetArray.includes(20n, 1);
      let matchedResult = targetArray.includes(30n, 1);
      expect(skippedResult).assertFalse();
      expect(matchedResult).assertTrue();
      expect(targetArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6800
     * @tc.name testBigUint64ArrayIncludes068
     * @tc.desc Verify includes(searchElement: int) accepts decimal literal 255 and matches stored 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 42n, 255n]);
      let decimalSearchElement: int = 255;
      let searchResult = targetArray.includes(decimalSearchElement);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_6900
     * @tc.name testBigUint64ArrayIncludes069
     * @tc.desc Verify byteOffset view includes does not search parent tail when fromIndex equals view length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 20n]);
      let targetArray = new BigUint64Array(sourceArray.buffer, 8, 3);
      let fromIndex: int = targetArray.length;
      let searchResult = targetArray.includes(20n, fromIndex);
      expect(searchResult).assertFalse();
      expect(targetArray.length).assertEqual(3);
      expect(sourceArray[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7000
     * @tc.name testBigUint64ArrayIncludes070
     * @tc.desc Verify subarray includes uses negative fromIndex relative to the local window tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 20n, 50n]);
      let targetArray = sourceArray.subarray(1, 4);
      let localTailIndex: int = -1;
      let searchResult = targetArray.includes(20n, localTailIndex);
      expect(searchResult).assertTrue();
      expect(targetArray.length).assertEqual(3);
      expect(sourceArray[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7100
     * @tc.name testBigUint64ArrayIncludes071
     * @tc.desc Verify includes() searches only a nested byteOffset subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let nestedWindow = offsetView.subarray(1, 3);
      let insideResult = nestedWindow.includes(30n);
      let parentPrefixResult = nestedWindow.includes(20n);
      let parentSuffixResult = nestedWindow.includes(50n);
      expect(insideResult).assertTrue();
      expect(parentPrefixResult).assertFalse();
      expect(parentSuffixResult).assertFalse();
      expect(nestedWindow.byteOffset).assertEqual(16);
      expect(nestedWindow.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7200
     * @tc.name testBigUint64ArrayIncludes072
     * @tc.desc Verify includes() on a slice copy from a byteOffset view does not observe later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let copiedValueResult = sliceCopy.includes(30n);
      let sourceWriteResult = sliceCopy.includes(777n);
      let differsFromSourceBuffer: boolean = sliceCopy.buffer !== sourceBuffer;
      expect(copiedValueResult).assertTrue();
      expect(sourceWriteResult).assertFalse();
      expect(differsFromSourceBuffer).assertTrue();
      expect(fullView[2]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7300
     * @tc.name testBigUint64ArrayIncludes073
     * @tc.desc Verify includes() returns false on a zero-length byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let searchResult = zeroLengthView.includes(30n);
      expect(searchResult).assertFalse();
      expect(zeroLengthView.length).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
      expect(zeroLengthView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7400
     * @tc.name testBigUint64ArrayIncludes074
     * @tc.desc Verify byte source converted by toInt supplies negative fromIndex -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let byteIndexSource: byte = -2;
      let fromIndex: int = byteIndexSource.toInt();
      let searchResult = targetArray.includes(40n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7500
     * @tc.name testBigUint64ArrayIncludes075
     * @tc.desc Verify short source converted by toInt supplies fromIndex 2 and finds a later duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n, 42n, 50n]);
      let shortIndexSource: short = 2;
      let fromIndex: int = shortIndexSource.toInt();
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7600
     * @tc.name testBigUint64ArrayIncludes076
     * @tc.desc Verify long source converted by toInt supplies negative fromIndex -3 and finds the tail duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 42n, 20n, 30n, 42n]);
      let longIndexSource: long = -3;
      let fromIndex: int = longIndexSource.toInt();
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7700
     * @tc.name testBigUint64ArrayIncludes077
     * @tc.desc Verify float source 1.9f converted by toInt supplies fromIndex 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 42n, 50n]);
      let floatIndexSource: float = 1.9f;
      let fromIndex: int = floatIndexSource.toInt();
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7800
     * @tc.name testBigUint64ArrayIncludes078
     * @tc.desc Verify double source 2.9 converted by toInt skips a match before index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 42n, 20n, 30n]);
      let doubleIndexSource: double = 2.9;
      let fromIndex: int = doubleIndexSource.toInt();
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_7900
     * @tc.name testBigUint64ArrayIncludes079
     * @tc.desc Verify includes finds the signed 64-bit boundary value 9223372036854775808n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 9223372036854775808n, 2n]);
      let searchResult = targetArray.includes(9223372036854775808n);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8000
     * @tc.name testBigUint64ArrayIncludes080
     * @tc.desc Verify fromIndex negative length plus one skips the first duplicate and finds a later duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n, 42n, 50n]);
      let fromIndex: int = -targetArray.length + 1;
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8100
     * @tc.name testBigUint64ArrayIncludes081
     * @tc.desc Verify includes returns false when fromIndex negative length plus one excludes the only match at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n, 30n, 50n]);
      let fromIndex: int = -targetArray.length + 1;
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8200
     * @tc.name testBigUint64ArrayIncludes082
     * @tc.desc Verify int minimum fromIndex clamps to zero and finds the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n]);
      let fromIndex: int = -2147483648;
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8300
     * @tc.name testBigUint64ArrayIncludes083
     * @tc.desc Verify int maximum fromIndex returns false without searching existing values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([42n, 10n, 20n]);
      let fromIndex: int = 2147483647;
      let searchResult = targetArray.includes(42n, fromIndex);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8400
     * @tc.name testBigUint64ArrayIncludes084
     * @tc.desc Verify an offset view observes an overlapping sibling write after an earlier miss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(40);
      let targetView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 2);
      let initialResult = targetView.includes(99n);
      siblingView[0] = 99n;
      let updatedResult = targetView.includes(99n);
      expect(initialResult).assertFalse();
      expect(updatedResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8500
     * @tc.name testBigUint64ArrayIncludes085
     * @tc.desc Verify negative fromIndex -2 is normalized inside an offset view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let targetView = new BigUint64Array(sourceArray.buffer, 8, 4);
      let searchResult = targetView.includes(40n, -2);
      expect(searchResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8600
     * @tc.name testBigUint64ArrayIncludes086
     * @tc.desc Verify a subarray observes a later parent write inside its local window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let targetView = parentArray.subarray(1, 4);
      let initialResult = targetView.includes(99n);
      parentArray[3] = 99n;
      let updatedResult = targetView.includes(99n);
      expect(initialResult).assertFalse();
      expect(updatedResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8700
     * @tc.name testBigUint64ArrayIncludes087
     * @tc.desc Verify a nested view created before a buffer write observes the updated inner value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer);
      let offsetView = new BigUint64Array(sharedBuffer, 8, 4);
      let nestedView = offsetView.subarray(1, 3);
      fullView[2] = 77n;
      let searchResult = nestedView.includes(77n);
      expect(searchResult).assertTrue();
      expect(nestedView.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8800
     * @tc.name testBigUint64ArrayIncludes088
     * @tc.desc Verify local fromIndex one skips a shared overlap value at the head of the later view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let earlierView = new BigUint64Array(sharedBuffer, 8, 4);
      let laterView = new BigUint64Array(sharedBuffer, 24, 3);
      earlierView[2] = 66n;
      let searchResult = laterView.includes(66n, 1);
      expect(searchResult).assertFalse();
      expect(laterView[0]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_8900
     * @tc.name testBigUint64ArrayIncludes089
     * @tc.desc Verify includes(searchElement int -1) does not convert the search value to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551615n, 42n]);
      let negativeSearchValue: int = -1;
      let searchResult = targetArray.includes(negativeSearchValue);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9000
     * @tc.name testBigUint64ArrayIncludes090
     * @tc.desc Verify includes(searchElement int -2) does not convert the search value to max uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 18446744073709551614n, 42n]);
      let negativeSearchValue: int = -2;
      let searchResult = targetArray.includes(negativeSearchValue);
      expect(searchResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9100
     * @tc.name testBigUint64ArrayIncludes091
     * @tc.desc Verify includes(searchElement byte -1) does not convert the search value to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceValues = [0n, maxUint64Value, 42n];
      let targetArray = new BigUint64Array(sourceValues);
      let negativeSearchValue: byte = -1;
      let searchResult = targetArray.includes(negativeSearchValue);
      expect(searchResult).assertFalse();
      expect(targetArray[1]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9200
     * @tc.name testBigUint64ArrayIncludes092
     * @tc.desc Verify includes(searchElement short -2) does not convert the search value to max uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMaxUint64Value: bigint = 18446744073709551614n;
      let sourceValues = [0n, nearMaxUint64Value, 42n];
      let targetArray = new BigUint64Array(sourceValues);
      let negativeSearchValue: short = -2;
      let searchResult = targetArray.includes(negativeSearchValue);
      expect(searchResult).assertFalse();
      expect(targetArray[1]).assertEqual(nearMaxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9300
     * @tc.name testBigUint64ArrayIncludes093
     * @tc.desc Verify includes(searchElement long -1) does not convert the search value to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceValues = [0n, maxUint64Value, 42n];
      let targetArray = new BigUint64Array(sourceValues);
      let negativeSearchValue: long = -1;
      let searchResult = targetArray.includes(negativeSearchValue);
      expect(searchResult).assertFalse();
      expect(targetArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9400
     * @tc.name testBigUint64ArrayIncludes094
     * @tc.desc Verify binary negative fromIndex minus two finds the tail duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.includes(42n, -0b10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9500
     * @tc.name testBigUint64ArrayIncludes095
     * @tc.desc Verify octal negative fromIndex minus two finds the tail duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.includes(42n, -0o2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9600
     * @tc.name testBigUint64ArrayIncludes096
     * @tc.desc Verify hexadecimal negative fromIndex minus two finds the tail duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.includes(42n, -0x2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9700
     * @tc.name testBigUint64ArrayIncludes097
     * @tc.desc Verify number source converted by toInt supplies fromIndex two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberIndexSource: number = 2.9;
      let targetArray = BigUint64Array.of(42n, 1n, 42n, 2n);
      expect(targetArray.includes(42n, numberIndexSource.toInt())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9800
     * @tc.name testBigUint64ArrayIncludes098
     * @tc.desc Verify float source converted by toInt supplies search element forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatSearchSource: float = 42.9f;
      let targetArray = BigUint64Array.of(10n, 42n, 30n);
      expect(targetArray.includes(floatSearchSource.toInt())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_INCLUDES_9900
     * @tc.name testBigUint64ArrayIncludes099
     * @tc.desc Verify double source converted by toInt supplies absent search element forty three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIncludes099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleSearchSource: double = 43.9;
      let targetArray = BigUint64Array.of(10n, 42n, 30n);
      expect(targetArray.includes(doubleSearchSource.toInt())).assertFalse();
    });

  });
}
