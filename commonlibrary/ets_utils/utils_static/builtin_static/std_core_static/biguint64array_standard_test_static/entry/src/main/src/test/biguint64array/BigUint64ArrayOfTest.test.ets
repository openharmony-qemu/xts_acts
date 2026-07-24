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
const SIGNED_LONG_MAX_VALUE: bigint = 9223372036854775807n;
const SIGNED_LONG_MIN_VALUE: bigint = -9223372036854775808n;

export default function biguint64arrayOfTest(): void {

  describe('BigUint64ArrayOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0100
     * @tc.name testBigUint64ArrayOf001
     * @tc.desc Verify of() without items returns an empty BigUint64Array with zero byte metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of();
      expect(resultArray.length).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(0);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0200
     * @tc.name testBigUint64ArrayOf002
     * @tc.desc Verify of(0n) returns one element containing 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(0n);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray.byteLength).assertEqual(8);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0300
     * @tc.name testBigUint64ArrayOf003
     * @tc.desc Verify of() preserves positive BigInt argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(1n, 2n, 3n);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0400
     * @tc.name testBigUint64ArrayOf004
     * @tc.desc Verify of() with ten BigInt arguments preserves selected positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n);
      expect(resultArray.length).assertEqual(10);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[5]).assertEqual(5n);
      expect(resultArray[9]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0500
     * @tc.name testBigUint64ArrayOf005
     * @tc.desc Verify of() preserves the max uint64 BigInt boundary exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(MAX_UINT64_VALUE);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0600
     * @tc.name testBigUint64ArrayOf006
     * @tc.desc Verify of() preserves the max uint64 minus one BigInt boundary exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMaxValue = MAX_UINT64_VALUE - 1n;
      let resultArray = BigUint64Array.of(nearMaxValue);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0700
     * @tc.name testBigUint64ArrayOf007
     * @tc.desc Verify of() wraps 2^64 BigInt to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(UINT64_MODULUS_VALUE);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0800
     * @tc.name testBigUint64ArrayOf008
     * @tc.desc Verify of() wraps 2^64 plus one BigInt to 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowValue = UINT64_MODULUS_VALUE + 1n;
      let resultArray = BigUint64Array.of(overflowValue);
      expect(resultArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_0900
     * @tc.name testBigUint64ArrayOf009
     * @tc.desc Verify of() wraps MAX plus MAX to MAX minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubledMaxValue = MAX_UINT64_VALUE + MAX_UINT64_VALUE;
      let resultArray = BigUint64Array.of(doubledMaxValue);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1000
     * @tc.name testBigUint64ArrayOf010
     * @tc.desc Verify of(-1n) wraps to the max uint64 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-1n);
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1100
     * @tc.name testBigUint64ArrayOf011
     * @tc.desc Verify of(-2n) wraps to max uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-2n);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1200
     * @tc.name testBigUint64ArrayOf012
     * @tc.desc Verify of() preserves signed long max and wraps signed long min
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(SIGNED_LONG_MAX_VALUE, SIGNED_LONG_MIN_VALUE);
      expect(resultArray[0]).assertEqual(SIGNED_LONG_MAX_VALUE);
      expect(resultArray[1]).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1300
     * @tc.name testBigUint64ArrayOf013
     * @tc.desc Verify of() converts a mixed BigInt boundary sequence element by element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(0n, 1n, MAX_UINT64_VALUE, UINT64_MODULUS_VALUE, -1n);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(resultArray[3]).assertEqual(0n);
      expect(resultArray[4]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1400
     * @tc.name testBigUint64ArrayOf014
     * @tc.desc Verify of() preserves alternating zero and max uint64 BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(0n, MAX_UINT64_VALUE, 0n, MAX_UINT64_VALUE);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(MAX_UINT64_VALUE);
      expect(resultArray[2]).assertEqual(0n);
      expect(resultArray[3]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1500
     * @tc.name testBigUint64ArrayOf015
     * @tc.desc Verify of() accepts BigInt values created by BigInt constructors
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue = BigInt(0);
      let normalValue = BigInt(42);
      let negativeValue = BigInt(-1);
      let resultArray = BigUint64Array.of(zeroValue, normalValue, negativeValue);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(42n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1600
     * @tc.name testBigUint64ArrayOf016
     * @tc.desc Verify of() accepts a value read from another BigUint64Array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(7n, 14n, 21n);
      let resultArray = BigUint64Array.of(sourceArray[1]);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(14n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1700
     * @tc.name testBigUint64ArrayOf017
     * @tc.desc Verify of(...FixedArray<BigInt>) expands values in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<bigint> = [5n, 10n, 15n];
      let resultArray = BigUint64Array.of(...sourceValues);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1800
     * @tc.name testBigUint64ArrayOf018
     * @tc.desc Verify of(...Array<BigInt>) expands values and keeps a new result buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<bigint> = [11n, 22n, 33n];
      let resultArray = BigUint64Array.of(...sourceValues);
      sourceValues[0] = 99n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(11n);
      expect(resultArray[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_1900
     * @tc.name testBigUint64ArrayOf019
     * @tc.desc Verify of() accepts integer literal zero and stores 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(0);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2000
     * @tc.name testBigUint64ArrayOf020
     * @tc.desc Verify of() accepts positive integer literals and preserves order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(1, 2, 3);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2100
     * @tc.name testBigUint64ArrayOf021
     * @tc.desc Verify of() accepts negative integer literal and wraps it to max uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-1);
      expect(resultArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2200
     * @tc.name testBigUint64ArrayOf022
     * @tc.desc Verify of() accepts negative integer minus two and wraps it to max minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-2);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2300
     * @tc.name testBigUint64ArrayOf023
     * @tc.desc Verify of() accepts int variable max and stores it exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIntValue: int = 2147483647;
      let resultArray = BigUint64Array.of(maxIntValue);
      expect(resultArray[0]).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2400
     * @tc.name testBigUint64ArrayOf024
     * @tc.desc Verify of() accepts int variable min and wraps it to uint64 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minIntValue: int = -2147483648;
      let resultArray = BigUint64Array.of(minIntValue);
      expect(resultArray[0]).assertEqual(18446744071562067968n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2500
     * @tc.name testBigUint64ArrayOf025
     * @tc.desc Verify of() converts mixed integer values independently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(1, -1, 42, 0);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(MAX_UINT64_VALUE);
      expect(resultArray[2]).assertEqual(42n);
      expect(resultArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2600
     * @tc.name testBigUint64ArrayOf026
     * @tc.desc Verify of() accepts twenty integer arguments and preserves selected positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        10, 11, 12, 13, 14, 15, 16, 17, 18, 19);
      expect(resultArray.length).assertEqual(20);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[10]).assertEqual(10n);
      expect(resultArray[19]).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2700
     * @tc.name testBigUint64ArrayOf027
     * @tc.desc Verify of(...FixedArray<int>) expands integer values and converts each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<int> = [0, 1, -1];
      let resultArray = BigUint64Array.of(...sourceValues);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2800
     * @tc.name testBigUint64ArrayOf028
     * @tc.desc Verify of() result exposes BigUint64Array element metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(10n, 20n, 30n);
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(resultArray.byteOffset).assertEqual(0);
      expect(resultArray.byteLength).assertEqual(24);
      expect(resultArray.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_2900
     * @tc.name testBigUint64ArrayOf029
     * @tc.desc Verify of() result has the BigUint64Array name property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(1n);
      expect(resultArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3000
     * @tc.name testBigUint64ArrayOf030
     * @tc.desc Verify two of() calls return independent arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstArray = BigUint64Array.of(1n, 2n);
      let secondArray = BigUint64Array.of(1n, 2n);
      firstArray[0] = 99n;
      expect(secondArray[0]).assertEqual(1n);
      expect(firstArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3100
     * @tc.name testBigUint64ArrayOf031
     * @tc.desc Verify of() result elements can be overwritten by subscript assignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(1n, 2n);
      resultArray[1] = 55n;
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3200
     * @tc.name testBigUint64ArrayOf032
     * @tc.desc Verify of() result can be copied by from() without sharing storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(7n, 14n, 21n);
      let copiedArray = BigUint64Array.from(sourceArray);
      sourceArray[0] = 99n;
      expect(copiedArray[0]).assertEqual(7n);
      expect(copiedArray[1]).assertEqual(14n);
      expect(copiedArray[2]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3300
     * @tc.name testBigUint64ArrayOf033
     * @tc.desc Verify of(Float.NaN) throws RangeError for an invalid number argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: number = Float.NaN;
      try {
        BigUint64Array.of(nanValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3400
     * @tc.name testBigUint64ArrayOf034
     * @tc.desc Verify of(Float.POSITIVE_INFINITY) throws RangeError for an invalid number argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityValue: number = Float.POSITIVE_INFINITY;
      try {
        BigUint64Array.of(positiveInfinityValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3500
     * @tc.name testBigUint64ArrayOf035
     * @tc.desc Verify of(Float.NEGATIVE_INFINITY) throws RangeError for an invalid number argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInfinityValue: number = Float.NEGATIVE_INFINITY;
      try {
        BigUint64Array.of(negativeInfinityValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3600
     * @tc.name testBigUint64ArrayOf036
     * @tc.desc Verify of(item: int) accepts decimal literal 255 and stores 255n as the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalItem: int = 255;
      let resultArray = BigUint64Array.of(decimalItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3700
     * @tc.name testBigUint64ArrayOf037
     * @tc.desc Verify of(item: int) accepts binary literal 0b11111111 and stores 255n as the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryItem: int = 0b11111111;
      let resultArray = BigUint64Array.of(binaryItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3800
     * @tc.name testBigUint64ArrayOf038
     * @tc.desc Verify of(item: int) accepts octal literal 0o377 and stores 255n as the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalItem: int = 0o377;
      let resultArray = BigUint64Array.of(octalItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_3900
     * @tc.name testBigUint64ArrayOf039
     * @tc.desc Verify of(item: int) accepts hexadecimal literal 0xFF and stores 255n as the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexadecimalItem: int = 0xFF;
      let resultArray = BigUint64Array.of(hexadecimalItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4000
     * @tc.name testBigUint64ArrayOf040
     * @tc.desc Verify of(item: BigInt) accepts BigInt from binary number 0b11111111 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binarySourceValue: int = 0b11111111;
      let convertedItem: bigint = BigInt(binarySourceValue);
      let resultArray = BigUint64Array.of(convertedItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4100
     * @tc.name testBigUint64ArrayOf041
     * @tc.desc Verify of(item: BigInt) accepts BigInt from hexadecimal number 0xFF and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexadecimalSourceValue: int = 0xFF;
      let convertedItem: bigint = BigInt(hexadecimalSourceValue);
      let resultArray = BigUint64Array.of(convertedItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4200
     * @tc.name testBigUint64ArrayOf042
     * @tc.desc Verify of(item: byte) accepts declared byte value 12 and stores 12n as the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteItem: byte = 12;
      let resultArray = BigUint64Array.of(byteItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4300
     * @tc.name testBigUint64ArrayOf043
     * @tc.desc Verify of(item: short) accepts declared short value 2048 and stores 2048n as the only element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortItem: short = 2048;
      let resultArray = BigUint64Array.of(shortItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(2048n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4400
     * @tc.name testBigUint64ArrayOf044
     * @tc.desc Verify of(item: long) accepts declared long value 10000000000 and stores 10000000000n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longItem: long = 10000000000;
      let resultArray = BigUint64Array.of(longItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(10000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4500
     * @tc.name testBigUint64ArrayOf045
     * @tc.desc Verify of(...FixedArray<BigInt>) copies spread values independently from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<bigint> = [13n, 21n];
      let resultArray = BigUint64Array.of(...sourceValues);
      sourceValues[0] = 34n;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(13n);
      expect(resultArray[1]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4600
     * @tc.name testBigUint64ArrayOf046
     * @tc.desc Verify of(...FixedArray<int>) copies integer spread values independently from source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<int> = [2, -2];
      let resultArray = BigUint64Array.of(...sourceValues);
      sourceValues[0] = 9;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(MAX_UINT64_VALUE - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4700
     * @tc.name testBigUint64ArrayOf047
     * @tc.desc Verify of(...Array<int>) expands integer source values and keeps the result independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<int> = [4, -4];
      let resultArray = BigUint64Array.of(...sourceValues);
      sourceValues[1] = 8;
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(4n);
      expect(resultArray[1]).assertEqual(MAX_UINT64_VALUE - 3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4800
     * @tc.name testBigUint64ArrayOf048
     * @tc.desc Verify mutating of(...Array<BigInt>) result does not affect the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Array<bigint> = [55n, 89n];
      let resultArray = BigUint64Array.of(...sourceValues);
      resultArray[0] = 144n;
      expect(sourceValues[0]).assertEqual(55n);
      expect(sourceValues[1]).assertEqual(89n);
      expect(resultArray[0]).assertEqual(144n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_4900
     * @tc.name testBigUint64ArrayOf049
     * @tc.desc Verify of(...BigUint64Array) copies iterable source values independently from later mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(12n, 24n, 36n);
      let resultArray = BigUint64Array.of(...sourceArray);
      sourceArray[1] = 99n;
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(12n);
      expect(resultArray[1]).assertEqual(24n);
      expect(resultArray[2]).assertEqual(36n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5000
     * @tc.name testBigUint64ArrayOf050
     * @tc.desc Verify of(item: int) accepts mixed binary octal and hexadecimal integer rest arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryItem: int = 0b101010;
      let octalItem: int = 0o77;
      let hexadecimalItem: int = 0x58;
      let resultArray = BigUint64Array.of(binaryItem, octalItem, hexadecimalItem);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(42n);
      expect(resultArray[1]).assertEqual(63n);
      expect(resultArray[2]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5100
     * @tc.name testBigUint64ArrayOf051
     * @tc.desc Verify of(...FixedArray<int>) accepts non-decimal integer source values in spread order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<int> = [0b1001, 0o12, 0x0B];
      let resultArray = BigUint64Array.of(...sourceValues);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(9n);
      expect(resultArray[1]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5200
     * @tc.name testBigUint64ArrayOf052
     * @tc.desc Verify of(item: BigInt) accepts multiple BigInt values created from non-decimal number literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryConvertedItem: bigint = BigInt(0b101010);
      let octalConvertedItem: bigint = BigInt(0o77);
      let hexadecimalConvertedItem: bigint = BigInt(0x58);
      let resultArray = BigUint64Array.of(binaryConvertedItem, octalConvertedItem, hexadecimalConvertedItem);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(42n);
      expect(resultArray[1]).assertEqual(63n);
      expect(resultArray[2]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5300
     * @tc.name testBigUint64ArrayOf053
     * @tc.desc Verify of(item: BigInt) accepts BigInt from decimal number 255 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalSourceValue: int = 255;
      let convertedItem: bigint = BigInt(decimalSourceValue);
      let resultArray = BigUint64Array.of(convertedItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5400
     * @tc.name testBigUint64ArrayOf054
     * @tc.desc Verify of(item: BigInt) accepts BigInt from octal number 0o377 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalSourceValue: int = 0o377;
      let convertedItem: bigint = BigInt(octalSourceValue);
      let resultArray = BigUint64Array.of(convertedItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5500
     * @tc.name testBigUint64ArrayOf055
     * @tc.desc Verify of(...Set<BigInt>) expands unique values in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<bigint> = new Set<bigint>();
      sourceValues.add(7n);
      sourceValues.add(7n);
      sourceValues.add(11n);
      let resultArray = BigUint64Array.of(...sourceValues);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(7n);
      expect(resultArray[1]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5600
     * @tc.name testBigUint64ArrayOf056
     * @tc.desc Verify of(...values iterator) expands partially advanced iterator from current position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let resultArray = BigUint64Array.of(...sourceIterator);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5700
     * @tc.name testBigUint64ArrayOf057
     * @tc.desc Verify of(item: number) accepts the exact two to the power of 53 integer boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberItem: number = 9007199254740992;
      let resultArray = BigUint64Array.of(numberItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(9007199254740992n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5800
     * @tc.name testBigUint64ArrayOf058
     * @tc.desc Verify of(item: float) accepts an integer-valued float and stores the exact BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatItem: float = 42.0f;
      let resultArray = BigUint64Array.of(floatItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_5900
     * @tc.name testBigUint64ArrayOf059
     * @tc.desc Verify of(item: double) accepts an integer-valued double and stores the exact BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleItem: double = 255.0;
      let resultArray = BigUint64Array.of(doubleItem);
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6000
     * @tc.name testBigUint64ArrayOf060
     * @tc.desc Verify of(item: float) throws RangeError for a finite positive fractional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fractionalFloatItem: float = 1.5f;
      try {
        BigUint64Array.of(fractionalFloatItem);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6100
     * @tc.name testBigUint64ArrayOf061
     * @tc.desc Verify of(item: double) throws RangeError for a finite negative fractional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fractionalDoubleItem: double = -2.5;
      try {
        BigUint64Array.of(fractionalDoubleItem);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6200
     * @tc.name testBigUint64ArrayOf062
     * @tc.desc Verify binary negative integer minus two wraps to maximum uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-0b10);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6300
     * @tc.name testBigUint64ArrayOf063
     * @tc.desc Verify octal negative integer minus two wraps to maximum uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-0o2);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6400
     * @tc.name testBigUint64ArrayOf064
     * @tc.desc Verify hexadecimal negative integer minus two wraps to maximum uint64 minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resultArray = BigUint64Array.of(-0x2);
      expect(resultArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6500
     * @tc.name testBigUint64ArrayOf065
     * @tc.desc Verify byte source converted by toInt creates value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteValueSource: byte = 42;
      let resultArray = BigUint64Array.of(byteValueSource.toInt());
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6600
     * @tc.name testBigUint64ArrayOf066
     * @tc.desc Verify number source converted by toInt creates truncated value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberValueSource: number = 42.9;
      let resultArray = BigUint64Array.of(numberValueSource.toInt());
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6700
     * @tc.name testBigUint64ArrayOf067
     * @tc.desc Verify double source converted by toInt creates truncated value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleValueSource: double = 42.9;
      let resultArray = BigUint64Array.of(doubleValueSource.toInt());
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6800
     * @tc.name testBigUint64ArrayOf068
     * @tc.desc Verify short source converted by toInt creates value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortValueSource: short = 42;
      let resultArray = BigUint64Array.of(shortValueSource.toInt());
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_6900
     * @tc.name testBigUint64ArrayOf069
     * @tc.desc Verify long source converted by toInt creates value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValueSource: long = 42;
      let resultArray = BigUint64Array.of(longValueSource.toInt());
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OF_7000
     * @tc.name testBigUint64ArrayOf070
     * @tc.desc Verify float source converted by toInt creates value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatValueSource: float = 42.0f;
      let resultArray = BigUint64Array.of(floatValueSource.toInt());
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(42n);
    });
  });
}
