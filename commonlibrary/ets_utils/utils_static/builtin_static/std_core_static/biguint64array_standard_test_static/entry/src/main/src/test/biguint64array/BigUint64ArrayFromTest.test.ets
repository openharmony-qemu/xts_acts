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


export default function biguint64arrayFromTest(): void {

  describe('BigUint64ArrayFromTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0010
     * @tc.name testBigUint64ArrayFrom001
     * @tc.desc Verify from(FixedArray<BigInt>) with empty source returns zero length and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0020
     * @tc.name testBigUint64ArrayFrom002
     * @tc.desc Verify from(FixedArray<BigInt>) preserves positive BigInt source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [1n, 2n, 3n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0030
     * @tc.name testBigUint64ArrayFrom003
     * @tc.desc Verify from(FixedArray<BigInt>) preserves signed int max BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [2147483647n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0040
     * @tc.name testBigUint64ArrayFrom004
     * @tc.desc Verify from(FixedArray<BigInt>) wraps -1n to the max uint64 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [-1n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0050
     * @tc.name testBigUint64ArrayFrom005
     * @tc.desc Verify from(FixedArray<BigInt>) wraps signed int min BigInt to modulo uint64 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [-2147483648n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(18446744071562067968n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0060
     * @tc.name testBigUint64ArrayFrom006
     * @tc.desc Verify from(FixedArray<BigInt>) preserves mixed negative zero and positive conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [-2n, 0n, 1n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0070
     * @tc.name testBigUint64ArrayFrom007
     * @tc.desc Verify from(Set<BigInt>) with empty source returns zero length and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0080
     * @tc.name testBigUint64ArrayFrom008
     * @tc.desc Verify from(Set<BigInt>) preserves a single zero element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(0n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0090
     * @tc.name testBigUint64ArrayFrom009
     * @tc.desc Verify from(Set<BigInt>) preserves insertion order for normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(10n);
      sourceSet.add(20n);
      sourceSet.add(30n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0100
     * @tc.name testBigUint64ArrayFrom010
     * @tc.desc Verify from(Set<BigInt>) preserves max uint64 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(18446744073709551615n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0110
     * @tc.name testBigUint64ArrayFrom011
     * @tc.desc Verify from(Set<BigInt>) wraps overflow values with modulo uint64 arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(18446744073709551616n);
      sourceSet.add(18446744073709551617n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0120
     * @tc.name testBigUint64ArrayFrom012
     * @tc.desc Verify from(Set<BigInt>) wraps negative values to uint64 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(-1n);
      sourceSet.add(-2n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
      expect(resultArray[1]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0130
     * @tc.name testBigUint64ArrayFrom013
     * @tc.desc Verify from(Set<BigInt>) handles signed long boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(9223372036854775807n);
      sourceSet.add(-9223372036854775808n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray[0]).assertEqual(9223372036854775807n);
      expect(resultArray[1]).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0140
     * @tc.name testBigUint64ArrayFrom014
     * @tc.desc Verify from(Set<BigInt>) observes Set de-duplication before conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(99n);
      sourceSet.add(99n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0150
     * @tc.name testBigUint64ArrayFrom015
     * @tc.desc Verify from(Set<BigInt>) excludes values deleted before conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(1n);
      sourceSet.add(2n);
      sourceSet.delete(1n);
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0160
     * @tc.name testBigUint64ArrayFrom016
     * @tc.desc Verify from(Set<BigInt>) returns empty array after source clear
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(1n);
      sourceSet.add(2n);
      sourceSet.clear();
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0170
     * @tc.name testBigUint64ArrayFrom017
     * @tc.desc Verify mutating Set after from() does not affect the created BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(5n);
      let resultArray = BigUint64Array.from(sourceSet);
      sourceSet.delete(5n);
      sourceSet.add(10n);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0180
     * @tc.name testBigUint64ArrayFrom018
     * @tc.desc Verify mutating from(Set) result does not affect the source Set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(5n);
      let resultArray = BigUint64Array.from(sourceSet);
      resultArray[0] = 99n;
      expect(sourceSet.has(5n)).assertTrue();
      expect(sourceSet.has(99n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0190
     * @tc.name testBigUint64ArrayFrom019
     * @tc.desc Verify two from(Set) calls produce independent arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(3n);
      let firstCopy = BigUint64Array.from(sourceSet);
      let secondCopy = BigUint64Array.from(sourceSet);
      firstCopy[0] = 44n;
      expect(secondCopy[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0200
     * @tc.name testBigUint64ArrayFrom020
     * @tc.desc Verify from(BigUint64Array) with empty source returns zero length and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = BigUint64Array.from(sourceArray);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0210
     * @tc.name testBigUint64ArrayFrom021
     * @tc.desc Verify from(BigUint64Array) copies normal values in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = BigUint64Array.from(sourceArray);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0220
     * @tc.name testBigUint64ArrayFrom022
     * @tc.desc Verify from(BigUint64Array) copies uint64 boundary values exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18446744073709551615n, 9223372036854775807n]);
      let resultArray = BigUint64Array.from(sourceArray);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
      expect(resultArray[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0230
     * @tc.name testBigUint64ArrayFrom023
     * @tc.desc Verify from(BigUint64Array) copies already wrapped source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 18446744073709551616n;
      sourceArray[1] = -1n;
      sourceArray[2] = 42n;
      let resultArray = BigUint64Array.from(sourceArray);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(18446744073709551615n);
      expect(resultArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0240
     * @tc.name testBigUint64ArrayFrom024
     * @tc.desc Verify from(BigUint64Array) allocates a buffer distinct from the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let resultArray = BigUint64Array.from(sourceArray);
      let sharesBuffer: boolean = resultArray.buffer === sourceArray.buffer;
      expect(sharesBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0250
     * @tc.name testBigUint64ArrayFrom025
     * @tc.desc Verify mutating from(BigUint64Array) result does not affect the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = BigUint64Array.from(sourceArray);
      resultArray[0] = 999n;
      expect(sourceArray[0]).assertEqual(1n);
      expect(resultArray[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0260
     * @tc.name testBigUint64ArrayFrom026
     * @tc.desc Verify mutating BigUint64Array source after from() does not affect the copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = BigUint64Array.from(sourceArray);
      sourceArray[0] = 999n;
      expect(resultArray[0]).assertEqual(1n);
      expect(sourceArray[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0270
     * @tc.name testBigUint64ArrayFrom027
     * @tc.desc Verify chained from(BigUint64Array) calls keep each copy independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n]);
      let firstCopy = BigUint64Array.from(sourceArray);
      let secondCopy = BigUint64Array.from(firstCopy);
      firstCopy[0] = 77n;
      expect(sourceArray[0]).assertEqual(2n);
      expect(secondCopy[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0280
     * @tc.name testBigUint64ArrayFrom028
     * @tc.desc Verify from(BigUint64Array) copies a byteOffset view into a zero-offset result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backingArray = new BigUint64Array(new ArrayBuffer(24));
      backingArray[1] = 10n;
      backingArray[2] = 20n;
      let sourceView = new BigUint64Array(backingArray.buffer, 8, 2);
      let resultArray = BigUint64Array.from(sourceView);
      expect(sourceView.byteOffset).assertEqual(8);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0290
     * @tc.name testBigUint64ArrayFrom029
     * @tc.desc Verify from(Array<BigInt>) with empty source returns zero length and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0300
     * @tc.name testBigUint64ArrayFrom030
     * @tc.desc Verify from(Array<BigInt>) preserves a single normal value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [42n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0310
     * @tc.name testBigUint64ArrayFrom031
     * @tc.desc Verify from(Array<BigInt>) preserves multi-element source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [100n, 200n, 300n, 400n, 500n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(5);
      expect(resultArray[0]).assertEqual(100n);
      expect(resultArray[4]).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0320
     * @tc.name testBigUint64ArrayFrom032
     * @tc.desc Verify from(Array<BigInt>) preserves max uint64 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [18446744073709551615n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0330
     * @tc.name testBigUint64ArrayFrom033
     * @tc.desc Verify from(Array<BigInt>) wraps 2^64 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [18446744073709551616n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0340
     * @tc.name testBigUint64ArrayFrom034
     * @tc.desc Verify from(Array<BigInt>) wraps 2^64 plus one to 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [18446744073709551617n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0350
     * @tc.name testBigUint64ArrayFrom035
     * @tc.desc Verify from(Array<BigInt>) wraps -1n to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [-1n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0360
     * @tc.name testBigUint64ArrayFrom036
     * @tc.desc Verify from(Array<BigInt>) wraps -2n to max uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [-2n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0370
     * @tc.name testBigUint64ArrayFrom037
     * @tc.desc Verify from(Array<BigInt>) wraps signed long min to uint64 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [-9223372036854775808n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray[0]).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0380
     * @tc.name testBigUint64ArrayFrom038
     * @tc.desc Verify from(Array<BigInt>) preserves repeated max uint64 elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [
        18446744073709551615n,
        18446744073709551615n,
        18446744073709551615n
      ];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(18446744073709551615n);
      expect(resultArray[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0390
     * @tc.name testBigUint64ArrayFrom039
     * @tc.desc Verify from(Array<BigInt>) preserves length and endpoints for a large source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [];
      for (let index: int = 0; index < 50; index++) {
        sourceValues.push(BigInt(index));
      }
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(50);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[49]).assertEqual(49n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0400
     * @tc.name testBigUint64ArrayFrom040
     * @tc.desc Verify mutating Array source after from() does not affect the created array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let resultArray = BigUint64Array.from(sourceValues);
      sourceValues[0] = 999n;
      expect(resultArray[0]).assertEqual(1n);
      expect(sourceValues[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0410
     * @tc.name testBigUint64ArrayFrom041
     * @tc.desc Verify mutating from(Array) result does not affect the source Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let resultArray = BigUint64Array.from(sourceValues);
      resultArray[0] = 999n;
      expect(sourceValues[0]).assertEqual(1n);
      expect(resultArray[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0420
     * @tc.name testBigUint64ArrayFrom042
     * @tc.desc Verify two from(Array) calls produce independent arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [3n];
      let firstCopy = BigUint64Array.from(sourceValues);
      let secondCopy = BigUint64Array.from(sourceValues);
      firstCopy[0] = 44n;
      expect(firstCopy[0]).assertEqual(44n);
      expect(secondCopy[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0430
     * @tc.name testBigUint64ArrayFrom043
     * @tc.desc Verify from(Array) result exposes expected typed-array properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(resultArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0440
     * @tc.name testBigUint64ArrayFrom044
     * @tc.desc Verify from(Array, mapfn) with empty source does not call mapfn
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [];
      let callCount: int = 0;
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
        callCount++;
        return 1n;
      });
      expect(resultArray.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0450
     * @tc.name testBigUint64ArrayFrom045
     * @tc.desc Verify from(Array, mapfn) applies identity mapping and preserves values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let callCount: int = 0;
      let resultArray = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        callCount++;
        return element;
      });
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0460
     * @tc.name testBigUint64ArrayFrom046
     * @tc.desc Verify from(Array, mapfn) receives sequential index values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n];
      let capturedIndices: number[] = [];
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, index: number): bigint => {
        capturedIndices.push(index);
        return index === 0 ? 0n : index === 1 ? 1n : 2n;
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(2n);
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0470
     * @tc.name testBigUint64ArrayFrom047
     * @tc.desc Verify from(Array, mapfn) can capture external BigInt state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let offsetValue: bigint = 100n;
      let resultArray = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        return element + offsetValue;
      });
      expect(resultArray[0]).assertEqual(101n);
      expect(resultArray[1]).assertEqual(102n);
      expect(resultArray[2]).assertEqual(103n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0480
     * @tc.name testBigUint64ArrayFrom048
     * @tc.desc Verify from(Array, mapfn) writes multiplied BigInt results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let resultArray = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        return element * 2n;
      });
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0490
     * @tc.name testBigUint64ArrayFrom049
     * @tc.desc Verify from(Array, mapfn) writes constant max uint64 results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n];
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
        return 18446744073709551615n;
      });
      expect(resultArray[0]).assertEqual(18446744073709551615n);
      expect(resultArray[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0500
     * @tc.name testBigUint64ArrayFrom050
     * @tc.desc Verify from(Array, mapfn) wraps 2^64 return value to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [0n];
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
        return 18446744073709551616n;
      });
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0510
     * @tc.name testBigUint64ArrayFrom051
     * @tc.desc Verify from(Array, mapfn) wraps -1n return value to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [0n];
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
        return -1n;
      });
      expect(resultArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0520
     * @tc.name testBigUint64ArrayFrom052
     * @tc.desc Verify from(Array, mapfn) wraps max plus 42 to 41n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [0n];
      let maxUint64Value: bigint = 18446744073709551615n;
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
        return maxUint64Value + 42n;
      });
      expect(resultArray[0]).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0530
     * @tc.name testBigUint64ArrayFrom053
     * @tc.desc Verify from(Array, mapfn) callback receives original source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [100n, 200n];
      let capturedValues: bigint[] = [];
      let resultArray = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        capturedValues.push(element);
        return element;
      });
      expect(resultArray.length).assertEqual(2);
      expect(capturedValues[0]).assertEqual(100n);
      expect(capturedValues[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0540
     * @tc.name testBigUint64ArrayFrom054
     * @tc.desc Verify Error thrown on first from(Array, mapfn) callback propagates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let callCount: int = 0;
      try {
        BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
          callCount++;
          throw new Error('mapfn error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0550
     * @tc.name testBigUint64ArrayFrom055
     * @tc.desc Verify RangeError thrown by middle from(Array, mapfn) callback propagates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n];
      let callCount: int = 0;
      try {
        BigUint64Array.from(sourceValues, (_element: bigint, index: number): bigint => {
          callCount++;
          if (index === 1) {
            throw new RangeError('middle error');
          }
          return 1n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0560
     * @tc.name testBigUint64ArrayFrom056
     * @tc.desc Verify TypeError thrown by last from(Array, mapfn) callback propagates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n];
      let callCount: int = 0;
      try {
        BigUint64Array.from(sourceValues, (_element: bigint, index: number): bigint => {
          callCount++;
          if (index === 2) {
            throw new TypeError('last error');
          }
          return 1n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0570
     * @tc.name testBigUint64ArrayFrom057
     * @tc.desc Verify from(Array, mapfn) does not call throwing mapfn for empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [];
      let resultArray = BigUint64Array.from(sourceValues, (_element: bigint, _index: number): bigint => {
        throw new Error('never called');
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0580
     * @tc.name testBigUint64ArrayFrom058
     * @tc.desc Verify from(Set, mapfn) preserves source order with identity mapping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(11n);
      sourceSet.add(22n);
      sourceSet.add(33n);
      let resultArray = BigUint64Array.from(sourceSet, (element: bigint, _index: number): bigint => {
        return element;
      });
      expect(resultArray[0]).assertEqual(11n);
      expect(resultArray[1]).assertEqual(22n);
      expect(resultArray[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0590
     * @tc.name testBigUint64ArrayFrom059
     * @tc.desc Verify from(Set, mapfn) writes transformed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(1n);
      sourceSet.add(2n);
      sourceSet.add(3n);
      let resultArray = BigUint64Array.from(sourceSet, (element: bigint, _index: number): bigint => {
        return element + 10n;
      });
      expect(resultArray[0]).assertEqual(11n);
      expect(resultArray[1]).assertEqual(12n);
      expect(resultArray[2]).assertEqual(13n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0600
     * @tc.name testBigUint64ArrayFrom060
     * @tc.desc Verify from(Set, mapfn) receives sequential index values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(0n);
      sourceSet.add(0n);
      sourceSet.add(1n);
      sourceSet.add(2n);
      let capturedIndices: number[] = [];
      let resultArray = BigUint64Array.from(sourceSet, (_element: bigint, index: number): bigint => {
        capturedIndices.push(index);
        return index === 0 ? 0n : index === 1 ? 1n : 2n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(2n);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0610
     * @tc.name testBigUint64ArrayFrom061
     * @tc.desc Verify from(Set, mapfn) with empty source does not call mapfn
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      let callCount: int = 0;
      let resultArray = BigUint64Array.from(sourceSet, (_element: bigint, _index: number): bigint => {
        callCount++;
        return 1n;
      });
      expect(resultArray.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0620
     * @tc.name testBigUint64ArrayFrom062
     * @tc.desc Verify from(Set, mapfn) callback receives original set values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(300n);
      sourceSet.add(400n);
      let capturedValues: bigint[] = [];
      let resultArray = BigUint64Array.from(sourceSet, (element: bigint, _index: number): bigint => {
        capturedValues.push(element);
        return element;
      });
      expect(resultArray.length).assertEqual(2);
      expect(capturedValues[0]).assertEqual(300n);
      expect(capturedValues[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0630
     * @tc.name testBigUint64ArrayFrom063
     * @tc.desc Verify Error thrown by from(Set, mapfn) callback propagates and stops iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(10n);
      sourceSet.add(20n);
      sourceSet.add(30n);
      let callCount: int = 0;
      try {
        BigUint64Array.from(sourceSet, (_element: bigint, index: number): bigint => {
          callCount++;
          if (index === 1) {
            throw new Error('set mapfn error');
          }
          return 1n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0640
     * @tc.name testBigUint64ArrayFrom064
     * @tc.desc Verify from(BigUint64Array, mapfn) maps iterable source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let resultArray = BigUint64Array.from(sourceArray, (element: bigint, _index: number): bigint => {
        return element * 3n;
      });
      expect(resultArray[0]).assertEqual(6n);
      expect(resultArray[1]).assertEqual(12n);
      expect(resultArray[2]).assertEqual(18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0650
     * @tc.name testBigUint64ArrayFrom065
     * @tc.desc Verify from(BigUint64Array, mapfn) receives source indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let resultArray = BigUint64Array.from(sourceArray, (_element: bigint, index: number): bigint => {
        return index === 0 ? 1n : index === 1 ? 2n : 3n;
      });
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0660
     * @tc.name testBigUint64ArrayFrom066
     * @tc.desc Verify from(BigUint64Array, mapfn) wraps negative return values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let resultArray = BigUint64Array.from(sourceArray, (_element: bigint, _index: number): bigint => {
        return -2n;
      });
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0670
     * @tc.name testBigUint64ArrayFrom067
     * @tc.desc Verify from(Array) and from(FixedArray<BigInt>) produce equal values for positives
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixedValues: FixedArray<BigInt> = [5n, 10n, 15n];
      let arrayValues: Array<BigInt> = [5n, 10n, 15n];
      let fixedResult = BigUint64Array.from(fixedValues);
      let arrayResult = BigUint64Array.from(arrayValues);
      expect(fixedResult.length).assertEqual(arrayResult.length);
      expect(fixedResult[0]).assertEqual(arrayResult[0]);
      expect(fixedResult[1]).assertEqual(arrayResult[1]);
      expect(fixedResult[2]).assertEqual(arrayResult[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0680
     * @tc.name testBigUint64ArrayFrom068
     * @tc.desc Verify from(Set) and from(Array) produce equal values for same order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(42n);
      sourceSet.add(99n);
      let arrayValues: Array<BigInt> = [42n, 99n];
      let setResult = BigUint64Array.from(sourceSet);
      let arrayResult = BigUint64Array.from(arrayValues);
      expect(setResult.length).assertEqual(arrayResult.length);
      expect(setResult[0]).assertEqual(arrayResult[0]);
      expect(setResult[1]).assertEqual(arrayResult[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0690
     * @tc.name testBigUint64ArrayFrom069
     * @tc.desc Verify from(BigUint64Array) and from(Array) produce equal values for same data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let sourceValues: Array<BigInt> = [7n, 14n, 21n];
      let typedResult = BigUint64Array.from(sourceArray);
      let arrayResult = BigUint64Array.from(sourceValues);
      expect(typedResult.length).assertEqual(arrayResult.length);
      expect(typedResult[0]).assertEqual(arrayResult[0]);
      expect(typedResult[2]).assertEqual(arrayResult[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0700
     * @tc.name testBigUint64ArrayFrom070
     * @tc.desc Verify from(Array, identity mapfn) matches from(Array) without mapfn
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [7n, 8n, 9n];
      let directResult = BigUint64Array.from(sourceValues);
      let mappedResult = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        return element;
      });
      expect(mappedResult.length).assertEqual(directResult.length);
      expect(mappedResult[0]).assertEqual(directResult[0]);
      expect(mappedResult[2]).assertEqual(directResult[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0710
     * @tc.name testBigUint64ArrayFrom071
     * @tc.desc Verify from(Set, identity mapfn) matches from(Set) without mapfn
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(33n);
      sourceSet.add(66n);
      let directResult = BigUint64Array.from(sourceSet);
      let mappedResult = BigUint64Array.from(sourceSet, (element: bigint, _index: number): bigint => {
        return element;
      });
      expect(mappedResult.length).assertEqual(directResult.length);
      expect(mappedResult[0]).assertEqual(directResult[0]);
      expect(mappedResult[1]).assertEqual(directResult[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0720
     * @tc.name testBigUint64ArrayFrom072
     * @tc.desc Verify from(BigUint64Array, identity mapfn) matches from(BigUint64Array)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([12n, 24n]);
      let directResult = BigUint64Array.from(sourceArray);
      let mappedResult = BigUint64Array.from(sourceArray, (element: bigint, _index: number): bigint => {
        return element;
      });
      expect(mappedResult.length).assertEqual(directResult.length);
      expect(mappedResult[0]).assertEqual(directResult[0]);
      expect(mappedResult[1]).assertEqual(directResult[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0730
     * @tc.name testBigUint64ArrayFrom073
     * @tc.desc Verify from() result can be used as a source for another independent from() copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [7n, 8n, 9n];
      let firstCopy = BigUint64Array.from(sourceValues);
      let secondCopy = BigUint64Array.from(firstCopy);
      firstCopy[1] = 88n;
      expect(secondCopy.length).assertEqual(3);
      expect(secondCopy[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0740
     * @tc.name testBigUint64ArrayFrom074
     * @tc.desc Verify from() results from different sources expose consistent string output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let sourceValues: Array<BigInt> = [4n, 5n, 6n];
      let typedResult = BigUint64Array.from(sourceArray);
      let arrayResult = BigUint64Array.from(sourceValues);
      expect(typedResult.join('|')).assertEqual(arrayResult.join('|'));
      expect(typedResult.toString()).assertEqual(arrayResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0750
     * @tc.name testBigUint64ArrayFrom075
     * @tc.desc Verify from() result is an ArrayBuffer view with expected byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(ArrayBuffer.isView(resultArray)).assertTrue();
      expect(resultArray.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0760
     * @tc.name testBigUint64ArrayFrom076
     * @tc.desc Verify mutating FixedArray<BigInt> source after from() does not affect the created array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [11n, 22n];
      let resultArray = BigUint64Array.from(sourceValues);
      sourceValues[0] = 33n;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(11n);
      expect(resultArray[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0770
     * @tc.name testBigUint64ArrayFrom077
     * @tc.desc Verify mutating from(FixedArray<BigInt>) result does not affect the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<BigInt> = [44n, 55n];
      let resultArray = BigUint64Array.from(sourceValues);
      resultArray[1] = 66n;
      expect(sourceValues[0]).assertEqual(44n);
      expect(sourceValues[1]).assertEqual(55n);
      expect(resultArray[1]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0780
     * @tc.name testBigUint64ArrayFrom078
     * @tc.desc Verify mutating byteOffset view source after from() does not affect the copied window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backingArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let sourceView = new BigUint64Array(backingArray.buffer, 8, 2);
      let resultArray = BigUint64Array.from(sourceView);
      sourceView[0] = 99n;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0790
     * @tc.name testBigUint64ArrayFrom079
     * @tc.desc Verify values() iterator source is copied independently from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([6n, 7n, 8n]);
      let sourceIterator = sourceArray.values();
      let resultArray = BigUint64Array.from(sourceIterator);
      sourceArray[1] = 77n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(6n);
      expect(resultArray[1]).assertEqual(7n);
      expect(resultArray[2]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0800
     * @tc.name testBigUint64ArrayFrom080
     * @tc.desc Verify mutating Array<BigInt> source after from(Array, mapfn) does not affect mapped results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [1n, 2n];
      let resultArray = BigUint64Array.from(sourceValues, (element: bigint, index: number): bigint => {
        return element + BigInt(index);
      });
      sourceValues[1] = 99n;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0810
     * @tc.name testBigUint64ArrayFrom081
     * @tc.desc Verify from(byteOffset view) returns an independent buffer and result writes do not update the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let resultArray = BigUint64Array.from(sourceView);
      let sharesSourceBuffer: boolean = resultArray.buffer === sharedBuffer;
      expect(sharesSourceBuffer).assertFalse();
      expect(resultArray.length).assertEqual(3);
      resultArray[0] = 99n;
      expect(resultArray[0]).assertEqual(99n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(40n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0820
     * @tc.name testBigUint64ArrayFrom082
     * @tc.desc Verify from(byteOffset view, mapfn) uses window values and local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(sharedBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      baseView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let observedIndexTotal: number = 0;
      let resultArray = BigUint64Array.from(sourceView, (element: bigint, index: number): bigint => {
        observedIndexTotal = observedIndexTotal + index;
        return element + BigInt(index);
      });
      expect(observedIndexTotal).assertEqual(1);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0830
     * @tc.name testBigUint64ArrayFrom083
     * @tc.desc Verify from(subarray) observes parent mutation within the live source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sourceView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let resultArray = BigUint64Array.from(sourceView);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0840
     * @tc.name testBigUint64ArrayFrom084
     * @tc.desc Verify from(values iterator of byteOffset view) copies only the window into an independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let baseView = new BigUint64Array(sharedBuffer);
      baseView[0] = 5n;
      baseView[1] = 10n;
      baseView[2] = 15n;
      baseView[3] = 20n;
      baseView[4] = 25n;
      let byteOffset: int = 16;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let sourceIterator = sourceView.values();
      let resultArray = BigUint64Array.from(sourceIterator);
      resultArray[0] = 88n;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray[0]).assertEqual(88n);
      expect(resultArray[1]).assertEqual(20n);
      expect(baseView[2]).assertEqual(15n);
      expect(baseView[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0850
     * @tc.name testBigUint64ArrayFrom085
     * @tc.desc Verify from(Array<BigInt>) preserves BigInt values created from base literal numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [BigInt(0x10), BigInt(0b101), BigInt(0o11)];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(16n);
      expect(resultArray[1]).assertEqual(5n);
      expect(resultArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0860
     * @tc.name testBigUint64ArrayFrom086
     * @tc.desc Verify from(Set<BigInt>) preserves insertion order for BigInt base literal conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<BigInt> = new Set<BigInt>();
      sourceSet.add(BigInt(0x20));
      sourceSet.add(BigInt(0b1010));
      sourceSet.add(BigInt(0o13));
      let resultArray = BigUint64Array.from(sourceSet);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(32n);
      expect(resultArray[1]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0870
     * @tc.name testBigUint64ArrayFrom087
     * @tc.desc Verify from(subarray, mapfn) uses window values and local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let sourceView = sourceArray.subarray(1, 4);
      let observedIndexTotal: number = 0;
      let resultArray = BigUint64Array.from(sourceView, (element: bigint, index: number): bigint => {
        observedIndexTotal = observedIndexTotal + index;
        return element + BigInt(index);
      });
      expect(observedIndexTotal).assertEqual(3);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(31n);
      expect(resultArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0880
     * @tc.name testBigUint64ArrayFrom088
     * @tc.desc Verify from(Array<BigInt>) preserves BigInt converted from a decimal int source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalSourceValue: int = 255;
      let sourceValues: Array<BigInt> = [BigInt(decimalSourceValue)];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0890
     * @tc.name testBigUint64ArrayFrom089
     * @tc.desc Verify from(Array<BigInt>) preserves BigInt converted from an octal int source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalSourceValue: int = 0o377;
      let sourceValues: Array<BigInt> = [BigInt(octalSourceValue)];
      let resultArray = BigUint64Array.from(sourceValues);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0900
     * @tc.name testBigUint64ArrayFrom090
     * @tc.desc Verify from(nested byteOffset subarray) copies the current window into an independent result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffsetView = new BigUint64Array(sharedBuffer, 8, 5);
      let firstWindow = byteOffsetView.subarray(1, 5);
      let nestedWindow = firstWindow.subarray(1, 3);
      fullView[4] = 555n;
      let resultArray = BigUint64Array.from(nestedWindow);
      fullView[3] = 444n;
      fullView[4] = 777n;
      expect(nestedWindow.byteOffset).assertEqual(24);
      expect(nestedWindow.length).assertEqual(2);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(40n);
      expect(resultArray[1]).assertEqual(555n);
      expect(nestedWindow[0]).assertEqual(444n);
      expect(nestedWindow[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0910
     * @tc.name testBigUint64ArrayFrom091
     * @tc.desc Verify from(slice of byteOffset view) copies the isolated window snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffsetView = new BigUint64Array(sharedBuffer, 8, 4);
      let sliceWindow = byteOffsetView.slice(1, 4);
      fullView[2] = 333n;
      let resultArray = BigUint64Array.from(sliceWindow);
      sliceWindow[1] = 444n;
      expect(sliceWindow.byteOffset).assertEqual(0);
      expect(sliceWindow.length).assertEqual(3);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
      expect(fullView[2]).assertEqual(333n);
      expect(sliceWindow[1]).assertEqual(444n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0920
     * @tc.name testBigUint64ArrayFrom092
     * @tc.desc Verify from(values iterator) consumes partially advanced iterator from current position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 8n, 16n]);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let resultArray = BigUint64Array.from(sourceIterator);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(8n);
      expect(resultArray[1]).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0930
     * @tc.name testBigUint64ArrayFrom093
     * @tc.desc Verify from(values iterator, mapfn) maps remaining iterator values with local indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let observedIndexTotal: number = 0;
      let resultArray = BigUint64Array.from(sourceIterator, (element: bigint, index: number): bigint => {
        observedIndexTotal = observedIndexTotal + index;
        return element + BigInt(index);
      });
      expect(observedIndexTotal).assertEqual(1);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0940
     * @tc.name testBigUint64ArrayFrom094
     * @tc.desc Verify from(Array, mapfn) observes an unvisited source element changed by an earlier callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [2n, 4n, 6n];
      let observedTailValue: bigint = 0n;
      let resultArray = BigUint64Array.from(sourceValues, (element: bigint, index: number): bigint => {
        if (index === 0) {
          sourceValues[2] = 99n;
        }
        if (index === 2) {
          observedTailValue = element;
        }
        return element;
      });
      expect(observedTailValue).assertEqual(99n);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(99n);
      expect(sourceValues[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0950
     * @tc.name testBigUint64ArrayFrom095
     * @tc.desc Verify generic from(ArrayLike<int>, mapfn) receives declared int values and preserves order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<int> = [2147483647, 0, -1];
      let sourceValues: ArrayLike<int> = sourceArray;
      let resultArray = BigUint64Array.from(sourceValues, (element: int, _index: number): BigInt => {
        return BigInt(element);
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(2147483647n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0960
     * @tc.name testBigUint64ArrayFrom096
     * @tc.desc Verify generic from(ArrayLike<number>, mapfn) converts fractional number sources explicitly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<number> = [1.9, -2.9, 3.1];
      let sourceValues: ArrayLike<number> = sourceArray;
      let resultArray = BigUint64Array.from(sourceValues, (element: number, _index: number): BigInt => {
        return BigInt(element.toInt());
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(18446744073709551614n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0970
     * @tc.name testBigUint64ArrayFrom097
     * @tc.desc Verify generic from(ArrayLike<string>, mapfn) maps a non-BigInt source type to BigInt results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<string> = ['zero', 'maximum'];
      let sourceValues: ArrayLike<string> = sourceArray;
      let resultArray = BigUint64Array.from(sourceValues, (element: string, _index: number): BigInt => {
        if (element === 'maximum') {
          return 18446744073709551615n;
        }
        return 0n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0980
     * @tc.name testBigUint64ArrayFrom098
     * @tc.desc Verify generic from(ArrayLike<BigInt>, mapfn) uses explicit array-like values and callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<BigInt> = [10n, 20n, 30n];
      let sourceValues: ArrayLike<BigInt> = sourceArray;
      let resultArray = BigUint64Array.from(sourceValues, (element: BigInt, index: number): BigInt => {
        return element + BigInt(index);
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(21n);
      expect(resultArray[2]).assertEqual(32n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_0990
     * @tc.name testBigUint64ArrayFrom099
     * @tc.desc Verify from(Array, mapfn) maps the current callback value snapshot after writing the same source index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [2n, 4n, 6n];
      let observedCurrentValue: BigInt = 0n;
      let resultArray = BigUint64Array.from(sourceValues, (element: BigInt, index: number): BigInt => {
        if (index === 1) {
          sourceValues[1] = 99n;
          observedCurrentValue = element;
        }
        return element;
      });
      expect(observedCurrentValue).assertEqual(4n);
      expect(resultArray[1]).assertEqual(4n);
      expect(sourceValues[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1000
     * @tc.name testBigUint64ArrayFrom100
     * @tc.desc Verify from(Array, mapfn) later write to a visited source index does not change the mapped result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<BigInt> = [2n, 4n, 6n];
      let resultArray = BigUint64Array.from(sourceValues, (element: BigInt, index: number): BigInt => {
        if (index === 2) {
          sourceValues[0] = 77n;
        }
        return element;
      });
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(6n);
      expect(sourceValues[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1010
     * @tc.name testBigUint64ArrayFrom101
     * @tc.desc Verify from(view, mapfn) observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: BigInt = 0n;
      let resultArray = BigUint64Array.from(sourceView, (element: BigInt, index: number): BigInt => {
        if (index === 0) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLaterValue = element;
        }
        return element;
      });
      expect(observedLaterValue).assertEqual(9n);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(9n);
      expect(resultArray[2]).assertEqual(3n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1020
     * @tc.name testBigUint64ArrayFrom102
     * @tc.desc Verify generic from(ArrayLike<float>, mapfn) observes float precision before explicit BigInt conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<float> = [16777217.0f];
      let sourceValues: ArrayLike<float> = sourceArray;
      let resultArray = BigUint64Array.from(sourceValues, (element: float, _index: number): BigInt => {
        return BigInt(element.toInt());
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(16777216n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1030
     * @tc.name testBigUint64ArrayFrom103
     * @tc.desc Verify Array BigInt source preserves a value created from binary integer input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<BigInt> = [BigInt(0b11111111)];
      let resultArray = BigUint64Array.from(sourceArray);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1040
     * @tc.name testBigUint64ArrayFrom104
     * @tc.desc Verify Array BigInt source preserves a value created from hexadecimal integer input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<BigInt> = [BigInt(0xFF)];
      let resultArray = BigUint64Array.from(sourceArray);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1050
     * @tc.name testBigUint64ArrayFrom105
     * @tc.desc Verify ArrayLike byte source converts each value explicitly through toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<byte> = [1, 2, 3];
      let resultArray = BigUint64Array.from(sourceArray, (element: byte): BigInt => BigInt(element.toInt()));
      expect(resultArray.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1060
     * @tc.name testBigUint64ArrayFrom106
     * @tc.desc Verify ArrayLike short source converts each value explicitly through toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<short> = [10, 20];
      let resultArray = BigUint64Array.from(sourceArray, (element: short): BigInt => BigInt(element.toInt()));
      expect(resultArray.join(',')).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1070
     * @tc.name testBigUint64ArrayFrom107
     * @tc.desc Verify ArrayLike long source converts each value explicitly through toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<long> = [4294967297, 4294967298];
      let resultArray = BigUint64Array.from(sourceArray, (element: long): BigInt => BigInt(element.toInt()));
      expect(resultArray.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FROM_1080
     * @tc.name testBigUint64ArrayFrom108
     * @tc.desc Verify ArrayLike double source truncates each value explicitly through toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFrom108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: Array<double> = [1.9, 2.9];
      let resultArray = BigUint64Array.from(sourceArray, (element: double): BigInt => BigInt(element.toInt()));
      expect(resultArray.join(',')).assertEqual('1,2');
    });
  });
}
