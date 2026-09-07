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
import HashSet from '@ohos.util.HashSet';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  test004,
  test008,
  test011,
  test012,
  test013,
  test019,
  test022,
  test026,
  test028,
  test029,
  test031,
  test036
} from './HashSetResource';

export default function HashSetTest() {
  describe("HashSetTest", () => {

    /**
     * @tc.name   testAdd001
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0100
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      let res = hashSet.has(1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0200
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add("a").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<string>();
      hashSet.add("b");
      hashSet.add("c");
      hashSet.add("d");
      hashSet.add("a");
      hashSet.add("g");
      let res = hashSet.has("a");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0300
     * @tc.desc   Add element to HashSet instance. For example: let c = [1, 2, 3]; hashSet.add(c).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<number[]>();
      let c = [1, 2, 3];
      hashSet.add(c);
      let res = hashSet.has(c);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0400
     * @tc.desc   Add element to HashSet instance. For example: let c = {name: "lili", age: "13"}; hashSet.add(c).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test004()).assertTrue();
    });

    /**
     * @tc.name   testLength005
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0500
     * @tc.desc   Get the number of element in the HashSet instance. For example: hashSet.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet.length;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.name   testHas006
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0600
     * @tc.desc   Determine whether the HashSet instance contains the specified element. For example: hashSet.has(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<number | string>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.has(1);
      expect(res).assertEqual(true);
      let res1 = hashSet.has("A");
      expect(res1).assertEqual(false);
    });

    /**
     * @tc.name   testIsEmpty007
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0700
     * @tc.desc   Determine whether the HashSet instance is empty. For example: hashSet.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIsEmpty007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testRemove008
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0800
     * @tc.desc   Delete the specified element. For example: hashSet.remove(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemove008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test008()).assertTrue();
    });

    /**
     * @tc.name   testClear009
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_0900
     * @tc.desc   Clear all elements of the HashSet instance. For example: hashSet.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testClear009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      let res = hashSet.length;
      expect(res).assertEqual(5);
      hashSet.clear();
      let res1 = hashSet.length;
      expect(res1).assertEqual(0);
    });

    /**
     * @tc.name   testValues010
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1000
     * @tc.desc   Get a collection of all elements of a HashSet instance. For example: hashSet.values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testValues010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hashSet = new HashSet<string>();
      hashSet.add("A");
      hashSet.add("B");
      hashSet.add("C");
      hashSet.add("D");
      hashSet.add("E");
      let res = hashSet.values();
      for (let i = 0; i < hashSet.length; i++) {
        let has = hashSet.has(res.next().value);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.name   testForEach011
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1100
     * @tc.desc   Traverse the collection of all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testForEach011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test011()).assertTrue();
    });

    /**
     * @tc.name   testIterator012
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1200
     * @tc.desc   Iterate over all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIterator012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test012()).assertTrue();
    });

    /**
     * @tc.name   testIterator013
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1300
     * @tc.desc   Iterate over all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test013()).assertTrue();
    });

    /**
     * @tc.name   testEntries014
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1400
     * @tc.desc   Iterate over all elements of the HashSet instance. For example: hashSet.entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let res = hashSet.entries();
      for (let i = 0; i < hashSet.length; i++) {
        let has = hashSet.has(res.next().value[1]);
        expect(has).assertEqual(true);
      }
    });

    /**
     * @tc.name   testAdd015
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1500
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add("").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<string>();
      hashSet.add("");
      let res = hashSet.has("");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd016
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1600
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add("$").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<string>();
      hashSet.add("$");
      let res = hashSet.has("$");
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd017
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1700
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add(1.34).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(1.34);
      let res = hashSet.has(1.34);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd018
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1800
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add(-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(-1);
      let res = hashSet.has(-1);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testAdd019
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_1900
     * @tc.desc   Add element to HashSet instance. For example: let a = {}; hashSet.add(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test019()).assertTrue();
    });

    /**
     * @tc.name   testAdd020
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2000
     * @tc.desc   Add element to HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      for (let i = 0; i < 100; i++) {
        hashSet.add(i);
        let res = hashSet.has(i);
        expect(res).assertEqual(true);
      }
      let res1 = hashSet.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.name   testIterator021
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2100
     * @tc.desc   Iterate over all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      let i = 0;
      for (let item of hashSet) {
        expect(item).assertEqual(i);
        i++;
      }
    });

    /**
     * @tc.name   testForEach022
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2200
     * @tc.desc   Traverse the collection of all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test022()).assertTrue();
    });

    /**
     * @tc.name   testIsEmpty023
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2300
     * @tc.desc   Determine whether the HashSet instance is empty. For example: hashSet.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      hashSet.clear();
      let res = hashSet.isEmpty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testHas024
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2400
     * @tc.desc   Determine whether the HashSet instance contains the specified element. For example: hashSet.has(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHas024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      let res = hashSet.has(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testRemove025
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2500
     * @tc.desc   Delete the specified element. For example: hashSet.remove(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemove025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      let res = hashSet.remove(1);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testClear026
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2600
     * @tc.desc   Clear all elements of the HashSet instance. For example: hashSet.clear().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClear026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test026()).assertTrue();
    });

    /**
     * @tc.name   testEntries027
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2700
     * @tc.desc   Iterate over all elements of the HashSet instance. For example: hashSet.entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      let res = hashSet.entries();
      expect(res.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   testIterator028
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2800
     * @tc.desc   Iterate over all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test028()).assertTrue();
    });

    /**
     * @tc.name   testForEach029
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_2900
     * @tc.desc   Traverse the collection of all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test029()).assertTrue();
    });

    /**
     * @tc.name   testAdd030
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3000
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add(1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(1);
      let has = hashSet.has(1);
      let size = hashSet.length;
      expect(has).assertEqual(true);
      expect(size).assertEqual(1);
    });

    /**
     * @tc.name   testIterator031
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3100
     * @tc.desc   Iterate over all elements of the HashSet instance. For example: hashSet[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test031()).assertTrue();
    });

    /**
     * @tc.name   testHas032
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3200
     * @tc.desc   Determine whether the HashSet instance contains the specified element. For example: hashSet.has.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHas032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number | string>();
      hashSet.add(4);
      hashSet.add(1);
      hashSet.add(3);
      hashSet.add(2);
      hashSet.add(5);
      try {
        hashSet.has.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The has method cannot be bound`);
      }
    });

    /**
     * @tc.name   testAdd033
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3300
     * @tc.desc   Add element to HashSet instance. For example: hashSet.add.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<string>();
      try {
        hashSet.add.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The add method cannot be bound`);
      }
    });

    /**
     * @tc.name   testIsEmpty034
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3400
     * @tc.desc   Determine whether the HashSet instance is empty. For example: hashSet.isEmpty.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsEmpty034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<string>();
      try {
        hashSet.isEmpty.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach035
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3500
     * @tc.desc   Traverse the collection of all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<string>();
      try {
        hashSet.forEach.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The forEach method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach036
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3600
     * @tc.desc   Traverse the collection of all elements of the HashSet instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test036()).assertTrue();
    });

    /**
     * @tc.name   testEntries037
     * @tc.number SUB_COMMONLIBRARY_UTIL_HASHSETFP_3700
     * @tc.desc   Iterate over all elements of the HashSet instance. For example: hashSet.entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testEntries037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let hashSet = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      hashSet.add(4);
      hashSet.add(5);
      let iter = hashSet.entries();
      let temp = iter.next();
      while (!temp.done) {
        expect(temp.value[0]).assertEqual(temp.value[1]);
        temp = iter.next();
      }
    });
  });
}
