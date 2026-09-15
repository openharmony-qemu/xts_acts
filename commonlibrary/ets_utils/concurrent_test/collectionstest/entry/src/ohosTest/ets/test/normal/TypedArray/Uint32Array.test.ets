
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { sleep } from '../../../testability/TestUtils';

export default function Uint32ArrayTest() {
  describe('Uint32ArrayTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0700
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_0900
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_1100
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
