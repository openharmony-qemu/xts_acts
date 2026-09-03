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
import HashMap from '@ohos.util.HashMap';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  test005, test012, test017, test026, test027, test028, test030, test033,
  test034, test037, test038, test039, test040, test041, test046, test048,
  test049, test056
} from './HashMapResource';

export default function HashMapTest() {
  describe("HashMapTest", () => {

    /**
     * @tc.name   testSet002
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0100
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      let res = hashMap.get(1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet003
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0200
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, 2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, 2);
      let res = hashMap.get(1);
      expect(res).assertEqual(2);
    });

    /**
     * @tc.name   testSet004
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0300
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: let c = [1, 2, 3]; hashMap.set(1, c).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, number[]>();
      let c = [1, 2, 3];
      hashMap.set(1, c);
      let res = hashMap.get(1);
      expect(res).assertEqual(c);
    });

    /**
     * @tc.name   testSet005
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0400
     * @tc.desc   Add a pair of key value pairs to the HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test005()).assertTrue();
    });

    /**
     * @tc.name   testSet006
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0500
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set("a", "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("a", "A");
      let res = hashMap.get("a");
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet007
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0600
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set("", "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("", "A");
      let res = hashMap.get("");
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet008
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0700
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set("$", "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<string, string>();
      hashMap.set("$", "A");
      let res = hashMap.get("$");
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet009
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0800
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(3.14, "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(3.14, "A");
      let res = hashMap.get(3.14);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet010
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_0900
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(0.3, "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(0.3, "A");
      let res = hashMap.get(0.3);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet011
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1000
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(-1, "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(-1, "A");
      let res = hashMap.get(-1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testSet012
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1100
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: let a = {}; hashMap.set(a, "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test012()).assertTrue();
    });

    /**
     * @tc.name   testSet013
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1200
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, Object>();
      hashMap.set(1, null);
      let res = hashMap.get(1);
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testSet014
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1300
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, "$").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "$");
      let res = hashMap.get(1);
      expect(res).assertEqual("$");
    });

    /**
     * @tc.name   testSet015
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1400
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, "3.14").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, 3.14);
      let res = hashMap.get(1);
      expect(res).assertEqual(3.14);
    });

    /**
     * @tc.name   testSet016
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1500
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(1, -1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, number>();
      hashMap.set(1, -1);
      let res = hashMap.get(1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testSet017
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1600
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: let a = {}; hashMap.set(1, a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test017()).assertTrue();
    });

    /**
     * @tc.name   testSet018
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1700
     * @tc.desc   Add a pair of key value pairs to the HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, number>();
      for (let i = 0; i < 100; i++) {
        hashMap.set(1, i);
      }
      let res = hashMap.get(1);
      let res1 = hashMap.length;
      expect(res).assertEqual(99);
      expect(res1).assertEqual(1);
    });

    /**
     * @tc.name   testSet019
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1800
     * @tc.desc   Add a pair of key value pairs to the HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSet019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, number>();
      for (let i = 0; i < 100; i++) {
        hashMap.set(i, 1);
        let res = hashMap.get(i);
        expect(res).assertEqual(1);
      }
      let res1 = hashMap.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.name   testLength020
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_1900
     * @tc.desc   Get the number of key value pairs in the HashMap instance. For example: hashMap.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testHasKey021
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2000
     * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey(3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasKey021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.hasKey(3);
      expect(res).assertEqual(true);
      let res1 = hashMap.hasKey(8);
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testHasKey022
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2100
     * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasKey022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.hasKey(8);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testHasValue023
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2200
     * @tc.desc   Determine whether the HashMap contains the specified value. For example: hashMap.hasValue("C").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasValue023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string | number>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.hasValue("C");
      expect(res).assertEqual(true);
      let res1 = hashMap.hasValue(8);
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testHasKey023
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2300
     * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasKey023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, number>();
      for (let i = 0; i < 10; i++) {
        hashMap.set(i, i)
      }
      let ss = Math.floor(Math.random() * 10)
      let res = hashMap.hasKey(ss);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testHasValue024
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2400
     * @tc.desc   Determine whether the HashMap contains the specified value. For example: hashMap.hasValue(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasValue024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.hasValue(8);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testGet025
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2500
     * @tc.desc   Get the corresponding value through the key. For example: hashMap.get(3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.get(3);
      expect(res).assertEqual("C");
    });

    /**
     * @tc.name   testGet026
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2600
     * @tc.desc   Get the corresponding value through the key. For example: hashMap.get(3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test026()).assertTrue();
    });

    /**
     * @tc.name   testSetAll027
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2700
     * @tc.desc   Copy key value pairs from one HashMap to another.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetAll027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test027()).assertTrue();
    });

    /**
     * @tc.name   testSetAll028
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2800
     * @tc.desc   Copy key value pairs from one HashMap to another.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetAll028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test028()).assertTrue();
    });

    /**
     * @tc.name   testRemove029
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_2900
     * @tc.desc   Delete key value pairs according to key. For example: hashMap.remove(3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.remove(3);
      expect(res).assertEqual("C");
      let res1 = hashMap.length;
      expect(res1).assertEqual(4);
    });

    /**
     * @tc.name   testRemove030
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3000
     * @tc.desc   Delete key value pairs according to key. For example: hashMap.remove(3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test030()).assertTrue();
    });

    /**
     * @tc.name   testClear031
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3100
     * @tc.desc   Clear all key value pairs in HashMap. For example: hashMap.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      expect(res).assertEqual(5);
      hashMap.clear();
      let res1 = hashMap.length;
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.name   testClear032
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3200
     * @tc.desc   Clear all key value pairs in HashMap. For example: hashMap.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, number>();
      hashMap.clear();
      let res = hashMap.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testKeys033
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3300
     * @tc.desc   Get a collection of all the keys in the HashMap. For example: hashMap.keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testKeys033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test033()).assertTrue();
    });

    /**
     * @tc.name   testValues034
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3400
     * @tc.desc   Get a collection of all the values in the HashMap. For example: hashMap.values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testValues034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test034()).assertTrue();
    });

    /**
     * @tc.name   testReplace035
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3500
     * @tc.desc   Modify the corresponding value according to the specified key. For example: hashMap.replace(2, "G").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReplace035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.replace(2, "G");
      expect(res).assertEqual(true);
      expect(hashMap.get(2)).assertEqual("G");
    });

    /**
     * @tc.name   testReplace036
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3600
     * @tc.desc   Modify the corresponding value according to the specified key. For example: hashMap.replace(2, "G").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReplace036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      let res = hashMap.replace(2, "G");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3700
     * @tc.desc   Traverse all key value pairs in the HashMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test037()).assertTrue();
    });

    /**
     * @tc.name   testForEach038
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3800
     * @tc.desc   Traverse all key value pairs in the HashMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test038()).assertTrue();
    });

    /**
     * @tc.name   testIterator039
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_3900
     * @tc.desc   Iterate over all key value pairs in the HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test039()).assertTrue();
    });

    /**
     * @tc.name   testIterator040
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4000
     * @tc.desc   Traverse all key value pairs in the HashMap instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test040()).assertTrue();
    });

    /**
     * @tc.name   testEntries041
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4100
     * @tc.desc   Get all key value pairs collection in HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test041()).assertTrue();
    });

    /**
     * @tc.name   testEntries042
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4200
     * @tc.desc   Get all key value pairs collection in HashMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.entries();
      expect(undefined).assertEqual(res.next().value);
    });

    /**
     * @tc.name   testIsEmpty043
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4300
     * @tc.desc   Determine whether the HashMap instance is empty. For example: hashMap.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      let res = hashMap.length;
      let res1 = hashMap.isEmpty();
      expect(res).assertEqual(5);
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testIsEmpty044
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4400
     * @tc.desc   Determine whether the HashMap instance is empty. For example: hashMap.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      hashMap.set(1, "A");
      hashMap.set(2, "B");
      hashMap.set(3, "C");
      hashMap.set(4, "D");
      hashMap.set(5, "E");
      hashMap.clear();
      let res = hashMap.length;
      let res1 = hashMap.isEmpty();
      expect(res).assertEqual(0);
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.name   testEntries045
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4500
     * @tc.desc   Get all key value pairs collection in HashMap.For example: hashMap.entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, number>();
      let res = hashMap.entries();
      expect(undefined).assertEqual(res.next().value);
    });

    /**
     * @tc.name   testIterator046
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4600
     * @tc.desc   Iterate over all key value pairs in the HashMap. For example: hashMap[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test046()).assertTrue();
    });

    /**
     * @tc.name   testSet047
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4700
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set.bind({}, 1, "A")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSet047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<number, string>();
      try {
        hashMap.set.bind({}, 1, "A")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The set method cannot be bound`);
      }
    });

    /**
     * @tc.name   testSetAll048
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4800
     * @tc.desc   Copy key value pairs from one HashMap to another.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetAll048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test048()).assertTrue();
    });

    /**
     * @tc.name   testSetAll049
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_4900
     * @tc.desc   Copy key value pairs from one HashMap to another.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetAll049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test049()).assertTrue();
    });

    /**
     * @tc.name   testSet049
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5000
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set.bind({}, "a", "b")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSet049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.set.bind({}, "a", "b")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The set method cannot be bound`);
      }
    });

    /**
     * @tc.name   testIsEmpty050
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5100
     * @tc.desc   Determine whether the HashMap instance is empty. For example: hashMap.isEmpty.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsEmpty050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.isEmpty.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.name   testHasKey051
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5200
     * @tc.desc   Determine whether the HashMap contains the specified key. For example: hashMap.hasKey.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasKey051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.hasKey.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The hasKey method cannot be bound`);
      }
    });

    /**
     * @tc.name   testGet052
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5300
     * @tc.desc   Get the corresponding value through the key. For example: hashMap.get.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.get.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The get method cannot be bound`);
      }
    });

    /**
     * @tc.name   testSet053
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5400
     * @tc.desc   Add a pair of key value pairs to the HashMap. For example: hashMap.set(undefined, 11).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<Object, number>();
      try {
        hashMap.set(undefined, 11);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`The type of "key" must be Key of JS. Received value is: undefined`);
      }
    });

    /**
     * @tc.name   testRemove054
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5500
     * @tc.desc   Delete key value pairs according to key. For example: hashMap.remove.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.remove.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The remove method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach055
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5600
     * @tc.desc   Traverse all key value pairs in the HashMap instance.For example: hashMap.forEach.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashMap = new HashMap<string, string>();
      try {
        hashMap.forEach.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The forEach method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach056
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHMAPFP_5700
     * @tc.desc   Traverse all key value pairs in the HashMap instance.For example: hashMap.forEach(11).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test056()).assertTrue();
    });
  });
}
