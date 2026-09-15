/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from './pages/Utils'
import { collections } from '@kit.ArkTS';


interface GeneratedObjectLiteralInterface_1 {
  version: number;
  recordCount: number;
  flags: number;
}

interface GeneratedObjectLiteralInterface_2 {
  id: number;
  values: collections.Uint16Array;
}

export default function Uint16ArrayAllTest() {
  describe('Uint16ArrayAllTest', () => {
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
     * @tc.name   TypeArrayUint16Array0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0001
     * @tc.desc   Construct Uint16Array from length and verify basic properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint16Array(3);
      expect(arr.length).assertEqual(3);
      expect(collections.Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.byteLength).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0002
     * @tc.desc   Construct Uint16Array from regular array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint16Array([100, 200, 300]);
      expect(arr.toString()).assertEqual('100,200,300');
      expect(arr[1]).assertEqual(200);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0003
     * @tc.desc   Construct Uint16Array from ArrayBuffer with offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(8);
      const arr = new collections.Uint16Array(buffer, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint16Array0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0004
     * @tc.desc   Verify storage of Uint16Array maximum value (65535)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(1);
      arr[0] = 65535;
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0005
     * @tc.desc   Verify truncation handling for values exceeding 65535
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(1);
      arr[0] = 65536;
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0006
     * @tc.desc   Verify unsigned conversion handling for negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(1);
      arr[0] = -1;
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint16Array0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0007
     * @tc.desc   Verify modification synchronization for views sharing same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(4);
      const arr1 = new collections.Uint16Array(buffer);
      const arr2 = new collections.Uint16Array(buffer);

      arr1[0] = 1234;
      expect(arr2[0]).assertEqual(1234);
      expect(arr2[1]).assertEqual(0);
      expect(arr2.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0008
     * @tc.desc   Create Int32Array view from Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new collections.Uint16Array([0x1234, 0x5678]);
      const int32View = new collections.Int32Array(uint16Arr.buffer);

      expect(int32View.length).assertEqual(1);
      expect(int32View[0]).assertEqual(0x56781234);
    })

    /**
     * @tc.name   TypeArrayUint16Array0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0009
     * @tc.desc   Copy data from regular array using set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(5);
      arr.set([10, 20, 30]);
      expect(arr.toString()).assertEqual('10,20,30,0,0');
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint16Array0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0010
     * @tc.desc   Copy data with offset using set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(6);
      arr.fill(1);
      arr.set([5, 6, 7], 2);
      expect(arr.toString()).assertEqual('1,1,5,6,7,1');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(6);
      expect(arr[4]).assertEqual(7);
      expect(arr[5]).assertEqual(1);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayUint16Array0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0011
     * @tc.desc   Handle out-of-range values with set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(3);
      arr.set([70000, -50, 32768]);
      expect(arr.toString()).assertEqual('4464,65486,32768');
      expect(arr[0]).assertEqual(4464);
      expect(arr[1]).assertEqual(65486);
      expect(arr[2]).assertEqual(32768);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0012
     * @tc.desc   Create subarray sharing buffer with subarray method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([1, 2, 3, 4, 5]);
      const subArr = arr.subarray(1, 4);
      expect(subArr.toString()).assertEqual('2,3,4');
      expect(subArr.buffer).assertEqual(arr.buffer);
      expect(subArr.length).assertEqual(3);
      expect(subArr[0]).assertEqual(2);
      expect(subArr[1]).assertEqual(3);
      expect(subArr[2]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0013
     * @tc.desc   Create non-shared copy with slice method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([10, 20, 30]);
      const slicedArr = arr.slice(1);
      expect(slicedArr.toString()).assertEqual('20,30');
      expect(slicedArr.buffer === arr.buffer).assertFalse();
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(20);
      expect(slicedArr[1]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayUint16Array0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0014
     * @tc.desc   Fill array with valid single value using fill method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(4);
      arr.fill(12345);
      expect(arr.every(v => v === 12345)).assertEqual(true);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(12345);
      expect(arr[1]).assertEqual(12345);
      expect(arr[2]).assertEqual(12345);
      expect(arr[3]).assertEqual(12345);
    })

    /**
     * @tc.name   TypeArrayUint16Array0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0015
     * @tc.desc   Fill array with out-of-range value using fill method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(3);
      arr.fill(80000);
      expect(arr.every(v => v === 14464)).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(14464);
      expect(arr[1]).assertEqual(14464);
      expect(arr[2]).assertEqual(14464);
    })

    /**
     * @tc.name   TypeArrayUint16Array0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0016
     * @tc.desc   Transform elements with map method (within range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([100, 200, 300]);
      const mappedArr = arr.map(v => v * 2);
      expect(mappedArr.toString()).assertEqual('200,400,600');
      expect(mappedArr.length).assertEqual(3);
      expect(mappedArr[0]).assertEqual(200);
      expect(mappedArr[1]).assertEqual(400);
      expect(mappedArr[2]).assertEqual(600);
    })

    /**
     * @tc.name   TypeArrayUint16Array0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0017
     * @tc.desc   Transform elements with map method (out-of-range truncation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([30000, 40000, 50000]);
      const mappedArr = arr.map(v => v * 2);
      expect(mappedArr.toString()).assertEqual('60000,14464,34464');
      expect(mappedArr.length).assertEqual(3);
      expect(mappedArr[0]).assertEqual(60000);
      expect(mappedArr[1]).assertEqual(14464);
      expect(mappedArr[2]).assertEqual(34464);
    })

    /**
     * @tc.name   TypeArrayUint16Array0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0018
     * @tc.desc   Filter elements greater than specified value with filter method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([1000, 5000, 10000, 20000, 5000]);
      const filteredArr = arr.filter(v => v > 5000);
      expect(filteredArr.toString()).assertEqual('10000,20000');
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(10000);
      expect(filteredArr[1]).assertEqual(20000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0019
     * @tc.desc   Calculate sum of elements with reduce method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([100, 200, 300, 400]);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(1000);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(arr[3]).assertEqual(400);
    })

    /**
     * @tc.name   TypeArrayUint16Array0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0020
     * @tc.desc   Verify if all elements are less than specified value with every method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([5000, 10000, 15000]);
      const allBelow20000 = arr.every(v => v < 20000);
      const allBelow10000 = arr.every(v => v < 10000);
      expect(allBelow20000).assertEqual(true);
      expect(allBelow10000).assertEqual(false);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5000);
      expect(arr[1]).assertEqual(10000);
      expect(arr[2]).assertEqual(15000);
    })
    /**
     * @tc.name   TypeArrayUint16Array0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0021
     * @tc.desc   Check existence of element with some method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([15000, 30000, 45000]);
      const hasOver35000 = arr.some(v => v > 35000);
      const hasBelow10000 = arr.some(v => v < 10000);
      expect(hasOver35000).assertEqual(true);
      expect(hasBelow10000).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint16Array0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0022
     * @tc.desc   Find element with find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([8000, 16000, 24000, 16000, 32000]);
      const found = arr.find(v => v === 16000);
      const notFound = arr.find(v => v === 40000);
      expect(found).assertEqual(16000);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayUint16Array0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0023
     * @tc.desc   Find element index with findIndex method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([8000, 16000, 24000, 16000, 32000]);
      const index = arr.findIndex(v => v === 16000);
      const notFoundIndex = arr.findIndex(v => v === 40000);
      expect(index).assertEqual(1);
      expect(notFoundIndex).assertEqual(-1);

    })

    /**
     * @tc.name   TypeArrayUint16Array0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0024
     * @tc.desc   Check element existence with includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([5000, 10000, 65535, 30000]);
      expect(arr.includes(10000)).assertEqual(true);
      expect(arr.includes(65536)).assertEqual(false);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0025
     * @tc.desc   Find first occurrence index with indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([3000, 6000, 9000, 6000, 12000]);
      expect(arr.indexOf(6000)).assertEqual(1);
      expect(arr.indexOf(15000)).assertEqual(-1);
      expect(arr.length).assertEqual(5);


    })

    /**
     * @tc.name   TypeArrayUint16Array0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0026
     * @tc.desc   Find last occurrence index with lastIndexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([3000, 6000, 9000, 6000, 12000]);
      expect(arr.lastIndexOf(6000)).assertEqual(3);
      expect(arr.lastIndexOf(15000)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayUint16Array0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0027
     * @tc.desc   Concatenate elements to string with join method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([1234, 5678, 9012]);
      expect(arr.join('-')).assertEqual('1234-5678-9012');
      expect(arr.join('|')).assertEqual('1234|5678|9012');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0028
     * @tc.desc   Use values iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([2000, 4000, 6000]);
      const values = collections.Uint16Array.from(arr.values());
      expect(values.toString()).assertEqual('2000,4000,6000');
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(2000);
      expect(values[1]).assertEqual(4000);
      expect(values[2]).assertEqual(6000);
    })

    /**
     * @tc.name   TypeArrayUint16Array0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0029
     * @tc.desc   Use keys iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([500, 1000, 1500]);
      const keys = collections.Uint16Array.from(arr.keys());
      expect(keys.toString()).assertEqual('0,1,2');
      expect(keys.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0030
     * @tc.desc   Use entries iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([1111, 2222, 3333]);
      const entries = Array.from(arr.entries());
      expect(entries[0].toString()).assertEqual('0,1111');
      expect(entries[1].toString()).assertEqual('1,2222');
      expect(entries[2].toString()).assertEqual('2,3333');
      expect(entries.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0031
     * @tc.desc   Convert to regular array with Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new collections.Uint16Array([7000, 14000, 21000]);
      const regArr = collections.Uint16Array.from(uint16Arr);
      expect(Array.isArray(regArr)).assertEqual(false);
      expect(regArr.toString()).assertEqual('7000,14000,21000');
      expect(regArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0032
     * @tc.desc   Convert to regular array with spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new collections.Uint16Array([8000, 16000, 24000]);
      const regArr = [...uint16Arr];
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.toString()).assertEqual('8000,16000,24000');
      expect(regArr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0033
     * @tc.desc   Convert to Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new collections.Uint16Array([32000, 64000, 65535]);
      const uint32Arr = new Uint32Array(uint16Arr);
      expect(uint32Arr instanceof Uint32Array).assertEqual(true);
      expect(uint32Arr.toString()).assertEqual('32000,64000,65535');
      expect(uint32Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0034
     * @tc.desc   Convert to Int16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new collections.Uint16Array([32767, 32768, 65535]);
      const int16Arr = new Int16Array(uint16Arr);
      expect(int16Arr instanceof Int16Array).assertEqual(true);
      expect(int16Arr.toString()).assertEqual('32767,-32768,-1');
      expect(int16Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0035
     * @tc.desc   Convert to string with toString method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([10000, 20000, 30000]);
      expect(arr.toString()).assertEqual('10000,20000,30000');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0036
     * @tc.desc   Convert to string with toLocaleString method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([12345, 6789, 54321]);
      expect(arr.toLocaleString()).assertEqual('12,345,6,789,54,321');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0037
     * @tc.desc   Interaction with JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([100, 200, 300, 400]);
      const jsonStr = JSON.stringify(Array.from(arr));
      expect(jsonStr).assertEqual('[100,200,300,400]');
    })

    /**
     * @tc.name   TypeArrayUint16Array0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0038
     * @tc.desc   Handle NaN value storage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(2);
      arr[0] = NaN;
      arr[1] = Number.NaN;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0039
     * @tc.desc   Handle Infinity value storage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(2);
      arr[0] = Infinity;
      arr[1] = -Infinity;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint16Array0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0040
     * @tc.desc   Verify buffer property of Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array([500, 1000, 1500]);
      const buffer = arr.buffer;
      expect(buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(buffer.byteLength).assertEqual(6);
    })
    /**
     * @tc.name   TypeArrayUint16Array0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0041
     * @tc.desc   Handle empty Uint16Array (length 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint16Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.every(() => false)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayUint16Array0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0042
     * @tc.desc   Create from Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr = new Int8Array([-1, 127, -128]);
      const uint16Arr = new collections.Uint16Array(int8Arr);
      expect(uint16Arr.toString()).assertEqual('65535,127,65408');
      expect(uint16Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0043
     * @tc.desc   Create from Float32Array with value conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint16Array0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const float32Arr = new Float32Array([-1.5, 32768.5, 70000.9]);
      const uint16Arr = new collections.Uint16Array(float32Arr);
      expect(uint16Arr.toString()).assertEqual('65535,32768,4464');
      expect(uint16Arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint16Array0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0044
     * @tc.desc   Create view with DataView and interact with Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const uint16Arr = new Uint16Array(buffer);
      const dataView = new DataView(buffer);
      dataView.setUint16(2, 0x1234, true);
      expect(uint16Arr[0]).assertEqual(0x00);
      expect(uint16Arr[1]).assertEqual(0x1234);
      expect(uint16Arr[2]).assertEqual(0x00);
      expect(uint16Arr[3]).assertEqual(0x00);
      expect(uint16Arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint16Array0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0045
     * @tc.desc   Handle large array (接近最大长度)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeLength = Math.pow(2, 27) - 1;
      const arr = new collections.Uint16Array(largeLength);
      expect(arr.length).assertEqual(largeLength);
      arr[0] = 65535;
      arr[largeLength - 1] = 32768;
      expect(arr[0]).assertEqual(65535);
      expect(arr[largeLength - 1]).assertEqual(32768);
    })

    /**
     * @tc.name   TypeArrayUint16Array0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0046
     * @tc.desc   16-bit audio sample processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertToSigned = (samples: collections.Uint16Array) => {
        return samples.map(s => s > 32767 ? s - 65536 : s);
      };
      const samples = new collections.Uint16Array([0, 32767, 32768, 65535]);
      const signedSamples = convertToSigned(samples);
      expect(signedSamples.toString()).assertEqual('0,32767,32768,65535');
      expect(signedSamples.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0047
     * @tc.desc   16-bit grayscale image processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const applyThreshold = (pixels: collections.Uint16Array, threshold: number) => {
        return pixels.map(p => p > threshold ? 65535 : 0);
      };

      const pixels = new collections.Uint16Array([10000, 30000, 40000, 50000]);
      const processed = applyThreshold(pixels, 35000);
      expect(processed.toString()).assertEqual('0,0,65535,65535');
      expect(processed.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0048
     * @tc.desc   Network protocol 16-bit field handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const createPacket = (flags: number, length: number, checksum: number) => {
        return new collections.Uint16Array([flags, length, checksum]);
      };

      const packet = createPacket(0x0001, 0x04D2, 0x1234);
      expect(packet[0]).assertEqual(1);
      expect(packet[1]).assertEqual(1234);
      expect(packet[2]).assertEqual(4660);
      expect(packet.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayUint16Array0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0049
     * @tc.desc   16-bit value processing in compression algorithm
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const deltaEncode16 = (data: collections.Uint16Array) => {
        const encoded = new collections.Uint16Array(data.length);
        encoded[0] = data[0];
        for (let i = 1; i < data.length; i++) {
          encoded[i] = (data[i] - data[i-1]) & 0xFFFF;
        }
        return encoded;
      };

      const data = new collections.Uint16Array([1000, 1002, 1005, 1005, 1010]);
      const encoded = deltaEncode16(data);
      expect(encoded.toString()).assertEqual('1000,2,3,0,5');
      expect(encoded.length).assertEqual(5)
    })

    /**
     * @tc.name   TypeArrayUint16Array0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0050
     * @tc.desc   Sensor data processing with 16-bit precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const calibrateData = (rawData: collections.Uint16Array, offset: number) => {
        return rawData.map(v => (v + offset) & 0xFFFF);
      };

      const raw = new collections.Uint16Array([65530, 65532, 65534]);
      const calibrated = calibrateData(raw, 10);
      expect(calibrated.toString()).assertEqual('4,6,8');
      expect(calibrated.length).assertEqual(3)
    })

    /**
     * @tc.name   TypeArrayUint16Array0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0051
     * @tc.desc   Game coordinate system with 16-bit values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const translateCoordinates = (coords: collections.Uint16Array, x: number, y: number) => {
        const result = new collections.Uint16Array(coords.length);
        for (let i = 0; i < coords.length; i += 2) {
          result[i] = (coords[i] + x) & 0xFFFF;
          result[i+1] = (coords[i+1] + y) & 0xFFFF;
        }
        return result;
      };

      const coords = new collections.Uint16Array([100, 200, 300, 400]);
      const translated = translateCoordinates(coords, 50, -150);
      expect(translated.toString()).assertEqual('150,50,350,250');
      expect(translated.length).assertEqual(4)
    })

    /**
     * @tc.name   TypeArrayUint16Array0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0052
     * @tc.desc   Binary file format parsing with 16-bit fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parseHeader = (data: collections.Uint16Array) => {
        return ({
          version: data[0],
          recordCount: data[1],
          flags: data[2]
        } as GeneratedObjectLiteralInterface_1);
      };

      const headerData = new collections.Uint16Array([0x0003, 0x000A, 0x8000]);
      const header: GeneratedObjectLiteralInterface_1 = parseHeader(headerData);
      expect(header.version).assertEqual(3);
      expect(header.recordCount).assertEqual(10);
      expect(header.flags).assertEqual(32768);
    })

    /**
     * @tc.name   TypeArrayUint16Array0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_ALL_0053
     * @tc.desc   Handling invalid buffer offset in constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint16Array0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(8);
      let errorThrown = false;

      try {
        new collections.Uint16Array(buffer, 7, 1);
      } catch (e) {
