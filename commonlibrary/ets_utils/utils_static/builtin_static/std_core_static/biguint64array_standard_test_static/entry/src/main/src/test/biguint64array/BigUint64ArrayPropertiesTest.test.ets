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

export default function biguint64arrayPropertiesTest(): void {

  describe('BigUint64ArrayPropertiesTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0100
     * @tc.name testBigUint64ArrayProperties001
     * @tc.desc Verify static and instance BYTES_PER_ELEMENT values are both 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sizedArray = new BigUint64Array(4);
      let bufferView = new BigUint64Array(new ArrayBuffer(24), 8, 2);
      let expectedBytesPerElement: int = 8;
      expect(sizedArray.BYTES_PER_ELEMENT).assertEqual(expectedBytesPerElement);
      expect(bufferView.BYTES_PER_ELEMENT).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0200
     * @tc.name testBigUint64ArrayProperties002
     * @tc.desc Verify int length constructor derives byteLength from length and element size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let elementCount: int = 3;
      let sizedArray = new BigUint64Array(elementCount);
      expect(sizedArray.length).assertEqual(3);
      expect(sizedArray.byteLength).assertEqual(24);
      expect(sizedArray.byteLength).assertEqual(sizedArray.length * sizedArray.BYTES_PER_ELEMENT);
      expect(sizedArray.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0300
     * @tc.name testBigUint64ArrayProperties003
     * @tc.desc Verify number length constructor truncates fractional length before deriving properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fractionalLength: number = 2.5;
      let sizedArray = new BigUint64Array(fractionalLength);
      expect(sizedArray.length).assertEqual(2);
      expect(sizedArray.byteLength).assertEqual(16);
      expect(sizedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0400
     * @tc.name testBigUint64ArrayProperties004
     * @tc.desc Verify fractional number length below one creates an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fractionalLength: number = 0.9;
      let sizedArray = new BigUint64Array(fractionalLength);
      expect(sizedArray.length).assertEqual(0);
      expect(sizedArray.byteLength).assertEqual(0);
      expect(sizedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0500
     * @tc.name testBigUint64ArrayProperties005
     * @tc.desc Verify FixedArray BigInt source creates compact properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<BigInt> = [1n, 2n];
      let typedArray = new BigUint64Array(sourceValues);
      expect(typedArray.length).assertEqual(2);
      expect(typedArray.byteLength).assertEqual(16);
      expect(typedArray.byteOffset).assertEqual(0);
      expect(typedArray[0]).assertEqual(1n);
      expect(typedArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0600
     * @tc.name testBigUint64ArrayProperties006
     * @tc.desc Verify Array BigInt source creates compact properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n];
      let typedArray = new BigUint64Array(sourceValues);
      expect(typedArray.length).assertEqual(3);
      expect(typedArray.byteLength).assertEqual(24);
      expect(typedArray.byteOffset).assertEqual(0);
      expect(typedArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0700
     * @tc.name testBigUint64ArrayProperties007
     * @tc.desc Verify Set iterable source keeps order and derives compact properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(10n);
      sourceSet.add(20n);
      let typedArray = new BigUint64Array(sourceSet);
      expect(typedArray.length).assertEqual(2);
      expect(typedArray.byteLength).assertEqual(16);
      expect(typedArray[0]).assertEqual(10n);
      expect(typedArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0800
     * @tc.name testBigUint64ArrayProperties008
     * @tc.desc Verify copy constructor resets byteOffset and allocates an independent buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sourceBuffer, 8, 2);
      sourceView[0] = 100n;
      let copiedArray = new BigUint64Array(sourceView);
      copiedArray[0] = 200n;
      expect(copiedArray.length).assertEqual(2);
      expect(copiedArray.byteOffset).assertEqual(0);
      expect(copiedArray.buffer !== sourceView.buffer).assertTrue();
      expect(sourceView[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_0900
     * @tc.name testBigUint64ArrayProperties009
     * @tc.desc Verify ArrayBuffer single-argument constructor uses the whole aligned buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let bufferView = new BigUint64Array(sourceBuffer);
      expect(bufferView.length).assertEqual(2);
      expect(bufferView.byteLength).assertEqual(16);
      expect(bufferView.byteOffset).assertEqual(0);
      expect(bufferView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1000
     * @tc.name testBigUint64ArrayProperties010
     * @tc.desc Verify empty ArrayBuffer constructor creates an empty zero-offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(0);
      let bufferView = new BigUint64Array(sourceBuffer);
      expect(bufferView.length).assertEqual(0);
      expect(bufferView.byteLength).assertEqual(0);
      expect(bufferView.byteOffset).assertEqual(0);
      expect(bufferView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1100
     * @tc.name testBigUint64ArrayProperties011
     * @tc.desc Verify int byteOffset constructor maps remaining buffer bytes into length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let bufferView = new BigUint64Array(sourceBuffer, 8);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.length).assertEqual(2);
      expect(bufferView.byteLength).assertEqual(16);
      expect(bufferView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1200
     * @tc.name testBigUint64ArrayProperties012
     * @tc.desc Verify byteOffset equal to buffer length creates a zero-length view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let bufferView = new BigUint64Array(sourceBuffer, 16);
      expect(bufferView.length).assertEqual(0);
      expect(bufferView.byteLength).assertEqual(0);
      expect(bufferView.byteOffset).assertEqual(16);
      expect(bufferView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1300
     * @tc.name testBigUint64ArrayProperties013
     * @tc.desc Verify three-argument constructor exactly fits the full buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let bufferView = new BigUint64Array(sourceBuffer, 0, 3);
      expect(bufferView.length).assertEqual(3);
      expect(bufferView.byteLength).assertEqual(24);
      expect(bufferView.byteOffset).assertEqual(0);
      expect(bufferView.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1400
     * @tc.name testBigUint64ArrayProperties014
     * @tc.desc Verify three-argument constructor creates a middle view with expected properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let bufferView = new BigUint64Array(sourceBuffer, 8, 3);
      expect(bufferView.length).assertEqual(3);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.byteLength).assertEqual(24);
      expect(bufferView.byteOffset + bufferView.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1500
     * @tc.name testBigUint64ArrayProperties015
     * @tc.desc Verify three-argument zero length keeps the requested byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let bufferView = new BigUint64Array(sourceBuffer, 8, 0);
      expect(bufferView.length).assertEqual(0);
      expect(bufferView.byteLength).assertEqual(0);
      expect(bufferView.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1600
     * @tc.name testBigUint64ArrayProperties016
     * @tc.desc Verify number byteOffset truncates to an aligned offset before deriving properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let fractionalOffset: number = 8.9;
      let bufferView = new BigUint64Array(sourceBuffer, fractionalOffset);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.length).assertEqual(1);
      expect(bufferView.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1700
     * @tc.name testBigUint64ArrayProperties017
     * @tc.desc Verify number byteOffset truncating to buffer length creates an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let fractionalOffset: number = 16.9;
      let bufferView = new BigUint64Array(sourceBuffer, fractionalOffset);
      expect(bufferView.byteOffset).assertEqual(16);
      expect(bufferView.length).assertEqual(0);
      expect(bufferView.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1800
     * @tc.name testBigUint64ArrayProperties018
     * @tc.desc Verify subarray byteOffset equals begin index times element byte size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(6);
      let subView = sourceArray.subarray(2, 5);
      let expectedOffset: int = sourceArray.byteOffset + 2 * sourceArray.BYTES_PER_ELEMENT;
      expect(subView.byteOffset).assertEqual(expectedOffset);
      expect(subView.length).assertEqual(3);
      expect(subView.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_1900
     * @tc.name testBigUint64ArrayProperties019
     * @tc.desc Verify subarray from a non-zero-offset view keeps buffer-relative byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(48);
      let sourceView = new BigUint64Array(sourceBuffer, 8, 4);
      let subView = sourceView.subarray(1, 3);
      expect(subView.byteOffset).assertEqual(16);
      expect(subView.length).assertEqual(2);
      expect(subView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2000
     * @tc.name testBigUint64ArrayProperties020
     * @tc.desc Verify subarray shares the original buffer and exposes the parent buffer length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(5);
      let subView = sourceArray.subarray(1, 4);
      subView[0] = 77n;
      expect(subView.buffer).assertEqual(sourceArray.buffer);
      expect(subView.buffer.byteLength).assertEqual(sourceArray.buffer.byteLength);
      expect(sourceArray[1]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2100
     * @tc.name testBigUint64ArrayProperties021
     * @tc.desc Verify slice creates a compact copy with byteOffset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let copiedSlice = sourceArray.slice(1, 3);
      copiedSlice[0] = 99n;
      expect(copiedSlice.length).assertEqual(2);
      expect(copiedSlice.byteLength).assertEqual(16);
      expect(copiedSlice.byteOffset).assertEqual(0);
      expect(copiedSlice.buffer !== sourceArray.buffer).assertTrue();
      expect(sourceArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2200
     * @tc.name testBigUint64ArrayProperties022
     * @tc.desc Verify byteLength equals length times BYTES_PER_ELEMENT across creation APIs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ofArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      let fromArray = BigUint64Array.from([1n, 2n, 3n]);
      let bufferView = new BigUint64Array(new ArrayBuffer(40), 8, 3);
      expect(ofArray.byteLength).assertEqual(ofArray.length * ofArray.BYTES_PER_ELEMENT);
      expect(fromArray.byteLength).assertEqual(fromArray.length * fromArray.BYTES_PER_ELEMENT);
      expect(bufferView.byteLength).assertEqual(bufferView.length * bufferView.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2300
     * @tc.name testBigUint64ArrayProperties023
     * @tc.desc Verify byteOffset plus byteLength identifies the view end inside its buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(48);
      let bufferView = new BigUint64Array(sourceBuffer, 8, 3);
      let viewEndOffset: int = bufferView.byteOffset + bufferView.byteLength;
      expect(viewEndOffset).assertEqual(32);
      expect(sourceBuffer.byteLength).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2400
     * @tc.name testBigUint64ArrayProperties024
     * @tc.desc Verify length can be computed from byteLength divided by BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sizedArray = new BigUint64Array(6);
      let computedLength: int = sizedArray.byteLength / sizedArray.BYTES_PER_ELEMENT;
      expect(computedLength).assertEqual(sizedArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2500
     * @tc.name testBigUint64ArrayProperties025
     * @tc.desc Verify repeated property reads do not mutate length or byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let currentBuffer = sourceArray.buffer;
      let currentName = sourceArray.name;
      expect(currentBuffer.byteLength).assertEqual(24);
      expect(currentName).assertEqual('BigUint64Array');
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2600
     * @tc.name testBigUint64ArrayProperties026
     * @tc.desc Verify name is BigUint64Array across source and view creation paths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<BigInt> = [10n, 20n, 30n];
      let fixedArrayView = new BigUint64Array(sourceValues);
      let arrayView = new BigUint64Array([100n, 200n]);
      let bufferView = new BigUint64Array(new ArrayBuffer(24), 8);
      let slicedView = arrayView.slice(0, 1);
      expect(fixedArrayView.name).assertEqual('BigUint64Array');
      expect(arrayView.name).assertEqual('BigUint64Array');
      expect(bufferView.name).assertEqual('BigUint64Array');
      expect(slicedView.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2700
     * @tc.name testBigUint64ArrayProperties027
     * @tc.desc Verify buffer views created from the same ArrayBuffer keep the same buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let fullView = new BigUint64Array(sourceBuffer);
      let offsetView = new BigUint64Array(sourceBuffer, 8);
      let explicitView = new BigUint64Array(sourceBuffer, 0, 2);
      expect(fullView.buffer).assertEqual(sourceBuffer);
      expect(offsetView.buffer).assertEqual(sourceBuffer);
      expect(explicitView.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2800
     * @tc.name testBigUint64ArrayProperties028
     * @tc.desc Verify non-buffer constructors allocate independent buffers for equal input values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let firstArray = new BigUint64Array([1n, 2n]);
      let secondArray = new BigUint64Array([1n, 2n]);
      let copiedArray = new BigUint64Array(firstArray);
      expect(firstArray.buffer !== secondArray.buffer).assertTrue();
      expect(copiedArray.buffer !== firstArray.buffer).assertTrue();
      expect(copiedArray.length).assertEqual(firstArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_2900
     * @tc.name testBigUint64ArrayProperties029
     * @tc.desc Verify source Array mutations after construction do not change typed-array properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [5n, 6n];
      let typedArray = new BigUint64Array(sourceValues);
      sourceValues[0] = 99n;
      expect(typedArray.length).assertEqual(2);
      expect(typedArray.byteLength).assertEqual(16);
      expect(typedArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3000
     * @tc.name testBigUint64ArrayProperties030
     * @tc.desc Verify empty FixedArray and Array sources produce identical empty properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fixedSource: FixedArray<BigInt> = [];
      let arraySource: Array<BigInt> = [];
      let fixedArrayView = new BigUint64Array(fixedSource);
      let arrayView = new BigUint64Array(arraySource);
      expect(fixedArrayView.length).assertEqual(0);
      expect(fixedArrayView.byteLength).assertEqual(0);
      expect(arrayView.length).assertEqual(0);
      expect(arrayView.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3100
     * @tc.name testBigUint64ArrayProperties031
     * @tc.desc Verify max uint64 source values keep compact length and byteLength properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64Value: BigInt = 18446744073709551615n;
      let sourceValues: FixedArray<BigInt> = [maxUint64Value, maxUint64Value];
      let typedArray = new BigUint64Array(sourceValues);
      expect(typedArray.length).assertEqual(2);
      expect(typedArray.byteLength).assertEqual(16);
      expect(typedArray[0]).assertEqual(maxUint64Value);
      expect(typedArray[1]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3200
     * @tc.name testBigUint64ArrayProperties032
     * @tc.desc Verify all-equal Array source derives properties from element count only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [7n, 7n, 7n, 7n];
      let typedArray = new BigUint64Array(sourceValues);
      expect(typedArray.length).assertEqual(4);
      expect(typedArray.byteLength).assertEqual(32);
      expect(typedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3300
     * @tc.name testBigUint64ArrayProperties033
     * @tc.desc Verify writes through one buffer view are visible through another view sharing the buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let writerView = new BigUint64Array(sourceBuffer, 0, 2);
      let readerView = new BigUint64Array(sourceBuffer, 8, 1);
      writerView[1] = 900n;
      expect(readerView.buffer).assertEqual(writerView.buffer);
      expect(readerView.byteOffset).assertEqual(8);
      expect(readerView[0]).assertEqual(900n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3400
     * @tc.name testBigUint64ArrayProperties034
     * @tc.desc Verify subarray without end covers remaining elements and derives byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let subView = sourceArray.subarray(3);
      expect(subView.length).assertEqual(2);
      expect(subView.byteLength).assertEqual(16);
      expect(subView.byteOffset).assertEqual(24);
      expect(subView[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3500
     * @tc.name testBigUint64ArrayProperties035
     * @tc.desc Verify slice without arguments copies all elements into a compact buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n);
      let copiedSlice = sourceArray.slice();
      expect(copiedSlice.length).assertEqual(sourceArray.length);
      expect(copiedSlice.byteLength).assertEqual(sourceArray.byteLength);
      expect(copiedSlice.byteOffset).assertEqual(0);
      expect(copiedSlice.buffer !== sourceArray.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3600
     * @tc.name testBigUint64ArrayProperties036
     * @tc.desc Verify BigUint64Array.of without values returns empty properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = BigUint64Array.of();
      expect(emptyArray.length).assertEqual(0);
      expect(emptyArray.byteLength).assertEqual(0);
      expect(emptyArray.byteOffset).assertEqual(0);
      expect(emptyArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3700
     * @tc.name testBigUint64ArrayProperties037
     * @tc.desc Verify BigUint64Array.from empty array returns empty properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [];
      let emptyArray = BigUint64Array.from(sourceValues);
      expect(emptyArray.length).assertEqual(0);
      expect(emptyArray.byteLength).assertEqual(0);
      expect(emptyArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3800
     * @tc.name testBigUint64ArrayProperties038
     * @tc.desc Verify large aligned ArrayBuffer derives length from total bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(80);
      let bufferView = new BigUint64Array(sourceBuffer);
      expect(bufferView.length).assertEqual(10);
      expect(bufferView.byteLength).assertEqual(80);
      expect(bufferView.byteLength).assertEqual(bufferView.length * bufferView.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_3900
     * @tc.name testBigUint64ArrayProperties039
     * @tc.desc Verify exact one-element buffer view is accepted and exposes expected properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(8);
      let bufferView = new BigUint64Array(sourceBuffer, 0, 1);
      expect(bufferView.length).assertEqual(1);
      expect(bufferView.byteLength).assertEqual(8);
      expect(bufferView.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4000
     * @tc.name testBigUint64ArrayProperties040
     * @tc.desc Verify nested subarray keeps buffer-relative byteOffset and derived byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(64);
      let baseView = new BigUint64Array(sourceBuffer, 8, 6);
      let middleView = baseView.subarray(1, 5);
      let nestedView = middleView.subarray(1, 3);
      let expectedOffset: int = 24;
      let expectedByteLength: int = 16;
      expect(nestedView.buffer).assertEqual(sourceBuffer);
      expect(nestedView.byteOffset).assertEqual(expectedOffset);
      expect(nestedView.length).assertEqual(2);
      expect(nestedView.byteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4100
     * @tc.name testBigUint64ArrayProperties041
     * @tc.desc Verify slice from a byteOffset view returns a compact independent buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(48);
      let sourceView = new BigUint64Array(sourceBuffer, 8, 4);
      sourceView[1] = 44n;
      sourceView[2] = 55n;
      let sliceBeginIndex: int = 1;
      let sliceEndIndex: int = 3;
      let copiedSlice = sourceView.slice(sliceBeginIndex, sliceEndIndex);
      sourceView[1] = 99n;
      let sliceUsesIndependentBuffer: boolean = copiedSlice.buffer !== sourceBuffer;
      expect(copiedSlice.length).assertEqual(2);
      expect(copiedSlice.byteLength).assertEqual(16);
      expect(copiedSlice.byteOffset).assertEqual(0);
      expect(sliceUsesIndependentBuffer).assertTrue();
      expect(copiedSlice[0]).assertEqual(44n);
      expect(copiedSlice[1]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4200
     * @tc.name testBigUint64ArrayProperties042
     * @tc.desc Verify binary int byteOffset creates an aligned view with derived properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let binaryByteOffset: int = 0b1000;
      let bufferView = new BigUint64Array(sourceBuffer, binaryByteOffset);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.length).assertEqual(3);
      expect(bufferView.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4300
     * @tc.name testBigUint64ArrayProperties043
     * @tc.desc Verify octal int byteOffset creates an aligned view with derived properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let octalByteOffset: int = 0o10;
      let bufferView = new BigUint64Array(sourceBuffer, octalByteOffset);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.length).assertEqual(3);
      expect(bufferView.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4400
     * @tc.name testBigUint64ArrayProperties044
     * @tc.desc Verify hexadecimal int byteOffset creates an aligned view with derived properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let hexadecimalByteOffset: int = 0x8;
      let bufferView = new BigUint64Array(sourceBuffer, hexadecimalByteOffset);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.length).assertEqual(3);
      expect(bufferView.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4500
     * @tc.name testBigUint64ArrayProperties045
     * @tc.desc Verify copy from nested subarray window resets byteOffset and keeps compact byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(64);
      let sourceView = new BigUint64Array(sourceBuffer, 8, 6);
      let middleView = sourceView.subarray(1, 5);
      let nestedWindow = middleView.subarray(1, 3);
      let copiedArray = new BigUint64Array(nestedWindow);
      let usesIndependentBuffer: boolean = copiedArray.buffer !== sourceBuffer;
      expect(copiedArray.byteOffset).assertEqual(0);
      expect(copiedArray.length).assertEqual(2);
      expect(copiedArray.byteLength).assertEqual(16);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4600
     * @tc.name testBigUint64ArrayProperties046
     * @tc.desc Verify empty slice from byteOffset view returns compact independent zero-length buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sourceBuffer, 8, 3);
      let sliceBeginIndex: int = 1;
      let sliceEndIndex: int = 1;
      let emptySlice = sourceView.slice(sliceBeginIndex, sliceEndIndex);
      let usesIndependentBuffer: boolean = emptySlice.buffer !== sourceBuffer;
      expect(emptySlice.byteOffset).assertEqual(0);
      expect(emptySlice.length).assertEqual(0);
      expect(emptySlice.byteLength).assertEqual(0);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4700
     * @tc.name testBigUint64ArrayProperties047
     * @tc.desc Verify zero-length subarray from byteOffset view preserves buffer-relative byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let sourceView = new BigUint64Array(sourceBuffer, 8, 4);
      let subarrayBeginIndex: int = 2;
      let subarrayEndIndex: int = 2;
      let zeroLengthView = sourceView.subarray(subarrayBeginIndex, subarrayEndIndex);
      let expectedByteOffset: int = 24;
      expect(zeroLengthView.buffer).assertEqual(sourceBuffer);
      expect(zeroLengthView.byteOffset).assertEqual(expectedByteOffset);
      expect(zeroLengthView.length).assertEqual(0);
      expect(zeroLengthView.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4800
     * @tc.name testBigUint64ArrayProperties048
     * @tc.desc Verify Set source with duplicate values derives properties after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let typedArray = new BigUint64Array(sourceSet);
      expect(typedArray.length).assertEqual(3);
      expect(typedArray.byteLength).assertEqual(24);
      expect(typedArray.byteOffset).assertEqual(0);
      expect(typedArray[0]).assertEqual(7n);
      expect(typedArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_4900
     * @tc.name testBigUint64ArrayProperties049
     * @tc.desc Verify advanced iterator source derives compact properties from the remaining window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let typedArray = new BigUint64Array(sourceIterator);
      expect(typedArray.length).assertEqual(3);
      expect(typedArray.byteLength).assertEqual(24);
      expect(typedArray.byteOffset).assertEqual(0);
      expect(typedArray[0]).assertEqual(10n);
      expect(typedArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_5000
     * @tc.name testBigUint64ArrayProperties050
     * @tc.desc Verify byte length constructor derives compact length and byteLength properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let elementCount: byte = 3;
      let sizedArray = new BigUint64Array(elementCount);
      expect(sizedArray.length).assertEqual(3);
      expect(sizedArray.byteLength).assertEqual(24);
      expect(sizedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_PROPERTIES_5100
     * @tc.name testBigUint64ArrayProperties051
     * @tc.desc Verify short byteOffset constructor derives the expected aligned view properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayProperties051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: short = 8;
      let viewLength: int = 2;
      let bufferView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      expect(bufferView.byteOffset).assertEqual(8);
      expect(bufferView.length).assertEqual(2);
      expect(bufferView.byteLength).assertEqual(16);
    });

  });
}
