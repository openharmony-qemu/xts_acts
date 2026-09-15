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

export default function Uint8ClampedArrayTest() {
  describe('Uint8ClampedArrayTest', () => {
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
     * @tc.name   testUint8ClampedArray0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0100
     * @tc.desc   Testing the iterative ability of Uint8ClampedArray using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0001";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint8ClampedArray.set(expectedValues);
        for (let i = 0; i < uint8ClampedArray.length; i++) {
          expect(uint8ClampedArray[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0200
     * @tc.desc   Testing the iterative ability of Uint8ClampedArray using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0002";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint8ClampedArray.set(expectedValues);
        const normalArray: number[] = [...uint8ClampedArray];
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
     * @tc.name   testUint8ClampedArray0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint8ClampedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0003";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
        expect(uint8ClampedArray instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0400
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0004";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0005";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(0);
        expect(uint8ClampedArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0006";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
        expect(uint8ClampedArray.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0007";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(100000);
        expect(uint8ClampedArray.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0800
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(array instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayBuffer);
        expect(array instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0010";
      try {
        let arrayLike = [1, 3, 5];
        let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8Array);
        expect(array instanceof collections.Uint8ClampedArray).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0015";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0016";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0017";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0018";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0019";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0020";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, 2);
        expect(array.toString()).assertEqual('3,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0022";
      try {
        let arrayLike = [];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2300
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0023";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
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
     * @tc.name   testUint8ClampedArray0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2400
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0024";
      try {
        let array: Uint8ClampedArray = Uint8ClampedArray.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2500
     * @tc.desc   Testing the array-like map function created from a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0025";
      try {
        let array: Uint8ClampedArray = Uint8ClampedArray.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2600
     * @tc.desc   Testing the array-like map function created from a num array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0026";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
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
     * @tc.name   testUint8ClampedArray0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2700
     * @tc.desc   Testing the array-like map function created from a nesting array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
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
     * @tc.name   testUint8ClampedArray0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2800
     * @tc.desc   Testing the array-like map function without specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_2900
     * @tc.desc   Testing the array-like map function with specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0030";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0031";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0032";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0033";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0034";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0035";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0036";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0037";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0038";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_3900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0039";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0040";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0041";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0042";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0043";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0044";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0045";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0046";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0047";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0048";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_4900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0049";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0050";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0051";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5200
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0052";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5300
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0053";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5400
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0054";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5500
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0055";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5600
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0056";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5700
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0057";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5800
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0058";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_5900
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0059";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6000
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0060";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6100
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0061";
      try {
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint8ClampedArray = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6200
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0062";
      try {
        let arrayLike = [-10, 20, 300, 40, -50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.some((element: number) => element == 0)).assertEqual(true);
        expect(uint8ClampedArray.some((element: number) => element == 255)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6300
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0063";
      try {
        let arrayLike = [-10, 20, 300, 40, -50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.some((element: number) => element == 300)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6400
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0064";
      try {
        let arrayLike = [-10, 20, 300, 40, -50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.some((element: number) => element >= 0)).assertEqual(true);
        expect(uint8ClampedArray.some((element: number) => element <= 255)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6500
     * @tc.desc   Testing whether it returns true when all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0065";
      try {
        let arrayLike = [10, 20, 30, 40, 50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.every((element: number) => element < 100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6600
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0066";
      try {
        let arrayLike = [10, 20, 30, 40, 50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.every((element: number) => element < 30)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6700
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0067";
      try {
        let arrayLike = [10, 20, 30, 40, 50];
        let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
        expect(uint8ClampedArray.every((element: number) => element > 50)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0068";
      try {
        let arrayLike = [1, 2, 3];
        let uint8ClampedArray1: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4);
        let uint8ClampedArray2: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 1);
        let uint8ClampedArray3: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 1, 2);
        expect(uint8ClampedArray1.toString()).assertEqual('4,4,4');
        expect(uint8ClampedArray2.toString()).assertEqual('1,4,4');
        expect(uint8ClampedArray3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_6900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, -1);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 2);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 10);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, -1);
        expect(uint8ClampedArray.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7500
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 2);
        expect(uint8ClampedArray.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7600
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 10);
        expect(uint8ClampedArray.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7700
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, -1);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7800
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_7900
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 2);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8000
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 10);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8100
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, -1);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8200
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 0);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8300
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 2);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8400
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint8ClampedArray: collections.Uint8ClampedArray =
          new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 10);
        expect(uint8ClampedArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8500
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let filtered: collections.Uint8ClampedArray = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8600
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0086";
      try {
        let arrayLike = [];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let filtered: collections.Uint8ClampedArray = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8700
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let filtered1: collections.Uint8ClampedArray = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Uint8ClampedArray = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8800
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_8900
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0089";
      try {
        let arrayLike = [];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9000
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
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
     * @tc.name   testUint8ClampedArray0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9100
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9200
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArray0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint8ClampedArray0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint8ClampedArray0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT8CLAMPED_ARRAY_9300
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
