import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from '../../../testability/TestUtils';

export default function Int8ArrayTest() {
  describe('Int8ArrayTest', () => {
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
     * @tc.name   testInt8Array0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0100
     * @tc.desc   Testing the iterative ability of Int8Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0001";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int8Array.set(expectedValues);
        for (let i = 0; i < expectedValues.length; i++) {
          expect(int8Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0200
     * @tc.desc   Testing the iterative ability of Int8Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0002";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        int8Array.set(expectedValues);
        const normalArray: number[] = [...int8Array];
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
     * @tc.name   testInt8Array0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int8Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0003";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array();
        expect(int8Array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0400
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0004";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0500
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0005";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(0);
        expect(int8Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0600
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0006";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(10);
        expect(int8Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0700
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0007";
      try {
        let int8Array: collections.Int8Array = new collections.Int8Array(100000);
        expect(int8Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0800
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int8Array = new collections.Int8Array(arrayLike);
        expect(array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_0900
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Int8Array = new collections.Int8Array(arrayBuffer);
        expect(array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1000
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
        let array: collections.Int8Array = new collections.Int8Array(uint8Array);
        expect(array instanceof collections.Int8Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1100
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1200
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1300
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1400
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1500
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0015";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1600
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0016";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1700
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0017";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1800
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0018";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_1900
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0019";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2000
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0020";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, 2);
        expect(array.toString()).assertEqual('0,0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2100
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2200
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0022";
      try {
        let arrayLike = [];
        let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testInt8Array0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2300
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0023";
      try {
        let array: collections.Int8Array = collections.Int8Array.from<number>(
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
     * @tc.name   testInt8Array0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_INT8ARRAY_2400
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testInt8Array0024";
      try {
        let array: collections.Int8Array = collections.Int8Array.from<string>(
