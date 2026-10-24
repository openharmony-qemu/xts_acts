import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { sleep } from "./pages/Utils";
import { collections } from '@kit.ArkTS'
import { BusinessError } from '@kit.BasicServicesKit';

export default function CollectionsArraySomeTest() {
  describe('CollectionsArraySomeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   BuiltinsArraySomeTest0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0171
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArraySomeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4, 5])
      const even = (num: number) => num > 3;
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0211
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4, 5])
      const even = (num: number) => {
        return num > 3 && num > 2;
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0250
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4, 5])
      const even = (num: number) => {
        const threshold = null;
        const actualThreshold = threshold !== null ? threshold : 0;
        return num > 3 && num > actualThreshold;
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })

    /**
     * @tc.name   BuiltinsArraySomeTest0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0288
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4, 5])
      const even = (num: number) => num === 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0325
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([])
      const even = (num: number) => num > 0
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertFalse()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0361
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([5])
      const even = (num: number) => num > 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0396
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([2])
      const even = (num: number) => num > 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertFalse()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0428
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: [Record<string, never>, [], () => void] = [
        {},
        [],
        () => {
        }
      ];
      const even = (element: Record<string, never> | [] | (() => void)): boolean => {
        return typeof element === 'function';
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0458
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4, 5])
      const even = (num: number) => num > 10
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertFalse()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0487
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4, 5])
      const even = (num: number) => num === 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0513
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from<number>([2, 4, 5, 8]);

      let res = false;
      for (const element of inputArray) {

        if (element % 2 !== 0) {
          res = true;
          break;
        }
      }

      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0535
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 4])
      const even = (num: number) => num === 4
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0553
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, null, 3, undefined, 4])
      const even = (e: number | undefined | null) => e === null
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })

    /**
     * @tc.name   BuiltinsArraySomeTest1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0570
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from(['apple', '', 'banana', 'cherry'])
      const even = (e: string) => e === ''
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })

    /**
     * @tc.number  SUB_ARRAY_SOME_BIND_0100
     * @tc.name    testArraySomeBind0001
     * @tc.desc    Verify some detached invocation throws 10200011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testArraySomeBind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new collections.Array<number>(1, 2, 3);
      let fn = arr.some;
      try {
        fn((v: number): boolean => v > 1);
        expect().assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(10200011);
      }
    });
  })
}