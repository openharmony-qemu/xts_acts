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



interface GeneratedTypeLiteralInterface_1 {
  and: collections.Int32Array;
  or: collections.Int32Array;
  xor: collections.Int32Array;
  not: collections.Int32Array;
}

interface GeneratedTypeLiteralInterface_2 {
  sum1: number;
  sum2: number;
}

interface GeneratedTypeLiteralInterface_3 {
  sum: collections.Int32Array;
  min: collections.Int32Array;
  max: collections.Int32Array;
  countAboveMean: collections.Int32Array;
}

interface GeneratedTypeLiteralInterface_4 {
  valid: boolean;
  invalidIndices: number[];
}

interface GeneratedTypeLiteralInterface_5 {
  slope: number;
  intercept: number;
  predict: (xVal: number) => number;
}

interface GeneratedTypeLiteralInterface_6 {
  normalized: collections.Int32Array;
  outliers: number[];
}

export default function Int32ArrayAllTest() {
  describe('Int32ArrayAllTest', () => {
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
     * @tc.name   TypeArrayInt32Array0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0001
     * @tc.desc   Verify Int32Array creation from different sources
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr1 = new collections.Int32Array(3);
      expect(arr1.length).assertEqual(3);
      expect(arr1.byteLength).assertEqual(12);

      let arr2 = new collections.Int32Array([1, 2, 3]);
      expect(arr2.toString()).assertEqual('1,2,3');

      let buffer = new collections.ArrayBuffer(16);
      let arr3 = new collections.Int32Array(buffer);
      expect(arr3.length).assertEqual(4);

      let arr4 = new collections.Int32Array(buffer, 4, 2);
      expect(arr4.length).assertEqual(2);
      expect(arr4.byteOffset).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0002
     * @tc.desc   Verify Int32Array properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new collections.Int32Array(1);
      expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(arr.byteLength).assertEqual(4);
      expect(collections.Array.isArray(arr)).assertEqual(false);
      expect(arr instanceof collections.Int32Array).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt32Array0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0003
     * @tc.desc   Verify Int32Array with basic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);

      arr[1] = 25;
      expect(arr[1]).assertEqual(25);
      expect(arr.length).assertEqual(3);

      let sum = 0;
      for (let val of arr) {
        sum += val;
      }
      expect(sum).assertEqual(65);
    })

    /**
     * @tc.name   TypeArrayInt32Array0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0004
     * @tc.desc   Verify Int32Array set method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array(5);

      arr.set([1, 2, 3]);
      expect(arr.toString()).assertEqual('1,2,3,0,0');

      arr.set([4, 5], 3);
      expect(arr.toString()).assertEqual('1,2,3,4,5');

      let source = new Uint32Array([10, 20]);
      arr.set(source, 1);
      expect(arr.toString()).assertEqual('1,10,20,4,5');
    })

    /**
     * @tc.name   TypeArrayInt32Array0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0005
     * @tc.desc   Verify Int32Array subarray method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array([1, 2, 3, 4, 5]);
      let sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      sub[0] = 20;
      expect(arr[1]).assertEqual(20);
      let sub2 = arr.subarray(3);
      expect(sub2.toString()).assertEqual('4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(sub2.length).assertEqual(2);
      expect(sub2[0]).assertEqual(4);
      expect(sub2[1]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt32Array0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0006
     * @tc.desc   Verify Int32Array with ArrayBuffer sharing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let buffer = new collections.ArrayBuffer(16);
      let arr1 = new collections.Int32Array(buffer);
      let arr2 = new collections.Int32Array(buffer);
      arr1[0] = 123;
      expect(arr2[0]).assertEqual(123);
      let arr3 = new collections.Int16Array(buffer);
      arr1[1] = 0x12345678;
      expect(arr3[2]).assertEqual(0x5678);
      expect(arr3[3]).assertEqual(0x1234);
      expect(arr1.length).assertEqual(4);
      expect(arr1[1]).assertEqual(0x12345678);
      expect(arr1[2]).assertEqual(0);
      expect(arr1[3]).assertEqual(0);
      expect(arr2.length).assertEqual(4);
      expect(arr2[1]).assertEqual(0x12345678);
      expect(arr2[2]).assertEqual(0);
      expect(arr2[3]).assertEqual(0);
      expect(arr3.length).assertEqual(8);
      expect(arr3[0]).assertEqual(123);
      expect(arr3[1]).assertEqual(0);
      expect(arr3[4]).assertEqual(0);
      expect(arr3[5]).assertEqual(0);
      expect(arr3[6]).assertEqual(0);
      expect(arr3[7]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt32Array0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0007
     * @tc.desc   Verify Int32Array with DataView interaction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let arr = new Int32Array(buffer);
      let view = new DataView(buffer);
      view.setInt32(0, 0x11223344, true);
      view.setInt32(4, 0x55667788, false);
      expect(arr[0]).assertEqual(0x11223344);
      expect(arr[1]).assertEqual(-0x778899ab);
      arr[2] = 0xAABBCCDD;
      expect(view.getInt32(8, true)).assertEqual(-0x55443323);
      expect(view.getInt32(8, false)).assertEqual(-0x22334456);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(-0x55443323);
      expect(arr[3]).assertEqual(0);
      expect(view.byteLength).assertEqual(16);
    })

    /**
     * @tc.name   TypeArrayInt32Array0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0008
     * @tc.desc   Verify Int32Array conversion to and from regular arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let original = [1, 2, 3, 4];
      let arr = new collections.Int32Array(original);
      expect(arr.toString()).assertEqual('1,2,3,4');
      let converted = collections.Int32Array.from(arr);
      expect(converted.toString()).assertEqual(original.toString());
      expect(converted instanceof collections.Int32Array).assertEqual(true);
      let spreadArr = [...arr];
      expect(spreadArr.toString()).assertEqual(original.toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(converted.length).assertEqual(4);
      expect(converted[0]).assertEqual(1);
      expect(converted[1]).assertEqual(2);
      expect(converted[2]).assertEqual(3);
      expect(converted[3]).assertEqual(4);
      expect(spreadArr.length).assertEqual(4);
      expect(spreadArr[0]).assertEqual(1);
      expect(spreadArr[1]).assertEqual(2);
      expect(spreadArr[2]).assertEqual(3);
      expect(spreadArr[3]).assertEqual(4);
    })
    /**
     * @tc.name   TypeArrayInt32Array0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0009
     * @tc.desc   Verify Int32Array with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let minValue = -2147483648;
      let maxValue = 2147483647;
      let arr = new collections.Int32Array(3);
      arr[0] = minValue;
      arr[1] = maxValue;
      expect(arr[0]).assertEqual(minValue);
      expect(arr[1]).assertEqual(maxValue);
      arr[2] = maxValue + 1;
      expect(arr[2]).assertEqual(minValue);
      arr[2] = minValue - 1;
      expect(arr[2]).assertEqual(maxValue);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt32Array0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0010
     * @tc.desc   Verify Int32Array with higher-order functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array([1, 2, 3, 4, 5]);
      let mapped = arr.map(x => x * 2);
      expect(mapped.toString()).assertEqual('2,4,6,8,10');
      let filtered = arr.filter(x => x % 2 === 0);
      expect(filtered.toString()).assertEqual('2,4');
      let sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(15);
      let allPositive = arr.every(x => x > 0);
      expect(allPositive).assertEqual(true);
      let hasEven = arr.some(x => x % 2 === 0);
      expect(hasEven).assertEqual(true);
      expect(arr.length).assertEqual(5);
      expect(mapped.length).assertEqual(5);
      expect(filtered.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
      expect(mapped[3]).assertEqual(8);
      expect(mapped[4]).assertEqual(10);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt32Array0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0011
     * @tc.desc   Verify Int32Array with fill and copyWithin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr = new collections.Int32Array(5);
      arr.fill(10);
      expect(arr.toString()).assertEqual('10,10,10,10,10');
      arr.fill(20, 1, 4);
      expect(arr.toString()).assertEqual('10,20,20,20,10');
      arr.copyWithin(0, 3);
      expect(arr.toString()).assertEqual('20,10,20,20,10');
      let arr2 = new collections.Int32Array([1, 2, 3, 4, 5]);
      arr2.copyWithin(1, 3, 5);
      expect(arr2.toString()).assertEqual('1,4,5,4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(10);
      expect(arr2.length).assertEqual(5);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(4);
      expect(arr2[2]).assertEqual(5);
      expect(arr2[3]).assertEqual(4);
      expect(arr2[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt32Array0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0012
     * @tc.desc   Verify Int32Array with SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt32Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let buffer = new SharedArrayBuffer(16);
      let arr1 = new Int32Array(buffer);
      arr1.set([1, 2, 3, 4]);
      setTimeout(() => {
        let arr2 = new Int32Array(buffer);
        arr2[0] = 100;
        arr2[2] = 300;
      }, 0);
      setTimeout(() => {
        expect(arr1[0]).assertEqual(100);
        expect(arr1[1]).assertEqual(2);
        expect(arr1[2]).assertEqual(300);
        expect(arr1[3]).assertEqual(4);
        done();
      }, 10);
    })

    /**
     * @tc.name   TypeArrayInt32Array0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0013
     * @tc.desc   Verify Int32Array with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let bitwiseOperations = (arr: collections.Int32Array): GeneratedTypeLiteralInterface_1 => {
        let mask = 0x00FF00FF;
        let and = new collections.Int32Array(arr.length);
        let or = new collections.Int32Array(arr.length);
        let xor = new collections.Int32Array(arr.length);
        let not = new collections.Int32Array(arr.length);

        for (let i = 0; i < arr.length; i++) {
          and[i] = arr[i] & mask;
          or[i] = arr[i] | mask;
          xor[i] = arr[i] ^ mask;
          not[i] = ~arr[i];
        }

        return {
          and,
          or,
          xor,
          not
        };
      };

      let arr = new collections.Int32Array([0x12345678, 0xABCDEF12]);
      let results = bitwiseOperations(arr);

      expect(results.and[0]).assertEqual(0x00340078);
      expect(results.or[0]).assertEqual(0x12FF56FF);
      expect(results.xor[0]).assertEqual(0x12CB5687);
      expect(results.not[0]).assertEqual(-0x12345679);
    })

    /**
     * @tc.name   TypeArrayInt32Array0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0014
     * @tc.desc   Verify Int32Array with byte order conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let swapEndianness = (value: number): number => {
        return ((value & 0xFF) << 24) |
          ((value & 0xFF00) << 8) |
          ((value >> 8) & 0xFF00) |
          ((value >> 24) & 0xFF);
      };

      let arr = new collections.Int32Array([0x12345678, 0xABCDEF12]);
      let swapped = arr.map(swapEndianness);

      expect(swapped[0]).assertEqual(0x78563412);
      expect(swapped[1]).assertEqual(0x12EFCDAB);


      let swappedBack = swapped.map(swapEndianness);
      expect(swappedBack.toString()).assertEqual(arr.toString());
    })

    /**
     * @tc.name   TypeArrayInt32Array0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_ALL_0015
     * @tc.desc   Verify Int32Array with data chunking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt32Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      let chunkArray = (arr: collections.Int32Array, chunkSize: number): collections.Int32Array[] => {
        let chunks: collections.Int32Array[] = [];
        for (let i = 0; i < arr.length; i += chunkSize) {
          let chunk = arr.subarray(i, i + chunkSize);
          chunks.push(chunk);
        }
        return chunks;
      };


      let mergeChunks = (chunks: collections.Int32Array[]): collections.Int32Array => {
        let totalLength = chunks.reduce((sum, chunk) => sum + chunk.length, 0);
        let result = new collections.Int32Array(totalLength);

        let offset = 0;
        for (let chunk of chunks) {
          result.set(chunk, offset);
          offset += chunk.length;
        }

