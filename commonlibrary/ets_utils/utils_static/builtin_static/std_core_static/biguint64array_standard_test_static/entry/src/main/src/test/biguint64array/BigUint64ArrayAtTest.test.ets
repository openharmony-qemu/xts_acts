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

export default function biguint64arrayAtTest(): void {

  describe('BigUint64ArrayAtTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0010
     * @tc.name testBigUint64ArrayAt001
     * @tc.desc Verify at(0) returns the first element of a multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(0);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0020
     * @tc.name testBigUint64ArrayAt002
     * @tc.desc Verify at(1) returns the second element of a multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(1);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0030
     * @tc.name testBigUint64ArrayAt003
     * @tc.desc Verify at(length-1) returns the last element using expression index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(arr.length - 1);
      expect(result).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0040
     * @tc.name testBigUint64ArrayAt004
     * @tc.desc Verify at(length) returns undefined for index equal to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(arr.length);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0050
     * @tc.name testBigUint64ArrayAt005
     * @tc.desc Verify at(length+1) returns undefined for index beyond length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(arr.length + 1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0060
     * @tc.name testBigUint64ArrayAt006
     * @tc.desc Verify at(100) returns undefined for positive index far beyond length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0070
     * @tc.name testBigUint64ArrayAt007
     * @tc.desc Verify at(-1) returns the last element via negative indexing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(-1);
      expect(result).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0080
     * @tc.name testBigUint64ArrayAt008
     * @tc.desc Verify at(-2) returns the second-to-last element via negative indexing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(-2);
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0090
     * @tc.name testBigUint64ArrayAt009
     * @tc.desc Verify at(-length) returns the first element via negative indexing expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(-arr.length);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0100
     * @tc.name testBigUint64ArrayAt010
     * @tc.desc Verify at(-(length+1)) returns undefined for negative index beyond bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(-(arr.length + 1));
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0110
     * @tc.name testBigUint64ArrayAt011
     * @tc.desc Verify at(-100) returns undefined for negative index far beyond bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(-100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0120
     * @tc.name testBigUint64ArrayAt012
     * @tc.desc Verify at(0) on empty array returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let result = emptyArray.at(0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0130
     * @tc.name testBigUint64ArrayAt013
     * @tc.desc Verify at(-1) on empty array returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let result = emptyArray.at(-1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0140
     * @tc.name testBigUint64ArrayAt014
     * @tc.desc Verify at(1) on empty array returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let result = emptyArray.at(1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0150
     * @tc.name testBigUint64ArrayAt015
     * @tc.desc Verify at(0) on single-element array returns the element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(7n);
      let result = arr.at(0);
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0160
     * @tc.name testBigUint64ArrayAt016
     * @tc.desc Verify at(-1) on single-element array returns the element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(7n);
      let result = arr.at(-1);
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0170
     * @tc.name testBigUint64ArrayAt017
     * @tc.desc Verify at(1) on single-element array returns undefined (out-of-bounds)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(7n);
      let result = arr.at(1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0180
     * @tc.name testBigUint64ArrayAt018
     * @tc.desc Verify at(-2) on single-element array returns undefined (out-of-bounds negative)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(7n);
      let result = arr.at(-2);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0190
     * @tc.name testBigUint64ArrayAt019
     * @tc.desc Verify at(0) on zero-value single-element array returns 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n);
      let result = arr.at(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0200
     * @tc.name testBigUint64ArrayAt020
     * @tc.desc Verify at(0) on uint64 max value array returns 18446744073709551615n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(18446744073709551615n);
      let result = arr.at(0);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0210
     * @tc.name testBigUint64ArrayAt021
     * @tc.desc Verify at(-1) on uint64 max value array returns 18446744073709551615n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(18446744073709551615n);
      let result = arr.at(-1);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0220
     * @tc.name testBigUint64ArrayAt022
     * @tc.desc Verify at(0) on two-element boundary array [1n, MAX] returns 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(1n, 18446744073709551615n);
      let result = arr.at(0);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0230
     * @tc.name testBigUint64ArrayAt023
     * @tc.desc Verify at(1) on two-element boundary array [1n, MAX] returns MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(1n, 18446744073709551615n);
      let result = arr.at(1);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0240
     * @tc.name testBigUint64ArrayAt024
     * @tc.desc Verify at(-1) on two-element boundary array [1n, MAX] returns MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(1n, 18446744073709551615n);
      let result = arr.at(-1);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0250
     * @tc.name testBigUint64ArrayAt025
     * @tc.desc Verify at(-2) on two-element boundary array returns first element 1n (equal to -length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(1n, 18446744073709551615n);
      let result = arr.at(-2);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0260
     * @tc.name testBigUint64ArrayAt026
     * @tc.desc Verify at(2) on two-element array returns undefined (out-of-bounds)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(1n, 18446744073709551615n);
      let result = arr.at(2);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0270
     * @tc.name testBigUint64ArrayAt027
     * @tc.desc Verify at(-3) on two-element array returns undefined (-(length+1))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(1n, 18446744073709551615n);
      let result = arr.at(-3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0280
     * @tc.name testBigUint64ArrayAt028
     * @tc.desc Verify at(0) on mixed boundary array [0n, 9223372036854775807n, MAX] returns 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0290
     * @tc.name testBigUint64ArrayAt029
     * @tc.desc Verify at(1) on mixed boundary array returns max signed positive bigint 9223372036854775807n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(1);
      expect(result).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0300
     * @tc.name testBigUint64ArrayAt030
     * @tc.desc Verify at(2) on mixed boundary array returns uint64 max 18446744073709551615n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(2);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0310
     * @tc.name testBigUint64ArrayAt031
     * @tc.desc Verify at(-1) on mixed boundary array returns uint64 max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(-1);
      expect(result).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0320
     * @tc.name testBigUint64ArrayAt032
     * @tc.desc Verify at(-3) on mixed boundary array returns first element 0n (equal to -length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(-3);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0330
     * @tc.name testBigUint64ArrayAt033
     * @tc.desc Verify at(3) on three-element mixed boundary array returns undefined (out-of-bounds)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0340
     * @tc.name testBigUint64ArrayAt034
     * @tc.desc Verify at(-4) on three-element mixed boundary array returns undefined (-(length+1))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(0n, 9223372036854775807n, 18446744073709551615n);
      let result = arr.at(-4);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0350
     * @tc.name testBigUint64ArrayAt035
     * @tc.desc Verify at(0) on large default-initialized array new BigUint64Array(100) returns 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0360
     * @tc.name testBigUint64ArrayAt036
     * @tc.desc Verify at(50) on large default-initialized array returns 0n (middle index)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(50);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0370
     * @tc.name testBigUint64ArrayAt037
     * @tc.desc Verify at(99) on 100-element array returns 0n (length-1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(99);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0380
     * @tc.name testBigUint64ArrayAt038
     * @tc.desc Verify at(-1) on large default-initialized array returns 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(-1);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0390
     * @tc.name testBigUint64ArrayAt039
     * @tc.desc Verify at(-100) on 100-element array returns 0n (equal to -length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(-100);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0400
     * @tc.name testBigUint64ArrayAt040
     * @tc.desc Verify at(100) on 100-element array returns undefined (out-of-bounds)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0410
     * @tc.name testBigUint64ArrayAt041
     * @tc.desc Verify at(-101) on 100-element array returns undefined (-(length+1))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      let result = arr.at(-101);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0420
     * @tc.name testBigUint64ArrayAt042
     * @tc.desc Verify int variable idx=0 used as at() argument returns first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let largeIndex: int = 0;
      let result = arr.at(largeIndex);
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0430
     * @tc.name testBigUint64ArrayAt043
     * @tc.desc Verify int variable idx=-1 used as at() argument returns last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let negativeIndex: int = -1;
      let result = arr.at(negativeIndex);
      expect(result).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0440
     * @tc.name testBigUint64ArrayAt044
     * @tc.desc Verify int variable idx=length used as at() argument returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let outOfBoundsIndex: int = arr.length;
      let result = arr.at(outOfBoundsIndex);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0450
     * @tc.name testBigUint64ArrayAt045
     * @tc.desc Verify int variable idx=-(length+1) used as at() argument returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let negOutOfBoundsIndex: int = -(arr.length + 1);
      let result = arr.at(negOutOfBoundsIndex);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0460
     * @tc.name testBigUint64ArrayAt046
     * @tc.desc Verify addition expression 0+1 as at() index returns second element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let result = arr.at(0 + 1);
      expect(result).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0470
     * @tc.name testBigUint64ArrayAt047
     * @tc.desc Verify subtraction expression 3-1 as at() index returns third element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let result = arr.at(3 - 1);
      expect(result).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0480
     * @tc.name testBigUint64ArrayAt048
     * @tc.desc Verify length-2 expression as at() index returns second-to-last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(100n, 200n, 300n, 400n, 500n);
      let result = arr.at(arr.length - 2);
      expect(result).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0490
     * @tc.name testBigUint64ArrayAt049
     * @tc.desc Verify at(999999) with large int positive index returns undefined on small array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(999999);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0500
     * @tc.name testBigUint64ArrayAt050
     * @tc.desc Verify at(-999999) with large int negative index returns undefined on small array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let result = arr.at(-999999);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0510
     * @tc.name testBigUint64ArrayAt051
     * @tc.desc Verify at(0) on Array<BigInt>-constructed array returns first element 10n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let result: BigInt | undefined = arr.at(0);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0520
     * @tc.name testBigUint64ArrayAt052
     * @tc.desc Verify at(-1) on Array<BigInt>-constructed array returns last element 30n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let result: BigInt | undefined = arr.at(-1);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0530
     * @tc.name testBigUint64ArrayAt053
     * @tc.desc Verify at(length) on Array<BigInt>-constructed array returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let result: BigInt | undefined = arr.at(arr.length);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0540
     * @tc.name testBigUint64ArrayAt054
     * @tc.desc Verify at(-length-1) on Array<BigInt>-constructed array returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let result: BigInt | undefined = arr.at(-arr.length - 1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0550
     * @tc.name testBigUint64ArrayAt055
     * @tc.desc Verify at(1) on Array<BigInt>-constructed array returns middle element 20n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let result: BigInt | undefined = arr.at(1);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0560
     * @tc.name testBigUint64ArrayAt056
     * @tc.desc Verify at(-2) on Array<BigInt>-constructed array returns middle element 20n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let result: BigInt | undefined = arr.at(-2);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0570
     * @tc.name testBigUint64ArrayAt057
     * @tc.desc Verify at(0) on default-initialized array new BigUint64Array(5) returns 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(5);
      let result: BigInt | undefined = arr.at(0);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0580
     * @tc.name testBigUint64ArrayAt058
     * @tc.desc Verify at(-1) on default-initialized array new BigUint64Array(5) returns 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(5);
      let result: BigInt | undefined = arr.at(-1);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0590
     * @tc.name testBigUint64ArrayAt059
     * @tc.desc Verify at(0) on mixed array [10n, MAX, 0n, 1n] returns first element 10n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 18446744073709551615n, 0n, 1n]);
      let result: BigInt | undefined = arr.at(0);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0600
     * @tc.name testBigUint64ArrayAt060
     * @tc.desc Verify at(-1) on mixed array [10n, MAX, 0n, 1n] returns last element 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 18446744073709551615n, 0n, 1n]);
      let result: BigInt | undefined = arr.at(-1);
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0610
     * @tc.name testBigUint64ArrayAt061
     * @tc.desc Verify at(-4) on 4-element mixed array returns first element 10n (equal to -length)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 18446744073709551615n, 0n, 1n]);
      let result: BigInt | undefined = arr.at(-4);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0620
     * @tc.name testBigUint64ArrayAt062
     * @tc.desc Verify array length is unchanged after at(0) call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let lengthBefore: int = arr.length;
      arr.at(0);
      expect(arr.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0630
     * @tc.name testBigUint64ArrayAt063
     * @tc.desc Verify array length is unchanged after at(length) out-of-bounds call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let lengthBefore: int = arr.length;
      arr.at(arr.length);
      expect(arr.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0640
     * @tc.name testBigUint64ArrayAt064
     * @tc.desc Verify array length is unchanged after multiple consecutive at() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let lengthBefore: int = arr.length;
      arr.at(0);
      arr.at(1);
      arr.at(-1);
      arr.at(100);
      expect(arr.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0650
     * @tc.name testBigUint64ArrayAt065
     * @tc.desc Verify empty array length remains 0 after at(0) call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let lengthBefore: int = emptyArray.length;
      emptyArray.at(0);
      expect(emptyArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0660
     * @tc.name testBigUint64ArrayAt066
     * @tc.desc Verify byteLength is unchanged after at(0) call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let byteLengthBefore: int = arr.byteLength;
      arr.at(0);
      expect(arr.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0670
     * @tc.name testBigUint64ArrayAt067
     * @tc.desc Verify byteLength is unchanged after at(-1) call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let byteLengthBefore: int = arr.byteLength;
      arr.at(-1);
      expect(arr.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0680
     * @tc.name testBigUint64ArrayAt068
     * @tc.desc Verify byteLength is unchanged after multiple at() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let byteLengthBefore: int = arr.byteLength;
      arr.at(0);
      arr.at(-1);
      arr.at(2);
      expect(arr.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0690
     * @tc.name testBigUint64ArrayAt069
     * @tc.desc Verify empty array byteLength remains 0 after at() call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let byteLengthBefore: int = emptyArray.byteLength;
      emptyArray.at(0);
      expect(emptyArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0700
     * @tc.name testBigUint64ArrayAt070
     * @tc.desc Verify buffer-constructed view byteLength is unchanged after at() call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 0, 3);
      let byteLengthBefore: int = arr.byteLength;
      arr.at(1);
      expect(arr.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0710
     * @tc.name testBigUint64ArrayAt071
     * @tc.desc Verify at(0) does not modify the element at index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let elementBefore: bigint = arr.$_get(0);
      arr.at(0);
      expect(arr.$_get(0)).assertEqual(elementBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0720
     * @tc.name testBigUint64ArrayAt072
     * @tc.desc Verify at(-1) does not modify the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let elementBefore: bigint = arr.$_get(arr.length - 1);
      arr.at(-1);
      expect(arr.$_get(arr.length - 1)).assertEqual(elementBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0730
     * @tc.name testBigUint64ArrayAt073
     * @tc.desc Verify at(1) does not modify element at index 0 (other index unchanged)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let otherElement: bigint = arr.$_get(0);
      arr.at(1);
      expect(arr.$_get(0)).assertEqual(otherElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0740
     * @tc.name testBigUint64ArrayAt074
     * @tc.desc Verify at(length) out-of-bounds call does not modify any elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let firstElement: bigint = arr.$_get(0);
      let secondElement: bigint = arr.$_get(1);
      let thirdElement: bigint = arr.$_get(2);
      arr.at(100);
      expect(arr.$_get(0)).assertEqual(firstElement);
      expect(arr.$_get(1)).assertEqual(secondElement);
      expect(arr.$_get(2)).assertEqual(thirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0750
     * @tc.name testBigUint64ArrayAt075
     * @tc.desc Verify two consecutive at(1) calls return the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let firstCall: BigInt | undefined = arr.at(1);
      let secondCall: BigInt | undefined = arr.at(1);
      expect(firstCall).assertEqual(secondCall);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0760
     * @tc.name testBigUint64ArrayAt076
     * @tc.desc Verify at(-1) and at(length-1) return the same value on multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let negResult: BigInt | undefined = arr.at(-1);
      let posResult: BigInt | undefined = arr.at(arr.length - 1);
      expect(negResult).assertEqual(posResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0770
     * @tc.name testBigUint64ArrayAt077
     * @tc.desc Verify at(0) return value equals $_get(0) on same array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let atResult: BigInt | undefined = arr.at(0);
      let getResult: bigint = arr.$_get(0);
      expect(atResult).assertEqual(getResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0780
     * @tc.name testBigUint64ArrayAt078
     * @tc.desc Verify at(-1) return value equals $_get(length-1) on same array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n]);
      let atResult: BigInt | undefined = arr.at(-1);
      let getResult: bigint = arr.$_get(arr.length - 1);
      expect(atResult).assertEqual(getResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0790
     * @tc.name testBigUint64ArrayAt079
     * @tc.desc Verify at(0) on buffer view with byteOffset=8 returns element at offset position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buf, 0, 3);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      let offsetView = new BigUint64Array(buf, 8, 2);
      let result: BigInt | undefined = offsetView.at(0);
      expect(result).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0800
     * @tc.name testBigUint64ArrayAt080
     * @tc.desc Verify at(-1) on buffer view with byteOffset=8 returns last element of offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buf, 0, 3);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      let offsetView = new BigUint64Array(buf, 8, 2);
      let result: BigInt | undefined = offsetView.at(-1);
      expect(result).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0810
     * @tc.name testBigUint64ArrayAt081
     * @tc.desc Verify shared buffer write via one view is visible through at() on another view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let writerView = new BigUint64Array(buf, 0, 2);
      let readerView = new BigUint64Array(buf, 0, 2);
      writerView[0] = 99n;
      let result: BigInt | undefined = readerView.at(0);
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0820
     * @tc.name testBigUint64ArrayAt082
     * @tc.desc Verify shared buffer write at last position visible through at(-1) on another view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let writerView = new BigUint64Array(buf, 0, 2);
      let readerView = new BigUint64Array(buf, 0, 2);
      writerView[1] = 77n;
      let result: BigInt | undefined = readerView.at(-1);
      expect(result).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0830
     * @tc.name testBigUint64ArrayAt083
     * @tc.desc Verify different byteOffset views on same buffer return their own correct elements via at()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buf, 0, 4);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      let viewA = new BigUint64Array(buf, 0, 2);
      let viewB = new BigUint64Array(buf, 16, 2);
      let resultA: BigInt | undefined = viewA.at(1);
      let resultB: BigInt | undefined = viewB.at(0);
      expect(resultA).assertEqual(2n);
      expect(resultB).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0840
     * @tc.name testBigUint64ArrayAt084
     * @tc.desc Verify at(0) on subarray returns first element of the sub-range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let result: BigInt | undefined = sub.at(0);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0850
     * @tc.name testBigUint64ArrayAt085
     * @tc.desc Verify at(-1) on subarray returns last element of the sub-range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let result: BigInt | undefined = sub.at(-1);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0860
     * @tc.name testBigUint64ArrayAt086
     * @tc.desc Verify parent array modification is visible through subarray at() due to shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      arr[1] = 999n;
      let result: BigInt | undefined = sub.at(0);
      expect(result).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0870
     * @tc.name testBigUint64ArrayAt087
     * @tc.desc Verify at(0) on buffer+byteOffset+length limited view returns correct first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buf, 0, 4);
      fullView[0] = 11n;
      fullView[1] = 22n;
      fullView[2] = 33n;
      fullView[3] = 44n;
      let limitedView = new BigUint64Array(buf, 8, 2);
      let result: BigInt | undefined = limitedView.at(0);
      expect(result).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0880
     * @tc.name testBigUint64ArrayAt088
     * @tc.desc Verify at(-1) on buffer+byteOffset+length limited view returns correct last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buf, 0, 4);
      fullView[0] = 11n;
      fullView[1] = 22n;
      fullView[2] = 33n;
      fullView[3] = 44n;
      let limitedView = new BigUint64Array(buf, 8, 2);
      let result: BigInt | undefined = limitedView.at(-1);
      expect(result).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0890
     * @tc.name testBigUint64ArrayAt089
     * @tc.desc Verify at(length) on length-limited buffer view returns undefined (out-of-bounds)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buf, 0, 4);
      fullView[0] = 11n;
      fullView[1] = 22n;
      fullView[2] = 33n;
      fullView[3] = 44n;
      let limitedView = new BigUint64Array(buf, 8, 2);
      let result: BigInt | undefined = limitedView.at(2);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0900
     * @tc.name testBigUint64ArrayAt090
     * @tc.desc Verify at(index: byte) accepts declared byte index 2 and returns the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: byte = 2;
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0910
     * @tc.name testBigUint64ArrayAt091
     * @tc.desc Verify at(index: short) accepts declared short index -1 and returns the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let targetIndex: short = -1;
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0920
     * @tc.name testBigUint64ArrayAt092
     * @tc.desc Verify at(index) accepts a hexadecimal int index and returns the matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let targetIndex: int = 0x02;
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0930
     * @tc.name testBigUint64ArrayAt093
     * @tc.desc Verify at(index) accepts a binary-derived negative int index and returns from the end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let indexMagnitude: int = 0b10;
      let targetIndex: int = -indexMagnitude;
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0940
     * @tc.name testBigUint64ArrayAt094
     * @tc.desc Verify at(index) reads a byteOffset view built with base literal parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let byteOffset: int = 0x10;
      let viewLength: int = 0b10;
      let targetIndex: int = 0x01;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let result: BigInt | undefined = offsetView.at(targetIndex);
      expect(offsetView.byteOffset).assertEqual(16);
      expect(offsetView.length).assertEqual(2);
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0950
     * @tc.name testBigUint64ArrayAt095
     * @tc.desc Verify at(index) on nested subarray window observes current shared buffer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let expectedValue: BigInt = 333n;
      fullView[3] = expectedValue;
      let targetIndex: int = 0;
      let result: BigInt | undefined = nestedWindow.at(targetIndex);
      expect(nestedWindow.byteOffset).assertEqual(24);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0960
     * @tc.name testBigUint64ArrayAt096
     * @tc.desc Verify at(index) on slice window reads copied value after source buffer mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let mutationValue: BigInt = 999n;
      fullView[2] = mutationValue;
      let targetIndex: int = 0;
      let result: BigInt | undefined = copiedWindow.at(targetIndex);
      expect(copiedWindow.byteOffset).assertEqual(0);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0970
     * @tc.name testBigUint64ArrayAt097
     * @tc.desc Verify at(index) on zero-length byteOffset view returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let targetIndex: int = 0;
      let result: BigInt | undefined = zeroLengthView.at(targetIndex);
      expect(zeroLengthView.byteOffset).assertEqual(byteOffset);
      expect(zeroLengthView.length).assertEqual(0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0980
     * @tc.name testBigUint64ArrayAt098
     * @tc.desc Verify at(index) on Set-constructed array observes unique insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(7n);
      sourceValues.add(7n);
      sourceValues.add(11n);
      let constructedArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 1;
      let result: BigInt | undefined = constructedArray.at(targetIndex);
      expect(constructedArray.length).assertEqual(2);
      expect(result).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_0990
     * @tc.name testBigUint64ArrayAt099
     * @tc.desc Verify at(index) on iterator-constructed array starts from advanced iterator position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let constructedArray = new BigUint64Array(sourceIterator);
      let targetIndex: int = 0;
      let result: BigInt | undefined = constructedArray.at(targetIndex);
      expect(constructedArray.length).assertEqual(2);
      expect(result).assertEqual(10n);
      expect(constructedArray.at(-1)).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1000
     * @tc.name testBigUint64ArrayAt100
     * @tc.desc Verify long toInt conversion narrows a large source to reachable index two before at
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let longIndexSource: long = 4294967298;
      let targetIndex: int = longIndexSource.toInt();
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1010
     * @tc.name testBigUint64ArrayAt101
     * @tc.desc Verify float toInt conversion truncates positive fractional index before at
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let floatIndexSource: float = 1.9f;
      let targetIndex: int = floatIndexSource.toInt();
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1020
     * @tc.name testBigUint64ArrayAt102
     * @tc.desc Verify double toInt conversion truncates negative fractional index before at
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let doubleIndexSource: double = -1.9;
      let targetIndex: int = doubleIndexSource.toInt();
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1030
     * @tc.name testBigUint64ArrayAt103
     * @tc.desc Verify at(index) accepts an octal int index and returns the matching element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let targetIndex: int = 0o3;
      let result: BigInt | undefined = sourceArray.at(targetIndex);
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1040
     * @tc.name testBigUint64ArrayAt104
     * @tc.desc Verify binary positive index two returns the third element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.at(0b10)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1050
     * @tc.name testBigUint64ArrayAt105
     * @tc.desc Verify octal negative index minus one returns the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.at(-0o1)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1060
     * @tc.name testBigUint64ArrayAt106
     * @tc.desc Verify hexadecimal negative index minus one returns the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.at(-0x1)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1070
     * @tc.name testBigUint64ArrayAt107
     * @tc.desc Verify byte source converted by toInt supplies positive index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let byteIndexSource: byte = 2;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.at(byteIndexSource.toInt())).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1080
     * @tc.name testBigUint64ArrayAt108
     * @tc.desc Verify short source converted by toInt supplies negative index minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let shortIndexSource: short = -1;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.at(shortIndexSource.toInt())).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_AT_1090
     * @tc.name testBigUint64ArrayAt109
     * @tc.desc Verify number source converted by toInt supplies truncated positive index two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayAt109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numberIndexSource: number = 2.9;
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      expect(sourceArray.at(numberIndexSource.toInt())).assertEqual(30n);
    });

  });
}
