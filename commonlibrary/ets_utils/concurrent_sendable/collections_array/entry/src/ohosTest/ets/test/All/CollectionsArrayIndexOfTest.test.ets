import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { hilog } from "@kit.PerformanceAnalysisKit";
import { sleep } from "./pages/Utils";
import { collections } from '@kit.ArkTS'
import { BusinessError } from '@kit.BasicServicesKit';


export default function CollectionsArrayIndexOfTest() {
  describe('CollectionsArrayIndexOfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   BuiltinsArrayIndexOfTest0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0156
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3])
      const callbackFn = (ele: number) => {
        return inputArray.indexOf(ele)
      }
      const res = callbackFn(2)
      console.log("res: " + res)
      expect(res).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0196
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3])
      const callbackFn = (ele: number) => {
        return inputArray.indexOf(ele)
      }
      const res = callbackFn(4)
      console.log("res: " + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0235
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 2, 4])
      const callbackFn = (ele1: number, ele2: number) => {
        return inputArray.indexOf(ele1, ele2)
      }
      const res = callbackFn(2, 2)
      console.log("res: " + res)
      expect(res).assertEqual(3)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0274
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 2, 4])
      const callbackFn = (ele1: number, ele2: number) => {
        return inputArray.indexOf(ele1, ele2)
      }
      const res = callbackFn(2, 3)
      console.log("res: " + res)
      expect(res).assertEqual(3)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0312
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray = collections.Array.from([1, 2, 3, 2, 4])
      const callbackFn = (ele1: number, ele2: number) => {
        return inputArray.indexOf(ele1, ele2)
      }
      const res = callbackFn(2, 4)
      console.log("res: " + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0348
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, , 3])
      const res = inputArray.indexOf(undefined)
      console.log("res:" + res)
      expect(res).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0383
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, , 3])
      const res = inputArray.indexOf(2)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0417
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([NaN])
      const res = inputArray.indexOf(NaN)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest0900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0448
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([0, -0])
      const res = inputArray.indexOf(0)
      console.log("res:" + res)
      expect(res).assertEqual(0)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0478
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([undefined])
      const res = inputArray.indexOf(undefined)
      console.log("res:" + res)
      expect(res).assertEqual(0)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0504
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3])
      const res = inputArray.indexOf(2, -1)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0528
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3])
      const res = inputArray.indexOf(3, -1)
      console.log("res:" + res)
      expect(res).assertEqual(2)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0546
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3])
      const res = inputArray.indexOf(2, 5)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0563
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3])
      const res = inputArray.indexOf(2, -5)
      console.log("res:" + res)
      expect(res).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0579
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from<string|undefined>([])
      const res = inputArray.indexOf(undefined)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0594
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, null, 3, 4])
      const res = inputArray.indexOf(null)
      console.log("res:" + res)
      expect(res).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0608
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from(['apple', 'banana', 'cherry'])
      const res = inputArray.indexOf('banana')
      console.log("res:" + res)
      expect(res).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0622
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from(['apple', '', 'cherry'])
      const res = inputArray.indexOf('')
      console.log("res:" + res)
      expect(res).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest1900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0635
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(Math.floor(1.5))
      console.log("res:" + res)
      expect(res).assertEqual(0)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0647
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(-0)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0658
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(Number.EPSILON)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0668
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(Number.MIN_VALUE)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0676
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(Number.MAX_VALUE)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0684
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(-Infinity)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0690
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(Infinity)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0695
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(123.456)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0700
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(0xcafebabe)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0705
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(0x0102)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   BuiltinsArrayIndexOfTest2900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0709
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(0x01020304)
      console.log("res:" + res)
      expect(res).assertEqual(-1)
      Done()
    })

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0712
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray = collections.Array.from([1, 2, 3, 4, 5, 6])
      const res = inputArray.indexOf(0x3)
      console.log("res:" + res)
      expect(res).assertEqual(2)
      Done()
    })

    /**
     * @tc.number  SUB_ARRAY_INDEXOF_BIND_0100
     * @tc.name    testArrayIndexOfBind0001
     * @tc.desc    Verify indexOf detached invocation throws 10200011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testArrayIndexOfBind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new collections.Array<number>(1, 2, 3);
      let fn = arr.indexOf;
      try {
        fn(1);
        expect().assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(10200011);
      }
    });

    /**
     * @tc.number  SUB_ARRAY_INDEXOF_ONE_0200
     * @tc.name    testArrayIndexOfOne0002
     * @tc.desc    Verify indexOf with wrong-typed search element throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testArrayIndexOfOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new collections.Array<number>(1, 2, 3);
      expect(arr.indexOf('x' as Object as number)).assertEqual(-1);
    });
  })
}