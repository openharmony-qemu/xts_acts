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
import PlainArray from '@ohos.util.PlainArray';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { test004, test009, test018, test021, test026, test033, test039, test040, test041, test042, test043, test044, test045, test046, test047 } from './PlainArrayResource';

export default function PlainArrayTest() {
  describe("PlainArrayTest", () => {

    /**
     * @tc.name   testAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0100
     * @tc.desc   Add a pair of key value pairs to the PlainArray. For example: plainArray.add(1, "A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      let res = plainArray.get(1);
      expect(res).assertEqual("A");
    });

    /**
     * @tc.name   testAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0200
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<number[]>();
      let a = [1, 2, 3, 4];
      plainArray.add(2, a);
      let res = plainArray.get(2);
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0300
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test004()).assertTrue();
    });

    /**
     * @tc.name   testAdd005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0400
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<boolean>();
      let c = false;
      plainArray.add(1, c);
      let res = plainArray.get(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testAdd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0500
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 3);
      let res = plainArray.get(1);
      expect(res).assertEqual(3);
    });

    /**
     * @tc.name   testGet007
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0600
     * @tc.desc   Get the corresponding value through the key. For example: plainArray.get(4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGet007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.get(4);
      expect(res).assertEqual("D");
      res = plainArray.get(10);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testLength008
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0700
     * @tc.desc   Get the number of key value pairs in the PlainArray instance. For example: plainArray.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      let res = plainArray.length;
      expect(res).assertEqual(0);
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      res = plainArray.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testClone009
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0800
     * @tc.desc   Clone an PlainArray instance. For example: plainArray.clone().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testClone009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test009()).assertTrue();
    });

    /**
     * @tc.name   testClear010
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_0900
     * @tc.desc   Clear all key value pairs in PlainArray. For example: plainArray.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testClear010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.length;
      expect(res).assertEqual(5);
      plainArray.clear();
      let res1 = plainArray.length;
      expect(res1).assertEqual(0);
      plainArray.clear();
      let res2 = plainArray.length;
      expect(res2).assertEqual(0);
    });

    /**
     * @tc.name   testHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1000
     * @tc.desc   Check whether the PlainArray contains a specified element. For example: plainArray.has(6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.has(6);
      expect(res).assertEqual(false);
      let res1 = plainArray.has(1);
      expect(res1).assertEqual(true);
    });

    /**
     * @tc.name   testGetIndexOfKey012
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1100
     * @tc.desc   Find the index of the key value pair according to the corresponding key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetIndexOfKey012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfKey(2);
      expect(res).assertEqual(1);
      res = plainArray.getIndexOfKey(12);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testGetIndexOfValue013
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1200
     * @tc.desc   Find the index of the key value pair according to the corresponding value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetIndexOfValue013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfValue("A");
      expect(res).assertEqual(0);
      res = plainArray.getIndexOfValue("Z");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testIsEmpty014
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1300
     * @tc.desc   Determine whether the PlainArray instance is empty. For example: plainArray.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIsEmpty014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      let result = plainArray.length;
      expect(result).assertEqual(0);
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testGetKeyAt015
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1400
     * @tc.desc   Find the key of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetKeyAt015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getKeyAt(2);
      expect(res).assertEqual(3);
    });

    /**
     * @tc.name   testReMove016
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1500
     * @tc.desc   Delete key value pairs according to key. For example: plainArray.remove(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testReMove016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.remove(2);
      expect(res).assertEqual("B");
      let value = plainArray.get(2);
      expect(value).assertEqual(undefined);
      res = plainArray.remove(12);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testReMoveAt017
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1600
     * @tc.desc   Delete key value pairs according to index. For example: plainArray.removeAt(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testReMoveAt017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.removeAt(2);
      expect(res).assertEqual("C");
      let value = plainArray.get(3);
      expect(value).assertEqual(undefined);
    });

    /**
     * @tc.name   testReMoveRangeFrom018
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1700
     * @tc.desc   Deletes the specified number of elements from the specified starting index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testReMoveRangeFrom018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test018()).assertTrue();
    });

    /**
     * @tc.name   testSetValueAt019
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1800
     * @tc.desc   Modify the value of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetValueAt019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.setValueAt(2, "V");
      let keys = [1, 2, 3, 4, 5];
      let values = ["A", "B", "V", "D", "E"];
      for (let i = 0; i < keys.length; i++) {
        expect(values[i]).assertEqual(plainArray.get(keys[i]));
      }
      try {
        plainArray.setValueAt(-1, "X");
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: -1`);
      }
    });

    /**
     * @tc.name   testToString020
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_1900
     * @tc.desc   Use "," to splice the elements in the LightWeightMap instance into a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testToString020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      let res1 = plainArray.toString();
      expect(res1).assertEqual("");
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      let res = plainArray.toString();
      expect(res).assertEqual("1:A,2:B,3:C");
    });

    /**
     * @tc.name   testForEach021
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2000
     * @tc.desc   Traverse all key value pairs in the PlainArray instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test021()).assertTrue();
    });

    /**
     * @tc.name   testIterator022
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2100
     * @tc.desc   Iterate over all key value pairs in the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let keys = [1, 2, 3, 4, 5];
      let values = ["A", "B", "C", "D", "E"];
      for (let i = 0; i < keys.length; i++) {
        expect(values[i]).assertEqual(plainArray.get(keys[i]));
      }
    });

    /**
     * @tc.name   testGetValueAt023
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2200
     * @tc.desc   Get the value of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetValueAt023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getValueAt(2);
      expect(res).assertEqual("C");
    });

    /**
     * @tc.name   testAdd024
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2300
     * @tc.desc   Add a pair of key value pairs to the PlainArray.For example: plainArray.add(1, 3.1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<number>();
      plainArray.add(1, 3.1);
      let res = plainArray.get(1);
      expect(res).assertEqual(3.1);
    });

    /**
     * @tc.name   testAdd025
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2400
     * @tc.desc   Add a pair of key value pairs to the PlainArray.For example: plainArray.add(1, null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<Object>();
      plainArray.add(1, null);
      let res = plainArray.get(1);
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testAdd026
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2500
     * @tc.desc   Add a pair of key value pairs to the PlainArray.For example: plainArray.add("a", null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test026()).assertTrue();
    });

    /**
     * @tc.name   testGet027
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2600
     * @tc.desc   Get the corresponding value through the key. For example: plainArray.get(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.get(8);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetIndexOfKey028
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2700
     * @tc.desc   Find the index of the key value pair according to the corresponding key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetIndexOfKey028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfKey(9);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testGetIndexOfValue029
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2800
     * @tc.desc   Find the index of the key value pair according to the corresponding value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetIndexOfValue029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getIndexOfValue("Asad");
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.name   testGetKeyAt030
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_2900
     * @tc.desc   Find the key of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetKeyAt030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.getKeyAt(50);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetValueAt031
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3000
     * @tc.desc   Find the value of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetValueAt031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      try {
        plainArray.getValueAt(50);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 50`);
      }
    });

    /**
     * @tc.name   testRemove032
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3100
     * @tc.desc   Delete key value pairs according to key. For example: plainArray.remove(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<number>();
      let res = plainArray.remove(2);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testRemoveAt033
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3200
     * @tc.desc   Delete key value pairs according to index. For example: plainArray.removeAt("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveAt033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test033()).assertTrue();
    });

    /**
     * @tc.name   testReMoveRangeFrom034
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3300
     * @tc.desc   Deletes the specified number of elements from the specified starting index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReMoveRangeFrom034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      plainArray.removeRangeFrom(0, 5);
      let res = plainArray.length;
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testSetValueAt035
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3400
     * @tc.desc   Modify the value of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetValueAt035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      try {
        plainArray.setValueAt(8, "V");
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200001);
        expect(err.message)
          .assertEqual(`The value of "index" is out of range. It must be >= 0 && <= 4. Received value is: 8`);
      }
    });

    /**
     * @tc.name   testAdd036
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3500
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<number>();
      for (let i = 0; i < 100; i++) {
        plainArray.add(i, i + 1);
      }
      let res = plainArray.get(1);
      let res1 = plainArray.length;
      expect(res).assertEqual(2);
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.name   testAdd037
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3600
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<number>();
      for (let i = 0; i < 1000; i++) {
        plainArray.add(i, i + 1);
      }
      let res = plainArray.get(99);
      let res1 = plainArray.length;
      expect(res).assertEqual(100);
      expect(res1).assertEqual(1000);
    });

    /**
     * @tc.name   testAdd038
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3700
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(3, "a");
      plainArray.add(1, "b");
      plainArray.add(2, "c");
      plainArray.add(5, "d");
      plainArray.add(4, "e");
      let res = plainArray.get(2);
      expect(res).assertEqual("c");
    });

    /**
     * @tc.name   testAdd039
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3800
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test039()).assertTrue();
    });

    /**
     * @tc.name   testAdd040
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_3900
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test040()).assertTrue();
    });

    /**
     * @tc.name   testAdd041
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4000
     * @tc.desc   Add a pair of key value pairs to the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test041()).assertTrue();
    });

    /**
     * @tc.name   testIterator042
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4100
     * @tc.desc   Iterate over all key value pairs in the PlainArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test042()).assertTrue();
    });

    /**
     * @tc.name   testAdd043
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4200
     * @tc.desc   Add a pair of key value pairs to the PlainArray. For example: plainArray.add(1.23, "a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test043()).assertTrue();
    });

    /**
     * @tc.name   testHas044
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4300
     * @tc.desc   Check whether the PlainArray contains a specified element. For example: plainArray.has("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHas044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test044()).assertTrue();
    });

    /**
     * @tc.name   testGet045
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4400
     * @tc.desc   Get the corresponding value through the key. For example: plainArray.get("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGet045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test045()).assertTrue();
    });

    /**
     * @tc.name   testGetIndexOfKey046
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4500
     * @tc.desc   Find the index of the key value pair according to the corresponding key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetIndexOfKey046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test046()).assertTrue();
    });

    /**
     * @tc.name   testGetKeyAt047
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4600
     * @tc.desc   Find the key of the key value pair according to the corresponding index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetKeyAt047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test047()).assertTrue();
    });

    /**
     * @tc.name   testReMoveAt048
     * @tc.number SUB_COMMONLIBRARY_UTIL_PLAINARRAYFP_4700
     * @tc.desc   Delete key value pairs according to index. For example: plainArray.removeAt(12).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReMoveAt048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "A");
      plainArray.add(2, "B");
      plainArray.add(3, "C");
      plainArray.add(4, "D");
      plainArray.add(5, "E");
      let res = plainArray.removeAt(12);
      expect(res).assertEqual(undefined);
    });
  });
}
