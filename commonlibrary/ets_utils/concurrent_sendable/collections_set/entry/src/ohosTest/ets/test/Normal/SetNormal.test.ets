import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';
import { sleep } from './TestUtils';

@Sendable
class SendableTestClass {
  num: number = 5;
  getNum() {
    return this.num;
  }
};

@Sendable
export class ImplISendableClass implements lang.ISendable {
  count: number = 0;
  getNum() {
    return this.count;
  }
}

export default function SetNormalTest() {
  describe('SetNormalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(100);
    })
    /**
     * @tc.name   testSet0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0001
     * @tc.desc   Testing the set for 1~10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0001";
      try {
        const setList = new collections.Set<number>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        let num1: number = 0;
        for (let item of setList) {
          num1 = num1 + 1;
          expect(item).assertEqual(num1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0002
     * @tc.desc   Testing the size of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0002";
      try {
        const setList = new collections.Set<number>();
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0003
     * @tc.desc   Testing the size of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0003";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0004
     * @tc.desc   Testing the size of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0004";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        let rstDel = setList.delete(2);
        expect(rstDel).assertTrue();
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0005
     * @tc.desc   Testing the size of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0005";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        setList.add(4);
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0006
     * @tc.desc   Testing the size of set, clear set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0006";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        setList.clear();
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0007
     * @tc.desc   Testing the size of set, add repeating element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0007";
      try {
        const setList = new collections.Set<number>([1, 2, 3]);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
        setList.add(2);
        sizeNum = setList.size;
        expect(sizeNum).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0008
     * @tc.desc   Testing the Constructor of set, element is string, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0008";
      try {
        const setList = new collections.Set<string>(["one"]);
        setList.add("four");
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("one");
        expect(iterator.next().value.toString()).assertEqual("four");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0009
     * @tc.desc   Testing the Constructor of set, element is string, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0009";
      try {
        const setList = new collections.Set<string>(["one", "two"]);
        let rst = setList.delete("two");
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("one");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0010
     * @tc.desc   Testing the Constructor of set, element is string, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0010";
      try {
        const setList = new collections.Set<string>(["one", "two"]);
        let rst = setList.has("two");
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0011
     * @tc.desc   Testing the Constructor of set, element is number, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0011";
      try {
        const setList = new collections.Set<number>([1]);
        setList.add(3);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0012
     * @tc.desc   Testing the Constructor of set, element is number, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0012";
      try {
        const setList = new collections.Set<number>([1, 2]);
        let rst = setList.delete(2);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0013
     * @tc.desc   Testing the Constructor of set, element is number, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0013";
      try {
        const setList = new collections.Set<number>([1, 2]);
        let rst = setList.has(2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0014
     * @tc.desc   Testing the Constructor of set, element is boolean, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0014";
      try {
        const setList = new collections.Set<boolean>([true]);
        setList.add(false);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(true);
        expect(iterator.next().value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0015
     * @tc.desc   Testing the Constructor of set, element is boolean, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0015";
      try {
        const setList = new collections.Set<boolean>([true, false]);
        let rst = setList.delete(true);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0016
     * @tc.desc   Testing the Constructor of set, element is boolean, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0016";
      try {
        const setList = new collections.Set<boolean>([true, false]);
        let rst = setList.has(true);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0017
     * @tc.desc   Testing the Constructor of set, element is undefined, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0017";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        setList.add(undefined);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(undefined);
        expect(iterator.next().value).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0018
     * @tc.desc   Testing the Constructor of set, element is undefined, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0018";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        let rst = setList.delete(undefined);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(undefined);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0019
     * @tc.desc   Testing the Constructor of set, element is undefined, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0019";
      try {
        const setList = new collections.Set<undefined>([undefined]);
        let rst = setList.has(undefined);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0020
     * @tc.desc   Testing the Constructor of set, element is null, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0020";
      try {
        const setList = new collections.Set<null>([null]);
        setList.add(null);
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        expect(iterator.next().value == null).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0021
     * @tc.desc   Testing the Constructor of set, element is null, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0021";
      try {
        const setList = new collections.Set<null>([null, null]);
        let rst = setList.delete(null);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value == null).assertEqual(true);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0022
     * @tc.desc   Testing the Constructor of set, element is null, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0022";
      try {
        const setList = new collections.Set<null>([null, null]);
        let rst = setList.has(null);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0023
     * @tc.desc   Testing the Constructor of set, element is bigint, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0023";
      try {
        const setList = new collections.Set<bigint>([555555n]);
        setList.add(99999999n);
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(555555n);
        expect(iterator.next().value).assertEqual(99999999n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0024
     * @tc.desc   Testing the Constructor of set, element is bigint, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0024";
      try {
        const setList = new collections.Set<bigint>([66666666n, 99999999n]);
        let rst = setList.delete(66666666n);
        expect(rst).assertTrue();
        const iterator = setList.values();
        expect(iterator.next().value).assertEqual(99999999n);
        let sizeNum = setList.size;
        expect(sizeNum).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0025
     * @tc.desc   Testing the Constructor of set, element is bigint, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0025";
      try {
        const setList = new collections.Set<bigint>([66666666n, 99999999n]);
        let rst = setList.has(99999999n);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0026
     * @tc.desc   Testing the Constructor of set, element is Array, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0026";
      try {
        let arrayList = new collections.Array<number>(1,2,3);
        const setList = new collections.Set<collections.Array<number>>([arrayList]);
        let arrayList1 = new collections.Array<number>(4,5,6);
        setList.add(arrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("1,2,3");
        expect(iterator.next().value.toString()).assertEqual("4,5,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0027
     * @tc.desc   Testing the Constructor of set, element is Array, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0027";
      try {
        let arrayList1 = new collections.Array<number>(1,2,3);
        let arrayList2 = new collections.Array<number>(4,5,6);
        const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
        setList.delete(arrayList1);
        const iterator = setList.values();
        expect(iterator.next().value.toString()).assertEqual("4,5,6");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0028
     * @tc.desc   Testing the Constructor of set, element is Array, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0028";
      try {
        let arrayList1 = new collections.Array<number>(1,2,3);
        let arrayList2 = new collections.Array<number>(4,5,6);
        const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
        let rst = setList.has(arrayList2);
        expect(rst).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0029
     * @tc.desc   Testing the Constructor of set, element is Map, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0029";
      try {
        let mapList1 = new collections.Map<number, string>();
        mapList1.set(1, "a");
        const setList = new collections.Set<collections.Map<number, string>>([mapList1]);
        let mapList2 = new collections.Map<number, string>();
        mapList2.set(2, "b");
        setList.add(mapList2);
        const iterator = setList.values();
        expect(iterator.next().value.entries().next().value.toString()).assertEqual("1,a");
        expect(iterator.next().value.entries().next().value.toString()).assertEqual("2,b");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testSet0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_NORMAL_0030
     * @tc.desc   Testing the Constructor of set, element is Map, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSet0030";
      try {
        let mapList1 = new collections.Map<number, string>();
        mapList1.set(1, "a");
        let mapList2 = new collections.Map<number, string>();
        mapList2.set(2, "b");
