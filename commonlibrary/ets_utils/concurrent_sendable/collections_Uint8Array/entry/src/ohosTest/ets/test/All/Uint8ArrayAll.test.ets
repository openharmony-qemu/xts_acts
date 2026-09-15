/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from './pages/Utils'
import { ItemInfo } from '@kit.MediaLibraryKit'
import { map } from '@kit.ConnectivityKit'
import { collections } from '@kit.ArkTS';


export default function Uint8ArrayAllTest() {
  describe('Uint8ArrayAllTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0001
     * @tc.desc   Verify Uint8Array handles maximum legal value (255) assignment and read
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const maxLegalVal: number = 255;
      uint8Arr[0] = maxLegalVal;
      expect(uint8Arr[0]).assertEqual(maxLegalVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0002
     * @tc.desc   Verify Uint8Array handles minimum legal value (0) assignment and read
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const minLegalVal: number = 0;
      uint8Arr[0] = minLegalVal;
      expect(uint8Arr[0]).assertEqual(minLegalVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0003
     * @tc.desc   Verify Uint8Array overflows correctly when value = max legal + 1 (256)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const overflowVal: number = 255 + 1;
      const expectedVal: number = 0;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0004
     * @tc.desc   Verify Uint8Array overflows correctly when value = min legal - 1 (-1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const underflowVal: number = 0 - 1;
      const expectedVal: number = 255;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0005
     * @tc.desc   Verify Uint8Array handles value = max legal + 2 (257) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const overflowVal: number = 255 + 2;
      const expectedVal: number = 1;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0006
     * @tc.desc   Verify Uint8Array handles value = min legal - 2 (-2) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const underflowVal: number = 0 - 2;
      const expectedVal: number = 254;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0007
     * @tc.desc   Verify Uint8Array handles value = 2×max legal + 1 (511) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const overflowVal: number = 2 * 255 + 1;
      const expectedVal: number = 255;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0008
     * @tc.desc   Verify Uint8Array handles value = -max legal (255) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const underflowVal: number = -255;
      const expectedVal: number = 1;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0009
     * @tc.desc   Verify Uint8Array constructor with length = 0 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      expect(uint8Arr.length).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(0);
      expect(uint8Arr.buffer.byteLength).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0010
     * @tc.desc   Verify Uint8Array constructor with length = 1 (minimum non-empty length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      expect(uint8Arr.length).assertEqual(1);
      expect(uint8Arr.byteLength).assertEqual(1);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0011
     * @tc.desc   Verify Uint8Array with ArrayBuffer (offset = 0, length = buffer.byteLength)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(8);
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(buf, 0, buf.byteLength);
      expect(uint8Arr.byteOffset).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(buf.byteLength);
      expect(uint8Arr.length).assertEqual(buf.byteLength);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0012
     * @tc.desc   Verify Uint8Array with ArrayBuffer (offset = buffer.byteLength - 1, length = 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const maxOffset: number = buf.byteLength - 1;
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(buf, maxOffset, 1);
      expect(uint8Arr.byteOffset).assertEqual(maxOffset);
      expect(uint8Arr.byteLength).assertEqual(1);
      expect(uint8Arr.length).assertEqual(1);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0013
     * @tc.desc   Verify Uint8Array throws RangeError when offset = buffer.byteLength (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const invalidOffset: number = buf.byteLength;
      let isRangeError: boolean = false;

      try {
        new collections.Uint8Array(buf, invalidOffset, 1);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0014
     * @tc.desc   Verify Uint8Array throws RangeError when offset + length = buffer.byteLength + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const offset: number = 3;
      const length: number = 3;
      let isRangeError: boolean = false;
      try {
        new collections.Uint8Array(buf, offset, length);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0015
     * @tc.desc   Verify Uint8Array set method with start index = 0 (full view coverage)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(4);
      const source: number[] = [10, 20, 30, 40];
      uint8Arr.set(source, 0);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(20);
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0016
     * @tc.desc   Verify Uint8Array set method with start index = length - source.length (exact fit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(5);
      const source: number[] = [30, 40, 50];
      const startIdx: number = uint8Arr.length - source.length;
      uint8Arr.set(source, startIdx);
      expect(uint8Arr.length).assertEqual(5);
      expect(uint8Arr.toString()).assertEqual('0,0,30,40,50');
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
      expect(uint8Arr[4]).assertEqual(50);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0017
     * @tc.desc   Verify Uint8Array set method throws RangeError when start index + source.length = length + 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(5);
      const source: number[] = [30, 40, 50];
      const startIdx: number = 3;
      let isRangeError: boolean = false;

      try {
        uint8Arr.set(source, startIdx);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0018
     * @tc.desc   Verify Uint8Array subarray with start = 0, end = length (full view copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([1, 2, 3, 4]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(0, uint8Arr.length);
      expect(subArr.length).assertEqual(uint8Arr.length);
      expect(subArr[0]).assertEqual(1);
      expect(subArr[1]).assertEqual(2);
      expect(subArr[2]).assertEqual(3);
      expect(subArr[3]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0019
     * @tc.desc   Verify Uint8Array subarray with start = length - 1, end = length (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(uint8Arr.length - 1, uint8Arr.length);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0020
     * @tc.desc   Verify Uint8Array subarray with start = length, end = length + 1 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([1, 2, 3]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(uint8Arr.length, uint8Arr.length + 1);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0021
     * @tc.desc   Verify Uint8Array subarray with start = -length, end = 0 (full view from negative start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5, 10, 15]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(-uint8Arr.length, 0);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0022
     * @tc.desc   Verify Uint8Array subarray with start = -1, end = length (last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([20, 30, 40]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(-1, uint8Arr.length);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0023
     * @tc.desc   Verify DataView reads Uint8Array buffer at offset = 0 (buffer start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      uint8Arr[0] = 0;
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0024
     * @tc.desc   Verify DataView reads Uint8Array buffer at offset = buffer.byteLength - 1 (buffer end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      uint8Arr[3] = 255;
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(3)).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0025
     * @tc.desc   Verify DataView writes Uint8Array buffer at offset = 0 (buffer start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setUint8(0, 0);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0026
     * @tc.desc   Verify DataView writes Uint8Array buffer at offset = buffer.byteLength - 1 (buffer end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const dv: DataView = new DataView(buf);
      dv.setUint8(3, 255);
      expect(uint8Arr[3]).assertEqual(255);
      expect(uint8Arr.length).assertEqual(4);
      expect(uint8Arr.toString()).assertEqual('0,0,0,255')
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0027
     * @tc.desc   Verify Uint8Array forEach iterates empty array (no callback execution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      let callbackCount: number = 0;
      uint8Arr.forEach(() => callbackCount++);
      expect(callbackCount).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0028
     * @tc.desc   Verify Uint8Array forEach iterates single-element array (one callback execution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5]);
      let callbackCount: number = 0;
      uint8Arr.forEach(() => callbackCount++);
      expect(callbackCount).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0029
     * @tc.desc   Verify Uint8Array map returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const mappedArr: collections.Uint8Array = uint8Arr.map(val => val * 2);
      expect(mappedArr.length).assertEqual(0);
      expect(mappedArr instanceof collections.Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0030
     * @tc.desc   Verify Uint8Array map returns single-element array for single-element input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10]);
      const mappedArr: collections.Uint8Array = uint8Arr.map(val => val * 2);
      expect(mappedArr.length).assertEqual(1);
      expect(mappedArr[0]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0031
     * @tc.desc   Verify Uint8Array filter returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const filteredArr: collections.Uint8Array = uint8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(0);
      expect(filteredArr instanceof collections.Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0032
     * @tc.desc   Verify Uint8Array filter returns empty array when no elements match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([0, 0, 0]);
      const filteredArr: collections.Uint8Array = uint8Arr.filter(val => val > 0);
      expect(filteredArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0033
     * @tc.desc   Verify Uint8Array find returns undefined for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const foundVal: number | undefined = uint8Arr.find(val => val > 0);
      expect(foundVal).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0034
     * @tc.desc   Verify Uint8Array find returns the only element when it matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([255]);
      const foundVal: number | undefined = uint8Arr.find(val => val === 255);
      expect(foundVal).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0035
     * @tc.desc   Verify Uint8Array findIndex returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const foundIdx: number = uint8Arr.findIndex(val => val > 0);
      expect(foundIdx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0036
     * @tc.desc   Verify Uint8Array findIndex returns 0 for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([0]);
      const foundIdx: number = uint8Arr.findIndex(val => val === 0);
      expect(foundIdx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0037
     * @tc.desc   Verify Uint8Array every returns true for empty array (vacuous truth)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const result: boolean = uint8Arr.every(val => val < 256);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0038
     * @tc.desc   Verify Uint8Array every returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5]);
      const result: boolean = uint8Arr.every(val => val === 5);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0039
     * @tc.desc   Verify Uint8Array some returns false for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const result: boolean = uint8Arr.some(val => val > 255);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0040
     * @tc.desc   Verify Uint8Array some returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([255]);
      const result: boolean = uint8Arr.some(val => val === 255);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0041
     * @tc.desc   Verify Uint8Array reduce throws error for empty array without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      let isTypeError: boolean = false;

      try {
        uint8Arr.reduce((acc, val) => acc + val);
      } catch (e) {
        isTypeError = (e as Error).name === 'TypeError';
      }
      expect(isTypeError).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0042
     * @tc.desc   Verify Uint8Array reduce uses initial value for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const initialVal: number = 10;
      const total: number = uint8Arr.reduce((acc, val) => acc + val, initialVal);
      expect(total).assertEqual(initialVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0043
     * @tc.desc   Verify Uint8Array reduce uses single element as initial value (no initial value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5]);
      const total: number = uint8Arr.reduce((acc, val) => acc + val);
      expect(total).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0044
     * @tc.desc   Verify Uint8Array includes returns false for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const result: boolean = uint8Arr.includes(0);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0045
     * @tc.desc   Verify Uint8Array includes returns true for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([255]);
      const result: boolean = uint8Arr.includes(255);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0046
     * @tc.desc   Verify Uint8Array indexOf returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const idx: number = uint8Arr.indexOf(0);
      expect(idx).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0047
     * @tc.desc   Verify Uint8Array indexOf returns 0 for single-element matching array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([0]);
      const idx: number = uint8Arr.indexOf(0);
      expect(idx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0048
     * @tc.desc   Verify Uint8Array slice returns empty array for empty input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(0, 1);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0049
     * @tc.desc   Verify Uint8Array slice returns same array for start=0, end=length (single-element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5]);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(0, 1);
      expect(slicedArr.length).assertEqual(1);
      expect(slicedArr[0]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0050
     * @tc.desc   Verify Uint8Array fill has no effect on empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      uint8Arr.fill(10);
      expect(uint8Arr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0051
     * @tc.desc   Verify Uint8Array handles value = 3×max legal (765) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const overflowVal: number = 3 * 255;
      const expectedVal: number = 765 % 256;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0052
     * @tc.desc   Verify Uint8Array handles value = -2×max legal (-510) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const underflowVal: number = -2 * 255;
      const expectedVal: number = (-510 % 256 + 256) % 256;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0053
     * @tc.desc   Verify Uint8Array constructor with non-integer length (truncated to 5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nonIntLength: number = 5.9;
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(nonIntLength);
      expect(uint8Arr.length).assertEqual(5);
      expect(uint8Arr.byteLength).assertEqual(5);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0054
     * @tc.desc   Verify Uint8Array constructor with non-integer length (truncated to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nonIntLength: number = 0.9;
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(nonIntLength);
      expect(uint8Arr.length).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0055
     * @tc.desc   Verify Uint8Array with ArrayBuffer (offset=1, length=buffer.byteLength-2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(6);
      const offset: number = 1;
      const length: number = buf.byteLength - 2;
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(buf, offset, length);
      expect(uint8Arr.byteOffset).assertEqual(offset);
      expect(uint8Arr.byteLength).assertEqual(length);
      expect(uint8Arr.length).assertEqual(length);
      expect(uint8Arr.toString()).assertEqual('0,0,0,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0056
     * @tc.desc   Verify Uint8Array set method with Int8Array (negative values converted)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Source: Int8Array = new Int8Array([-1, -2, 127]);
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(3);
      uint8Arr.set(int8Source);
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(254);
      expect(uint8Arr[2]).assertEqual(127);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0057
     * @tc.desc   Verify Uint8Array set method with Float32Array (truncated and converted)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatSource: Float32Array = new Float32Array([255.9, -1.1, 100.5]);
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(3);
      uint8Arr.set(floatSource);
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(255);
      expect(uint8Arr[2]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0058
     * @tc.desc   Verify Uint8Array subarray with start=-2, end=-1 (second-last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(-2, -1);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0059
     * @tc.desc   Verify Uint8Array subarray with start=-3, end=2 (first two elements of last three)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5, 15, 25, 35, 45]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(-3, 4);
      expect(subArr.length).assertEqual(2);
      expect(subArr[0]).assertEqual(25);
      expect(subArr[1]).assertEqual(35);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0060
     * @tc.desc   Verify DataView reads Uint8Array buffer with non-zero offset (offset=2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 1, 3);
      uint8Arr.set([60, 70, 80]);
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(2)).assertEqual(70);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0061
     * @tc.desc   Verify DataView writes Uint8Array buffer with non-zero offset (offset=1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const uint8Arr: Uint8Array = new Uint8Array(buf, 1, 3);
      const dv: DataView = new DataView(buf);
      dv.setUint8(2, 90);
      expect(uint8Arr[1]).assertEqual(90);
      expect(uint8Arr.length).assertEqual(3);
      expect(uint8Arr.toString()).assertEqual('0,90,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0062
     * @tc.desc   Verify Uint8Array forEach iterates all elements (sum check)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ArrayBound0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,()=> {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      let sum: number = 0;
      uint8Arr.forEach(val => sum += val);
      expect(sum).assertEqual(60);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0063
     * @tc.desc   Verify Uint8Array forEach passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([5, 10]);
      let collectedIndices: number[] = [];
      let collectedArrays: collections.Uint8Array[] = [];
      uint8Arr.forEach((_, idx, arr) => {
        collectedIndices.push(idx);
        collectedArrays.push(arr);
      });
      expect(collectedIndices[0]).assertEqual(0);
      expect(collectedIndices[1]).assertEqual(1);
      expect(collectedArrays[0]).assertEqual(uint8Arr);
      expect(collectedArrays[1]).assertEqual(uint8Arr);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0064
     * @tc.desc   Verify Uint8Array map converts values to max legal (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([100, 200]);
      const mappedArr: collections.Uint8Array = uint8Arr.map(val => val + 100);
      expect(mappedArr[0]).assertEqual(200);
      expect(mappedArr[1]).assertEqual(44);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0065
     * @tc.desc   Verify Uint8Array filter retains elements equal to max legal (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([255, 100, 255, 50]);
      const filteredArr: collections.Uint8Array = uint8Arr.filter(val => val === 255);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(255);
      expect(filteredArr[1]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0066
     * @tc.desc   Verify Uint8Array find returns first element greater than max/2 (127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([100, 150, 200]);
      const foundVal: number | undefined = uint8Arr.find(val => val > 127);
      expect(foundVal).assertEqual(150);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0067
     * @tc.desc   Verify Uint8Array findIndex returns index of first element less than min+5 (5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 3, 8, 2]);
      const foundIdx: number = uint8Arr.findIndex(val => val < 5);
      expect(foundIdx).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0068
     * @tc.desc   Verify Uint8Array every returns false when one element exceeds max/2 (127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([100, 150, 80]);
      const result: boolean = uint8Arr.every(val => val <= 127);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0069
     * @tc.desc   Verify Uint8Array some returns true when one element equals min (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([50, 0, 200]);
      const result: boolean = uint8Arr.some(val => val === 0);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0070
     * @tc.desc   Verify Uint8Array reduce calculates product (with overflow handling)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([2, 150]);
      const initialVal: number = 1;
      const product: number = uint8Arr.reduce((acc, val) => acc * val, initialVal);
      expect(product).assertEqual(300);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0071
     * @tc.desc   Verify Uint8Array includes returns true for value = max legal - 1 (254)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([254, 100, 200]);
      const result: boolean = uint8Arr.includes(254);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0072
     * @tc.desc   Verify Uint8Array includes returns false for value = max legal + 1 (256)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([0, 127, 255]);
      const result: boolean = uint8Arr.includes(256);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0073
     * @tc.desc   Verify Uint8Array indexOf returns last occurrence with start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([50, 30, 50, 70, 50]);
      const startIdx: number = 2;
      const idx: number = uint8Arr.indexOf(50, startIdx);
      expect(idx).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0074
     * @tc.desc   Verify Uint8Array lastIndexOf returns first occurrence from end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([50, 30, 50, 70, 50]);
      const idx: number = uint8Arr.lastIndexOf(50);
      expect(idx).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0075
     * @tc.desc   Verify Uint8Array lastIndexOf returns -1 with start index < first occurrence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([50, 30, 50, 70, 50]);
      const startIdx: number = 1;
      const idx: number = uint8Arr.lastIndexOf(50, startIdx);
      expect(idx).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0076
     * @tc.desc   Verify Uint8Array slice with start=length-2, end=length (last two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(uint8Arr.length - 2, uint8Arr.length);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(30);
      expect(slicedArr[1]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0077
     * @tc.desc   Verify Uint8Array slice with start=-length, end=-length+2 (first two elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(-uint8Arr.length, -uint8Arr.length + 2);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(10);
      expect(slicedArr[1]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0078
     * @tc.desc   Verify Uint8Array copyWithin with target=1, start=3, end=5 (partial copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([1, 2, 3, 4, 5]);
      uint8Arr.copyWithin(1, 3, 5);
      expect(uint8Arr[0]).assertEqual(1);
      expect(uint8Arr[1]).assertEqual(4);
      expect(uint8Arr[2]).assertEqual(5);
      expect(uint8Arr[3]).assertEqual(4);
      expect(uint8Arr[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0079
     * @tc.desc   Verify Uint8Array copyWithin with target=0, start=1, end=3 (overlapping copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      uint8Arr.copyWithin(0, 1, 3);
      expect(uint8Arr[0]).assertEqual(20);
      expect(uint8Arr[1]).assertEqual(30);
      expect(uint8Arr[2]).assertEqual(30);
      expect(uint8Arr[3]).assertEqual(40);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0080
     * @tc.desc   Verify Uint8Array fill with value=255, start=1, end=3 (partial fill)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([0, 0, 0, 0]);
      const fillVal: number = 255;
      uint8Arr.fill(fillVal, 1, 3);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
      expect(uint8Arr[0]).assertEqual(0);
      expect(uint8Arr[3]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0081
     * @tc.desc   Verify Uint8Array fill with value=0, start=-3, end=-1 (negative range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([255, 255, 255, 255]);
      const fillVal: number = 0;
      uint8Arr.fill(fillVal, -3, -1);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
      expect(uint8Arr[3]).assertEqual(255);
      expect(uint8Arr[0]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0082
     * @tc.desc   Verify Uint8Array converts from plain array with overflow values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] = [300, -5, 255];
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(plainArr);
      expect(uint8Arr[0]).assertEqual(44);
      expect(uint8Arr[1]).assertEqual(251);
      expect(uint8Arr[2]).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0083
     * @tc.desc   Verify Uint8Array converts to plain array via Array.from (with mapper)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const plainArr: collections.Uint8Array = collections.Uint8Array.from(uint8Arr, val => val * 2);
      expect(plainArr[0]).assertEqual(20);
      expect(plainArr[1]).assertEqual(40);
      expect(plainArr[2]).assertEqual(60);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0084
     * @tc.desc   Verify Uint8Array converts to plain array via spread syntax (overflow in mapper)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([200, 100]);
      const plainArr: number[] = [...uint8Arr].map(val => val + 100);
      expect(plainArr[0]).assertEqual(300);
      expect(plainArr[1]).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0085
     * @tc.desc   Verify Uint8Array set method with start index = length - 1 (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(4);
      const source: number[] = [255];
      const startIdx: number = uint8Arr.length - 1;
      uint8Arr.set(source, startIdx);
      expect(uint8Arr[3]).assertEqual(255);
      expect(uint8Arr[2]).assertEqual(0);
      expect(uint8Arr[1]).assertEqual(0);
      expect(uint8Arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0086
     * @tc.desc   Verify Uint8Array subarray with start=0, end=-1 (all except last element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(0, -1);
      expect(subArr.length).assertEqual(3);
      expect(subArr[2]).assertEqual(30);
      expect(subArr[1]).assertEqual(20);
      expect(subArr[0]).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0087
     * @tc.desc   Verify Uint8Array subarray with start=2, end=-2 (empty view)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(2, -2);
      expect(subArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0088
     * @tc.desc   Verify Uint8Array fill with start index > end index (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.fill(255, 3, 1);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0089
     * @tc.desc   Verify Uint8Array copyWithin with start > end (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.copyWithin(0, 3, 1);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0090
     * @tc.desc   Verify Uint8Array copyWithin with target >= length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.copyWithin(3, 0, 2);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0091
     * @tc.desc   Verify Uint8Array copyWithin with start >= length (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      uint8Arr.copyWithin(0, 3, 5);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0092
     * @tc.desc   Verify Uint8Array fill with end index > length (fills to end)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const fillVal: number = 255;
      uint8Arr.fill(fillVal, 1, 10);
      expect(uint8Arr[0]).assertEqual(10);
      expect(uint8Arr[1]).assertEqual(fillVal);
      expect(uint8Arr[2]).assertEqual(fillVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0093
     * @tc.desc   Verify Uint8Array slice with end index > length (truncates to length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(1, 10);
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(20);
      expect(slicedArr[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0094
     * @tc.desc   Verify Uint8Array slice with start index > length (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(5, 10);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0095
     * @tc.desc   Verify Uint8Array slice with start index = end index (empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const slicedArr: collections.Uint8Array = uint8Arr.slice(2, 2);
      expect(slicedArr.length).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0096
     * @tc.desc   Verify Uint8Array set method with empty source array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      const emptySource: number[] = [];
      uint8Arr.set(emptySource);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0097
     * @tc.desc   Verify Uint8Array set method with source array length 0 (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30]);
      const originalVals: number[] = [...uint8Arr];
      const emptySource: collections.Uint8Array = new collections.Uint8Array(0);
      uint8Arr.set(emptySource, 1);
      expect(uint8Arr[0]).assertEqual(originalVals[0]);
      expect(uint8Arr[1]).assertEqual(originalVals[1]);
      expect(uint8Arr[2]).assertEqual(originalVals[2]);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0098
     * @tc.desc   Verify Uint8Array forEach with empty array (callback not called)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      let isCalled: boolean = false;
      uint8Arr.forEach(() => isCalled = true);
      expect(isCalled).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0099
     * @tc.desc   Verify Uint8Array map with empty array (returns empty Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const mappedArr: collections.Uint8Array = uint8Arr.map(val => val + 10);
      expect(mappedArr.length).assertEqual(0);
      expect(mappedArr instanceof collections.Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0100
     * @tc.desc   Verify Uint8Array filter with empty array (returns empty Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(0);
      const filteredArr: collections.Uint8Array = uint8Arr.filter(val => val > 100);
      expect(filteredArr.length).assertEqual(0);
      expect(filteredArr instanceof collections.Uint8Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0101
     * @tc.desc   Verify Uint8Array handles value = 256×2 + 100 (612) overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const overflowVal: number = 256 * 2 + 100;
      const expectedVal: number = 612 % 256;
      uint8Arr[0] = overflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0102
     * @tc.desc   Verify Uint8Array handles value = - (256 + 50) (-306) underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(1);
      const underflowVal: number = -(256 + 50);
      const expectedVal: number = (-306 % 256 + 256) % 256;
      uint8Arr[0] = underflowVal;
      expect(uint8Arr[0]).assertEqual(expectedVal);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0103
     * @tc.desc   Verify Uint8Array constructor with ArrayBuffer (offset=0, length=0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(buf, 0, 0);
      expect(uint8Arr.length).assertEqual(0);
      expect(uint8Arr.byteLength).assertEqual(0);
      expect(uint8Arr.buffer).assertEqual(buf);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0104
     * @tc.desc   Verify Uint8Array constructor with ArrayBuffer (offset=buf.length-2, length=2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(6);
      const offset: number = buf.byteLength - 2;
      const length: number = 2;
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(buf, offset, length);
      expect(uint8Arr.byteOffset).assertEqual(offset);
      expect(uint8Arr.length).assertEqual(length);
      expect(uint8Arr.byteLength).assertEqual(length);
      expect(uint8Arr.toString()).assertEqual('0,0')
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0105
     * @tc.desc   Verify Uint8Array set method with Uint16Array (values exceed 255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Source: Uint16Array = new Uint16Array([300, 510]);
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(2);
      uint8Arr.set(uint16Source);
      expect(uint8Arr[0]).assertEqual(44);
      expect(uint8Arr[1]).assertEqual(254);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0106
     * @tc.desc   Verify Uint8Array set method with Int32Array (negative values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int32Source: Int32Array = new Int32Array([-10, -200]);
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array(2);
      uint8Arr.set(int32Source);
      expect(uint8Arr[0]).assertEqual(246);
      expect(uint8Arr[1]).assertEqual(56);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0107
     * @tc.desc   Verify Uint8Array subarray with start=-4, end=-2 (middle two elements of 5-length array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40, 50]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(-4, -2);
      expect(subArr.length).assertEqual(2);
      expect(subArr[0]).assertEqual(20);
      expect(subArr[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0108
     * @tc.desc   Verify Uint8Array subarray with start=1, end=-3 (single element of 5-length array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20, 30, 40, 50]);
      const subArr: collections.Uint8Array = uint8Arr.subarray(1, -3);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(20);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0109
     * @tc.desc   Verify DataView reads Uint8Array buffer with offset=buf.length-1 (last byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(7);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const targetOffset: number = buf.byteLength - 1;
      uint8Arr[targetOffset] = 255;
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(targetOffset)).assertEqual(255);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0110
     * @tc.desc   Verify DataView writes Uint8Array buffer with offset=buf.length-2 (second-last byte)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(7);
      const uint8Arr: Uint8Array = new Uint8Array(buf);
      const targetOffset: number = buf.byteLength - 2;
      const dv: DataView = new DataView(buf);
      dv.setUint8(targetOffset, 127);
      expect(uint8Arr[targetOffset]).assertEqual(127);
      expect(uint8Arr.length).assertEqual(7)
      expect(uint8Arr.toString()).assertEqual('0,0,0,0,0,127,0');
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0111
     * @tc.desc   Verify Uint8Array forEach modifies external variable (count elements > 127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([100, 150, 200, 50]);
      let count: number = 0;
      uint8Arr.forEach(val => val > 127 && count++);
      expect(count).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0112
     * @tc.desc   Verify Uint8Array forEach with thisArg (binds context)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([10, 20]);

      interface GeneratedObjectLiteralInterface_1 {
        sum: number;
      }

      const context: GeneratedObjectLiteralInterface_1 = { sum: 0 };
      uint8Arr.forEach((val: number) => {
        context.sum += val;
      });
      expect(context.sum).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0113
     * @tc.desc   Verify Uint8Array map with values exceeding 255 (overflow in mapping)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([200, 100]);
      const mappedArr: collections.Uint8Array = uint8Arr.map(val => val + 100);
      expect(mappedArr[0]).assertEqual(44);
      expect(mappedArr[1]).assertEqual(200);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0114
     * @tc.desc   Verify Uint8Array map with negative mapped values (converted to Uint8)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([50, 100]);
      const mappedArr: collections.Uint8Array = uint8Arr.map(val => val - 150);
      expect(mappedArr[0]).assertEqual(156);
      expect(mappedArr[1]).assertEqual(206);
    })

    /**
     * @tc.name   TypeArrayUint8ArrayBound0115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_ALL_0115
     * @tc.desc   Verify Uint8Array filter retains elements between 100 and 200
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ArrayBound0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint8Arr: collections.Uint8Array = new collections.Uint8Array([50, 150, 250, 180, 80]);
      const filteredArr: collections.Uint8Array = uint8Arr.filter(val => val >= 100 && val <= 200);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(150);
      expect(filteredArr[1]).assertEqual(180);
