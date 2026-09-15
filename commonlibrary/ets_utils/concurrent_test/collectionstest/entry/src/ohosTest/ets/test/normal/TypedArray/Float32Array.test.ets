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

export default function Float32ArrayTest() {
  describe('Float32ArrayTest', () => {
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
     * @tc.name   testFloat32Array0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0100
     * @tc.desc   Testing the iterative ability of Float32Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0001";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        float32Array.set(expectedValues);
        for (let i = 0; i < float32Array.length; i++) {
          expect(float32Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0200
     * @tc.desc   Testing the iterative ability of Float32Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0002";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        float32Array.set(expectedValues);
        const normalArray: number[] = [...float32Array];
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
     * @tc.name   testFloat32Array0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Float32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0003";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array();
        expect(float32Array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0400
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0004";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0005";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(0);
        expect(float32Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0006";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(10);
        expect(float32Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0007";
      try {
        let float32Array: collections.Float32Array = new collections.Float32Array(100000);
        expect(float32Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0800
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Float32Array = new collections.Float32Array(arrayBuffer);
        expect(array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let int32Array: collections.Int32Array = new collections.Int32Array(arrayLike);
        let array: collections.Float32Array = new collections.Float32Array(int32Array);
        expect(array instanceof collections.Float32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0015";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0016";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0017";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0018";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0019";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0020";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Float32Array = new collections.Float32Array(float32Array.buffer, 2, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1.5, 3.5, 5.5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0021";
      try {
        let arrayLike = [1.5, 3.5, 5.5];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        expect(array.toString()).assertEqual('1.5,3.5,5.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0022";
      try {
        let arrayLike = [];
        let array: collections.Float32Array = collections.Float32Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2300
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0023";
      try {
        let array: collections.Float32Array = collections.Float32Array.from<number>(
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
     * @tc.name   testFloat32Array0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2400
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0024";
      try {
        let array: Float32Array = Float32Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2500
     * @tc.desc   Testing the array-like map function created from a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0025";
      try {
        let array: Float32Array = Float32Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2600
     * @tc.desc   Testing the array-like map function created from a num array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0026";
      try {
        let array: collections.Float32Array = collections.Float32Array.from<number>(
          [1.1, 3.3, 5.5], (v: number, k: number) => v
        );
        expect(array.toString()).assertEqual('1.100000023841858,3.299999952316284,5.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2700
     * @tc.desc   Testing the array-like map function created from a nesting array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0027";
      try {
        let nestedArray: number[][] = [[1.1, 2.2], [3.3, 4.4], [5.5, 6.6]];
        let array: collections.Float32Array = collections.Float32Array.from<number>(
          ([] as number[]).concat(...nestedArray),
          (v: number) => v
        );
        expect(array.toString())
          .assertEqual('1.100000023841858,2.200000047683716,3.299999952316284,4.400000095367432,5.5,6.599999904632568');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Float32Array = collections.Float32Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Float32Array = collections.Float32Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0030";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0031";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0032";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0033";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0034";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0035";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0036";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0037";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0038";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0039";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0040";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0041";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0042";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0043";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0044";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0045";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0046";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0047";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0048";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0049";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0050";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0051";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0052";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0053";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0054";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0055";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0056";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0057";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0058";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0059";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0060";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0061";
      try {
        let array: collections.Float32Array = collections.Float32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Float32Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0062";
      try {
        let arrayLike = [12.7, 20.4, 300.5, -5.9, 127.6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.some((element: number) => element < -5)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0063";
      try {
        let arrayLike = [12.7, 20.4, 300.5, -5.9, 127.6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.some((element: number) => element == 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0064";
      try {
        let arrayLike = [10.5, 20.8, 30.1, 40.2, 50.6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.some((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6500
     * @tc.desc   Testing whether it returns true when all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0065";
      try {
        let arrayLike = [-1.0, 2.0, -3.0, 4.0, -5.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.every((element: number) => element < 10.0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0066";
      try {
        let arrayLike = [-1.0, 2.0, -3.0, 4.0, -5.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.every((element: number) => element < 0.0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0067";
      try {
        let arrayLike = [-1.0, 2.0, -3.0, 4.0, -5.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);
        expect(float32Array.every((element: number) => element > 5.0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let float32Array1: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4);
        let float32Array2: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, 1);
        let float32Array3: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, 1, 2);
        expect(float32Array1.toString()).assertEqual('4,4,4');
        expect(float32Array2.toString()).assertEqual('1,4,4');
        expect(float32Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, -1);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, 2);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4, -1, 10);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7300
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0073";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, -1);
        expect(float32Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7400
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0074";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7500
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0075";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, 2);
        expect(float32Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7600
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0076";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 0, 10);
        expect(float32Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7700
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0077";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, -1);
        expect(float32Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7800
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0078";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, 0);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_7900
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0079";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, 2);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8000
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0080";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 2, 10);
        expect(float32Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8100
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0081";
      try {
        let arrayLike = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
        let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike).fill(4.0, 10, -1);
        expect(float32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testFloat32Array0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FLOAT32ARRAY_8200
     * @tc.desc   Testing the filling of an ArkTS Float32Array within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloat32Array0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testFloat32Array0082";
      try {
