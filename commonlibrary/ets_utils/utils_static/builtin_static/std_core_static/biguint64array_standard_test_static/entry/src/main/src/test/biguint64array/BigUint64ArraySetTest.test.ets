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
const WRAPPED_NEGATIVE_TWO_VALUE: bigint = 18446744073709551614n;

export default function biguint64arraySetTest(): void {

  describe('BigUint64ArraySetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0100
     * @tc.name testBigUint64ArraySet001
     * @tc.desc Verify set(index value) writes the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      targetArray.set(0, 10n);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(0n);
      expect(targetArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0200
     * @tc.name testBigUint64ArraySet002
     * @tc.desc Verify set(index value) writes a middle element and keeps adjacent elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n]);
      targetArray.set(1, 99n);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(99n);
      expect(targetArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0300
     * @tc.name testBigUint64ArraySet003
     * @tc.desc Verify set(index value) writes the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      let lastIndex: int = targetArray.length - 1;
      targetArray.set(lastIndex, 44n);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[lastIndex]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0400
     * @tc.name testBigUint64ArraySet004
     * @tc.desc Verify set(index int value) converts an int value to BigInt storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      let sourceValue: int = 7;
      targetArray.set(1, sourceValue);
      expect(targetArray[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0500
     * @tc.name testBigUint64ArraySet005
     * @tc.desc Verify set(index value) stores the max uint64 value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(1);
      targetArray.set(0, MAX_UINT64_VALUE);
      expect(targetArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0600
     * @tc.name testBigUint64ArraySet006
     * @tc.desc Verify set(index value) wraps negative BigInt values to uint64 storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.set(0, -1n);
      targetArray.set(1, -2n);
      expect(targetArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(targetArray[1]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0700
     * @tc.name testBigUint64ArraySet007
     * @tc.desc Verify set(index value) wraps overflow BigInt values modulo uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      targetArray.set(0, UINT64_MODULUS_VALUE);
      targetArray.set(1, UINT64_MODULUS_VALUE + 1n);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0800
     * @tc.name testBigUint64ArraySet008
     * @tc.desc Verify set(FixedArray) copies source values from index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      let sourceValues: FixedArray<BigInt> = [10n, 20n, 30n];
      targetArray.set(sourceValues);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(20n);
      expect(targetArray[2]).assertEqual(30n);
      expect(targetArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_0900
     * @tc.name testBigUint64ArraySet009
     * @tc.desc Verify set(FixedArray insertPos) copies source values at the requested offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceValues: FixedArray<BigInt> = [50n, 60n];
      targetArray.set(sourceValues, 1);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(50n);
      expect(targetArray[2]).assertEqual(60n);
      expect(targetArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1000
     * @tc.name testBigUint64ArraySet010
     * @tc.desc Verify set(FixedArray) handles an empty source as a no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([7n, 8n, 9n]);
      let sourceValues: FixedArray<BigInt> = [];
      targetArray.set(sourceValues);
      expect(targetArray[0]).assertEqual(7n);
      expect(targetArray[1]).assertEqual(8n);
      expect(targetArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1100
     * @tc.name testBigUint64ArraySet011
     * @tc.desc Verify set(FixedArray) wraps negative and overflow source values independently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let sourceValues: FixedArray<BigInt> = [-1n, -2n, UINT64_MODULUS_VALUE];
      targetArray.set(sourceValues);
      expect(targetArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(targetArray[1]).assertEqual(WRAPPED_NEGATIVE_TWO_VALUE);
      expect(targetArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1200
     * @tc.name testBigUint64ArraySet012
     * @tc.desc Verify set(BigUint64Array) copies typed array values from index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let sourceArray = new BigUint64Array([4n, 5n]);
      targetArray.set(sourceArray);
      expect(targetArray[0]).assertEqual(4n);
      expect(targetArray[1]).assertEqual(5n);
      expect(targetArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1300
     * @tc.name testBigUint64ArraySet013
     * @tc.desc Verify set(BigUint64Array offset) copies typed array values at the requested offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceArray = new BigUint64Array([80n, 90n]);
      targetArray.set(sourceArray, 2);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
      expect(targetArray[2]).assertEqual(80n);
      expect(targetArray[3]).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1400
     * @tc.name testBigUint64ArraySet014
     * @tc.desc Verify set(BigUint64Array) copies already wrapped source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(2);
      sourceArray.set(0, -1n);
      sourceArray.set(1, UINT64_MODULUS_VALUE + 1n);
      let targetArray = new BigUint64Array(2);
      targetArray.set(sourceArray);
      expect(targetArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(targetArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1500
     * @tc.name testBigUint64ArraySet015
     * @tc.desc Verify set(ArrayLike BigInt) copies array values with default offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let sourceValues: Array<BigInt> = [11n, 22n];
      targetArray.set(sourceValues);
      expect(targetArray[0]).assertEqual(11n);
      expect(targetArray[1]).assertEqual(22n);
      expect(targetArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1600
     * @tc.name testBigUint64ArraySet016
     * @tc.desc Verify set(ArrayLike BigInt offset) copies array values at the requested offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceValues: Array<BigInt> = [33n, 44n];
      targetArray.set(sourceValues, 1);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(33n);
      expect(targetArray[2]).assertEqual(44n);
      expect(targetArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1700
     * @tc.name testBigUint64ArraySet017
     * @tc.desc Verify mixed set overloads can fill different sections of one target array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(5);
      targetArray.set(0, 1n);
      let fixedValues: FixedArray<BigInt> = [2n, 3n];
      targetArray.set(fixedValues, 1);
      targetArray.set(new BigUint64Array([4n, 5n]), 3);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
      expect(targetArray[2]).assertEqual(3n);
      expect(targetArray[3]).assertEqual(4n);
      expect(targetArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1800
     * @tc.name testBigUint64ArraySet018
     * @tc.desc Verify set() keeps target length byteLength and buffer stable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(4);
      let lengthBefore: int = targetArray.length;
      let byteLengthBefore: int = targetArray.byteLength;
      let bufferBefore = targetArray.buffer;
      targetArray.set(new BigUint64Array([6n, 7n]), 1);
      expect(targetArray.length).assertEqual(lengthBefore);
      expect(targetArray.byteLength).assertEqual(byteLengthBefore);
      expect(targetArray.buffer).assertEqual(bufferBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_1900
     * @tc.name testBigUint64ArraySet019
     * @tc.desc Verify set(index value) on a byteOffset view writes through to the backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      offsetView.set(0, 77n);
      offsetView.set(1, 88n);
      expect(fullView[0]).assertEqual(0n);
      expect(fullView[1]).assertEqual(77n);
      expect(fullView[2]).assertEqual(88n);
      expect(fullView[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2000
     * @tc.name testBigUint64ArraySet020
     * @tc.desc Verify set(BigUint64Array) into a subarray target updates the parent array window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let targetView = parentArray.subarray(1, 4);
      targetView.set(new BigUint64Array([20n, 30n]));
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(20n);
      expect(parentArray[2]).assertEqual(30n);
      expect(parentArray[3]).assertEqual(4n);
      expect(parentArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2100
     * @tc.name testBigUint64ArraySet021
     * @tc.desc Verify set(BigUint64Array offset) handles overlapping views on the same buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sourceView = targetArray.subarray(0, 3);
      targetArray.set(sourceView, 1);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(1n);
      expect(targetArray[2]).assertEqual(2n);
      expect(targetArray[3]).assertEqual(3n);
      expect(targetArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2200
     * @tc.name testBigUint64ArraySet022
     * @tc.desc Verify set(index value) throws RangeError when index equals length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n]);
      try {
        targetArray.set(targetArray.length, 3n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2300
     * @tc.name testBigUint64ArraySet023
     * @tc.desc Verify set(FixedArray) throws RangeError when source is larger than target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([9n, 8n]);
      let sourceValues: FixedArray<BigInt> = [1n, 2n, 3n];
      try {
        targetArray.set(sourceValues);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(9n);
      expect(targetArray[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2400
     * @tc.name testBigUint64ArraySet024
     * @tc.desc Verify set(BigUint64Array offset) throws RangeError when source exceeds target tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([9n, 8n, 7n]);
      let sourceArray = new BigUint64Array([1n, 2n]);
      try {
        targetArray.set(sourceArray, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(9n);
      expect(targetArray[1]).assertEqual(8n);
      expect(targetArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2500
     * @tc.name testBigUint64ArraySet025
     * @tc.desc Verify set(insertPos: int, val: int) writes decimal literal 42 at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let decimalValue: int = 42;
      targetArray.set(targetIndex, decimalValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(42n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2600
     * @tc.name testBigUint64ArraySet026
     * @tc.desc Verify set(insertPos: int, val: int) writes binary literal 0b101010 at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let binaryValue: int = 0b101010;
      targetArray.set(targetIndex, binaryValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(42n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2700
     * @tc.name testBigUint64ArraySet027
     * @tc.desc Verify set(insertPos: int, val: int) writes octal literal 0o52 at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let octalValue: int = 0o52;
      targetArray.set(targetIndex, octalValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(42n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2800
     * @tc.name testBigUint64ArraySet028
     * @tc.desc Verify set(insertPos: int, val: int) writes hexadecimal literal 0x2A at index 1 and stores 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let hexadecimalValue: int = 0x2A;
      targetArray.set(targetIndex, hexadecimalValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(42n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_2900
     * @tc.name testBigUint64ArraySet029
     * @tc.desc Verify set(insertPos: int, val: BigInt) writes BigInt(0b11111111) at index 1 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let binarySourceValue: int = 0b11111111;
      let convertedValue: bigint = BigInt(binarySourceValue);
      targetArray.set(targetIndex, convertedValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(255n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3000
     * @tc.name testBigUint64ArraySet030
     * @tc.desc Verify set(insertPos: int, val: BigInt) writes BigInt(0o377) at index 1 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let octalSourceValue: int = 0o377;
      let convertedValue: bigint = BigInt(octalSourceValue);
      targetArray.set(targetIndex, convertedValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(255n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3100
     * @tc.name testBigUint64ArraySet031
     * @tc.desc Verify set(insertPos: int, val: BigInt) writes BigInt(0xFF) at index 1 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let hexadecimalSourceValue: int = 0xFF;
      let convertedValue: bigint = BigInt(hexadecimalSourceValue);
      targetArray.set(targetIndex, convertedValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(255n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3200
     * @tc.name testBigUint64ArraySet032
     * @tc.desc Verify set(BigUint64Array offset) keeps prefix and suffix when source length is smaller than remaining capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let targetArray = new BigUint64Array(targetValues);
      let sourceValues: Array<BigInt> = [77n, 88n];
      let sourceArray = new BigUint64Array(sourceValues);
      let binaryOffset: int = 0b1;
      targetArray.set(sourceArray, binaryOffset);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(77n);
      expect(targetArray[2]).assertEqual(88n);
      expect(targetArray[3]).assertEqual(40n);
      expect(targetArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3300
     * @tc.name testBigUint64ArraySet033
     * @tc.desc Verify set(BigUint64Array offset) treats zero length source at terminal offset as no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetValues: Array<BigInt> = [6n, 7n, 8n];
      let targetArray = new BigUint64Array(targetValues);
      let sourceLength: int = 0;
      let emptySourceArray = new BigUint64Array(sourceLength);
      let terminalOffset: int = targetArray.length;
      targetArray.set(emptySourceArray, terminalOffset);
      expect(targetArray[0]).assertEqual(6n);
      expect(targetArray[1]).assertEqual(7n);
      expect(targetArray[2]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3400
     * @tc.name testBigUint64ArraySet034
     * @tc.desc Verify set(BigUint64Array offset) overwrites whole target when source length equals capacity at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetValues: Array<BigInt> = [1n, 2n, 3n, 4n];
      let targetArray = new BigUint64Array(targetValues);
      let sourceValues: Array<BigInt> = [91n, 92n, 93n, 94n];
      let sourceArray = new BigUint64Array(sourceValues);
      let startOffset: int = 0;
      targetArray.set(sourceArray, startOffset);
      expect(targetArray[0]).assertEqual(91n);
      expect(targetArray[1]).assertEqual(92n);
      expect(targetArray[2]).assertEqual(93n);
      expect(targetArray[3]).assertEqual(94n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3500
     * @tc.name testBigUint64ArraySet035
     * @tc.desc Verify set(insertPos: byte, val: BigInt) accepts declared byte index 1 and writes 66n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n]);
      let byteInsertPos: byte = 1;
      let replacementValue: bigint = 66n;
      targetArray.set(byteInsertPos, replacementValue);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(66n);
      expect(targetArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3600
     * @tc.name testBigUint64ArraySet036
     * @tc.desc Verify set(BigUint64Array, offset: short) accepts declared short offset 2 and preserves prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sourceArray = new BigUint64Array([77n, 88n]);
      let shortOffset: short = 2;
      targetArray.set(sourceArray, shortOffset);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
      expect(targetArray[2]).assertEqual(77n);
      expect(targetArray[3]).assertEqual(88n);
      expect(targetArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3700
     * @tc.name testBigUint64ArraySet037
     * @tc.desc Verify set(insertPos: int, val: long) accepts declared long value 10000000000 and stores 10000000000n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 2;
      let longReplacementValue: long = 10000000000;
      targetArray.set(targetIndex, longReplacementValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(1n);
      expect(targetArray[2]).assertEqual(10000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3800
     * @tc.name testBigUint64ArraySet038
     * @tc.desc Verify set(insertPos: short, val: BigInt) accepts declared short index 2 and writes the tail element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n]);
      let shortInsertPos: short = 2;
      let replacementValue: bigint = 77n;
      targetArray.set(shortInsertPos, replacementValue);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(20n);
      expect(targetArray[2]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_3900
     * @tc.name testBigUint64ArraySet039
     * @tc.desc Verify set(BigUint64Array, offset: byte) accepts declared byte offset 1 and preserves suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceArray = new BigUint64Array([88n, 99n]);
      let byteOffset: byte = 1;
      targetArray.set(sourceArray, byteOffset);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(88n);
      expect(targetArray[2]).assertEqual(99n);
      expect(targetArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4000
     * @tc.name testBigUint64ArraySet040
     * @tc.desc Verify set(insertPos: int, val: byte) accepts declared byte value 12 and stores 12n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let byteReplacementValue: byte = 12;
      targetArray.set(targetIndex, byteReplacementValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(12n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4100
     * @tc.name testBigUint64ArraySet041
     * @tc.desc Verify set(insertPos: int, val: short) accepts declared short value 2048 and stores 2048n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let shortReplacementValue: short = 2048;
      targetArray.set(targetIndex, shortReplacementValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(2048n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4200
     * @tc.name testBigUint64ArraySet042
     * @tc.desc Verify set() mutates its receiver while with() keeps the same replacement source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacementIndex: int = 1;
      let replacementValue: bigint = 99n;
      let mutableArray = new BigUint64Array([1n, 2n, 3n]);
      mutableArray.set(replacementIndex, replacementValue);
      expect(mutableArray[0]).assertEqual(1n);
      expect(mutableArray[1]).assertEqual(99n);
      expect(mutableArray[2]).assertEqual(3n);

      let immutableSourceArray = new BigUint64Array([1n, 2n, 3n]);
      let replacedArray = immutableSourceArray.with(replacementIndex, replacementValue);
      expect(replacedArray[0]).assertEqual(1n);
      expect(replacedArray[1]).assertEqual(99n);
      expect(replacedArray[2]).assertEqual(3n);
      expect(immutableSourceArray[0]).assertEqual(1n);
      expect(immutableSourceArray[1]).assertEqual(2n);
      expect(immutableSourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4300
     * @tc.name testBigUint64ArraySet043
     * @tc.desc Verify set(FixedArray BigInt) copies source values independently from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let sourceValues: FixedArray<BigInt> = [13n, 21n];
      targetArray.set(sourceValues);
      sourceValues[0] = 34n;
      expect(targetArray[0]).assertEqual(13n);
      expect(targetArray[1]).assertEqual(21n);
      expect(targetArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4400
     * @tc.name testBigUint64ArraySet044
     * @tc.desc Verify set(FixedArray BigInt offset) wraps source values and keeps the copied target stable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceValues: FixedArray<BigInt> = [8n, -3n];
      let targetOffset: int = 1;
      targetArray.set(sourceValues, targetOffset);
      sourceValues[1] = 9n;
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(8n);
      expect(targetArray[2]).assertEqual(MAX_UINT64_VALUE - 2n);
      expect(targetArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4500
     * @tc.name testBigUint64ArraySet045
     * @tc.desc Verify set(ArrayLike BigInt offset) keeps the copied target independent from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 6n, 7n, 8n]);
      let sourceValues: Array<BigInt> = [55n, 66n];
      let targetOffset: int = 1;
      targetArray.set(sourceValues, targetOffset);
      sourceValues[1] = 77n;
      expect(targetArray[0]).assertEqual(5n);
      expect(targetArray[1]).assertEqual(55n);
      expect(targetArray[2]).assertEqual(66n);
      expect(targetArray[3]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4600
     * @tc.name testBigUint64ArraySet046
     * @tc.desc Verify set(BigUint64Array offset) copies source values without linking the source to later target mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([31n, 41n]);
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let targetOffset: int = 1;
      targetArray.set(sourceArray, targetOffset);
      targetArray[1] = 59n;
      expect(sourceArray[0]).assertEqual(31n);
      expect(sourceArray[1]).assertEqual(41n);
      expect(targetArray[1]).assertEqual(59n);
      expect(targetArray[2]).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4700
     * @tc.name testBigUint64ArraySet047
     * @tc.desc Verify set(BigUint64Array source view) copies only the non-zero byteOffset source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullSourceView = new BigUint64Array(sourceBuffer, 0, 4);
      fullSourceView[0] = 11n;
      fullSourceView[1] = 22n;
      fullSourceView[2] = 33n;
      fullSourceView[3] = 44n;
      let sourceView = new BigUint64Array(sourceBuffer, 8, 2);
      let targetArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let targetOffset: int = 1;
      targetArray.set(sourceView, targetOffset);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(22n);
      expect(targetArray[2]).assertEqual(33n);
      expect(targetArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4800
     * @tc.name testBigUint64ArraySet048
     * @tc.desc Verify set(source byteOffset view offset) writes into a target byteOffset view window and preserves surrounding buffer values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullSourceView = new BigUint64Array(sourceBuffer, 0, 4);
      fullSourceView[0] = 11n;
      fullSourceView[1] = 22n;
      fullSourceView[2] = 33n;
      fullSourceView[3] = 44n;
      let sourceView = new BigUint64Array(sourceBuffer, 8, 2);
      let targetBuffer = new ArrayBuffer(48);
      let fullTargetView = new BigUint64Array(targetBuffer, 0, 6);
      fullTargetView[0] = 1n;
      fullTargetView[1] = 2n;
      fullTargetView[2] = 3n;
      fullTargetView[3] = 4n;
      fullTargetView[4] = 5n;
      fullTargetView[5] = 6n;
      let targetView = new BigUint64Array(targetBuffer, 8, 4);
      let targetOffset: int = 1;
      targetView.set(sourceView, targetOffset);
      expect(fullTargetView[0]).assertEqual(1n);
      expect(fullTargetView[1]).assertEqual(2n);
      expect(fullTargetView[2]).assertEqual(22n);
      expect(fullTargetView[3]).assertEqual(33n);
      expect(fullTargetView[4]).assertEqual(5n);
      expect(fullTargetView[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_4900
     * @tc.name testBigUint64ArraySet049
     * @tc.desc Verify set(FixedArray BigInt offset) writes into a target byteOffset view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetBuffer = new ArrayBuffer(48);
      let fullTargetView = new BigUint64Array(targetBuffer, 0, 6);
      fullTargetView[0] = 10n;
      fullTargetView[1] = 20n;
      fullTargetView[2] = 30n;
      fullTargetView[3] = 40n;
      fullTargetView[4] = 50n;
      fullTargetView[5] = 60n;
      let targetView = new BigUint64Array(targetBuffer, 8, 4);
      let hexadecimalSourceValue: int = 0x2A;
      let convertedSourceValue: bigint = BigInt(hexadecimalSourceValue);
      let sourceValues: FixedArray<BigInt> = [convertedSourceValue];
      let binaryOffset: int = 0b10;
      targetView.set(sourceValues, binaryOffset);
      expect(fullTargetView[0]).assertEqual(10n);
      expect(fullTargetView[1]).assertEqual(20n);
      expect(fullTargetView[2]).assertEqual(30n);
      expect(fullTargetView[3]).assertEqual(42n);
      expect(fullTargetView[4]).assertEqual(50n);
      expect(fullTargetView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5000
     * @tc.name testBigUint64ArraySet050
     * @tc.desc Verify set(ArrayLike BigInt offset) writes into a subarray target window and updates the parent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let targetView = parentArray.subarray(1, 5);
      let sourceValues: Array<BigInt> = [70n, 80n];
      let hexadecimalOffset: int = 0x1;
      targetView.set(sourceValues, hexadecimalOffset);
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[2]).assertEqual(70n);
      expect(parentArray[3]).assertEqual(80n);
      expect(parentArray[4]).assertEqual(5n);
      expect(parentArray[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5100
     * @tc.name testBigUint64ArraySet051
     * @tc.desc Verify set(insertPos: int, val: BigInt) writes BigInt(255) at index 1 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 1n, 2n]);
      let targetIndex: int = 1;
      let decimalSourceValue: int = 255;
      let convertedValue: bigint = BigInt(decimalSourceValue);
      targetArray.set(targetIndex, convertedValue);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(255n);
      expect(targetArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5200
     * @tc.name testBigUint64ArraySet052
     * @tc.desc Verify set(BigUint64Array offset) copies a later overlapping source window into an earlier target range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sourceView = targetArray.subarray(1, 4);
      let targetOffset: int = 0;
      targetArray.set(sourceView, targetOffset);
      expect(targetArray[0]).assertEqual(2n);
      expect(targetArray[1]).assertEqual(3n);
      expect(targetArray[2]).assertEqual(4n);
      expect(targetArray[3]).assertEqual(4n);
      expect(targetArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5300
     * @tc.name testBigUint64ArraySet053
     * @tc.desc Verify set(BigUint64Array offset) exactly fills a target byteOffset view tail without touching parent tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([70n, 80n]);
      let targetBuffer = new ArrayBuffer(48);
      let fullTargetView = new BigUint64Array(targetBuffer, 0, 6);
      fullTargetView[0] = 1n;
      fullTargetView[1] = 2n;
      fullTargetView[2] = 3n;
      fullTargetView[3] = 4n;
      fullTargetView[4] = 5n;
      fullTargetView[5] = 6n;
      let targetView = new BigUint64Array(targetBuffer, 8, 4);
      let terminalOffset: int = targetView.length - sourceArray.length;
      targetView.set(sourceArray, terminalOffset);
      expect(fullTargetView[0]).assertEqual(1n);
      expect(fullTargetView[1]).assertEqual(2n);
      expect(fullTargetView[2]).assertEqual(3n);
      expect(fullTargetView[3]).assertEqual(70n);
      expect(fullTargetView[4]).assertEqual(80n);
      expect(fullTargetView[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5400
     * @tc.name testBigUint64ArraySet054
     * @tc.desc Verify set(source view) into zero-length target byteOffset view throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetBuffer = new ArrayBuffer(32);
      let fullTargetView = new BigUint64Array(targetBuffer, 0, 4);
      fullTargetView[0] = 10n;
      fullTargetView[1] = 20n;
      fullTargetView[2] = 30n;
      fullTargetView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let targetView = new BigUint64Array(targetBuffer, byteOffset, viewLength);
      let sourceArray = new BigUint64Array([70n]);
      try {
        targetView.set(sourceArray);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetView.byteOffset).assertEqual(byteOffset);
      expect(targetView.length).assertEqual(0);
      expect(fullTargetView[1]).assertEqual(20n);
      expect(fullTargetView[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5500
     * @tc.name testBigUint64ArraySet055
     * @tc.desc Verify set(BigUint64Array offset) copies the receiver into itself at offset zero without changing values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([12n, 24n, 36n]);
      let startOffset: int = 0;
      targetArray.set(targetArray, startOffset);
      expect(targetArray[0]).assertEqual(12n);
      expect(targetArray[1]).assertEqual(24n);
      expect(targetArray[2]).assertEqual(36n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5600
     * @tc.name testBigUint64ArraySet056
     * @tc.desc Verify set(BigUint64Array offset) throws RangeError for a negative offset and keeps target values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([3n, 4n, 5n]);
      let sourceArray = new BigUint64Array([88n]);
      let negativeOffset: int = -1;
      try {
        targetArray.set(sourceArray, negativeOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(3n);
      expect(targetArray[1]).assertEqual(4n);
      expect(targetArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5700
     * @tc.name testBigUint64ArraySet057
     * @tc.desc Verify set(empty BigUint64Array offset) throws RangeError when offset is past target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([6n, 7n]);
      let sourceLength: int = 0;
      let emptySourceArray = new BigUint64Array(sourceLength);
      let pastEndOffset: int = targetArray.length + 1;
      try {
        targetArray.set(emptySourceArray, pastEndOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(6n);
      expect(targetArray[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5800
     * @tc.name testBigUint64ArraySet058
     * @tc.desc Verify set(FixedArray BigInt offset) exactly fills the target tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceValues: FixedArray<BigInt> = [70n, 80n];
      let terminalOffset: int = 2;
      targetArray.set(sourceValues, terminalOffset);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
      expect(targetArray[2]).assertEqual(70n);
      expect(targetArray[3]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_5900
     * @tc.name testBigUint64ArraySet059
     * @tc.desc Verify set(FixedArray BigInt offset) throws RangeError when source exceeds the target tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([9n, 8n, 7n]);
      let sourceValues: FixedArray<BigInt> = [1n, 2n];
      let targetOffset: int = 2;
      try {
        targetArray.set(sourceValues, targetOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(9n);
      expect(targetArray[1]).assertEqual(8n);
      expect(targetArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6000
     * @tc.name testBigUint64ArraySet060
     * @tc.desc Verify set(ArrayLike BigInt offset) exactly fills the target tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([11n, 22n, 33n, 44n]);
      let sourceValues: Array<BigInt> = [55n, 66n];
      let terminalOffset: int = 2;
      targetArray.set(sourceValues, terminalOffset);
      expect(targetArray[0]).assertEqual(11n);
      expect(targetArray[1]).assertEqual(22n);
      expect(targetArray[2]).assertEqual(55n);
      expect(targetArray[3]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6100
     * @tc.name testBigUint64ArraySet061
     * @tc.desc Verify set(ArrayLike BigInt offset) throws RangeError when source exceeds the target tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([5n, 6n, 7n]);
      let sourceValues: Array<BigInt> = [44n, 55n];
      let targetOffset: int = 2;
      try {
        targetArray.set(sourceValues, targetOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(5n);
      expect(targetArray[1]).assertEqual(6n);
      expect(targetArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6200
     * @tc.name testBigUint64ArraySet062
     * @tc.desc Verify set(BigUint64Array offset) into a subarray target throws RangeError and keeps the parent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let targetView = parentArray.subarray(1, 4);
      let sourceArray = new BigUint64Array([80n, 90n]);
      let targetOffset: int = 2;
      try {
        targetView.set(sourceArray, targetOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[2]).assertEqual(3n);
      expect(parentArray[3]).assertEqual(4n);
      expect(parentArray[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6300
     * @tc.name testBigUint64ArraySet063
     * @tc.desc Verify set(ArrayLike BigInt offset) copies source values current at call time
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceValues: Array<BigInt> = [12n, 24n];
      sourceValues[0] = 48n;
      let targetOffset: int = 1;
      targetArray.set(sourceValues, targetOffset);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(48n);
      expect(targetArray[2]).assertEqual(24n);
      expect(targetArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6400
     * @tc.name testBigUint64ArraySet064
     * @tc.desc Verify set(FixedArray BigInt offset) reads source mutation made before copying
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let sourceValues: FixedArray<BigInt> = [5n, 6n];
      sourceValues[1] = -1n;
      let targetOffset: int = 1;
      targetArray.set(sourceValues, targetOffset);
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(5n);
      expect(targetArray[2]).assertEqual(MAX_UINT64_VALUE);
      expect(targetArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6500
     * @tc.name testBigUint64ArraySet065
     * @tc.desc Verify float 42.9 converted by toInt stores truncated value 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let floatValueSource: float = 42.9f;
      let convertedValue: int = floatValueSource.toInt();
      let targetIndex: int = 1;
      targetArray.set(targetIndex, convertedValue);
      expect(targetArray[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6600
     * @tc.name testBigUint64ArraySet066
     * @tc.desc Verify double 255.9 converted by toInt stores truncated value 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(3);
      let doubleValueSource: double = 255.9;
      let convertedValue: int = doubleValueSource.toInt();
      let targetIndex: int = 2;
      targetArray.set(targetIndex, convertedValue);
      expect(targetArray[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6700
     * @tc.name testBigUint64ArraySet067
     * @tc.desc Verify byte toInt conversion supplies insert position one for a BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n, 30n]);
      let byteIndexSource: byte = 1;
      let targetIndex: int = byteIndexSource.toInt();
      let replacementValue: BigInt = 66n;
      targetArray.set(targetIndex, replacementValue);
      expect(targetArray[1]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6800
     * @tc.name testBigUint64ArraySet068
     * @tc.desc Verify short toInt conversion supplies offset one for a typed source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceArray = new BigUint64Array([70n, 80n]);
      let shortOffsetSource: short = 1;
      let targetOffset: int = shortOffsetSource.toInt();
      targetArray.set(sourceArray, targetOffset);
      expect(targetArray[1]).assertEqual(70n);
      expect(targetArray[2]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_6900
     * @tc.name testBigUint64ArraySet069
     * @tc.desc Verify long toInt conversion supplies low 32-bit offset one for a typed source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceArray = new BigUint64Array([90n, 100n]);
      let longOffsetSource: long = 4294967297;
      let targetOffset: int = longOffsetSource.toInt();
      targetArray.set(sourceArray, targetOffset);
      expect(targetArray[1]).assertEqual(90n);
      expect(targetArray[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7000
     * @tc.name testBigUint64ArraySet070
     * @tc.desc Verify float toInt conversion truncates offset one point nine before copying
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceArray = new BigUint64Array([11n, 22n]);
      let floatOffsetSource: float = 1.9f;
      let targetOffset: int = floatOffsetSource.toInt();
      targetArray.set(sourceArray, targetOffset);
      expect(targetArray[1]).assertEqual(11n);
      expect(targetArray[2]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7100
     * @tc.name testBigUint64ArraySet071
     * @tc.desc Verify double toInt conversion truncates offset two point nine before copying
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sourceArray = new BigUint64Array([33n, 44n]);
      let doubleOffsetSource: double = 2.9;
      let targetOffset: int = doubleOffsetSource.toInt();
      targetArray.set(sourceArray, targetOffset);
      expect(targetArray[2]).assertEqual(33n);
      expect(targetArray[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7200
     * @tc.name testBigUint64ArraySet072
     * @tc.desc Verify set stores the signed 64-bit boundary value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array(2);
      let targetIndex: int = 1;
      let boundaryValue: BigInt = 9223372036854775808n;
      targetArray.set(targetIndex, boundaryValue);
      expect(targetArray[1]).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7300
     * @tc.name testBigUint64ArraySet073
     * @tc.desc Verify an empty FixedArray at terminal offset leaves the target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n]);
      let sourceValues: FixedArray<BigInt> = [];
      let terminalOffset: int = targetArray.length;
      targetArray.set(sourceValues, terminalOffset);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7400
     * @tc.name testBigUint64ArraySet074
     * @tc.desc Verify an empty ArrayLike source at terminal offset leaves the target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([10n, 20n]);
      let sourceValues: Array<BigInt> = [];
      let terminalOffset: int = targetArray.length;
      targetArray.set(sourceValues, terminalOffset);
      expect(targetArray[0]).assertEqual(10n);
      expect(targetArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7500
     * @tc.name testBigUint64ArraySet075
     * @tc.desc Verify int minimum offset throws RangeError and preserves the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n]);
      let sourceArray = new BigUint64Array([9n]);
      let targetOffset: int = -2147483648;
      try {
        targetArray.set(sourceArray, targetOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7600
     * @tc.name testBigUint64ArraySet076
     * @tc.desc Verify a nonempty typed source at offset equal to target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = new BigUint64Array([1n, 2n]);
      let sourceArray = new BigUint64Array([9n]);
      let targetOffset: int = targetArray.length;
      try {
        targetArray.set(sourceArray, targetOffset);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7700
     * @tc.name testBigUint64ArraySet077
     * @tc.desc Verify a sibling write before set is read through the shared source view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 8, 2);
      let siblingView = new BigUint64Array(sharedBuffer);
      let targetArray = new BigUint64Array(3);
      siblingView[1] = 70n;
      siblingView[2] = 80n;
      let targetOffset: int = 1;
      targetArray.set(sourceView, targetOffset);
      expect(targetArray[1]).assertEqual(70n);
      expect(targetArray[2]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7800
     * @tc.name testBigUint64ArraySet078
     * @tc.desc Verify a sibling write after set does not change the copied target values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 8, 2);
      let siblingView = new BigUint64Array(sharedBuffer);
      sourceView[0] = 70n;
      sourceView[1] = 80n;
      let targetArray = new BigUint64Array(2);
      targetArray.set(sourceView);
      siblingView[1] = 99n;
      expect(targetArray[0]).assertEqual(70n);
      expect(targetArray[1]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_7900
     * @tc.name testBigUint64ArraySet079
     * @tc.desc Verify set on a target view is immediately visible through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(40);
      let targetView = new BigUint64Array(sharedBuffer, 8, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 16, 2);
      let sourceArray = new BigUint64Array([11n, 22n]);
      let targetOffset: int = 1;
      targetView.set(sourceArray, targetOffset);
      expect(siblingView[0]).assertEqual(11n);
      expect(siblingView[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8000
     * @tc.name testBigUint64ArraySet080
     * @tc.desc Verify a source byteOffset view copies into a disjoint sibling target and preserves the gap
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[1] = 11n;
      fullView[2] = 22n;
      fullView[3] = 33n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 2);
      let targetView = new BigUint64Array(sharedBuffer, 32, 2);
      targetView.set(sourceView);
      expect(fullView[3]).assertEqual(33n);
      expect(fullView[4]).assertEqual(11n);
      expect(fullView[5]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8100
     * @tc.name testBigUint64ArraySet081
     * @tc.desc Verify binary insert position one writes a BigInt value to the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(10n, 20n, 30n);
      targetArray.set(0b1, 42n);
      expect(targetArray.join(',')).assertEqual('10,42,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8200
     * @tc.name testBigUint64ArraySet082
     * @tc.desc Verify octal insert position one writes a BigInt value to the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(10n, 20n, 30n);
      targetArray.set(0o1, 42n);
      expect(targetArray.join(',')).assertEqual('10,42,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8300
     * @tc.name testBigUint64ArraySet083
     * @tc.desc Verify hexadecimal insert position one writes a BigInt value to the middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetArray = BigUint64Array.of(10n, 20n, 30n);
      targetArray.set(0x1, 42n);
      expect(targetArray.join(',')).assertEqual('10,42,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8400
     * @tc.name testBigUint64ArraySet084
     * @tc.desc Verify number source converted by toInt supplies scalar insert position one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberIndexSource: number = 1.9;
      let targetArray = BigUint64Array.of(10n, 20n, 30n);
      targetArray.set(numberIndexSource.toInt(), 55n);
      expect(targetArray[1]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8500
     * @tc.name testBigUint64ArraySet085
     * @tc.desc Verify byte source converted by toInt supplies typed array offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteOffsetSource: byte = 1;
      let targetArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let sourceArray = BigUint64Array.of(70n, 80n);
      targetArray.set(sourceArray, byteOffsetSource.toInt());
      expect(targetArray.join(',')).assertEqual('1,70,80,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SET_8600
     * @tc.name testBigUint64ArraySet086
     * @tc.desc Verify number source converted by toInt supplies scalar value forty two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberValueSource: number = 42.9;
      let targetArray = new BigUint64Array(2);
      targetArray.set(1, numberValueSource.toInt());
      expect(targetArray[1]).assertEqual(42n);
    });

  });
}
