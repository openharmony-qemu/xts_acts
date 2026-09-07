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
import LinkedList from '@ohos.util.LinkedList';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAdd005,
  testAdd057,
  testClone012,
  testForEach037,
  testGet059,
  testInsert028,
  testInsert029,
  testInsert030,
  testInsert058,
  testIterator036,
  testIterator058,
  testListGet041,
  testListSet042,
  testRemove021,
  testRemoveByIndex019,
  testRemoveByIndex062,
  testRemoveFirst014,
  testRemoveFirstFound024,
  testRemoveLast038,
  testRemoveLastFound025,
  testSet065
} from './LinkedListResource';

export default function LinkedListTest() {
  describe("LinkedListTest", () => {
    /**
     * @tc.name   testAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0100
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: linkedList.add("四").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("四");
      let res = linkedList.get(0);
      expect(res).assertEqual("四");
    });

    /**
     * @tc.name   testAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0200
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: linkedList.add(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(8);
      let res = linkedList.get(0);
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0300
     * @tc.desc   Add a element to the end of the LinkedList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<number[]>();
      let a = [1, 2, 3, 4];
      linkedList.add(a);
      let res = linkedList.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testAdd005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0400
     * @tc.desc   Add a element to the end of the LinkedList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testAdd005()).assertTrue();
    });

    /**
     * @tc.name   testAdd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0500
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: let a = ".";linkedList.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      let a = ".";
      linkedList.add(a);
      let res = linkedList.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testAdd007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0600
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: let a = "*";linkedList.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      let a = "*";
      linkedList.add(a);
      let res = linkedList.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testAdd008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0700
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: let a = "/";linkedList.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      let a = '/"';
      linkedList.add(a);
      let res = linkedList.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testAdd009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0800
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: let a = "";linkedList.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      let a = "";
      linkedList.add(a);
      let res = linkedList.get(0);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testAdd010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_0900
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: let a = "a";linkedList.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      let a = "a";
      linkedList.add(a);
      linkedList.add(a);
      let res = linkedList.get(0);
      expect(res).assertEqual(a);
      let res1 = linkedList.get(1);
      expect(res1).assertEqual(a);
    });

    /**
     * @tc.name   testHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1000
     * @tc.desc   Check whether the LinkedList contains a specified element. For example: linkedList.has("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      let res = linkedList.has("a");
      expect(res).assertEqual(true);
      let res1 = linkedList.has("d");
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testClone012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1100
     * @tc.desc   Clone an LinkedList instance. For example: linkedList.clone().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testClone012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testClone012()).assertTrue();
    });

    /**
     * @tc.name   testAddFirst013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1200
     * @tc.desc   Add element to LinkedList instance header. For example: linkedList.addFirst("e").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAddFirst013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.addFirst("e");
      let res = linkedList.get(0);
      expect(res).assertEqual("e");
    });

    /**
     * @tc.name   testRemoveFirst014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1300
     * @tc.desc   Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveFirst014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testRemoveFirst014()).assertTrue();
    });

    /**
     * @tc.name   testGetLastIndexOf015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1400
     * @tc.desc   In the LinkedList instance, find the index of a specified element from brack to front,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetLastIndexOf015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("b");
      let res = linkedList.getLastIndexOf("a");
      expect(res).assertEqual(3);
    });

    /**
     * @tc.name   testGetLastIndexOf016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1500
     * @tc.desc   In the LinkedList instance, find the index of a specified element from brack to front,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetLastIndexOf016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("b");
      let res = linkedList.getLastIndexOf("f");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testGetIndexOf017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1600
     * @tc.desc   In the LinkedList instance, find the index of a specified element from front to back,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetIndexOf017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("b");
      let res = linkedList.getIndexOf("b");
      expect(res).assertEqual(1);
    });

    /**
     * @tc.name   testGetIndexOf018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1700
     * @tc.desc   In the LinkedList instance, find the index of a specified element from front to back,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetIndexOf018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("b");
      let res = linkedList.getIndexOf("f");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testRemoveByIndex019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1800
     * @tc.desc   In the linkedList instance, delete the element based on its index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveByIndex019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testRemoveByIndex019()).assertTrue();
    });

    /**
     * @tc.name   testRemoveByIndex020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_1900
     * @tc.desc   In the linkedList instance, delete the element based on its subscript index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveByIndex020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      try {
        let res = linkedList.removeByIndex(10);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
      }
    });

    /**
     * @tc.name   testRemove021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2000
     * @tc.desc   Delete the specified element. For example: linkedList.remove("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemove021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testRemove021()).assertTrue();
    });

    /**
     * @tc.name   testRemove022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2100
     * @tc.desc   Delete the specified element. For example: linkedList.remove("d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemove022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      let res = linkedList.remove("d");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testRemove023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2200
     * @tc.desc   Delete the specified element. For example: linkedList.remove("d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemove023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      let res = linkedList.remove("d");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testRemoveFirstFound024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2300
     * @tc.desc   Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveFirstFound024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testRemoveFirstFound024()).assertTrue();
    });

    /**
     * @tc.name   testRemoveLastFound025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2400
     * @tc.desc   Delete the specified element found for the last time. For example: linkedList.removeLastFound("b").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveLastFound025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testRemoveLastFound025()).assertTrue();
    });

    /**
     * @tc.name   testGetFirst026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2500
     * @tc.desc   Get the header element of the linkedList instance. For example: linkedList.getFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetFirst026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      let res = linkedList.getFirst();
      expect(res).assertEqual("a");
    });

    /**
     * @tc.name   testGetLast027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2600
     * @tc.desc   Get the end element of the linkedList instance. For example: linkedList.getLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetLast027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      let res = linkedList.getLast();
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testInsert028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2700
     * @tc.desc   Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(3, "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsert028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testInsert028()).assertTrue();
    });

    /**
     * @tc.name   testInsert029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2800
     * @tc.desc   Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(0, "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsert029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testInsert029()).assertTrue();
    });

    /**
     * @tc.name   testInsert030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_2900
     * @tc.desc   Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(5, "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsert030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testInsert030()).assertTrue();
    });

    /**
     * @tc.name   testInsert031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3000
     * @tc.desc   Insert an element into the middle of the LinkedList instance. For example: linkedList.insert(9, "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsert031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      try {
        let res = linkedList.insert(8, "d");
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 5. Received value is: 8`);
      }
    });

    /**
     * @tc.name   testSet032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3100
     * @tc.desc   Modify the element corresponding to the specified index. For example: linkedList.set(2, "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSet032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      let res = linkedList.set(2, "d");
      let res1 = linkedList.get(2);
      expect(res1).assertEqual("d");
    });

    /**
     * @tc.name   testConvertToArray033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3200
     * @tc.desc   Convert an LinkedList instance to an array. For example: linkedList.convertToArray().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testConvertToArray033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(4);
      linkedList.add(3);
      linkedList.add(1);
      linkedList.add(2);
      linkedList.add(14);
      let res = linkedList.convertToArray();
      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(res[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.name   testLength034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3300
     * @tc.desc   Get the number of elements in the LinkedList instance. For example: linkedList.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLength034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(4);
      linkedList.add(3);
      linkedList.add(1);
      linkedList.add(2);
      linkedList.add(14);
      let res = linkedList.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testClear035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3400
     * @tc.desc   Clear all elements in the linkedList instance. For example: linkedList.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(4);
      linkedList.add(3);
      linkedList.add(1);
      linkedList.add(2);
      linkedList.add(14);
      linkedList.clear();
      let res = linkedList.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testIterator036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3500
     * @tc.desc   Iterates over all elements in an LinkedList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIterator036()).assertTrue();
    });

    /**
     * @tc.name   testForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3600
     * @tc.desc   Traversing elements in an LinkedList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testForEach037()).assertTrue();
    });

    /**
     * @tc.name   testRemoveLast038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3700
     * @tc.desc   Delete the end element of a LinkedList instance. linkedList.removeLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveLast038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testRemoveLast038()).assertTrue();
    });

    /**
     * @tc.name   testGet039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3800
     * @tc.desc   Gets the element corresponding to the specified index. For example: linkedList.get(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      let res = linkedList.get(1);
      expect(res).assertEqual("b");
    });

    /**
     * @tc.name   testGet040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_3900
     * @tc.desc   Gets the element corresponding to the specified index. For example: linkedList.get(10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      linkedList.add("b");
      let res = linkedList.get(10);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testListGet041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4000
     * @tc.desc   Gets the element corresponding to the specified index. For example: linkedList[1].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testListGet041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testListGet041()).assertTrue();
    });

    /**
     * @tc.name   testGet042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4100
     * @tc.desc   Gets the element corresponding to the specified index. For example: list.get(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(0);
      linkedList.add(1);
      linkedList.add(2);
      let s = Math.trunc(1.33);
      let res = linkedList.get(s);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.name   testListSet042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4200
     * @tc.desc   Modify the element corresponding to the specified index. For example: linkedList[1] = "f".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testListSet042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testListSet042()).assertTrue();
    });

    /**
     * @tc.name   testAdd043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4300
     * @tc.desc   Add a element to the end of the LinkedList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      for (let i = 0; i < 100; i++) {
        linkedList.add(i);
      }
      let res = linkedList.get(99);
      expect(res).assertEqual(99);
    });

    /**
     * @tc.name   testRemoveByIndex044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4400
     * @tc.desc   In the linkedList instance, delete the element based on its subscript index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByIndex044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      try {
        let res = linkedList.removeByIndex(1);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual("Container is empty");
      }
    });

    /**
     * @tc.name   testClone045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4500
     * @tc.desc   Clone an LinkedList instance. For example: linkedList.clone().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClone045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let newlinkedList = linkedList.clone();
      let res = true
      for (let i = 0; i < linkedList.length; i++) {
        if (linkedList[i] !== newlinkedList[i]) {
          res = false
        }
      }
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testGetIndexOf046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4600
     * @tc.desc   In the LinkedList instance, find the index of a specified element from front to back,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetIndexOf046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let res = linkedList.getIndexOf(1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testRemoveByIndex045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4700
     * @tc.desc   In the LinkedList instance, find the index of a specified element from front to back,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByIndex045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(0)
      linkedList.add(1)
      let s = Math.trunc(1.33);
      linkedList.removeByIndex(s);
      expect(linkedList.has(1)).assertEqual(false);
    });

    /**
     * @tc.name   testForEach047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4800
     * @tc.desc   Traversing elements in an LinkedList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let num = 0;
      linkedList.forEach((item, index) => {
        num++;
      });
      expect(num).assertEqual(0);
    });

    /**
     * @tc.name   testHas048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_4900
     * @tc.desc   Check whether the LinkedList contains a specified element. For example: linkedList.has(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHas048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let res = linkedList.has(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testGet050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5000
     * @tc.desc   Gets the element corresponding to the specified index. For example: linkedList.get(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let res = linkedList.get(1);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testClear051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5100
     * @tc.desc   Clear all elements in the LinkedList instance. For example: linkedList.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.clear();
      const len = linkedList.length;
      expect(len).assertEqual(0);
    });

    /**
     * @tc.name   testGetLast052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5200
     * @tc.desc   Get the end element of the linkedList instance. For example: linkedList.getLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLast052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let res = linkedList.getLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetFirst053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5300
     * @tc.desc   Get the header element of the linkedList instance. For example: linkedList.getFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetFirst053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      let res = linkedList.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testAdd054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5400
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: linkedList.add(null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<Object>();
      linkedList.add(null);
      let res = linkedList.get(0);
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testAdd055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5500
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: linkedList.add(0.1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(0.1);
      let res = linkedList.get(0);
      expect(res).assertEqual(0.1);
    });

    /**
     * @tc.name   testAdd056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5600
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: linkedList.add(-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(-1);
      let res = linkedList.get(0);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testAdd057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5700
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: const obj = {}; linkedList.add(obj).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testAdd057()).assertTrue();
    });

    /**
     * @tc.name   testIterator058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5800
     * @tc.desc   Iterates over all elements in an LinkedList instance. For example: linkedList[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIterator058()).assertTrue();
    });

    /**
     * @tc.name   testAdd059Adapt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_5900
     * @tc.desc   Add a element to the end of the LinkedList instance. For example: linkedList.add.bind({}, obj)().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd059Adapt001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      try {
        linkedList.add.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The add method cannot be bound`);
      }
    });

    /**
     * @tc.name   testInsert058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6000
     * @tc.desc   Insert an element into the middle of the LinkedList instance. For example: linkedList.insert("a", "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsert058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testInsert058()).assertTrue();
    });

    /**
     * @tc.name   testInsert059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6100
     * @tc.desc   Insert an element into the middle of the LinkedList instance. For example: linkedList.insert("a", "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsert059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      linkedList.add(0);
      linkedList.add(1);
      linkedList.add(2);
      let s = Math.trunc(1.33);
      linkedList.insert(s, 3);
      expect(linkedList.get(1)).assertEqual(3);
    });

    /**
     * @tc.name   testGet059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6200
     * @tc.desc   Gets the element corresponding to the specified index. For example: linkedList.get("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGet059()).assertTrue();
    });

    /**
     * @tc.name   testRemoveFirst060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6300
     * @tc.desc   Delete the header element of a LinkedList instance. For example: linkedList.removeFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveFirst060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      try {
        linkedList.removeFirst();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200010);
        expect(err.message).assertEqual(`Container is empty`);
      }
    });

    /**
     * @tc.name   testRemoveLast061
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6400
     * @tc.desc   Delete the end element of a LinkedList instance. linkedList.removeLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveLast061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<number>();
      try {
        linkedList.removeLast();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200010);
        expect(err.message).assertEqual(`Container is empty`);
      }
    });

    /**
     * @tc.name   testRemoveByIndex062
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6500
     * @tc.desc   In the linkedList instance, delete the element based on its subscript index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByIndex062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testRemoveByIndex062()).assertTrue();
    });

    /**
     * @tc.name   testRemoveFirstFound063
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6600
     * @tc.desc   Delete the specified element found for the first time. For example: linkedList.removeFirstFound("b").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveFirstFound063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      try {
        linkedList.removeFirstFound("b");
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200010);
        expect(err.message).assertEqual(`Container is empty`);
      }
    });

    /**
     * @tc.name   testSet064
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6700
     * @tc.desc   Modify the element corresponding to the specified index. For example: linkedList.set(6, "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSet064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linkedList = new LinkedList<string>();
      linkedList.add("a");
      linkedList.add("b");
      linkedList.add("c");
      linkedList.add("a");
      try {
        linkedList.set(6, "d");
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 3. Received value is: 6`);
      }
    });

    /**
     * @tc.name   testSet065
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKEDLISTFP_6800
     * @tc.desc   Modify the element corresponding to the specified index. For example: linkedList.set("a", "d").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSet065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testSet065()).assertTrue();
    });
  });
}
