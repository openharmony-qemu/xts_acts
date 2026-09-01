/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import TreeMap from '@ohos.util.TreeMap';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { test002, test005, test010, test036, test037, test038, test039, test041 } from './TreeMapResource';

export default function TreeMapTest() {
  describe("TreeMapTest", () => {
    /**
     * @tc.name   testConstructor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0100
     * @tc.desc   Create an TreeMap instance and use Compare. For example: TreeMap((a, b) => {return a > b}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testConstructor002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<string, number>((a, b) => {
        return a > b
      });
      expect(treeMap != undefined).assertEqual(true);
      treeMap.set("a", 1);
      treeMap.set("c", 3);
      treeMap.set("d", 4);
      treeMap.set("b", 2);
      expect(treeMap.length).assertEqual(4);
      expect(treeMap.remove("a")).assertEqual(1);
      expect(treeMap.remove("b")).assertEqual(2);
      expect(treeMap.remove("c")).assertEqual(3);
      expect(treeMap.remove("d")).assertEqual(4);
    });

    /**
     * @tc.name   testSet002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0200
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set(0, "鍥?).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test002()).assertTrue();
    });

    /**
     * @tc.name   testSet003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0300
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set(0, 8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, number>();
      treeMap.set(0, 8);
      let res = treeMap.get(0);
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testSet004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0400
     * @tc.desc   Add a pair of key value pairs to the TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, number[]>();
      let a = [1, 2, 3, 4];
      treeMap.set(0, a);
      let res = treeMap.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testSet005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0500
     * @tc.desc   Add a pair of key value pairs to the TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test005()).assertTrue();
    });

    /**
     * @tc.name   testSet006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0600
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set(2, "*").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(2, "*");
      let res = treeMap.get(2);
      expect(res).assertEqual("*");
    });

    /**
     * @tc.name   testSet007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0700
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set(-2, 3.14).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, number>();
      treeMap.set(-2, 3.14);
      let res = treeMap.get(-2);
      expect(res).assertEqual(3.14);
    });

    /**
     * @tc.name   testSet008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0800
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set(100, true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, boolean>();
      treeMap.set(100, true);
      let res = treeMap.get(100);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testSet009
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_0900
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set(100, true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(100, "");
      let res = treeMap.get(100);
      expect(res).assertEqual("");
    });

    /**
     * @tc.name   testSet010
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1000
     * @tc.desc   Add a pair of key value pairs to the TreeMap. For example: treeMap.set("a", "鍥?).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test010()).assertTrue();
    });

    /**
     * @tc.name   testSet011
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1100
     * @tc.desc   Add a pair of key value pairs to the TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, number>();
      for (let i = 0; i < 10000; i++) {
        treeMap.set(0, 8);
      }
      let res = treeMap.get(0);
      expect(res).assertEqual(8);
      expect(treeMap.length).assertEqual(1);
    });

    /**
     * @tc.name   testHasKey012
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1200
     * @tc.desc   Determine whether the TreeMap contains the specified key. For example: treeMap.hasKey(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHasKey012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      let res = treeMap.hasKey(1);
      expect(res).assertEqual(true);
      let res1 = treeMap.hasKey(6);
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testHasValue013
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1300
     * @tc.desc   Determine whether the TreeMap contains the specified Value. For example: treeMap.hasValue("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasValue013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.hasValue("a");
      expect(res).assertEqual(true);
      let res1 = treeMap.hasValue("d");
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testGet014
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1400
     * @tc.desc   Get the corresponding value through the key. For example: treeMap.get(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.get(1);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testGet015
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1500
     * @tc.desc   Get the corresponding value through the key. For example: treeMap.get(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, number>();
      let res = treeMap.get(1);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGet016
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1600
     * @tc.desc   Get the corresponding value through the key. For example: treeMap.get(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.clear();
      expect(treeMap.length).assertEqual(0);
      let res = treeMap.get(0);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetFirstKey017
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1700
     * @tc.desc   Get the key that ranks first in the TreeMap instance. For example: treeMap.getFirstKey().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetFirstKey017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.getFirstKey();
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testGetFirstKey018
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1800
     * @tc.desc   Get the key that ranks first in the TreeMap instance. For example: treeMap.getFirstKey().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetFirstKey018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, number>();
      let res = treeMap.getFirstKey();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetLastKey019
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_1900
     * @tc.desc   Get the last sorted key in the TreeMap instance. For example: treeMap.getLastKey().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLastKey019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.getLastKey();
      expect(res).assertEqual(2);
    });

    /**
     * @tc.name   testGetLastKey020
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2000
     * @tc.desc   Get the last sorted key in the TreeMap instance. For example: treeMap.getLastKey().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLastKey020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, number>();
      let res = treeMap.getLastKey();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetAll021
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2100
     * @tc.desc   Copy key value pairs from one HashMap to another. For example: treeMap.setAll(treeMap1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetAll021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      let treeMap1 = new TreeMap<number, string>();
      treeMap1.set(0, "a");
      treeMap1.set(1, "b");
      treeMap1.set(2, "c");
      treeMap.setAll(treeMap1);
      let res = treeMap.get(0);
      expect(res).assertEqual("a");
      let res1 = treeMap.get(1);
      expect(res1).assertEqual("b");
      let res2 = treeMap.get(2);
      expect(res2).assertEqual("c");
    });

    /**
     * @tc.name   testRemove022
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2200
     * @tc.desc   Delete key value pairs according to key. For example: treeMap.remove(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      let res = treeMap.remove(1);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testRemove023
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2300
     * @tc.desc   Delete key value pairs according to key. For example: treeMap.remove(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      let res = treeMap.remove(1);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testClear024
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2400
     * @tc.desc   Clear all key value pairs in TreeMap. For example: treeMap.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.clear();
      let res = treeMap.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testClear025
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2500
     * @tc.desc   Clear all key value pairs in TreeMap. For example: treeMap.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.clear();
      let res = treeMap.length;
      expect(res).assertEqual(0);
      treeMap.set(3, "d");
      let va = treeMap.get(3);
      expect(va).assertEqual("d");
    });

    /**
     * @tc.name   testGetLowerKey026
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2600
     * @tc.desc   Get a key that is a little lower than the specified key sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLowerKey026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.getLowerKey(2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.name   testGetLowerKey027
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2700
     * @tc.desc   Get a key that is a little lower than the specified key sort. For example: treeMap.getLowerKey(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLowerKey027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, number>();
      let res = treeMap.getLowerKey(2);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetHigherKey028
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2800
     * @tc.desc   Get a key that is a little higher than the specified key sort. For example: treeMap.getLowerKey(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetHigherKey028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.getHigherKey(2);
      expect(res).assertEqual(3);
    });

    /**
     * @tc.name   testGetHigherKey029
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_2900
     * @tc.desc   Get a key that is a little higher than the specified key sort. For example: treeMap.getLowerKey(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetHigherKey029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, number>();
      let res = treeMap.getHigherKey(2);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testKeys030
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3000
     * @tc.desc   Get a collection of all the keys in the TreeMap. For example: treeMap.keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testKeys030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.keys();
      expect(res.next().value).assertEqual(0);
      expect(res.next().value).assertEqual(1);
      expect(res.next().value).assertEqual(2);
      expect(res.next().value).assertEqual(3);
      expect(res.next().value).assertEqual(4);
    });

    /**
     * @tc.name   testValues031
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3100
     * @tc.desc   Get a collection of all the values in the TreeMap. For example: treeMap.values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testValues031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.values();
      expect(res.next().value).assertEqual("a");
      expect(res.next().value).assertEqual("b");
      expect(res.next().value).assertEqual("c");
      expect(res.next().value).assertEqual("d");
      expect(res.next().value).assertEqual("g");
    });

    /**
     * @tc.name   testReplace032
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3200
     * @tc.desc   Modify the corresponding value according to the specified key. For example: treeMap.replace(2, "B").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReplace032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.replace(2, "B");
      let res1 = treeMap.get(2);
      expect(res1).assertEqual("B");
    });

    /**
     * @tc.name   testReplace033
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3300
     * @tc.desc   Modify the corresponding value according to the specified key. For example: treeMap.replace(2, "B").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReplace033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      let res = treeMap.replace(2, "B");
      expect(res).assertEqual(false);
      let res1 = treeMap.get(2);
      expect(res1).assertEqual(undefined);
    });

    /**
     * @tc.name   testLength034
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3400
     * @tc.desc   Get the number of key value pairs in the TreeMap instance. For example: treeMap.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLength034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testLength035
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3500
     * @tc.desc   Get the number of key value pairs in the TreeMap instance. For example: treeMap.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLength035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, number>();
      let res = treeMap.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testForEach036
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3600
     * @tc.desc   Traverse all key value pairs in the TreeMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test036()).assertTrue();
    });

    /**
     * @tc.name   testEntries037
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3700
     * @tc.desc   Get all key value pairs collection in TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test037()).assertTrue();
    });

    /**
     * @tc.name   testIterator038
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3800
     * @tc.desc   Traverse all key value pairs in the TreeMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test038()).assertTrue();
    });

    /**
     * @tc.name   testIterator039
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_3900
     * @tc.desc   Traverse all key value pairs in the TreeMap instance. For example: treeMap[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test039()).assertTrue();
    });

    /**
     * @tc.name   testIsEmpty040
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_4000
     * @tc.desc   Determine whether the TreeMap instance is empty. For example: treeMap.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, "a");
      treeMap.set(1, "b");
      treeMap.set(2, "c");
      treeMap.set(3, "d");
      treeMap.set(4, "g");
      let res = treeMap.isEmpty();
      expect(res).assertEqual(false);
      treeMap.clear();
      let res1 = treeMap.isEmpty();
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.name   testSetAll041
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREEMAPFP_4100
     * @tc.desc   Copy key value pairs from one HashMap to another. For example: treeMap.setAll([1, 2, 3]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetAll041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test041()).assertTrue();
    });
  });
}
