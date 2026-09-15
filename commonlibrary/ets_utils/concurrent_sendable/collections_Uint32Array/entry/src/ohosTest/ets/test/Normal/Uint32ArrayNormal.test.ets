
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from './TestUtils';

export default function Uint32ArrayNormalTest() {
  describe('Uint32ArrayNormalTest', () => {
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
     * @tc.name   testUint32Array0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0001
     * @tc.desc   Testing the iterative ability of Uint32Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0001";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint32Array.set(expectedValues);
        for (let i = 0; i < uint32Array.length; i++) {
          expect(uint32Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0002
     * @tc.desc   Testing the iterative ability of Uint32Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0002";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint32Array.set(expectedValues);
        const normalArray: number[] = [...uint32Array];
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
     * @tc.name   testUint32Array0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint32Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0003";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array();
        expect(uint32Array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0004
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0004";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0005";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(0);
        expect(uint32Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0006";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
        expect(uint32Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0007";
      try {
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(100000);
        expect(uint32Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0008
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Uint32Array = new collections.Uint32Array(arrayBuffer);
        expect(array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0010
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let int32Array: collections.Int32Array = new collections.Int32Array(arrayLike);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array);
        expect(array instanceof collections.Uint32Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0011
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0012
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0013
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0014
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0015
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0015";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0016
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0016";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0017
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0017";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 2);
        expect(array.toString()).assertEqual('1,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0018
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0018";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 2, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0019
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0019";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 2, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0020
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0020";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 2, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0021
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0021";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0022
     * @tc.desc   Testing the 'from' interface with an array-like structure [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0022";
      try {
        let arrayLike = [];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0023
     * @tc.desc   Testing the array-like map function created from an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0023";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from<number>(
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
     * @tc.name   testUint32Array0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0024
     * @tc.desc   Testing the array-like map function created from a character array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0024";
      try {
        let array: Uint32Array = Uint32Array.from<string>(
          ["1", "3", "5"], (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0025
     * @tc.desc   Testing the array-like map function created from a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0025";
      try {
        let array: Uint32Array = Uint32Array.from<string>(
          "12345", (v: string, k: number) => parseInt(v));
        expect(array.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0026
     * @tc.desc   Testing the array-like map function created from a num array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0026";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from<number>(
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
     * @tc.name   testUint32Array0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0027
     * @tc.desc   Testing the array-like map function created from a nesting array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0027";
      try {
        let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
        let array: collections.Uint32Array = collections.Uint32Array.from<number>(
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
     * @tc.name   testUint32Array0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0028
     * @tc.desc   Testing the array-like map function without specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0028";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint32Array = collections.Uint32Array.from(set);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0029
     * @tc.desc   Testing the array-like map function with specifying a mapping function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0029";
      try {
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let array: collections.Uint32Array = collections.Uint32Array.from(
          set, (v: number, k: number) => v + k);
        expect(array.toString()).assertEqual('1,3,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0030
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0030";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(3, 1, 3);
        expect(copied.toString()).assertEqual('1,2,3,2,3,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0031
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0031";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0032
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0032";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0033
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0033";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0034
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0034";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0035
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0035";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0036
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0036";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0037
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0037";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0038
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0038";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0039
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0039";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0040
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0040";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(-1, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0041
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0041";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0042
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0042";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0043
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0043";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0044
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0044";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0045
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0045";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 0, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0046
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0046";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, -1);
        expect(copied.toString()).assertEqual('3,4,5,6,7,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0047
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0047";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0048
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0048";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0049
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0049";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 2, 10);
        expect(copied.toString()).assertEqual('3,4,5,6,7,8,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0050
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0050";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(0, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0051
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0051";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, -1, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0052
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0052";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, -1);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0053
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0053";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0054
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0054";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, 2);
        expect(copied.toString()).assertEqual('1,2,1,2,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0055
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0055";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 0, 10);
        expect(copied.toString()).assertEqual('1,2,1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0056
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0056";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, -1);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0057
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0057";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, 0);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0058
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0058";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, 2);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0059
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0059";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 2, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0060
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0060";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(2, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0061
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0061";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
        let copied: collections.Uint32Array = array.copyWithin(10, 10, 10);
        expect(copied.toString()).assertEqual('1,2,3,4,5,6,7,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0062
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0062";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.some((element: number) => element == 4294967286)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0063
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0063";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.some((element: number) => element < 0)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0064
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0064";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.some((element: number) => element >= 0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0065
     * @tc.desc   Testing whether it returns true when all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0065";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.every((element: number) => element >= 20)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0066
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0066";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.every((element: number) => element < 30)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0067
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0067";
      try {
        let arrayLike = [-10, 20, -30, 40, -50];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
        expect(uint32Array.every((element: number) => element < 20)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0068
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0068";
      try {
        let arrayLike = [1, 2, 3];
        let uint32Array1: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4);
        let uint32Array2: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 1);
        let uint32Array3: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 1, 2);
        expect(uint32Array1.toString()).assertEqual('4,4,4');
        expect(uint32Array2.toString()).assertEqual('1,4,4');
        expect(uint32Array3.toString()).assertEqual('1,4,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0069
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0069";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, -1);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0070
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0070";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0071
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0071";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 2);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0072
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0072";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 10);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0073
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0073";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, -1);
        expect(uint32Array.toString()).assertEqual('4,4,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0074
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0074";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0075
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0075";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 2);
        expect(uint32Array.toString()).assertEqual('4,4,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0076
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0076";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 10);
        expect(uint32Array.toString()).assertEqual('4,4,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0077
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0077";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, -1);
        expect(uint32Array.toString()).assertEqual('1,2,4,4,4,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0078
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0078";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0079
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0079";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 2);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0080
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0080";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 10);
        expect(uint32Array.toString()).assertEqual('1,2,4,4,4,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0081
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0081";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, -1);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0082
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0082";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 0);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0083
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0083";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 2);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0084
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0084";
      try {
        let arrayLike = [1, 2, 3, 4, 5, 6];
        let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 10);
        expect(uint32Array.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0085
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0085";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let filtered: collections.Uint32Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.toString()).assertEqual('0,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0086
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0086";
      try {
        let arrayLike = [];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let filtered: collections.Uint32Array = array.filter((element: number) => element % 2 == 0);
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0087
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0087";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let filtered1: collections.Uint32Array = array.filter((element: number) => element > 4);
        expect(filtered1.length).assertEqual(0);
        array.set([5, 6], 2);
        let filtered2: collections.Uint32Array = array.filter((element: number) => element > 4);
        expect(filtered2.toString()).assertEqual('5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0088
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0088";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0089
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meets the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0089";
      try {
        let arrayLike = [];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element > 2);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0090
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0090";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
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
     * @tc.name   testUint32Array0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0091
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0091";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((index: number) => index == -1);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0092
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0092";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element == 0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0093
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0093";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let res = array.find((element: number) => element == 10);
        expect(res).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0094
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0094";
      try {
        let arrayLike = [0, 1, 2, 3, 4];
        let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
        let condition = (element: number) => element > 0;
        let res = array.find(condition);
        let filtered: collections.Uint32Array = array.filter(condition);
        expect(res).assertEqual(filtered[0]);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0095
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0095";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0096
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0096";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0097
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0097";
      try {
        const array: collections.Uint32Array = collections.Uint32Array.from([1, 3, 5]);
        let foundIndex: number = array.findIndex((element: number) => element % 2 === 0);
        expect(foundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0098
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0098";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([]);
        let res = false;
        uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
          console.info(`Element ${value} at index ${index} in array ${array}`);
          res = true;
        });
        expect(uint32Array.length).assertEqual(0);
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0099
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0099";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        let res = false;
        uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0100
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0100";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
        uint32Array.set([5, 6], 2);
        let res = false;
        uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
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
     * @tc.name   testUint32Array0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0101
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0101";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([]);
        let res = array.indexOf(3);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0102
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0102";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
        let res = array.indexOf(4);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint32Array0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0103
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32Array0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint32Array0103";
      try {
        let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3]);
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
     * @tc.name   testUint32Array0104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_NORMAL_0104
