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
const HIGH_SIGNED_BOUNDARY_VALUE: bigint = 9223372036854775808n;

export default function biguint64arrayToStringTest(): void {

  describe('BigUint64ArrayToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0100
     * @tc.name testBigUint64ArrayToString001
     * @tc.desc Verify toString() on an empty array returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('');
      expect(stringResult.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0200
     * @tc.name testBigUint64ArrayToString002
     * @tc.desc Verify toString() on a single zero element returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('0');
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0300
     * @tc.name testBigUint64ArrayToString003
     * @tc.desc Verify toString() on a single positive element returns its decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('42');
      expect(stringResult.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0400
     * @tc.name testBigUint64ArrayToString004
     * @tc.desc Verify toString() preserves the max uint64 decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('18446744073709551615');
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0500
     * @tc.name testBigUint64ArrayToString005
     * @tc.desc Verify toString() preserves the near max uint64 decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE - 1n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('18446744073709551614');
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0600
     * @tc.name testBigUint64ArrayToString006
     * @tc.desc Verify toString() uses comma as separator for normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('1,2,3');
      expect(stringResult).assertEqual(sourceArray.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0700
     * @tc.name testBigUint64ArrayToString007
     * @tc.desc Verify toString() preserves zero max uint64 and one in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, MAX_UINT64_VALUE, 1n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('0,18446744073709551615,1');
      expect(sourceArray[1]).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0800
     * @tc.name testBigUint64ArrayToString008
     * @tc.desc Verify toString() stringifies negative BigInt inputs after uint64 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n, -2n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('18446744073709551615,18446744073709551614');
      expect(sourceArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(sourceArray[1]).assertEqual(MAX_UINT64_VALUE - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_0900
     * @tc.name testBigUint64ArrayToString009
     * @tc.desc Verify toString() stringifies overflow BigInt inputs after uint64 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([UINT64_MODULUS_VALUE, UINT64_MODULUS_VALUE + 1n]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('0,1');
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1000
     * @tc.name testBigUint64ArrayToString010
     * @tc.desc Verify toString() preserves values around signed long boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9223372036854775807n, HIGH_SIGNED_BOUNDARY_VALUE]);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('9223372036854775807,9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1100
     * @tc.name testBigUint64ArrayToString011
     * @tc.desc Verify toString() on a length constructed array returns comma separated zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('0,0,0,0,0');
      expect(sourceArray.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1200
     * @tc.name testBigUint64ArrayToString012
     * @tc.desc Verify toString() keeps order for a twelve element sequential array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(12);
      for (let writeIndex: int = 0; writeIndex < sourceArray.length; writeIndex++) {
        sourceArray[writeIndex] = BigInt(writeIndex);
      }
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('0,1,2,3,4,5,6,7,8,9,10,11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1300
     * @tc.name testBigUint64ArrayToString013
     * @tc.desc Verify toString() result contains exactly length minus one separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let stringResult = sourceArray.toString();
      let commaCount: int = 0;
      for (let charIndex: int = 0; charIndex < stringResult.length; charIndex++) {
        if (stringResult.substring(charIndex, charIndex + 1) === ',') {
          commaCount++;
        }
      }
      expect(commaCount).assertEqual(sourceArray.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1400
     * @tc.name testBigUint64ArrayToString014
     * @tc.desc Verify toString() does not include BigInt literal suffixes or spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, MAX_UINT64_VALUE]);
      let stringResult = sourceArray.toString();
      expect(stringResult.indexOf('n')).assertEqual(-1);
      expect(stringResult.indexOf(' ')).assertEqual(-1);
      expect(stringResult).assertEqual('1,2,18446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1500
     * @tc.name testBigUint64ArrayToString015
     * @tc.desc Verify toString() does not add leading or trailing separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let stringResult = sourceArray.toString();
      expect(stringResult.substring(0, 1)).assertEqual('1');
      expect(stringResult.substring(stringResult.length - 1, stringResult.length)).assertEqual('3');
      expect(stringResult).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1600
     * @tc.name testBigUint64ArrayToString016
     * @tc.desc Verify toString() can be used in string concatenation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let combinedText: string = '[' + sourceArray.toString() + ']';
      expect(combinedText).assertEqual('[10,20]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1700
     * @tc.name testBigUint64ArrayToString017
     * @tc.desc Verify toString() result supports substring and indexOf string operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([123n, 456n]);
      let stringResult = sourceArray.toString();
      expect(stringResult.substring(0, 3)).assertEqual('123');
      expect(stringResult.indexOf(',')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1800
     * @tc.name testBigUint64ArrayToString018
     * @tc.desc Verify toString() does not modify array elements or metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let byteOffsetBefore: int = sourceArray.byteOffset;
      let bufferBefore = sourceArray.buffer;
      sourceArray.toString();
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
      expect(sourceArray.byteOffset).assertEqual(byteOffsetBefore);
      expect(sourceArray.buffer).assertEqual(bufferBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_1900
     * @tc.name testBigUint64ArrayToString019
     * @tc.desc Verify repeated toString() calls return the same string until data changes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 8n, 9n]);
      let firstString = sourceArray.toString();
      let secondString = sourceArray.toString();
      expect(firstString).assertEqual(secondString);
      sourceArray[0] = 70n;
      expect(sourceArray.toString()).assertEqual('70,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2000
     * @tc.name testBigUint64ArrayToString020
     * @tc.desc Verify toString() reflects values after set() writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.set(new BigUint64Array([9n, 8n, 7n]));
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('9,8,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2100
     * @tc.name testBigUint64ArrayToString021
     * @tc.desc Verify toString() on a subarray view only includes the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let childView = sourceArray.subarray(1, 4);
      let stringResult = childView.toString();
      expect(stringResult).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2200
     * @tc.name testBigUint64ArrayToString022
     * @tc.desc Verify toString() on a slice result reflects copied elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let slicedArray = sourceArray.slice(1, 3);
      sourceArray[1] = 99n;
      let stringResult = slicedArray.toString();
      expect(stringResult).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2300
     * @tc.name testBigUint64ArrayToString023
     * @tc.desc Verify toString() on a nonzero byteOffset view only includes the view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      fullView[3] = 400n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      let stringResult = offsetView.toString();
      expect(stringResult).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2400
     * @tc.name testBigUint64ArrayToString024
     * @tc.desc Verify toString() observes shared buffer updates through sibling views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      fullView[2] = 999n;
      let stringResult = offsetView.toString();
      expect(stringResult).assertEqual('20,999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2500
     * @tc.name testBigUint64ArrayToString025
     * @tc.desc Verify toString() on a toReversed() result reflects reversed order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reversedArray = sourceArray.toReversed();
      let stringResult = reversedArray.toString();
      expect(stringResult).assertEqual('3,2,1');
      expect(sourceArray.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2600
     * @tc.name testBigUint64ArrayToString026
     * @tc.desc Verify toString() on a toSorted() result reflects sorted order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 1n, 2n]);
      let sortedArray = sourceArray.toSorted();
      let stringResult = sortedArray.toString();
      expect(stringResult).assertEqual('1,2,3');
      expect(sourceArray.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2700
     * @tc.name testBigUint64ArrayToString027
     * @tc.desc Verify valueOf() receiver toString() matches direct toString()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let directString = sourceArray.toString();
      let valueOfString = sourceArray.valueOf().toString();
      expect(valueOfString).assertEqual(directString);
      expect(valueOfString).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2800
     * @tc.name testBigUint64ArrayToString028
     * @tc.desc Verify toString() on a BigUint64Array.of() source preserves argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(6n, 12n, 24n);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('6,12,24');
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_2900
     * @tc.name testBigUint64ArrayToString029
     * @tc.desc Verify toString() on a BigUint64Array.from(Set) source preserves insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(9n);
      sourceSet.add(18n);
      sourceSet.add(27n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('9,18,27');
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3000
     * @tc.name testBigUint64ArrayToString030
     * @tc.desc Verify toString() on a FixedArray<BigInt> constructed source preserves element order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: FixedArray<bigint> = [4n, 8n, 16n];
      let sourceArray = new BigUint64Array(sourceValues);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('4,8,16');
      expect(sourceArray[2]).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3100
     * @tc.name testBigUint64ArrayToString031
     * @tc.desc Verify toString() on a copy constructed source is isolated from later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([3n, 6n, 9n]);
      let copiedArray = new BigUint64Array(originalArray);
      originalArray[1] = 60n;
      let stringResult = copiedArray.toString();
      expect(stringResult).assertEqual('3,6,9');
      expect(originalArray.toString()).assertEqual('3,60,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3200
     * @tc.name testBigUint64ArrayToString032
     * @tc.desc Verify toString() on a number byteOffset view reads the converted view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 24;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let baseView = new BigUint64Array(sourceBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      let byteOffset: number = 8.0;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset);
      let stringResult = offsetView.toString();
      expect(stringResult).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3300
     * @tc.name testBigUint64ArrayToString033
     * @tc.desc Verify toString() on a zero-length ArrayBuffer view returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 16;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let emptyWindow = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let stringResult = emptyWindow.toString();
      expect(stringResult).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3400
     * @tc.name testBigUint64ArrayToString034
     * @tc.desc Verify toString() on a subarray reflects parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let subarrayView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let stringResult = subarrayView.toString();
      expect(stringResult).assertEqual('2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3500
     * @tc.name testBigUint64ArrayToString035
     * @tc.desc Verify toString() on a length-bounded byteOffset subarray stringifies current window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer, 0, 7);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffset: int = 8;
      let viewLength: int = 5;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 2;
      let endIndex: int = 5;
      let nestedView = byteOffsetView.subarray(beginIndex, endIndex);
      fullView[4] = 555n;
      let stringResult = nestedView.toString();
      expect(nestedView.byteOffset).assertEqual(24);
      expect(nestedView.length).assertEqual(3);
      expect(stringResult).assertEqual('40,555,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3600
     * @tc.name testBigUint64ArrayToString036
     * @tc.desc Verify toString() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let copyBegin: int = 0;
      let copyEnd: int = 3;
      let sliceCopy = sourceView.slice(copyBegin, copyEnd);
      sourceView[1] = 777n;
      let stringResult = sliceCopy.toString();
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(3);
      expect(stringResult).assertEqual('20,30,40');
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3700
     * @tc.name testBigUint64ArrayToString037
     * @tc.desc Verify toString() on a Set source reflects insertion order after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('7,11,15');
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3800
     * @tc.name testBigUint64ArrayToString038
     * @tc.desc Verify toString() on an advanced iterator source starts at the current cursor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let stringResult = sourceArray.toString();
      expect(stringResult).assertEqual('10,15,20');
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_3900
     * @tc.name testBigUint64ArrayToString039
     * @tc.desc Verify toString() on an empty subarray window returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let beginIndex: int = 2;
      let endIndex: int = 2;
      let emptyView = sourceArray.subarray(beginIndex, endIndex);
      let stringResult = emptyView.toString();
      expect(emptyView.length).assertEqual(0);
      expect(stringResult).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_4000
     * @tc.name testBigUint64ArrayToString040
     * @tc.desc Verify toString() on a subarray window is stable after a parent write outside the window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sourceView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[0] = 100n;
      sourceArray[3] = 400n;
      let stringResult = sourceView.toString();
      expect(stringResult).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_4100
     * @tc.name testBigUint64ArrayToString041
     * @tc.desc Verify toString emits decimal strings for binary integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0b101010), BigInt(0b11111111));
      expect(sourceArray.toString()).assertEqual('42,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_4200
     * @tc.name testBigUint64ArrayToString042
     * @tc.desc Verify toString emits decimal strings for octal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0o52), BigInt(0o377));
      expect(sourceArray.toString()).assertEqual('42,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_TOSTRING_4300
     * @tc.name testBigUint64ArrayToString043
     * @tc.desc Verify toString emits decimal strings for hexadecimal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0x2A), BigInt(0xFF));
      expect(sourceArray.toString()).assertEqual('42,255');
    });
  });
}
