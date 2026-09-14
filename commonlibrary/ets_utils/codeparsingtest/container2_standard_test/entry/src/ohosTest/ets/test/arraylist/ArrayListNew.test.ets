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
import ArrayList from '@ohos.util.ArrayList';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  test001,
  test004,
  test007,
  test011,
  test014,
  test015,
  test016,
  test017,
  test020,
  test022,
  test025,
  test026,
  test035,
  test041,
  test044,
  test049,
  test050,
  test051,
  test054,
  test055,
  test056,
  test057,
  test058,
  test063
} from './ArrayResource';

export default function ArraylistTest() {
  describe("ArraylistTest", () => {

    /**
     * @tc.name   testConstructor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0100
     * @tc.desc   Create an ArrayList instance. For example: let arrayList = new ArrayList().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let err: ESObject = test001();
      expect(err).assertTrue();
    });

    /**
     * @tc.name   testAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0200
     * @tc.desc   Add a string type element to the end of the ArrayList instance. For example: arrayList.add("四").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<string>();
      arrayList.add("四");
      let res = arrayList.has("四");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0300
     * @tc.desc   Add a number type element to the end of the ArrayList instance. For example: arrayList.add(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(8);
      let res = arrayList.has(8);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0400
     * @tc.desc   Add a object type element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test004()).assertTrue();
    });

    /**
     * @tc.name   testAdd005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0500
     * @tc.desc   Add a array type element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number[]>();
      let a = [1, 2, 3, 4];
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0600
     * @tc.desc   Add a boolean type element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<boolean>();
      let a = true;
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testInsert007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0700
     * @tc.desc   Insert an element into the middle of the ArrayList instance. For example: arrayList.insert(8, 2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsert007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test007()).assertTrue();
    });

    /**
     * @tc.name   testLength008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0800
     * @tc.desc   Get the number of elements contained in the ArrayList instance. For example: arrayList.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testHas009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_0900
     * @tc.desc   Check whether the ArrayList contains a specified element. For example: arrayList.has(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.has(8);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testGetIndexOf010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1000
     * @tc.desc   In the ArrayList instance, find the index of a specified element from front to back,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetIndexOf010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add(1);
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(1, 2);
      let res1 = arrayList.getIndexOf(1);
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.name   testRemoveByIndex011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1100
     * @tc.desc   In the ArrayList instance, delete the element based on its index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveByIndex011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test011()).assertTrue();
    });

    /**
     * @tc.name   testRemove012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1200
     * @tc.desc   Delete the specified element . For example: arrayList.remove("三").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemove012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.remove("三");
      let res = arrayList.has("三");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testGetLastIndexOf013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1300
     * @tc.desc   In the ArrayList instance, find the index of a specified element from brack to front,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetLastIndexOf013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      let res = arrayList.getLastIndexOf(1);
      expect(res).assertEqual(4);
    });

    /**
     * @tc.name   testRemoveByRange014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1400
     * @tc.desc   Deletes elements from a specified range, including elements at the start position and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveByRange014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test014()).assertTrue();
    });

    /**
     * @tc.name   testReplaceAllElements015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1500
     * @tc.desc   Perform some operation on the elements in the ArrayList instance and return the ArrayList instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testReplaceAllElements015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test015()).assertTrue();
    });

    /**
     * @tc.name   testForEach016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1600
     * @tc.desc   Traversing elements in an ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testForEach016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test016()).assertTrue();
    });

    /**
     * @tc.name   testSubArrayList017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1700
     * @tc.desc   Intercepts an element within the specified range, including the element with the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSubArrayList017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test017()).assertTrue();
    });

    /**
     * @tc.name   testClear018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1800
     * @tc.desc   Clear all elements in the ArrayList instance. For example: arrayList.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testClear018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.clear();
      let res = arrayList.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testConvertToArray19
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_1900
     * @tc.desc   Convert an ArrayList instance to an array. For example: arrayList.convertToArray().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testConvertToArray19", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let arr = arrayList.convertToArray();
      let a = [4, 3, 1, 2, 14];
      for (let i = 0; i < a.length; i++) {
        expect(arr[i]).assertEqual(a[i]);
      }
    });

    /**
     * @tc.name   testClone020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2000
     * @tc.desc   Clone an ArrayList instance. For example: arrayList.clone().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testClone020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test020()).assertTrue();
    });

    /**
     * @tc.name   testGetCapacity021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2100
     * @tc.desc   Get the capacity of ArrayList instance. For example: arrayList.getCapacity().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetCapacity021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(10);
    });

    /**
     * @tc.name   testGetCapacity022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2200
     * @tc.desc   Get the capacity of the ArrayList instance after capacity expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetCapacity022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test022()).assertTrue();
    });

    /**
     * @tc.name   testIncreaseCapacityTo023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2300
     * @tc.desc   Expand the ArrayList instance capacity to the specified value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIncreaseCapacityTo023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.increaseCapacityTo(8);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testTrimToCurrentLength024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2400
     * @tc.desc   Limit the ArrayList instance capacity to the length of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTrimToCurrentLength024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.trimToCurrentLength();
      let res = arrayList.getCapacity();
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testIterator025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2500
     * @tc.desc   Iterates over all elements in an ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIterator025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test025()).assertTrue();
    });

    /**
     * @tc.name   testSort026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2600
     * @tc.desc   Arrange the elements in the ArrayList instance in descending order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSort026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test026()).assertTrue();
    });

    /**
     * @tc.name   testInsert0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2700
     * @tc.desc   Inserting an element with an index less than 0 will throw an exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsert0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      try {
        let res = arrayList.insert(8, -1);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
      }
    });

    /**
     * @tc.name   testInsert028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2800
     * @tc.desc   Inserting an element with an index greater than or equal to the length of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsert028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      try {
        let res = arrayList.insert(8, 10);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 10`);
      }
    });

    /**
     * @tc.name   testInsert029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_2900
     * @tc.desc   Inserting an element with an index greater than or equal to the length of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsert029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      try {
        let res = arrayList.insert(8, 11);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 11`);
      }
    });

    /**
     * @tc.name   testIsEmpty030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3000
     * @tc.desc   Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIsEmpty030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.clear();
      let res = arrayList.isEmpty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testIsEmpty031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3100
     * @tc.desc   Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      let res = arrayList.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testHas032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3200
     * @tc.desc   Check whether the ArrayList contains a specified element. For example: arrayList.has("二").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHas032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(8, 2);
      let res = arrayList.has("二");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testGetIndexOf033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3300
     * @tc.desc   In the ArrayList instance, find the index of a specified element from front to back,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetIndexOf033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add(1);
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.insert(1, 2);
      let res = arrayList.getIndexOf("A");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testRemove034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3400
     * @tc.desc   Delete the specified element.For example: arrayList.remove("A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      let res = arrayList.remove("A");
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testRemove035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3500
     * @tc.desc   Delete the specified element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test035()).assertTrue();
    });

    /**
     * @tc.name   testRemoveByIndex036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3600
     * @tc.desc   In the ArrayList instance, delete the element based on its index index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByIndex036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      arrayList.add("a");
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add("a");
      arrayList.add("b");
      try {
        let res = arrayList.removeByIndex(5);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 5`);
      }
    });

    /**
     * @tc.name   testRemoveByRange037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3700
     * @tc.desc   Add a string element to the end of the ArrayList instance. For example: arrayList.add("四").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByRange037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      try {
        let res = arrayList.removeByRange(3, 1);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 0. Received value is: 3`);
      }
    });

    /**
     * @tc.name   testRemoveByRange038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3800
     * @tc.desc   Deletes elements from a specified range, including elements at the start position and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByRange038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      try {
        let res = arrayList.removeByRange(6, 8);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.name   testRemoveByRange039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_3900
     * @tc.desc   Deletes elements from a specified range, including elements at the start position and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByRange039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      arrayList.removeByRange(0, 8);
      let res = arrayList.length;
      let res1 = arrayList.getLastIndexOf(1);
      expect(res).assertEqual(0);
      expect(res1).assertEqual(-1);
    });

    /**
     * @tc.name   testSubArrayList040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4000
     * @tc.desc   Intercepts an element within the specified range, including the element with the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSubArrayList040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      try {
        let subArr = arrayList.subArrayList(4, 2);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 1. Received value is: 4`);
      }
    });

    /**
     * @tc.name   testSubArrayList041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4100
     * @tc.desc   Intercepts an element within the specified range, including the element with the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSubArrayList041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test041()).assertTrue();
    });

    /**
     * @tc.name   testSubArrayList042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4200
     * @tc.desc   Intercepts an element within the specified range, including the element with the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSubArrayList042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      try {
        let subArr = arrayList.subArrayList(6, 9);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "fromIndex" is out of range. It must be >= 0 && <= 4. Received value is: 6`);
      }
    });

    /**
     * @tc.name   testIncreaseCapacityTo043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4300
     * @tc.desc   Expand the ArrayList instance capacity to the specified value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIncreaseCapacityTo043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number>();
      arrayList.add(4);
      arrayList.add(3);
      arrayList.add(1);
      arrayList.add(2);
      arrayList.add(14);
      arrayList.increaseCapacityTo(-1);
      let res = arrayList.getCapacity();
      expect(res).assertEqual(10);
    });

    /**
     * @tc.name   testIncreaseCapacityTo044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4400
     * @tc.desc   Expand the ArrayList instance capacity to the specified value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIncreaseCapacityTo044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test044()).assertTrue();
    });

    /**
     * @tc.name   testAdd045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4500
     * @tc.desc   Add a string element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number>();
      for (let i = 0; i < 100; i++) {
        arrayList.add(i);
      }
      let res = arrayList.getIndexOf(99);
      let res1 = arrayList.length;
      expect(res).assertEqual(99);
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.name   testAdd046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4600
     * @tc.desc   Add a symbol type element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      let a = "*";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4700
     * @tc.desc   Add a decimal type to the end of the ArrayList instance. For example: let a = "3.14";arrayList.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      let a = "3.14";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4800
     * @tc.desc   Add a null character element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      let a = "";
      arrayList.add(a);
      let res = arrayList.has(a);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testSort049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_4900
     * @tc.desc   Arrange the elements in the ArrayList instance in descending order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSort049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test049()).assertTrue();
    });

    /**
     * @tc.name   testSort050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5000
     * @tc.desc   Arrange the elements in the ArrayList instance in descending order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSort050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test050()).assertTrue();
    });

    /**
     * @tc.name   testIterator051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5100
     * @tc.desc   Iterates over all elements in an ArrayList instance. For example: arrayList[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test051()).assertTrue();
    });

    /**
     * @tc.name   testRemoveByRange052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5200
     * @tc.desc   Deletes elements from a specified range, including elements at the start position and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByRange052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number | string>();
      arrayList.add("四");
      arrayList.add("三");
      arrayList.add(1);
      arrayList.add("a");
      arrayList.add(1);
      arrayList.add("b");
      arrayList.add("c");
      arrayList.add(1);
      try {
        arrayList.removeByRange(0, 9);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "toIndex" is out of range. It must be >= 0 && <= 8. Received value is: 9`);
      }
    });

    /**
     * @tc.name   testAdd053Adapt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5300
     * @tc.desc   Add a boolean type element to the end of the ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd053Adapt001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.add.bind({}, "a")()
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The add method cannot be bound`);
      }
    });

    /**
     * @tc.name   testInsert054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5400
     * @tc.desc   Inserting an element with an index greater than or equal to the length of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsert054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test054()).assertTrue();
    });

    /**
     * @tc.name   testRemoveByIndex055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5500
     * @tc.desc   In the ArrayList instance, delete the element based on its index index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByIndex055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test055()).assertTrue();
    });

    /**
     * @tc.name   testRemoveByRange056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5600
     * @tc.desc   Deletes elements from a specified range, including elements at the start position and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByRange056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test056()).assertTrue();
    });

    /**
     * @tc.name   testReplaceAllElements057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5700
     * @tc.desc   Perform some operation on the elements in the ArrayList instance and return the ArrayList instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReplaceAllElements057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test057()).assertTrue();
    });

    /**
     * @tc.name   testSubArrayList058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5800
     * @tc.desc   Intercepts an element within the specified range, including the element with the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSubArrayList058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test058()).assertTrue();
    });

    /**
     * @tc.name   testHas059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_5900
     * @tc.desc   Check whether the ArrayList contains a specified element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHas059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.has.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The has method cannot be bound`);
      }
    });

    /**
     * @tc.name   testRemoveByIndex060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6000
     * @tc.desc   In the ArrayList instance, delete the element based on its index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveByIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.removeByIndex.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The removeByIndex method cannot be bound`);
      }
    });

    /**
     * @tc.name   testRemove061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6100
     * @tc.desc   Delete the specified element . For example: arrayList.remove.bind({})().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemove061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.remove.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The remove method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6200
     * @tc.desc   Traversing elements in an ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.forEach.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The forEach method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6300
     * @tc.desc   Traversing elements in an ArrayList instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test063()).assertTrue();
    });

    /**
     * @tc.name   testClear064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6400
     * @tc.desc   Clear all elements in the ArrayList instance. For example: arrayList.clear.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClear064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.clear.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The clear method cannot be bound`);
      }
    });

    /**
     * @tc.name   testIsEmpty065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6500
     * @tc.desc   Determine whether the ArrayList instance is empty. For example: arrayList.isEmpty.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsEmpty065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<string>();
      try {
        arrayList.isEmpty.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.name   testRemoveByIndex066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLISTFP_6600
     * @tc.desc   In the ArrayList instance, delete the element based on its subscript index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveByIndex066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayList = new ArrayList<number>();
      try {
        let res = arrayList.removeByIndex(0);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message).assertEqual("Container is empty");
      }
    });
  }

  );
}
