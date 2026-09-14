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
import TreeSet from '@ohos.util.TreeSet';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { test002, test006, test034, test036, test037, test045 } from './TreeSetResource';

export default function TreeSetTest() {
  describe("TreeSetTest", () => {

    /**
     * @tc.name   testConstructor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0100
     * @tc.desc   Create an TreeSet instance and use Compare. For example: TreeSet((a, b) => {return a > b}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testConstructor002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<string>((a, b) => {
        return a > b
      });
      expect(treeSet != undefined).assertEqual(true);
      treeSet.add("a");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("b");
      expect(treeSet.length).assertEqual(4);
      let numbers = Array.from(treeSet.values())
      for (let item of numbers) {
        let res = treeSet.remove(item)
        expect(res).assertEqual(true);
      }
    });

    /**
     * @tc.name   testAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0200
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("鍥?).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test002()).assertTrue();
    });

    /**
     * @tc.name   testAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0300
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("鍥?).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(8);
      let res = treeSet.has(8);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0400
     * @tc.desc   Add element to TreeSet instance. For example: let a = [1, 2, 3, 4]; treeSet.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number[]>();
      let a = [1, 2, 3, 4];
      treeSet.add(a);
      let res = treeSet.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd005
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0500
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("*").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("*");
      let res = treeSet.has("*");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0600
     * @tc.desc   Add element to TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test006()).assertTrue();
    });

    /**
     * @tc.name   testAdd007
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0700
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add(1.234).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(1.234);
      let res = treeSet.has(1.234);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd008
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0800
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      let res = treeSet.has(true);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd009
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_0900
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add("").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      let res = treeSet.has("");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd010
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1000
     * @tc.desc   Add element to TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      for (let i = 0; i < 10000; i++) {
        treeSet.add(i);
      }
      expect(treeSet.length).assertEqual(10000);
      let res = treeSet.has(8888);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testLength011
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1100
     * @tc.desc   Get the number of element in the TreeSet instance. For example: treeSet.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res = treeSet.length;
      expect(res).assertEqual(3);
    });

    /**
     * @tc.name   testLength012
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1200
     * @tc.desc   Get the number of element in the TreeSet instance. For example: treeSet.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testHas013
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1300
     * @tc.desc   Determine whether the TreeSet instance contains the specified element. For example: treeSet.has(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res = treeSet.has(2);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testHas014
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1400
     * @tc.desc   Determine whether the TreeSet instance contains the specified element. For example: treeSet.has(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res1 = treeSet.has(3);
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testGetFirstValue015
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1500
     * @tc.desc   Get the value that ranks first in the TreeSet instance. For example: treeSet.getFirstValue().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetFirstValue015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let res = treeSet.getFirstValue();
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testGetFirstValue016
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1600
     * @tc.desc   Get the value that ranks first in the TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetFirstValue016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.getFirstValue();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetLastValue017
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1700
     * @tc.desc   Get the last sorted key in the TreeSet instance. For example: treeSet.getLastValue().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLastValue017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let res = treeSet.getLastValue();
      expect(res).assertEqual(2);
    });

    /**
     * @tc.name   testGetLastValue018
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1800
     * @tc.desc   Get the last sorted key in the TreeSet instance. For example: treeSet.getLastValue().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLastValue018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.getLastValue();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetLowerValue019
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_1900
     * @tc.desc   Get a value that is a little lower than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLowerValue019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let res = treeSet.getLowerValue(2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.name   testGetLowerValue020
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2000
     * @tc.desc   Get a value that is a little lower than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLowerValue020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.getLowerValue(2);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetHigherValue021
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2100
     * @tc.desc   Get a value that is a little higher than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetHigherValue021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      let res = treeSet.getHigherValue(3);
      expect(res).assertEqual(4);
    });

    /**
     * @tc.name   testGetHigherValue022
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2200
     * @tc.desc   Get a value that is a little higher than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetHigherValue022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.getHigherValue(3);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testPopFirst023
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2300
     * @tc.desc   Delete first value of sort. For example: treeSet.popFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPopFirst023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("e");
      let res = treeSet.popFirst();
      expect(res).assertEqual("a");
    });

    /**
     * @tc.name   testPopFirst024
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2400
     * @tc.desc   Delete first value of sort. For example: treeSet.popFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPopFirst024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.popFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testPopLast025
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2500
     * @tc.desc   Delete last value of sort. For example: treeSet.popLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPopLast025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("e");
      let res = treeSet.popLast();
      expect(res).assertEqual("e");
    });

    /**
     * @tc.name   testPopLast026
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2600
     * @tc.desc   Delete last value of sort. For example: treeSet.popLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPopLast026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      let res = treeSet.popLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testClear027
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2700
     * @tc.desc   Clear all elements of the TreeSet instance. For example: treeSet.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.clear();
      let res = treeSet.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testClear028
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2800
     * @tc.desc   Clear all elements of the TreeSet instance. For example: treeSet.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.clear();
      let res = treeSet.length;
      expect(res).assertEqual(0);
      let res1 = treeSet.popFirst();
      expect(res1).assertEqual(undefined);
    });

    /**
     * @tc.name   testIsEmpty029
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_2900
     * @tc.desc   Determine whether the TreeSet instance is empty. For example: treeSet.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      let res1 = treeSet.isEmpty();
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testIsEmpty030
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3000
     * @tc.desc   Determine whether the TreeSet instance is empty. For example: treeSet.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<number>();
      let res2 = treeSet.isEmpty();
      expect(res2).assertEqual(true);
    });

    /**
     * @tc.name   testRemove031
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3100
     * @tc.desc   Delete the specified value. For example: hashSet.remove("c").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("g");
      let res1 = treeSet.remove("c");
      expect(res1).assertEqual(true);
      let res2 = treeSet.has("c");
      expect(res2).assertEqual(false);
    });

    /**
     * @tc.name   testRemove032
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3200
     * @tc.desc   Delete the specified value. For example: hashSet.remove("c").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      let res = treeSet.remove("c");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testValues033
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3300
     * @tc.desc   Get a collection of all the values in the TreeSet. For example: treeSet.values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testValues033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("g");
      let res = treeSet.values();
      expect(res.next().value).assertEqual("a");
      expect(res.next().value).assertEqual("b");
      expect(res.next().value).assertEqual("c");
      expect(res.next().value).assertEqual("d");
      expect(res.next().value).assertEqual("g");
    });

    /**
     * @tc.name   testForEach034
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3400
     * @tc.desc   Traverse the collection of all elements of the TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test034()).assertTrue();
    });

    /**
     * @tc.name   testEntries035
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3500
     * @tc.desc   Get all key value pairs collection in TreeMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.add("d");
      treeSet.add("g");
      let res = treeSet.entries();
      expect(JSON.stringify(res.next().value)).assertEqual('["a","a"]');
      expect(JSON.stringify(res.next().value)).assertEqual('["b","b"]');
      expect(JSON.stringify(res.next().value)).assertEqual('["c","c"]');
      expect(JSON.stringify(res.next().value)).assertEqual('["d","d"]');
      expect(JSON.stringify(res.next().value)).assertEqual('["g","g"]');
    });

    /**
     * @tc.name   testIterator036
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3600
     * @tc.desc   Iterate over all elements of the TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test036()).assertTrue();
    });

    /**
     * @tc.name   testIterator037
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3700
     * @tc.desc   Iterate over all elements of the TreeSet instance. For example: treeSet[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test037()).assertTrue();
    });

    /**
     * @tc.name   testAdd038
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3800
     * @tc.desc   Add element to TreeSet instance. For example: treeSet.add.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      try {
        treeSet.add.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The add method cannot be bound`);
      }
    });

    /**
     * @tc.name   testClear039
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_3900
     * @tc.desc   Clear all elements of the TreeSet instance. For example: treeSet.clear.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClear039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      try {
        treeSet.clear.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The clear method cannot be bound`);
      }
    });

    /**
     * @tc.name   testGetLowerValue040
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4000
     * @tc.desc   Get a value that is a little lower than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      try {
        treeSet.getLowerValue.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The getLowerValue method cannot be bound`);
      }
    });

    /**
     * @tc.name   testGetLowerValue041
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4100
     * @tc.desc   Get a value that is a little lower than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLowerValue041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<Object>();
      let res = treeSet.getLowerValue(null);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetHigherValue042
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4200
     * @tc.desc   Get a value that is a little higher than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<Object>();
      let res = treeSet.getHigherValue(null);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetHigherValue043
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4300
     * @tc.desc   Get a value that is a little higher than the specified value sort.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHigherValue043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      try {
        treeSet.getHigherValue.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The getHigherValue method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach044
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4400
     * @tc.desc   Traverse the collection of all elements of the TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      try {
        treeSet.forEach.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The forEach method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach045
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4500
     * @tc.desc   Traverse the collection of all elements of the TreeSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test045()).assertTrue();
    });

    /**
     * @tc.name   testValues046
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4600
     * @tc.desc   Get a collection of all the values in the TreeSet. For example: treeSet.values.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      try {
        treeSet.values.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The Symbol.iterator method cannot be bound`);
      }
    });

    /**
     * @tc.name   testValues047
     * @tc.number SUB_COMMONLIBRARY_UTIL_TREESETFP_4700
     * @tc.desc   Get a collection of all the values in the TreeSet. For example: treeSet.forEach((value, key).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let treeSet = new TreeSet<string>();
      treeSet.add("sparrow");
      treeSet.forEach((value, key) => {
        expect(value).assertEqual("sparrow");
        expect(key).assertEqual("sparrow");
      });
    });
  });
}
