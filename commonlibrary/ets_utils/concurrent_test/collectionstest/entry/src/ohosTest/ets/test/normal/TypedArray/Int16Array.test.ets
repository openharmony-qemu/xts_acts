/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from '../../../testability/TestUtils';

export default function Int16ArrayTest() {
  describe('Int16ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(20);
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
     * @tc.name   testInt16Array0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0100
     * @tc.desc   Testing the iterative ability of Int16Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0001";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int16Array.set(expectedValues);
        for (let i = 0; i < int16Array.length; i++) {
          expect(int16Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0200
     * @tc.desc   Testing the iterative ability of Int16Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0002";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int16Array.set(expectedValues);
        const normalArray: number[] = [...int16Array];
        for (let i = 0; i < expectedValues.length; i++) {
          expect(normalArray[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int16Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0003";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array();
        expect(int16Array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0400
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0004";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0005";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(0);
        expect(int16Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0006";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(10);
        expect(int16Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0007";
      try {
        let int16Array: collections.Int16Array = new collections.Int16Array(100000);
        expect(int16Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0800
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Int16Array = new collections.Int16Array(arrayBuffer);
        expect(array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(arrayLike);
        let array: collections.Int16Array = new collections.Int16Array(uint16Array);
        expect(array instanceof collections.Int16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0015";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0016";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0017";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0018";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 2, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0019";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0020";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int16Array = new collections.Int16Array(int16Array.buffer, 2, 2);
        expect(array.toString()).assertEqual('2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0022";
      try {
        let arrayLike = [];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2300
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0023";
      try {
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          {
            length: 5
          }, (v: Object, k: number) => k);
        expect(array.toString()).assertEqual('0,1,2,3,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2400
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0024";
      try {
        let array: Int16Array = Int16Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2500
     * @tc.desc   Testing the array-like map function created from a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0025";
      try {
        let array: Int16Array = Int16Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2600
     * @tc.desc   Testing the array-like map function created from a num array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0026";
      try {
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          [1, 3, 5], (v: number, k: number) => v
        );
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2700
     * @tc.desc   Testing the array-like map function created from a nesting array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Int16Array = collections.Int16Array.from<number>(
          ([] as number[]).concat(...nestedArray),
          (v: number) => v
        );
        expect(array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Int16Array = collections.Int16Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Int16Array = collections.Int16Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0030";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0031";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0032";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0033";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0034";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0035";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0036";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0037";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0038";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0039";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0040";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0041";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0042";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0043";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0044";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0045";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0046";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0047";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0048";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0049";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0050";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0051";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0052";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0053";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0054";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0055";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0056";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0057";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0058";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0059";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0060";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0061";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Int16Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0062";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.some((element: number) => element < 0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0063";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.some((element: number) => element == 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0064";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.some((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6500
     * @tc.desc   Testing whether it returns true when all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0065";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.every((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0066";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.every((element: number) => element < 20)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0067";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        expect(int16Array.every((element: number) => element > 50)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let int16Array1: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4);
        let int16Array2: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 1);
        let int16Array3: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 1, 2);
        expect(int16Array1.toString()).assertEqual('4,4,4');
        expect(int16Array2.toString()).assertEqual('1,4,4');
        expect(int16Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, -1);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, 2);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, -1, 10);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, -1);
        expect(int16Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7500
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, 2);
        expect(int16Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7600
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 0, 10);
        expect(int16Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7700
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, -1);
        expect(int16Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_7900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, 2);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 2, 10);
        expect(int16Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, -1);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, 0);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, 2);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike).fill(4, 10, 10);
        expect(int16Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8500
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let filtered: collections.Int16Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8600
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0086";
      try {
        let arrayLike = [];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let filtered: collections.Int16Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8700
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let filtered1: collections.Int16Array = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Int16Array = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8800
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_8900
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0089";
      try {
        let arrayLike = [];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9000
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res1 = array.find((element: number) => element > 4);
        expect(res1).assertEqual(undefined);
        array.set([5, 6], 2);
        let res2 = array.find((element: number) => element > 4);
        expect(res2).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9100
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9200
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9300
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let res = array.find((element: number) => element == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9400
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Int16Array = collections.Int16Array.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Int16Array = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9500
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0095";
      try {
        const array: collections.Int16Array = collections.Int16Array.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9600
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0096";
      try {
        const array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9700
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0097";
      try {
        const array: collections.Int16Array = collections.Int16Array.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9800
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0098";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([]);
        let res = false;
        int16Array.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(int16Array.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_9900
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0099";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let res = false;
        int16Array.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,3');
          expect(array.length).assertEqual(3);
          res = true;
        });
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10000
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0100";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        int16Array.set([5, 6], 2);
        let res = false;
        int16Array.forEach((value: number, index: number, array: collections.Int16Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          expect(array.toString()).assertEqual('1,2,5,6,5');
          expect(array.length).assertEqual(5);
          res = true;
        });
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10100
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0101";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10200
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0102";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10300
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0103";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3]);
        array.set([4, 5], 1);
        let res = array.indexOf(4);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10400
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0104";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, -1);
        expect(res).assertEqual(array.length - 1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10500
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0105";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 5);
        expect(res).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10600
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0106";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3);
        expect(res).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10700
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0107";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 3);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10800
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0108";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
        let res = array.indexOf(3, 9);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_10900
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0109";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let joined: string = array.join('');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11000
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0110";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let joined: string = array.join('-');
        expect(joined).assertEqual("");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11100
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0111";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join();
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11200
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0112";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join('');
        expect(joined).assertEqual("12345");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11300
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0113";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(undefined);
        expect(joined).assertEqual("1,2,3,4,5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11400
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0114";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("/");
        expect(joined).assertEqual("1/2/3/4/5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11500
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0115";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join(",。\￥·");
        expect(joined).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11600
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0116";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("녕하こんйте");
        expect(joined).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11700
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0117";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let joined: string = array.join("，");
        expect(joined).assertEqual("1，2，3，4，5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11800
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0118";
      try {
        let array: collections.Int16Array = new collections.Int16Array([]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("");
        expect(mapped.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_11900
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0119";
      try {
        let array: collections.Int16Array = new collections.Int16Array([25, 36, 49]);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,7");
        expect(mapped.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12000
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0120";
      try {
        let array: collections.Int16Array = new collections.Int16Array([25, 36, 49, 100, 256]);
        array.set([81, 64], 2);
        const mapped = array.map(Math.sqrt);
        expect(mapped.toString()).assertEqual("5,6,9,8,16");
        expect(mapped.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12100
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0121";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        array.reduce((accumulator: number, value: number) => accumulator + value);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12200
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0122";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let expectedValues: number[] = [1, 3, 6, 10, 15];
        let reducedValue: number = array.reduce((accumulator: number, value: number, index: number) => {
          let newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        });
        expect(reducedValue).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12300
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0123";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        const initialAccumulator = 8;
        const expectedValues: number[] = [9, 11, 14, 18, 23];
        let reducedValue: number = array.reduce((accumulator: number, value: number, index: number) => {
          const newAccumulator = accumulator + value;
          expect(newAccumulator).assertEqual(expectedValues[index]);
          return newAccumulator;
        }, initialAccumulator);
        expect(reducedValue).assertEqual(23);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12400
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0124";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([1, 2, 3, 4, 5]);
        let initialValue = "initialValue";
        let reducedValue: string = array.reduce<string>((accumulator: string, value: number) =>
        accumulator + value, initialValue);
        expect(reducedValue).assertEqual('initialValue12345');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12500
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16Array0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt16Array0125";
      try {
        let array: collections.Int16Array = collections.Int16Array.from([]);
        let reversed: collections.Int16Array = array.reverse();
        expect(reversed.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt16Array0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT16ARRAY_12600
