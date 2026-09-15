
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';
import { sleep } from './TestUtils';

@Sendable
export class ImplISendableClass implements lang.ISendable {
  count: number = 0;
  getNum() {
    return this.count;
  }
}

export default function ArrayNormalTest() {
  describe('ArrayNormalTest', () => {
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
     * @tc.name   testCollectionsArray0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0001
     * @tc.desc   Testing Collections of Array, create collection Array 1~10, for this Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0001";
      try {
          let newArray : collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
          console.info("newArray is: ", newArray);
          let tempNum : number = 1;
          for (let item of newArray) {
            console.info(`value : ${item}`);
            expect(item).assertEqual(tempNum);
            tempNum = tempNum + 1;
          }
      } catch (err) {
       console.error(`${TAG} failed, error: ${err}`);
       expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0002
     * @tc.desc   Testing Collections of Array with ...,create collection Array 1~10, for this Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0002";
      try {
        let newArray : collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.info("newArray is: ", newArray);
        let tempArray = new collections.Array<number>(...newArray);
        console.info("tempArray is: ", tempArray);
        let tempNum : number = 1;
        for (let item of tempArray) {
          console.info(`value : ${item}`);
          expect(item).assertEqual(tempNum);
          tempNum = tempNum + 1;
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0003
     * @tc.desc   Testing Collections of Array Constructor, not new.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0003";
      try {
        let array : collections.Array<number> = new collections.Array<number>(1);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('1');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0004
     * @tc.desc   Testing Collections of Array Constructor, param string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0004";
      try {
        let array : collections.Array<string> = new collections.Array<string>('a', 'b');
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('a,b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0005
     * @tc.desc   Testing Collections of Array Constructor, param number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0005";
      try {
        let array : collections.Array<number> = new collections.Array<number>(1, 2, 3);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0006
     * @tc.desc   Testing Collections of Array Constructor, param boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0006";
      try {
        let array : collections.Array<boolean> = new collections.Array<boolean>(true, false, true);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('true,false,true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0007
     * @tc.desc   Testing Collections of Array Constructor, param undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0007";
      try {
        let array : collections.Array<undefined> = new collections.Array<undefined>(undefined);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0008
     * @tc.desc   Testing Collections of Array Constructor, param null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0008";
      try {
        let array : collections.Array<null> = new collections.Array<null>(null);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0009
     * @tc.desc   Testing Collections of Array Constructor, param bigint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0009";
      try {
        let num1 : bigint = 98765432109876543210n;
        let num2 : bigint = 12345678901234567890n;
        let array : collections.Array<bigint> = new collections.Array<bigint>(num1, num2);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('98765432109876543210,12345678901234567890');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    //=====================================================================
    //=====================================================================
    /**
     * @tc.name   testCollectionsArray0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0010
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0010";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let concatArray1 : collections.ConcatArray<number> = new collections.Array<number>(6, 8);
        let newArray : collections.Array<collections.ConcatArray<number>> =
          new collections.Array<collections.ConcatArray<number>>(concatArray);
        newArray.push(concatArray1);
        console.info("newArray is: ", newArray);
        expect(newArray.toString()).assertEqual('1,2,4,6,8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0011
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0011";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let newArray : collections.Array<collections.ConcatArray<number>> =
          new collections.Array<collections.ConcatArray<number>>(concatArray);
        newArray.pop();
        console.info("newArray is: ", newArray);
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0012
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0012";
      try {
        let concatArray : collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let newArray : collections.Array<collections.ConcatArray<number>> =
          new collections.Array<collections.ConcatArray<number>>(concatArray);
        console.info("newArray is: ", newArray);
        console.info("newArray.at(0) is: ", newArray[0]);
        expect(newArray[0].toString()).assertEqual('1,2,4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0013
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.push element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0013";
      try {
        let array: collections.Array<number> = new collections.Array<number>(1,2,3);
        let newArray : collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(array);
        let array1: collections.Array<number> = new collections.Array<number>(4,5,6);
        newArray.push(array1);
        expect(newArray.toString()).assertEqual('1,2,3,4,5,6');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0014
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.pop element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0014";
      try {
        let array: collections.Array<number> = new collections.Array<number>(1,2,3);
        let newArray : collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(array);
        let array1: collections.Array<number> = new collections.Array<number>(4,5,6);
        newArray.push(array1);
        expect(newArray.toString()).assertEqual('1,2,3,4,5,6');
        newArray.pop();
        expect(newArray.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0015
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.index element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0015";
      try {
        let array: collections.Array<number> = new collections.Array<number>(1,2,3);
        let newArray : collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(array);
        expect(newArray[0].toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0016
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0016";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let newArray : collections.Array<collections.ArrayBuffer> =
          new collections.Array<collections.ArrayBuffer>(arrayBuffer);
        let arrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        newArray.push(arrayBuffer1);
        expect(newArray[0].byteLength).assertEqual(10);
        expect(newArray[1].byteLength).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0017
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0017";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let newArray : collections.Array<collections.ArrayBuffer> =
          new collections.Array<collections.ArrayBuffer>(arrayBuffer);
        let arrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(20);
        newArray.push(arrayBuffer1);
        expect(newArray[0].byteLength).assertEqual(10);
        expect(newArray[1].byteLength).assertEqual(20);
        newArray.pop();
        expect(newArray[0].byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0018
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0018";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
        let newArray : collections.Array<collections.ArrayBuffer> =
          new collections.Array<collections.ArrayBuffer>(arrayBuffer);
        expect(newArray[0].byteLength).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0019
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0019";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Int8Array> =
          new collections.Array<collections.Int8Array>(int8Array);
        let int8Array1: collections.Int8Array = collections.Int8Array.from([8,9]);
        newArray.push(int8Array1);
        expect(newArray.toString()).assertEqual('-1,2,3,8,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0020
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0020";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Int8Array> =
          new collections.Array<collections.Int8Array>(int8Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0021
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0021";
      try {
        let int8Array: collections.Int8Array = collections.Int8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Int8Array> =
          new collections.Array<collections.Int8Array>(int8Array);
        let int8Array1: collections.Int8Array = collections.Int8Array.from([8,9]);
        newArray.push(int8Array1);
        expect(newArray[0].includes(-1)).assertEqual(true);
        expect(newArray[1].toString()).assertEqual('8,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0022
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0022";
      try {
        let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Uint8Array> =
          new collections.Array<collections.Uint8Array>(uint8Array);
        let uint8Array1: collections.Uint8Array = collections.Uint8Array.from([8,9]);
        newArray.push(uint8Array1);
        expect(newArray.toString()).assertEqual('255,2,3,8,9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0023
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0023";
      try {
        let int8Array: collections.Uint8Array = collections.Uint8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Uint8Array> =
          new collections.Array<collections.Uint8Array>(int8Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0024
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0024";
      try {
        let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1,2,3]);
        let newArray : collections.Array<collections.Uint8Array> =
          new collections.Array<collections.Uint8Array>(uint8Array);
        let uint8Array1: collections.Uint8Array = collections.Uint8Array.from([8,9]);
        newArray.push(uint8Array1);
        expect(newArray[0].includes(255)).assertEqual(true);
        expect(newArray[1].includes(9)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0025
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0025";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint8ClampedArray> =
          new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
        let uint8ClampedArray1: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([150,300]);
        newArray.push(uint8ClampedArray1);
        expect(newArray.toString()).assertEqual('0,50,90,150,255');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0026
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0026";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint8ClampedArray> =
          new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0027
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0027";
      try {
        let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint8ClampedArray> =
          new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
        let uint8ClampedArray1: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([300]);
        newArray.push(uint8ClampedArray1);
        expect(newArray[0].includes(0)).assertEqual(true);
        expect(newArray[1].includes(255)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0028
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0028";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([-10,50]);
        let newArray : collections.Array<collections.Int16Array> =
          new collections.Array<collections.Int16Array>(int16Array);
        let int16Array1: collections.Int16Array = collections.Int16Array.from([100]);
        newArray.push(int16Array1);
        expect(newArray.toString()).assertEqual('-10,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0029
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0029";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([-10,50]);
        let newArray : collections.Array<collections.Int16Array> =
          new collections.Array<collections.Int16Array>(int16Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0030
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0030";
      try {
        let int16Array: collections.Int16Array = collections.Int16Array.from([-10,50,90]);
        let newArray : collections.Array<collections.Int16Array> =
          new collections.Array<collections.Int16Array>(int16Array);
        let int16Array1: collections.Int16Array = collections.Int16Array.from([300]);
        newArray.push(int16Array1);
        expect(newArray[0].includes(-10)).assertEqual(true);
        expect(newArray[1].includes(300)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0031
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0031";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint16Array> =
          new collections.Array<collections.Uint16Array>(uint16Array);
        let uint16Array1: collections.Uint16Array = collections.Uint16Array.from([100]);
        newArray.push(uint16Array1);
        expect(newArray.toString()).assertEqual('65526,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0032
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0032";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint16Array> =
          new collections.Array<collections.Uint16Array>(uint16Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0033
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0033";
      try {
        let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10,50,90]);
        let newArray : collections.Array<collections.Uint16Array> =
          new collections.Array<collections.Uint16Array>(uint16Array);
        let uint16Array1: collections.Uint16Array = collections.Uint16Array.from([300]);
        newArray.push(uint16Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(65526)).assertEqual(true);
        expect(newArray[1].includes(300)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0034
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0034";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([-10,50]);
        let newArray : collections.Array<collections.Int32Array> =
          new collections.Array<collections.Int32Array>(int32Array);
        let int32Array1: collections.Int32Array = collections.Int32Array.from([100]);
        newArray.push(int32Array1);
        expect(newArray.toString()).assertEqual('-10,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0035
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0035";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([-10,50]);
        let newArray : collections.Array<collections.Int32Array> =
          new collections.Array<collections.Int32Array>(int32Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0036
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0036";
      try {
        let int32Array: collections.Int32Array = collections.Int32Array.from([-10,50]);
        let newArray : collections.Array<collections.Int32Array> =
          new collections.Array<collections.Int32Array>(int32Array);
        let int32Array1: collections.Int32Array = collections.Int32Array.from([100]);
        newArray.push(int32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(-10)).assertEqual(true);
        expect(newArray[1].includes(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0037
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0037";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint32Array> =
          new collections.Array<collections.Uint32Array>(uint32Array);
        let uint32Array1: collections.Uint32Array = collections.Uint32Array.from([100]);
        newArray.push(uint32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('4294967286,50,100');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0038
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0038";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint32Array> =
          new collections.Array<collections.Uint32Array>(uint32Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0039
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0039";
      try {
        let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10,50]);
        let newArray : collections.Array<collections.Uint32Array> =
          new collections.Array<collections.Uint32Array>(uint32Array);
        let uint32Array1: collections.Uint32Array = collections.Uint32Array.from([100]);
        newArray.push(uint32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(4294967286)).assertEqual(true);
        expect(newArray[1].includes(100)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0040
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0040";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([0,5.0]);
        let newArray : collections.Array<collections.Float32Array> =
          new collections.Array<collections.Float32Array>(float32Array);
        let float32Array1: collections.Float32Array = collections.Float32Array.from([10.0]);
        newArray.push(float32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray.toString()).assertEqual('0,5,10');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0041
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0041";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([0,5.0]);
        let newArray : collections.Array<collections.Float32Array> =
          new collections.Array<collections.Float32Array>(float32Array);
        newArray.pop();
        expect(newArray.toString()).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0042
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0042";
      try {
        let float32Array: collections.Float32Array = collections.Float32Array.from([-1.0,5.0]);
        let newArray : collections.Array<collections.Float32Array> =
          new collections.Array<collections.Float32Array>(float32Array);
        let float32Array1: collections.Float32Array = collections.Float32Array.from([0]);
        newArray.push(float32Array1);
        console.info("newArray is: " + newArray);
        expect(newArray[0].includes(-1)).assertEqual(true);
        expect(newArray[1].includes(0)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0043
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0043";
      try {
        const testMap = new collections.Map<number, string>([
          [0, "foo"],
          [1, "bar"]
        ]);
        let newArray : collections.Array<collections.Map<number, string>> =
          new collections.Array<collections.Map<number, string>>(testMap);
        const testMap1 = new collections.Map<number, string>([
          [2, "xoo"]
        ]);
        newArray.push(testMap1);
        console.info("newArray is: " + newArray);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0044
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0044";
      try {
        const testMap = new collections.Map<number, string>([
          [0, "foo"],
          [1, "bar"]
        ]);
        let newArray : collections.Array<collections.Map<number, string>> =
          new collections.Array<collections.Map<number, string>>(testMap);
        console.info("newArray is: " + newArray);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0045
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0045";
      try {
        const testMap = new collections.Map<number, string>([
          [0, "foo"],
          [1, "bar"]
        ]);
        let newArray : collections.Array<collections.Map<number, string>> =
          new collections.Array<collections.Map<number, string>>(testMap);
        console.info("newArray is: " + newArray);
        const iterator = newArray[0].values();
        expect(iterator.next().value).assertEqual('foo');
        expect(iterator.next().value).assertEqual('bar');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0046
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0046";
      try {
        const testSet = new collections.Set<number>([1, 2]);
        let newArray : collections.Array<collections.Set<number>> =
          new collections.Array<collections.Set<number>>(testSet);
        const testSet1 = new collections.Set<number>([3]);
        newArray.push(testSet1);
        console.info("newArray is: " + newArray);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0047
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0047";
      try {
        const testSet = new collections.Set<number>([1, 2]);
        let newArray : collections.Array<collections.Set<number>> =
          new collections.Array<collections.Set<number>>(testSet);
        console.info("newArray is: " + newArray);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0048
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0048";
      try {
        const testSet = new collections.Set<number>([1, 2]);
        let newArray : collections.Array<collections.Set<number>> =
          new collections.Array<collections.Set<number>>(testSet);
        console.info("newArray is: " + newArray);
        const iterator = newArray[0].values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0049
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0049";
      try {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
        let newArray : collections.Array<collections.BitVector> =
          new collections.Array<collections.BitVector>(bitVector);
        let bitVector1: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0]
        newArray.push(bitVector1);
        console.info("newArray is: " + newArray);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0050
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0050";
      try {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
        let newArray : collections.Array<collections.BitVector> =
          new collections.Array<collections.BitVector>(bitVector);
        console.info("newArray is: " + newArray);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0051
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0051";
      try {
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0); // bitVector: [0, 1, 0, 1, 0]
        let newArray : collections.Array<collections.BitVector> =
          new collections.Array<collections.BitVector>(bitVector);
        console.info("newArray is: " + newArray);
        const iterator = newArray[0].values();
        expect(iterator.next().value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0052
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0052";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let lock2 = new ArkTSUtils.locks.AsyncLock();
        const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock1);
        newArray.push(lock2);
        expect(newArray.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0053
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0053";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let lock2 = new ArkTSUtils.locks.AsyncLock();
        const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock1);
        newArray.push(lock2);
        newArray.pop();
        expect(newArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0054
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0054";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock);
        expect(newArray.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0055
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0055";
      @Sendable
      class SendableTestClass {
        num: number = 5;
        getNum() {
          return this.num;
        }
      }
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const newArray = new collections.Array<SendableTestClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray[0].getNum()).assertEqual(10);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0056
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0056";
      @Sendable
      class SendableTestClass {
        num: number = 5;
        getNum() {
          return this.num;
        }
      }
      try {
        let sendableClass = new SendableTestClass();
        sendableClass.num = 10;
        const newArray = new collections.Array<SendableTestClass>(sendableClass);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0057
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0057";
      @Sendable
      class SendableTestClass {
        num: number = 5;
        getNum() {
          return this.num;
        }
      }
      try {
        let sendableClass1 = new SendableTestClass();
        sendableClass1.num = 10;
        let sendableClass2 = new SendableTestClass();
        sendableClass2.num = 20;
        const newArray = new collections.Array<SendableTestClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray.length).assertEqual(2);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0058
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0058";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 10;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 20;
        const newArray = new collections.Array<ImplISendableClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray[0].getNum()).assertEqual(10);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0059
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0059";
      try {
        let sendableClass = new ImplISendableClass();
        sendableClass.count = 10;
        const newArray = new collections.Array<ImplISendableClass>(sendableClass);
        newArray.pop();
        expect(newArray.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0060
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0060";
      try {
        let sendableClass1 = new ImplISendableClass();
        sendableClass1.count = 10;
        let sendableClass2 = new ImplISendableClass();
        sendableClass2.count = 20;
        const newArray = new collections.Array<ImplISendableClass>(sendableClass1);
        newArray.push(sendableClass2);
        expect(newArray.length).assertEqual(2);
        expect(newArray[1].getNum()).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0061
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0061";
      try {
        let newArray = new collections.Array<number|string>(1);
        newArray.push('a');
        expect(newArray[0]).assertEqual(1);
        expect(newArray[1]).assertEqual('a');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0062
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0062";
      try {
        let newArray = new collections.Array<number|string>(1,'a',2,'b');
        newArray.pop();
        expect(newArray.toString()).assertEqual('1,a,2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0063
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0063";
      try {
        let newArray = new collections.Array<number|string>(1,'a',2,'b');
        expect(newArray.includes('b')).assertEqual(true);
        expect(newArray.includes(1)).assertEqual(true);
        expect(newArray.includes('c')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0064
     * @tc.desc   Testing Collections of Array create, arrayLength -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0064";
      try {
        let array = collections.Array.create<number>(-1, 10);
        console.info("array is: " + array);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Invalid array length.');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0065
     * @tc.desc   Testing Collections of Array create, arrayLength 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0065";
      try {
        let array = collections.Array.create<number>(0, 10);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('');
        console.info("array length: " + array.length);
        expect(array.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0066
     * @tc.desc   Testing Collections of Array create, arrayLength 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArray0066";
      try {
        let array = collections.Array.create<number>(10, 3);
        console.info("array is: " + array);
        expect(array.toString()).assertEqual('3,3,3,3,3,3,3,3,3,3');
        console.info("array length: " + array.length);
        expect(array.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArray0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_NORMAL_0067
     * @tc.desc   Testing Collections of Array create, arrayLength 100000.
     * @tc.type   FUNCTION
