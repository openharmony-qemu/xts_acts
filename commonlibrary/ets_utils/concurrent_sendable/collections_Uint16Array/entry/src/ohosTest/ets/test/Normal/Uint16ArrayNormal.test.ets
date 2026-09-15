
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from './TestUtils';

export default function Uint16ArrayNormalTest() {
  describe('Uint16ArrayNormalTest', () => {
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
     * @tc.name   testUint16Array0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0001
     * @tc.desc   Testing the iterative ability of Uint16Array using a for loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0001";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint16Array.set(expectedValues);
        for (let i = 0; i < uint16Array.length; i++) {
          expect(uint16Array[i]).assertEqual(expectedValues[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0002
     * @tc.desc   Testing the iterative ability of Uint16Array using ... deconstruction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0002";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(10);
        const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        uint16Array.set(expectedValues);
        const normalArray: number[] = [...uint16Array];
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
     * @tc.name   testUint16Array0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint16Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0003";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array();
        expect(uint16Array instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0004
     * @tc.desc   Testing ArrayLength constructs -1 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0004";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0005";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(0);
        expect(uint16Array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0006";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(10);
        expect(uint16Array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0007";
      try {
        let uint16Array: collections.Uint16Array = new collections.Uint16Array(100000);
        expect(uint16Array.length).assertEqual(100000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0008
     * @tc.desc   Testing construct an object from an ArrayLike.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0008";
      try {
        let arrayLike = [1, 3, 5];
        let array: collections.Uint16Array = new collections.Uint16Array(arrayLike);
        expect(array instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
        let array: collections.Uint16Array = new collections.Uint16Array(arrayBuffer);
        expect(array instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0010
     * @tc.desc   Testing construct an object from another ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0010";
      try {
        let arrayLike = [1, 3, 5];
        let int16Array: collections.Int16Array = new collections.Int16Array(arrayLike);
        let array: collections.Uint16Array = new collections.Uint16Array(int16Array);
        expect(array instanceof collections.Uint16Array).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0011
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0011";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([]);
        let array: collections.Uint16Array = new collections.Uint16Array(int32Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0012
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0012";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint16Array = new collections.Uint16Array(int32Array.buffer, -1, 0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0013
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0013";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint16Array = new collections.Uint16Array(int32Array.buffer, -1, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0014
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0014";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint16Array = new collections.Uint16Array(int32Array.buffer, -1, 2);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0015
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0015";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint16Array = new collections.Uint16Array(uint16Array.buffer, 0, 0);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0016
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16Array0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testUint16Array0016";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6]);
        let array: collections.Uint16Array = new collections.Uint16Array(uint16Array.buffer, 0, -1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
      done()
    })
    /**
     * @tc.name   testUint16Array0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_NORMAL_0017
