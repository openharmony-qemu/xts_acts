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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { TreeMap } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreemapTest() {
  describe('treeMapTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   testConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1010
     * @tc.desc   Test the function of the constructor function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0001";
      try {
        let treeMap: TreeMap<number, number> = new TreeMap();
        treeMap.set(111, 999)
        treeMap.set(222, 888)
        treeMap.set(333, 777)
        let length = treeMap.length
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1020
     * @tc.desc   Test the function of the constructor function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0002";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("AAA", "111")
        treeMap.set("BBB", "222")
        treeMap.set("CCC", "333")
        let length = treeMap.length
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1030
     * @tc.desc   Test the function of the constructor function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0003";
      try {
        class TestEntry {
          public id: number = 0;
        }

        let ts1: TreeMap<TestEntry, string> =
          new TreeMap<TestEntry, string>((t1: TestEntry, t2: TestEntry): boolean => {
            return t1.id < t2.id;
          });
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.set(entry1, "0");
        ts1.set(entry2, "1");
        expect(ts1.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1040
     * @tc.desc   Test the function of the constructor function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testConstructor0004";
      try {
        class TestEntry {
          public id: number = 0;
        }

        let ts1: TreeMap<TestEntry, string> = new TreeMap();
        let entry1: TestEntry = {
          id: 0
        };
        let entry2: TestEntry = {
          id: 1
        }
        ts1.set(entry1, "0");
        ts1.set(entry2, "1");
        expect(ts1.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEmpty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1050
     * @tc.desc   Test the function of the interface IsEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0001";
      try {
        let treeMap: TreeMap<number, number> = new TreeMap();
        let result = treeMap.isEmpty();
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEmpty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1060
     * @tc.desc   Test the function of the interface IsEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.isEmpty();
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testIsEmpty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1070
     * @tc.desc   Test the function of the interface IsEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIsEmpty0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.isEmpty();
        expect(result).assertEqual(false);
        treeMap.remove("squirrel");
        let result1 = treeMap.isEmpty();
        expect(result1).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1080
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0001";
      let treeMap: TreeMap<string, number> = new TreeMap();
      let result = treeMap.hasKey("");
      expect(result).assertEqual(false);
      let result2 = treeMap.hasKey(null);
      expect(result2).assertEqual(false);
      let result3 = treeMap.hasKey(null);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   testHasKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1090
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1100
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1110
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasKey("squirrel");
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1120
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey("squirrel");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasKey0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1130
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey('goose');
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasKey0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1140
     * @tc.desc   Test the function of the interface HasKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasKey('123');
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1150
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testHasValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     const TAG = "testHasValue0001";
    //     try {
    //         let treeMap : TreeMap<string, number> = new TreeMap();
    //         let result = treeMap.hasValue("");
    //         expect(result).assertEqual(false);
    //     } catch (err) {
    //         console.error(`${TAG} failed, error: ${err.code}`);
    //         expect().assertFail();
    //     }
    // });

    /**
     * @tc.name   testHasValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1160
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasValue(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasValue0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1170
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.hasValue(undefined);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1180
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('testHasValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //     const TAG = "testHasValue0004";
    //     try {
    //         let treeMap : TreeMap<string, number> = new TreeMap();
    //         let result = treeMap.hasValue("squirrel");
    //         expect(result).assertEqual(false);
    //     } catch (err) {
    //         console.error(`${TAG} failed, error: ${err.code}`);
    //         expect().assertFail();
    //     }
    // });

    /**
     * @tc.name   testHasValue0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1190
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasValue(123);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasValue0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1200
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.hasValue(333);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testHasValue0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1210
     * @tc.desc   Test the function of the interface HasValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testHasValue0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 356);
        let result = treeMap.hasValue(356);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1220
     * @tc.desc   Test the function of the interface treeMap.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get('');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1230
     * @tc.desc   Test the function of the interface treeMap.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1240
     * @tc.desc   Test the function of the interface treeMap.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1250
     * @tc.desc   Test the function of the interface treeMap.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.get("key");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1260
     * @tc.desc   Test the function of the interface treeMap.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.get("squirrel");
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1270
     * @tc.desc   Test the function of the interface treeMap.get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGet0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.get("sparrow");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetFirstKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1280
     * @tc.desc   Test the function of the interface getFirstKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetFirstKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getFirstKey();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetFirstKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1290
     * @tc.desc   Test the function of the interface getFirstKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetFirstKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 356);
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('sparrow');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetFirstKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1300
     * @tc.desc   Test the function of the interface getFirstKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetFirstKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("DEF", 123);
        treeMap.set("ABC", 356);
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('ABC');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetFirstKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1310
     * @tc.desc   Test the function of the interface getFirstKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetFirstKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('dd');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetFirstKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1320
     * @tc.desc   Test the function of the interface getFirstKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetFirstKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetFirstKey0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        let result = treeMap.getFirstKey();
        expect(result).assertEqual('aa');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLastKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1330
     * @tc.desc   Test the function of the interface GetLastKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLastKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLastKey();
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLastKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1340
     * @tc.desc   Test the function of the interface GetLastKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLastKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("DEF", 123);
        let result = treeMap.getLastKey();
        expect(result).assertEqual('DEF');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLastKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1350
     * @tc.desc   Test the function of the interface GetLastKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLastKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("HIG", 456);
        treeMap.set("DEF", 123);
        let result = treeMap.getLastKey();
        expect(result).assertEqual('HIG');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLastKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1360
     * @tc.desc   Test the function of the interface GetLastKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLastKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.getLastKey();
        expect(result).assertEqual('XYZ');
        let result1 = treeMap.length;
        expect(result1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLastKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1370
     * @tc.desc   Test the function of the interface GetLastKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLastKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLastKey0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.getLastKey();
        expect(result).assertEqual('XYZ');
        let result1 = treeMap.length;
        expect(result1).assertEqual(3);
        treeMap.clear();
        result1 = treeMap.length;
        expect(result1).assertEqual(0);
        treeMap.set("ABC", '111');
        treeMap.set("JKL", '222');
        result = treeMap.getLastKey();
        expect(result).assertEqual('JKL');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSetAll0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1380
     * @tc.desc   Test the function of the interface SetAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.length;
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSetAll0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1390
     * @tc.desc   Test the function of the interface SetAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("HIG", 123);
        let result = treeMap.length;
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSetAll0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1400
     * @tc.desc   Test the function of the interface SetAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("ABC", 123);
        treeMap.set("DEF", 456);
        treeMap.set("GHI", 789);
        treeMap.set("JKL", 222);
        treeMap.set("MNP", 333);
        let result = treeMap.length;
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSetAll0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1410
     * @tc.desc   Test the function of the interface SetAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let result = treeMap.length;
        expect(result).assertEqual(3);
        let value1 = treeMap.getFirstKey();
        let value2 = treeMap.getLastKey();
        expect(value1).assertEqual('DEF');
        expect(value2).assertEqual('XYZ');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSetAll0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1420
     * @tc.desc   Test the function of the interface SetAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0005";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let newMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        newMap.clear();
        newMap.setAll(treeMap);
        let result = newMap.length;
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTreeMapSetAll0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1430
     * @tc.desc   Test the function of the interface SetAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSetAll0006";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        treeMap.set("HIG", "456");
        treeMap.set("DEF", "123");
        treeMap.set("XYZ", "789");
        let newMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue < secondValue
          });
        newMap.clear();
        newMap.set("demo", '123');
        newMap.setAll(treeMap);
        let result = newMap.length;
        expect(result).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1440
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("", 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("");
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1450
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1460
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set(null, 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get(null);
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1470
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set(undefined, 123);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get(undefined);
        expect(result).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1480
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", null);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1490
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", 1);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1500
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("a", undefined);
        let length = treeMap.length;
        expect(length).assertEqual(1);
        let result = treeMap.get("a");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1510
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapSet0008";
      try {
        let arr = 'abc';
        let treeMap: TreeMap<string, number> = new TreeMap();
        for (let i = 0; i < 1000; i++) {
          treeMap.set(arr + i, 123);
        }
        let length = treeMap.length;
        expect(length).assertEqual(1000);
        for (let k = 0; k < 1000; k++) {
          let result = treeMap.get(arr + k);
          expect(result).assertEqual(123);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapRemove0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1520
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        // treeMap.set("squirrel", 123);
        // treeMap.set("sparrow", 456);
        let result = treeMap.remove("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapRemove0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1530
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapRemove0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.remove(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapRemove0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1540
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.remove(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapRemove0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1550
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.remove('key');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapRemove0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1560
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 456);
        let result = treeMap.remove("sparrow");
        expect(result).assertEqual(456);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapRemove0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1570
     * @tc.desc   Test the function of the interface Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapRemove0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapRemove0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 456);
        let result = treeMap.remove("tiger");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1580
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1590
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1600
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1610
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getLowerKey("key");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1620
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        let result = treeMap.getLowerKey("squirrel");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1630
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getLowerKey("CCC");
        expect(result).assertEqual("BBB");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetLowerKey0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1640
     * @tc.desc   Test the function of the interface getLowerKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetLowerKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetLowerKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getLowerKey("AAA" + "1");
        expect(result).assertEqual("AAA");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1650
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey("");
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1660
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey(null);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1670
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey(undefined);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1680
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.getHigherKey('key');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1690
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("AAA", 123);
        let result = treeMap.getHigherKey('AAA');
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1700
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getHigherKey("BBB");
        expect(result).assertEqual("CCC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapGetHigherKey0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1710
     * @tc.desc   Test the function of the interface getHigherKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapGetHigherKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapGetHigherKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("BBB", 123);
        treeMap.set("AAA", 456);
        treeMap.set("CCC", 789);
        let result = treeMap.getHigherKey("BBB" + "1");
        expect(result).assertEqual("CCC");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1720
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace("", 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1730
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace(null, 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1740
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0003";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace(undefined, 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1750
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.replace('key', 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1760
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow", 123);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1770
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow", 456);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapReplaceKey0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1780
     * @tc.desc   Test the function of the interface replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplaceKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapReplaceKey0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("sparrow", 123);
        let result = treeMap.replace("sparrow1", 456);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapClear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1790
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        let result = treeMap.length;
        expect(result).assertEqual(0);
        result = treeMap.get('');
        expect(result).assertEqual(undefined);
        let result1 = treeMap.hasKey('');
        expect(result1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapClear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1800
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set("squirrel", 123);
        treeMap.set("sparrow", 356);
        treeMap.clear();
        let result = treeMap.length;
        expect(result).assertEqual(0);
        result = treeMap.get('squirrel');
        expect(result).assertEqual(undefined);
        result = treeMap.get('sparrow');
        expect(result).assertEqual(undefined);
        let result1 = treeMap.hasKey('squirrel');
        expect(result1).assertEqual(false);
        result1 = treeMap.hasKey('sparrow');
        expect(result1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapClear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1810
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
        let result = treeMap.get('aa');
        expect(result).assertEqual(undefined);
        result = treeMap.get('cc');
        expect(result).assertEqual(undefined);
        let result1 = treeMap.hasKey('bb');
        expect(result1).assertEqual(false);
        result1 = treeMap.hasKey('dd');
        expect(result1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapClear0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1820
     * @tc.desc   Test the function of the interface clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapClear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0004";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set("aa", "3");
        treeMap.set("dd", "1");
        treeMap.set("cc", "2");
        treeMap.set("bb", "4");
        treeMap.clear();
        treeMap.set("AAA", "111");
        treeMap.set("BBB", "222");
        treeMap.set("CCC", "333");
        let length = treeMap.length;
        expect(length).assertEqual(3);
        let result = treeMap.getFirstKey();
        expect(result).assertEqual("CCC");
        result = treeMap.getLastKey();
        expect(result).assertEqual("AAA");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1830
     * @tc.desc   Test the testTreeMap of the interface keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapClear0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        let res = treeMap.keys();
        expect(res.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1840
     * @tc.desc   Test the testTreeMap of the interface keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapKeys0002";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.keys();
        expect(res.next().value).assertEqual('AAA');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('DDD');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testTreeMapKeys0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1850
     * @tc.desc   Test the testTreeMap of the interface keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapKeys0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.keys();
        expect(res.next().value).assertEqual('DDD');
        expect(res.next().value).assertEqual('CCC');
        expect(res.next().value).assertEqual('BBB');
        expect(res.next().value).assertEqual('AAA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1860
     * @tc.desc   Test the testTreeMap of the interface values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapValues0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        let res = treeMap.values();
        expect(res.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapValues0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1870
     * @tc.desc   Test the testTreeMap of the interface values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapValues0002";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.values();
        expect(res.next().value).assertEqual('123');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('666');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapValues0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1880
     * @tc.desc   Test the testTreeMap of the interface values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapValues0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', "123");
        treeMap.set('BBB', "456");
        treeMap.set('CCC', "789");
        treeMap.set('DDD', "666");
        let res = treeMap.values();
        expect(res.next().value).assertEqual('666');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('123');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1890
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0001";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.forEach((value ?: number, key ?: string): void => {
          let length = treeMap.length
          expect(length).assertEqual(0)
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1900
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(456);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1910
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', '123');
        treeMap.set('BBB', '456');
        treeMap.set('CCC', '789');
        treeMap.set('DDD', '666');
        treeMap.forEach((value ?: string, key ?: string): void => {
        });
        let res = treeMap.values();
        expect(res.next().value).assertEqual('666');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('123');
        let length = treeMap.length
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1920
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.remove("BBB")
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length
        expect(length).assertEqual(3)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testTreeMapForEach0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1930
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.replace("BBB", 555)
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(555);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length
        expect(length).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testTreeMapForEach0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1940
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((value ?: number, key ?: string): void => {
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapEntries0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1950
     * @tc.desc   Test the testTreeMap of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0001";
      try {
        let treeMap: TreeMap<string, string> = new TreeMap();
        let res = treeMap.entries();
        expect(res.next().done).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapEntries0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1960
     * @tc.desc   Test the testTreeMapForEach of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0002";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(456);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapEntries0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1970
     * @tc.desc   Test the testTreeMap of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0003";
      try {
        let treeMap: TreeMap<string, string> =
          new TreeMap<string, string>((firstValue: string, secondValue: string): boolean => {
            return firstValue > secondValue
          });
        treeMap.set('AAA', '123');
        treeMap.set('BBB', '456');
        treeMap.set('CCC', '789');
        treeMap.set('DDD', '666');
        treeMap.entries();
        let res = treeMap.values();
        expect(res.next().value).assertEqual('666');
        expect(res.next().value).assertEqual('789');
        expect(res.next().value).assertEqual('456');
        expect(res.next().value).assertEqual('123');
        let length = treeMap.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testTreeMapEntries0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1980
     * @tc.desc   Test the testTreeMap of the interface entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0004";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.remove("BBB");
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length;
        expect(length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testTreeMapEntries0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_1990
     * @tc.desc   Test the testTreeMap of the interface entryies.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0005";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.replace("BBB", 555);
        let res = treeMap.values();
        expect(res.next().value).assertEqual(123);
        expect(res.next().value).assertEqual(555);
        expect(res.next().value).assertEqual(789);
        expect(res.next().value).assertEqual(666);
        let length = treeMap.length;
        expect(length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testTreeMapEntries0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2000
     * @tc.desc   Test the testTreeMap of the interface entryies.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapEntries0006";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.entries();
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2010
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0007";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.set('BBB', 456);
        treeMap.set('CCC', 789);
        treeMap.set('DDD', 666);
        treeMap.forEach((): void => {
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2020
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0008";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.forEach((value): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2030
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0009";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.forEach((value, index, treeMap: TreeMap<string, number>): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        });
        treeMap.clear();
        let length = treeMap.length;
        expect(length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapForEach0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2040
     * @tc.desc   Test the testTreeMap of the interface forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapForEach0010";
      try {
        let treeMap: TreeMap<string, number> = new TreeMap();
        treeMap.set('AAA', 123);
        treeMap.forEach((value, index, treeMap: TreeMap<string, number>): void => {
          expect(treeMap.hasValue(value)).assertTrue();
        }, treeMap);
        expect(treeMap.get('AAA')).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapComparatorConstruct0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2050
     * @tc.desc   Test the comparator of construct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapComparatorConstruct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapComparatorConstruct0001";

      class A {
        time: number = 0;

        constructor(time: number) {
          this.time = time;
        }
      }

      let mp: TreeMap<A, number> = new TreeMap((first: A, second: A) => {
        return first.time > second.time;
      });
      try {
        const a1 = new A(1);
        const a2 = new A(2);
        const a3 = new A(3);
        const a4 = new A(4);
        const a5 = new A(5);
        mp.set(a1, 1);
        mp.set(a2, 2);
        mp.set(a3, 3);
        mp.set(a4, 4);
        mp.set(a5, 5);
        for (let i = 0; i < 5; i++) {
          mp.remove(a1);
          expect(mp.hasKey(a1)).assertEqual(false);
          mp.set(a1, 1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapComparatorConstruct0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2060
     * @tc.desc   Test the comparator of construct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapComparatorConstruct0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapComparatorConstruct0002";

      class A {
        name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      let mp: TreeMap<A, number> = new TreeMap((first: A, second: A) => {
        return first.name > second.name;
      });
      try {
        const a1 = new A('jflksad');
        const a2 = new A('jgoijsd');
        const a3 = new A('sjdalkgj');
        const a4 = new A('jglkasdg');
        const a5 = new A('vjlkwdef');
        mp.set(a1, 1);
        mp.set(a2, 2);
        mp.set(a3, 3);
        mp.set(a4, 4);
        mp.set(a5, 5);
        for (let i = 0; i < 5; i++) {
          mp.remove(a1);
          expect(mp.hasKey(a1)).assertEqual(false);
          mp.set(a1, 1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapComparatorConstruct0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2070
     * @tc.desc   Test the comparator of construct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapComparatorConstruct0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testTreeMapComparatorConstruct0003";

      class A {
        value: number;
        name: string;

        constructor(value: number, name: string) {
          this.value = value;
          this.name = name;
        }
      }

      let mp: TreeMap<A, number> = new TreeMap((first: A, second: A) => {
        if (first.value == second.value) {
          return first.name > second.name;
        }
        return first.value > second.value;
      });
      try {
        const a1 = new A(1, 'abc');
        const a2 = new A(2, 'abc');
        const a3 = new A(3, 'abc');
        const a4 = new A(4, 'abc');
        const a5 = new A(5, 'abc');
        const aa1 = new A(1, 'aac');
        const aa2 = new A(2, 'aac');
        const aa3 = new A(3, 'aac');
        const aa4 = new A(4, 'aac');
        const aa5 = new A(5, 'aac');
        mp.set(a1, 1);
        mp.set(a2, 2);
        mp.set(a3, 3);
        mp.set(a4, 4);
        mp.set(a5, 5);
        mp.set(aa1, 1);
        mp.set(aa2, 1);
        mp.set(aa3, 1);
        mp.set(aa4, 1);
        mp.set(aa5, 1);
        for (let i = 0; i < 5; i++) {
          mp.remove(a1);
          expect(mp.hasKey(a1)).assertEqual(false);
          mp.set(a1, 1);
        }
        expect(mp.length).assertEqual(10);
        expect(mp.hasKey(a1)).assertEqual(true);
        mp.remove(a1);
        expect(mp.hasKey(a2)).assertEqual(true);
        mp.remove(a2);
        expect(mp.hasKey(aa1)).assertEqual(true);
        mp.remove(aa1);
        expect(mp.hasKey(aa2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testTreeMapSetAll001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2080
     * @tc.desc   Testing TreeMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapSetAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTreeMapSetAll001';
      let treeMap = new TreeMap<string, number | null | undefined>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);
      let map: TreeMap<string, number> = new TreeMap();
      map.set("demo", 12);
      map.setAll(treeMap);
      map.forEach((value ?: number, key ?: string): void => {
        console.info("value: " + value, "key: " + key);
      })
      try {
        treeMap.setAll(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      try {
        treeMap.setAll(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

    });

    /**
     * @tc.name   testTreeMapReplace001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2090
     * @tc.desc   Testing TreeMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTreeMapReplace001';
      let treeMap = new TreeMap<string, number | null | undefined>();
      treeMap.set("sparrow", 123);
      let result = treeMap.replace("sparrow", 357);
      console.info("sparrow:", treeMap.get("sparrow"));

      let result1 = treeMap.replace("sparrow", null);
      expect(result1).assertTrue();

      let result2 = treeMap.replace("sparrow", undefined);
      expect(result2).assertTrue()

    });
    /**
     * @tc.name   testTreeMapForEach001
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAP10_2100
     * @tc.desc   Testing TreeMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<string, number | null | undefined>();
      treeMap.set("sparrow", 123);
      treeMap.set("gull", 357);
      treeMap.forEach((value: number, key: string): void => {
        console.info("value: " + value, "key: " + key);
      });
      try {
        treeMap.forEach(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      try {
        treeMap.forEach(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
  })
}
