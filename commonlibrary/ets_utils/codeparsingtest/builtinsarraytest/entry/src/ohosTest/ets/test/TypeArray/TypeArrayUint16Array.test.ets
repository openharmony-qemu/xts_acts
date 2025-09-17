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
import { sleep } from '../../testability/pages/Utils'

interface GeneratedObjectLiteralInterface_1 {
  version: number;
  recordCount: number;
  flags: number;
}

interface GeneratedObjectLiteralInterface_2 {
  id: number;
  values: Uint16Array;
}

export default function typeArrayUint16ArrayTest() {
  describe('TypeArrayUint16ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0001
     * @tc.name TypeArrayUint16Array0001
     * @tc.desc Construct Uint16Array from length and verify basic properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint16Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.byteLength).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0002
     * @tc.name TypeArrayUint16Array0002
     * @tc.desc Construct Uint16Array from regular array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint16Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint16Array([100, 200, 300]);
      expect(arr.toString()).assertEqual('100,200,300');
      expect(arr[1]).assertEqual(200);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0003
     * @tc.name TypeArrayUint16Array0003
     * @tc.desc Construct Uint16Array from ArrayBuffer with offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0004
     * @tc.name TypeArrayUint16Array0004
     * @tc.desc Verify storage of Uint16Array maximum value (65535)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65535;
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0005
     * @tc.name TypeArrayUint16Array0005
     * @tc.desc Verify truncation handling for values exceeding 65535
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65536;
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0006
     * @tc.name TypeArrayUint16Array0006
     * @tc.desc Verify unsigned conversion handling for negative values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = -1;
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0007
     * @tc.name TypeArrayUint16Array0007
     * @tc.desc Verify modification synchronization for views sharing same ArrayBuffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const arr1 = new Uint16Array(buffer);
      const arr2 = new Uint16Array(buffer);

      arr1[0] = 1234;
      expect(arr2[0]).assertEqual(1234);
      expect(arr2[1]).assertEqual(0);
      expect(arr2.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0008
     * @tc.name TypeArrayUint16Array0008
     * @tc.desc Create Int32Array view from Uint16Array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([0x1234, 0x5678]);
      const int32View = new Int32Array(uint16Arr.buffer);

      expect(int32View.length).assertEqual(1);
      expect(int32View[0]).assertEqual(0x56781234);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0009
     * @tc.name TypeArrayUint16Array0009
     * @tc.desc Copy data from regular array using set method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
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
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0010
     * @tc.name TypeArrayUint16Array0010
     * @tc.desc Copy data with offset using set method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(6);
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
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0011
     * @tc.name TypeArrayUint16Array0011
     * @tc.desc Handle out-of-range values with set method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr.set([70000, -50, 32768]);
      expect(arr.toString()).assertEqual('4464,65486,32768');
      expect(arr[0]).assertEqual(4464);
      expect(arr[1]).assertEqual(65486);
      expect(arr[2]).assertEqual(32768);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0012
     * @tc.name TypeArrayUint16Array0012
     * @tc.desc Create subarray sharing buffer with subarray method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const subArr = arr.subarray(1, 4);
      expect(subArr.toString()).assertEqual('2,3,4');
      expect(subArr.buffer).assertEqual(arr.buffer);
      expect(subArr.length).assertEqual(3);
      expect(subArr[0]).assertEqual(2);
      expect(subArr[1]).assertEqual(3);
      expect(subArr[2]).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0013
     * @tc.name TypeArrayUint16Array0013
     * @tc.desc Create non-shared copy with slice method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30]);
      const slicedArr = arr.slice(1);
      expect(slicedArr.toString()).assertEqual('20,30');
      expect(slicedArr.buffer === arr.buffer).assertFalse();
      expect(slicedArr.length).assertEqual(2);
      expect(slicedArr[0]).assertEqual(20);
      expect(slicedArr[1]).assertEqual(30);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0014
     * @tc.name TypeArrayUint16Array0014
     * @tc.desc Fill array with valid single value using fill method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(4);
      arr.fill(12345);
      expect(arr.every(v => v === 12345)).assertEqual(true);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(12345);
      expect(arr[1]).assertEqual(12345);
      expect(arr[2]).assertEqual(12345);
      expect(arr[3]).assertEqual(12345);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0015
     * @tc.name TypeArrayUint16Array0015
     * @tc.desc Fill array with out-of-range value using fill method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr.fill(80000);
      expect(arr.every(v => v === 14464)).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(14464);
      expect(arr[1]).assertEqual(14464);
      expect(arr[2]).assertEqual(14464);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0016
     * @tc.name TypeArrayUint16Array0016
     * @tc.desc Transform elements with map method (within range)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300]);
      const mappedArr = arr.map(v => v * 2);
      expect(mappedArr.toString()).assertEqual('200,400,600');
      expect(mappedArr.length).assertEqual(3);
      expect(mappedArr[0]).assertEqual(200);
      expect(mappedArr[1]).assertEqual(400);
      expect(mappedArr[2]).assertEqual(600);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0017
     * @tc.name TypeArrayUint16Array0017
     * @tc.desc Transform elements with map method (out-of-range truncation)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([30000, 40000, 50000]);
      const mappedArr = arr.map(v => v * 2);
      expect(mappedArr.toString()).assertEqual('60000,14464,34464');
      expect(mappedArr.length).assertEqual(3);
      expect(mappedArr[0]).assertEqual(60000);
      expect(mappedArr[1]).assertEqual(14464);
      expect(mappedArr[2]).assertEqual(34464);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0018
     * @tc.name TypeArrayUint16Array0018
     * @tc.desc Filter elements greater than specified value with filter method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1000, 5000, 10000, 20000, 5000]);
      const filteredArr = arr.filter(v => v > 5000);
      expect(filteredArr.toString()).assertEqual('10000,20000');
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(10000);
      expect(filteredArr[1]).assertEqual(20000);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0019
     * @tc.name TypeArrayUint16Array0019
     * @tc.desc Calculate sum of elements with reduce method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(1000);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(arr[3]).assertEqual(400);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0020
     * @tc.name TypeArrayUint16Array0020
     * @tc.desc Verify if all elements are less than specified value with every method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 10000, 15000]);
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
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0021
     * @tc.name TypeArrayUint16Array0021
     * @tc.desc Check existence of element with some method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([15000, 30000, 45000]);
      const hasOver35000 = arr.some(v => v > 35000);
      const hasBelow10000 = arr.some(v => v < 10000);
      expect(hasOver35000).assertEqual(true);
      expect(hasBelow10000).assertEqual(false);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0022
     * @tc.name TypeArrayUint16Array0022
     * @tc.desc Find element with find method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([8000, 16000, 24000, 16000, 32000]);
      const found = arr.find(v => v === 16000);
      const notFound = arr.find(v => v === 40000);
      expect(found).assertEqual(16000);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0023
     * @tc.name TypeArrayUint16Array0023
     * @tc.desc Find element index with findIndex method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([8000, 16000, 24000, 16000, 32000]);
      const index = arr.findIndex(v => v === 16000);
      const notFoundIndex = arr.findIndex(v => v === 40000);
      expect(index).assertEqual(1);
      expect(notFoundIndex).assertEqual(-1);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0024
     * @tc.name TypeArrayUint16Array0024
     * @tc.desc Check element existence with includes method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([5000, 10000, 65535, 30000]);
      expect(arr.includes(10000)).assertEqual(true);
      expect(arr.includes(65536)).assertEqual(false);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0025
     * @tc.name TypeArrayUint16Array0025
     * @tc.desc Find first occurrence index with indexOf method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([3000, 6000, 9000, 6000, 12000]);
      expect(arr.indexOf(6000)).assertEqual(1);
      expect(arr.indexOf(15000)).assertEqual(-1);
      expect(arr.length).assertEqual(5);


    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0026
     * @tc.name TypeArrayUint16Array0026
     * @tc.desc Find last occurrence index with lastIndexOf method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([3000, 6000, 9000, 6000, 12000]);
      expect(arr.lastIndexOf(6000)).assertEqual(3);
      expect(arr.lastIndexOf(15000)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0027
     * @tc.name TypeArrayUint16Array0027
     * @tc.desc Concatenate elements to string with join method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1234, 5678, 9012]);
      expect(arr.join('-')).assertEqual('1234-5678-9012');
      expect(arr.join('|')).assertEqual('1234|5678|9012');
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0028
     * @tc.name TypeArrayUint16Array0028
     * @tc.desc Use values iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([2000, 4000, 6000]);
      const values = Array.from(arr.values());
      expect(values.toString()).assertEqual('2000,4000,6000');
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(2000);
      expect(values[1]).assertEqual(4000);
      expect(values[2]).assertEqual(6000);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0029
     * @tc.name TypeArrayUint16Array0029
     * @tc.desc Use keys iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([500, 1000, 1500]);
      const keys = Array.from(arr.keys());
      expect(keys.toString()).assertEqual('0,1,2');
      expect(keys.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0030
     * @tc.name TypeArrayUint16Array0030
     * @tc.desc Use entries iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([1111, 2222, 3333]);
      const entries = Array.from(arr.entries());
      expect(entries[0].toString()).assertEqual('0,1111');
      expect(entries[1].toString()).assertEqual('1,2222');
      expect(entries[2].toString()).assertEqual('2,3333');
      expect(entries.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0031
     * @tc.name TypeArrayUint16Array0031
     * @tc.desc Convert to regular array with Array.from
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([7000, 14000, 21000]);
      const regArr = Array.from(uint16Arr);
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.toString()).assertEqual('7000,14000,21000');
      expect(regArr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0032
     * @tc.name TypeArrayUint16Array0032
     * @tc.desc Convert to regular array with spread operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint16Array0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const uint16Arr = new Uint16Array([8000, 16000, 24000]);
      const regArr = [...uint16Arr];
      expect(Array.isArray(regArr)).assertEqual(true);
      expect(regArr.toString()).assertEqual('8000,16000,24000');
      expect(regArr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT16ARRAY_0033
     * @tc.name TypeArrayUint16Array0033
     * @tc.desc Convert to Uint32Array
