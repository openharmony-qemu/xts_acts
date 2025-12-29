/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function HeapSortTest() {
  describe("HeapSortTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number HEAP_SORT_BYTE_0100
     * @tc.name   testHeapSortbyte0001
     * @tc.desc   Test the basic sorting function of the heap
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testHeapSortbyte0001";
      try {
        const originalArray: FixedArray<byte> = [4, 10, 3, 5, 1] as FixedArray<byte>;
        const expectedArray: FixedArray<byte> = [1, 3, 4, 5, 10] as FixedArray<byte>;
        heapSort(originalArray, 0, originalArray.length);
        for (let i = 0; i < originalArray.length; i++) {
          expect(originalArray[i]).assertEqual(expectedArray[i]);
        }
        expect(originalArray.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_0200
     * @tc.name   testHeapSortbyte0002
     * @tc.desc   Test the sorting section of the heap for interval functionality
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testHeapSortbyte0002";
      try {
        const originalArray: FixedArray<byte> = [9, 7, 3, 5, 2, 8] as FixedArray<byte>;
        const expectedArray: FixedArray<byte> = [9, 7, 2, 3, 5, 8] as FixedArray<byte>;
        heapSort(originalArray, 2, 5);
        for (let i = 0; i < originalArray.length; i++) {
          expect(originalArray[i]).assertEqual(expectedArray[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_0300
     * @tc.name   testHeapSortbyte0003
     * @tc.desc   Test the heap sorting function to sort sorted arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortbyte0003";
      try {
        let arr: FixedArray<byte> = [1, 2, 3, 4, 5];
        heapSort(arr, 0, arr.length);
        expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_0400
     * @tc.name   testHeapSortbyte0004
     * @tc.desc   Test the heap sorting function to sort reverse arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortbyte0004";
      try {
        let arr: FixedArray<byte> = [5, 4, 3, 2, 1];
        heapSort(arr, 0, arr.length);
        expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_0500
     * @tc.name   testHeapSortbyte0005
     * @tc.desc   Test the heap sorting function to sort arrays of duplicate elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortbyte0005";
      try {
        let arr: FixedArray<byte> = [3, 1, 3, 2, 2, 1];
        heapSort(arr, 0, arr.length);
        expect(JSON.stringify(arr)).assertEqual(JSON.stringify([1, 1, 2, 2, 3, 3]));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_2_0100
     * @tc.name   testHeapSortbyte2001
     * @tc.desc   Test the basic ascending sorting function (byte type array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortbyte2001';
      try {
        const original: FixedArray<byte> = [3, 1, 4, 1, 5, 9, 2, 6] as FixedArray<byte>;
        const expected: FixedArray<byte> = [1, 1, 2, 3, 4, 5, 6, 9] as FixedArray<byte>;
        heapSort(original, 0, original.length, (lhs: byte, rhs: byte) => lhs < rhs);
        expect(original.length).assertEqual(expected.length);
        for (let i = 0; i < original.length; i++) {
          expect(original[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_2_0200
     * @tc.name   testHeapSortbyte2002
     * @tc.desc   Test custom descending comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortbyte2002';
      try {
        const original: FixedArray<byte> = [5, 2, 8, 1, 0, 7] as FixedArray<byte>;
        const expectedDesc: FixedArray<byte> = [8, 7, 5, 2, 1, 0] as FixedArray<byte>;
        const descComparator = (lhs: byte, rhs: byte): boolean => lhs > rhs;
        heapSort(original, 0, original.length, descComparator);
        for (let i = 0; i < original.length; i++) {
          expect(original[i]).assertEqual(expectedDesc[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_2_0300
     * @tc.name   testHeapSortbyte2003
     * @tc.desc   Test boundary conditions (empty array, single element array, index boundary)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortbyte2003';
      try {
        const emptyArray: FixedArray<byte> = [] as FixedArray<byte>;
        heapSort(emptyArray, 0, 0, (l, r) => l < r);
        expect(emptyArray.length).assertEqual(0);
        const singleElement: FixedArray<byte> = [10] as FixedArray<byte>;
        heapSort(singleElement, 0, 1, (l, r) => l < r);
        expect(singleElement[0]).assertEqual(10);
        const partialArray: FixedArray<byte> = [5, 3, 8, 1, 9, 2] as FixedArray<byte>;
        heapSort(partialArray, 1, 4, (l, r) => l < r);
        const expected = [5, 1, 3, 8, 9, 2];
        expect(partialArray.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(partialArray[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_BYTE_2_0400
     * @tc.name   testHeapSortbyte2004
     * @tc.desc   Test sorting of byte arrays containing negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortbyte2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortbyte2004';
      try {
        const arrayWithNegative: FixedArray<byte> = [-5, 20, -3, 0, 15, -10] as FixedArray<byte>;
        const expected: FixedArray<byte> = [-10, -5, -3, 0, 15, 20] as FixedArray<byte>;
        heapSort(arrayWithNegative, 0, arrayWithNegative.length, (l, r) => l < r);
        expect(arrayWithNegative.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(arrayWithNegative[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_0100
     * @tc.name   testHeapSortnumber0001
     * @tc.desc   Test basic number sorting (in ascending order)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortnumber0001';
      try {
        const original: FixedArray<number> = [4, 1, 3, 2, 6, 5];
        const expected: FixedArray<number> = [1, 2, 3, 4, 5, 6];
        heapSort(original, 0, original.length);
        expect(original.length).assertEqual(expected.length);
        for (let i = 0; i < original.length; i++) {
          expect(original[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_0200
     * @tc.name   testHeapSortnumber0002
     * @tc.desc   Test sorting containing special numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortnumber0002';
      try {
        const original: FixedArray<number> = [0, -1, 3, -2, 5];
        const expected: FixedArray<number> = [-2, -1, 0, 3, 5];
        heapSort(original, 0, original.length);
        for (let i = 0; i < original.length; i++) {
          expect(original[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_0300
     * @tc.name   testHeapSortnumber0003
     * @tc.desc   Test boundary conditions (empty array, single element, subarray sorting)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortnumber0003';
      try {
        const emptyArray: FixedArray<number> = [];
        heapSort(emptyArray, 0, 0);
        expect(emptyArray.length).assertEqual(0);
        const singleNumber: FixedArray<number> = [7];
        const originalValue = singleNumber[0];
        heapSort(singleNumber, 0, 1);
        expect(singleNumber[0]).assertEqual(7);
        const partialArray: FixedArray<number> = [6, 2, 4, 1, 3, 5];
        heapSort(partialArray, 1, 4);
        const expectedPartial = [6, 1, 2, 4, 3, 5];
        expect(partialArray.length).assertEqual(expectedPartial.length);
        for (let i = 0; i < expectedPartial.length; i++) {
          expect(partialArray[i]).assertEqual(expectedPartial[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_0400
     * @tc.name   testHeapSortnumber0004
     * @tc.desc   Test mixed number sorting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortnumber0004';
      try {
        const original: FixedArray<number> = [2, -1, 4, -3, 1, -2];
        const expected: FixedArray<number> = [-3, -2, -1, 1, 2, 4];
        heapSort(original, 0, original.length);
        for (let i = 0; i < original.length; i++) {
          expect(original[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_2_0100
     * @tc.name   testHeapSortnumber2001
     * @tc.desc   Test default ascending sorting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortnumber2001';
      try {
        const original: FixedArray<number> = [3, 10, 1, 20, 2, 30];
        const expected: FixedArray<number> = [1, 2, 3, 10, 20, 30];
        const ascComparator = (lhs: number, rhs: number): boolean => lhs < rhs;
        heapSort(original, 0, original.length, ascComparator);
        expect(original.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(original[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_2_0200
     * @tc.name   testHeapSortnumber2002
     * @tc.desc   Test custom descending sorting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHeapSortnumber2002';
      try {
        const original: FixedArray<number> = [5, 3, 8, 1, 4];
        const expected: FixedArray<number> = [8, 5, 4, 3, 1];
        const descComparator = (lhs: number, rhs: number): boolean => lhs > rhs;
        heapSort(original, 0, original.length, descComparator);
        for (let i = 0; i < original.length; i++) {
          expect(original[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_2_0300
     * @tc.name   testHeapSortnumber2003
     * @tc.desc   Test heapSort with partial range of number array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortnumber2003";
      try {
        let arr: Array<number> = [5, 4, 3, 2, 1];
        heapSort(arr as FixedArray<number>, 1, 4, (lhs: number, rhs: number): boolean => {
          return lhs < rhs;
        });
        const result = arr.join(',');
        expect(result).assertEqual("5,2,3,4,1");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_NUMBER_2_0400
     * @tc.name   testHeapSortnumber2004
     * @tc.desc   Testing heap sort with empty range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortnumber2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortnumber2004";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let originalArr = [...arr];
        heapSort(arr, 1, 1, (lhs: number, rhs: number): boolean => {
          return lhs < rhs;
        });
        expect(arr[0]).assertEqual(originalArr[0]);
        expect(arr[1]).assertEqual(originalArr[1]);
        expect(arr[2]).assertEqual(originalArr[2]);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_0100
     * @tc.name   testHeapSortdouble0001
     * @tc.desc   Test heapSort with basic array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble0001";
      try {
        let arr: FixedArray<double> = [4, 10, 3, 5, 1];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1,3,4,5,10");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_0200
     * @tc.name   testHeapSortdouble0002
     * @tc.desc   Test heapSort with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble0002";
      try {
        let arr: FixedArray<double> = [];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_0300
     * @tc.name   testHeapSortdouble0003
     * @tc.desc   Test heapSort with single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble0003";
      try {
        let arr: FixedArray<double> = [7];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("7");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_0400
     * @tc.name   testHeapSortdouble0004
     * @tc.desc   Test heapSort with partial range of array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble0004";
      try {
        let arr: FixedArray<double> = [9, 3, 7, 5, 2, 8, 1];
        heapSort(arr, 2, 5);
        expect(arr.toString()).assertEqual("9,3,2,5,7,8,1");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_0500
     * @tc.name   testHeapSortdouble0005
     * @tc.desc   Test heapSort with descending order array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble0005";
      try {
        let arr: FixedArray<double> = [5, 4, 3, 2, 1];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1,2,3,4,5");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_2_0100
     * @tc.name   testHeapSortdouble2001
     * @tc.desc   Testing heapSort with ascending order on full array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble2001";
      try {
        let arr: FixedArray<double> = [5, 3, 8, 1, 2];
        heapSort(arr, 0, arr.length, (lhs: double, rhs: double): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("1,2,3,5,8");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_2_0200
     * @tc.name   testHeapSortdouble2002
     * @tc.desc   Testing heapSort with descending order on partial array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble2002";
      try {
        let arr: FixedArray<double> = [5, 3, 8, 1, 2, 9, 4];
        heapSort(arr, 1, 5, (lhs: double, rhs: double): boolean => {
          return lhs > rhs;
        });
        expect(arr.toString()).assertEqual("5,8,3,2,1,9,4");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_2_0300
     * @tc.name   testHeapSortdouble2003
     * @tc.desc   Testing heapSort with empty range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble2003";
      try {
        let arr: FixedArray<double> = [5, 3, 8, 1, 2];
        let original = arr.toString();
        heapSort(arr, 2, 2, (lhs: double, rhs: double): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_2_0400
     * @tc.name   testHeapSortdouble2004
     * @tc.desc   Testing heapSort with single element range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble2004";
      try {
        let arr: FixedArray<double> = [5, 3, 8, 1, 2];
        let original = arr.toString();
        heapSort(arr, 3, 4, (lhs: double, rhs: double): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_DOUBLE_2_0500
     * @tc.name   testHeapSortdouble2005
     * @tc.desc   Testing heapSort with custom comparison function
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortdouble2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortdouble2005";
      try {
        let arr: FixedArray<double> = [1.5, 2.3, 0.8, 3.1, 2.0];
        heapSort(arr, 0, arr.length, (lhs: double, rhs: double): boolean => {
          return (lhs - Math.floor(lhs)) < (rhs - Math.floor(rhs));
        });
        expect(arr.toString()).assertEqual("2,3.1,2.3,1.5,0.8");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_0100
     * @tc.name   testHeapSortfloat0001
     * @tc.desc   Testing heapSort with full array in ascending order
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat0001";
      try {
        let arr: FixedArray<float> = [5.1f, 3.2f, 8.3f, 1.4f, 2.5f];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1.4,2.5,3.2,5.1,8.3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_0200
     * @tc.name   testHeapSortfloat0002
     * @tc.desc   Testing heapSort with partial array (middle 3 elements)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat0002";
      try {
        let arr: FixedArray<float> = [5.1f, 3.2f, 8.3f, 1.4f, 2.5f];
        heapSort(arr, 1, 4);
        expect(arr.toString()).assertEqual("5.1,1.4,3.2,8.3,2.5");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_0300
     * @tc.name   testHeapSortfloat0003
     * @tc.desc   Testing heapSort with already sorted array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat0003";
      try {
        let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1.1,2.2,3.3,4.4,5.5");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_0400
     * @tc.name   testHeapSortfloat0004
     * @tc.desc   Testing heapSort with single element range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat0004";
      try {
        let arr: FixedArray<float> = [5.5f, 3.3f, 2.2f];
        heapSort(arr, 1, 2);
        expect(arr.toString()).assertEqual("5.5,3.3,2.2");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_0500
     * @tc.name   testHeapSortfloat0005
     * @tc.desc   Testing heapSort with empty range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat0005";
      try {
        let arr: FixedArray<float> = [5.1f, 3.2f, 8.3f];
        let original = arr.toString();
        heapSort(arr, 1, 1);
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_2_0100
     * @tc.name   testHeapSortfloat2001
     * @tc.desc   Testing heapSort with ascending order using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat2001";
      try {
        let arr: FixedArray<float> = [5.1f, 3.2f, 8.3f, 1.4f, 2.5f];
        heapSort(arr, 0, arr.length, (lhs: float, rhs: float): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("1.4,2.5,3.2,5.1,8.3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_2_0200
     * @tc.name   testHeapSortfloat2002
     * @tc.desc   Testing heapSort with descending order using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat2002";
      try {
        let arr: FixedArray<float> = [5.1f, 3.2f, 8.3f, 1.4f, 2.5f];
        heapSort(arr, 0, arr.length, (lhs: float, rhs: float): boolean => {
          return lhs > rhs;
        });
        expect(arr.toString()).assertEqual("8.3,5.1,3.2,2.5,1.4");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_2_0300
     * @tc.name   testHeapSortfloat2003
     * @tc.desc   Testing heapSort with custom mustPrecede (sort by fractional part)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat2003";
      try {
        let arr: FixedArray<float> = [1.5f, 2.3f, 0.8f, 3.1f, 2.0f];
        heapSort(arr, 0, arr.length, (lhs: float, rhs: float): boolean => {
          return (lhs - Math.floor(lhs)) < (rhs - Math.floor(rhs));
        });
        expect(arr.toString()).assertEqual("2,3.1,2.3,1.5,0.8");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_2_0400
     * @tc.name   testHeapSortfloat2004
     * @tc.desc   Testing heapSort with partial array using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat2004";
      try {
        let arr: FixedArray<float> = [5.1f, 3.2f, 8.3f, 1.4f, 2.5f, 9.6f];
        heapSort(arr, 1, 4, (lhs: float, rhs: float): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("5.1,1.4,3.2,8.3,2.5,9.6");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_FLOAT_2_0500
     * @tc.name   testHeapSortfloat2005
     * @tc.desc   Testing heapSort with empty range using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortfloat2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortfloat2005";
      try {
        let arr: FixedArray<float> = [1.1f, 2.2f, 3.3f];
        let original = arr.toString();
        heapSort(arr, 1, 1, (lhs: float, rhs: float): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_0100
     * @tc.name   testHeapSortint0001
     * @tc.desc   Testing heapSort with full array in ascending order
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint0001";
      try {
        let arr: FixedArray<int> = [5, 3, 8, 1, 2];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1,2,3,5,8");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_0200
     * @tc.name   testHeapSortint0002
     * @tc.desc   Testing heapSort with partial array (middle 3 elements)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint0002";
      try {
        let arr: FixedArray<int> = [5, 3, 8, 1, 2];
        heapSort(arr, 1, 4);
        expect(arr.toString()).assertEqual("5,1,3,8,2");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_0300
     * @tc.name   testHeapSortint0003
     * @tc.desc   Testing heapSort with already sorted array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint0003";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1,2,3,4,5");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_0400
     * @tc.name   testHeapSortint0004
     * @tc.desc   Testing heapSort with single element range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint0004";
      try {
        let arr: FixedArray<int> = [5, 3, 2];
        heapSort(arr, 1, 2);
        expect(arr.toString()).assertEqual("5,3,2");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_0500
     * @tc.name   testHeapSortint0005
     * @tc.desc   Testing heapSort with empty range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint0005";
      try {
        let arr: FixedArray<int> = [5, 3, 8];
        let original = arr.toString();
        heapSort(arr, 1, 1);
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_2_0100
     * @tc.name   testHeapSortint2001
     * @tc.desc   Testing heapSort with ascending order using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint2001";
      try {
        let arr: FixedArray<int> = [5, 3, 8, 1, 2];
        heapSort(arr, 0, arr.length, (lhs: int, rhs: int): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("1,2,3,5,8");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_2_0200
     * @tc.name   testHeapSortint2002
     * @tc.desc   Testing heapSort with descending order using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint2002";
      try {
        let arr: FixedArray<int> = [5, 3, 8, 1, 2];
        heapSort(arr, 0, arr.length, (lhs: int, rhs: int): boolean => {
          return lhs > rhs;
        });
        expect(arr.toString()).assertEqual("8,5,3,2,1");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_2_0300
     * @tc.name   testHeapSortint2003
     * @tc.desc   Testing heapSort with custom mustPrecede (sort by even numbers first)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint2003";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        heapSort(arr, 0, arr.length, (lhs: int, rhs: int): boolean => {
          if (lhs % 2 === rhs % 2) {
            return lhs < rhs;
          }
          return lhs % 2 === 0;
        });
        expect(arr.toString()).assertEqual("2,4,6,1,3,5");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_2_0400
     * @tc.name   testHeapSortint2004
     * @tc.desc   Testing heapSort with partial array using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint2004";
      try {
        let arr: FixedArray<int> = [5, 3, 8, 1, 2, 9];
        heapSort(arr, 1, 4, (lhs: int, rhs: int): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("5,1,3,8,2,9");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_INT_2_0500
     * @tc.name   testHeapSortint2005
     * @tc.desc   Testing heapSort with empty range using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortint2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortint2005";
      try {
        let arr: FixedArray<int> = [1, 2, 3];
        let original = arr.toString();
        heapSort(arr, 1, 1, (lhs: int, rhs: int): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_0100
     * @tc.name   testHeapSortlong0001
     * @tc.desc   Testing heapSort with full array of positive numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong0001";
      try {
        let arr: FixedArray<long> = [5000000000, 3000000000, 8000000000, 1000000000, 2000000000];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("1000000000,2000000000,3000000000,5000000000,8000000000");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_0200
     * @tc.name   testHeapSortlong0002
     * @tc.desc   Testing heapSort with mixed positive/negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong0002";
      try {
        let arr: FixedArray<long> = [-5, 3, -8, 1, 0];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("-8,-5,0,1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_0300
     * @tc.name   testHeapSortlong0003
     * @tc.desc   Testing heapSort with partial array (last 3 elements)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong0003";
      try {
        let arr: FixedArray<long> = [10, 20, 5, 15, 25];
        heapSort(arr, 2, arr.length);
        expect(arr.toString()).assertEqual("10,20,5,15,25");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_0400
     * @tc.name   testHeapSortlong0004
     * @tc.desc   Testing heapSort with already sorted array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong0004";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 400];
        let original = arr.toString();
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_0500
     * @tc.name   testHeapSortlong0005
     * @tc.desc   Testing heapSort with single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong0005";
      try {
        let arr: FixedArray<long> = [9999999999];
        heapSort(arr, 0, arr.length);
        expect(arr.toString()).assertEqual("9999999999");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_2_0100
     * @tc.name   testHeapSortlong2001
     * @tc.desc   Testing heapSort with ascending order using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong2001";
      try {
        let arr: FixedArray<long> = [5000000000, 3000000000, 8000000000, 1000000000, 2000000000];
        heapSort(arr, 0, arr.length, (lhs: long, rhs: long): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("1000000000,2000000000,3000000000,5000000000,8000000000");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_2_0200
     * @tc.name   testHeapSortlong2002
     * @tc.desc   Testing heapSort with descending order using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong2002";
      try {
        let arr: FixedArray<long> = [5000000000, 3000000000, 8000000000, 1000000000, 2000000000];
        heapSort(arr, 0, arr.length, (lhs: long, rhs: long): boolean => {
          return lhs > rhs;
        });
        expect(arr.toString()).assertEqual("8000000000,5000000000,3000000000,2000000000,1000000000");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_2_0300
     * @tc.name   testHeapSortlong2003
     * @tc.desc   Testing heapSort with custom mustPrecede (sort by absolute value)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong2003";
      try {
        let arr: FixedArray<long> = [-5000000000, 3000000000, -8000000000, 1000000000, 0];
        heapSort(arr, 0, arr.length, (lhs: long, rhs: long): boolean => {
          return Math.abs(lhs) < Math.abs(rhs);
        });
        expect(arr.toString()).assertEqual("0,1000000000,3000000000,-5000000000,-8000000000");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_2_0400
     * @tc.name   testHeapSortlong2004
     * @tc.desc   Testing heapSort with partial array using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong2004";
      try {
        let arr: FixedArray<long> = [5000000000, 3000000000, 8000000000, 1000000000, 2000000000];
        heapSort(arr, 1, 4, (lhs: long, rhs: long): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual("5000000000,1000000000,3000000000,8000000000,2000000000");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number HEAP_SORT_LONG_2_0500
     * @tc.name   testHeapSortlong2005
     * @tc.desc   Testing heapSort with empty range using mustPrecede
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testHeapSortlong2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testHeapSortlong2005";
      try {
        let arr: FixedArray<long> = [1000000000, 2000000000, 3000000000];
        let original = arr.toString();
        heapSort(arr, 1, 1, (lhs: long, rhs: long): boolean => {
          return lhs < rhs;
        });
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0100
     * @tc.name   testBuiltinArrayFind30001
     * @tc.desc   Test finding existing double value in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30001";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double) => v === 3.3);
        expect(found).assertEqual(3.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0200
     * @tc.name   testBuiltinArrayFind30002
     * @tc.desc   Test case when double value doesn't exist in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30002";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double) => v === 6.6);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0300
     * @tc.name   testBuiltinArrayFind30003
     * @tc.desc   Test case for empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30003";
      try {
        const emptyArr: FixedArray<double> = new double[0];
        const found = find(emptyArr, (v: double) => v === 1.1);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0400
     * @tc.name   testBuiltinArrayFind30004
     * @tc.desc   Test find with index parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30004";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double, i: number) => i === 4);
        expect(found).assertEqual(5.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0500
     * @tc.name   testBuiltinArrayFind30005
     * @tc.desc   Test find with array parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30005";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double, i: number, array: FixedArray<double>) =>
        v === 2.2);
        expect(found).assertEqual(2.2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0600
     * @tc.name   testBuiltinArrayFind30006
     * @tc.desc   Test find with both index and array parameters
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30006";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double, i: number, array: FixedArray<double>) =>
        v === 2.2);
        expect(found).assertEqual(2.2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SPECIAL_0700
     * @tc.name   testBuiltinArrayFind30007
     * @tc.desc   Test case with special double values (NaN, Infinity)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30007";
      let hasThrown = false;
      try {
        const arr: FixedArray<double> = [1.1, 2.2];
        find(arr, (val: double, idx: number) => {
          if (idx === 1) {
            throw new Error("Callback error");
          }
          return val === 2.2;
        });
      } catch (e) {
        hasThrown = true;
        expect((e as Error).message).assertEqual("Callback error");
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0100
     * @tc.name   testBuiltinArrayFind60001
     * @tc.desc   Test finding existing long value in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60001";
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000, 4000];
        const found = find(arr, (v: long) => v === 3000);
        expect(found).assertEqual(3000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0200
     * @tc.name   testBuiltinArrayFind60002
     * @tc.desc   Test case when long value doesn't exist in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60002";
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000];
        const found = find(arr, (v: long) => v === 5000);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0300
     * @tc.name   testBuiltinArrayFind60003
     * @tc.desc   Test case for empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60003";
      try {
        const emptyArr: FixedArray<long> = new long[0];
        const found = find(emptyArr, (v: long) => v === 1000);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0400
     * @tc.name   testBuiltinArrayFind60004
     * @tc.desc   Test find with index parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60004";
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000, 4000];
        const found = find(arr, (v: long, i: number) => i === 2);
        expect(found).assertEqual(3000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0500
     * @tc.name   testBuiltinArrayFind60005
     * @tc.desc   Test boundary value search for long
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60005";
      try {
        const arr: FixedArray<long> = [9223372036854775807, -9223372036854775808];
        const found1 = find(arr, (v: long) => v === 9223372036854775807);
        const found2 = find(arr, (v: long) => v === -9223372036854775808);
        expect(found1).assertEqual(9223372036854775807);
        expect(found2).assertEqual(-9223372036854775808);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0600
     * @tc.name   testBuiltinArrayFind60006
     * @tc.desc   Test find with array parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60006";
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000];
        const found = find(arr, (v: long, i: number, array: FixedArray<long>) =>
        v === 2000);
        expect(found).assertEqual(2000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0700
     * @tc.name   testBuiltinArrayFind60007
     * @tc.desc   Test case for sparse long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60007";
      try {
        const arr: FixedArray<long | undefined> = [1000 as long, undefined, 3000 as long];
        const result = (arr as long[]).find((value) => value === undefined);
        expect(result).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0800
     * @tc.name   testBuiltinArrayFind60008
     * @tc.desc   Test case for zero value in long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60008";
      try {
        const arr: FixedArray<long> = [0, -0, 1000];
        const found = find(arr, (v: long) => v === 0);
        expect(found).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0900
     * @tc.name   testBuiltinArrayFind60009
     * @tc.desc   Test case when callback function throws exception in long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60009";
      let hasThrown = false;
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000];
        find(arr, (val: long, idx: number) => {
          if (idx === 1) {
            throw new Error("Callback error");
          }
          return val === 2000;
        });
      } catch (e) {
        hasThrown = true;
        expect((e as Error).message).assertEqual("Callback error");
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_FLOAT_0100
     * @tc.name   testBuiltinArrayFind40001
     * @tc.desc   Test basic find functionality (finding matching element)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind40001";
      try {
        const arr: FixedArray<float> = [1.5f, 2.3f, 3.7f, 4.2f];
        const result = find(arr, (val: float) => val > 3);
        expect(result).assertEqual(3.7 as float);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0500
     * @tc.name   TESTBUILTINARRAYCONCAT6005
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation preserves original array order
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6005";
      try {
        const arr1: FixedArray<double> = [1.1, 2.2];
        const arr2: FixedArray<double> = [3.3, 4.4];
        const result = concat(arr1, arr2);
        expect(result[0]).assertEqual(1.1);
        expect(result[1]).assertEqual(2.2);
        expect(result[2]).assertEqual(3.3);
        expect(result[3]).assertEqual(4.4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0600
     * @tc.name   TESTBUILTINARRAYCONCAT6006
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with single-element arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6006";
      try {
        const arr1: FixedArray<double> = [5.5];
        const arr2: FixedArray<double> = [6.6];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(5.5);
        expect(result[1]).assertEqual(6.6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0700
     * @tc.name   TESTBUILTINARRAYCONCAT6007
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with zero-value elements
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6007";
      try {
        const arr1: FixedArray<double> = [0.0];
        const arr2: FixedArray<double> = [0.0, 0.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(0.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0800
     * @tc.name   TESTBUILTINARRAYCONCAT6008
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with decimal numbers
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6008";
      try {
        const arr1: FixedArray<double> = [1.23];
        const arr2: FixedArray<double> = [4.56];
        const result = concat(arr1, arr2);
        expect(result[0]).assertEqual(1.23);
        expect(result[1]).assertEqual(4.56);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0900
     * @tc.name   TESTBUILTINARRAYCONCAT6009
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with large arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6009";
      try {
        const arr1: FixedArray<double> = [10.0, 20.0, 30.0];
        const arr2: FixedArray<double> = [40.0, 50.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(5);
        expect(result[4]).assertEqual(50.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_1000
     * @tc.name   TESTBUILTINARRAYCONCAT6010
     * @tc.type   FUNCTION
     * @tc.desc   Test chained concatenation
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6010";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const temp = concat(arr1, arr2);
        const result = concat(temp, arr3);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0100
     * @tc.name   TESTBUILTINARRAYCONCAT7001
     * @tc.type   FUNCTION
     * @tc.desc   Test basic concatenation with two required arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7001";
      try {
        const arr1: FixedArray<double> = [1.0, 2.0];
        const arr2: FixedArray<double> = [3.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0200
     * @tc.name   TESTBUILTINARRAYCONCAT7002
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with one required array and one variadic array
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7002";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0300
     * @tc.name   TESTBUILTINARRAYCONCAT7003
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with empty variadic arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7003";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0400
     * @tc.name   TESTBUILTINARRAYCONCAT7004
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with multiple variadic arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7004";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const arr4: FixedArray<double> = [4.0];
        const result = concat(arr1, arr2, arr3, arr4);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(4.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0500
     * @tc.name   TESTBUILTINARRAYCONCAT7005
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation preserves element order
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7005";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0, 3.0];
        const arr3: FixedArray<double> = [4.0];
        const result = concat(arr1, arr2, arr3);
        expect(result[0]).assertEqual(1.0);
        expect(result[1]).assertEqual(2.0);
        expect(result[2]).assertEqual(3.0);
        expect(result[3]).assertEqual(4.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0600
     * @tc.name   TESTBUILTINARRAYCONCAT7006
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with single-element required arrays and no variadic arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7006";
      try {
        const arr1: FixedArray<double> = [9.9];
        const arr2: FixedArray<double> = [8.8];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(9.9);
        expect(result[1]).assertEqual(8.8);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0700
     * @tc.name   TESTBUILTINARRAYCONCAT7007
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with large arrays (10+ elements)
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7007";
      try {
        const arr1: FixedArray<double> = [1.0, 2.0, 3.0];
        const arr2: FixedArray<double> = [4.0, 5.0, 6.0];
        const arr3: FixedArray<double> = [7.0, 8.0, 9.0, 10.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(10);
        expect(result[9]).assertEqual(10.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0800
     * @tc.name   TESTBUILTINARRAYCONCAT7008
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with negative and positive numbers mixed
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7008";
      try {
        const arr1: FixedArray<double> = [-1.5];
        const arr2: FixedArray<double> = [2.3];
        const arr3: FixedArray<double> = [-3.7];
        const result = concat(arr1, arr2, arr3);
        expect(result[0]).assertEqual(-1.5);
        expect(result[1]).assertEqual(2.3);
        expect(result[2]).assertEqual(-3.7);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

  });
}