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
import Deque from '@ohos.util.Deque';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { test004, test008, test015, test016, test032, test033, test034, test037 } from './DequeResource';

export default function DequeTest() {
  describe("DequeTest", () => {

    /**
     * @tc.name   testInsertFront002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0100
     * @tc.desc   Add element to deque instance header. For example: deque.insertFront("一").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertFront002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<string>();
      deque.insertFront("一");
      let res = deque.getFirst();
      expect(res).assertEqual("一");
    });

    /**
     * @tc.name   testInsertFront003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0200
     * @tc.desc   Add element to deque instance header. For example: deque.insertFront(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertFront003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number>();
      deque.insertFront(8);
      let res = deque.getFirst();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testInsertFront004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0300
     * @tc.desc   Add element to deque instance header.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertFront004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test004()).assertTrue();
    });

    /**
     * @tc.name   testInsertFront005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0400
     * @tc.desc   Add element to deque instance header. For example: let a = [1, 2, 3, 4]; deque.insertFront(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertFront005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number[]>();
      let a = [1, 2, 3, 4];
      deque.insertFront(a);
      let res = deque.getFirst();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testInsertEnd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0500
     * @tc.desc   Add element to deque instance end. For example: deque.insertEnd(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertEnd006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number>();
      deque.insertEnd(8);
      let res = deque.getLast();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testInsertEnd007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0600
     * @tc.desc   Add element to deque instance end. For example: let a = ["a", "b", "c"];deque.insertEnd(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertEnd007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<string[]>();
      let a = ["a", "b", "c"];
      deque.insertEnd(a);
      let res = deque.getLast();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testInsertEnd008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0700
     * @tc.desc   Add element to deque instance end. For example: let a = {class: "6班", say: "we"};deque.insertEnd(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testInsertEnd008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test008()).assertTrue();
    });

    /**
     * @tc.name   testGetFirst009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0800
     * @tc.desc   Get the header element of the deque instance. For example: deque.getFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetFirst009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<string>();
      deque.insertEnd("四");
      deque.insertEnd("三");
      let res = deque.getFirst();
      expect(res).assertEqual("四");
    });

    /**
     * @tc.name   testGetLast010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_0900
     * @tc.desc   Get the end element of the deque instance. For example: deque.getLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetLast010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number | string>();
      deque.insertEnd(8);
      deque.insertEnd("三");
      let res = deque.getLast();
      expect(res).assertEqual("三");
    });

    /**
     * @tc.name   testHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1000
     * @tc.desc   Determine whether the deque instance contains the specified element. For example: deque.has(6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number>();
      deque.insertEnd(6);
      let res = deque.has(6);
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testHas012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1100
     * @tc.desc   Determine whether the deque instance contains the specified element. For example: deque.has(6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHas012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number>();
      deque.insertEnd(8);
      let res = deque.has(6);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testPopFirst013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1200
     * @tc.desc   Delete the header element of a deque instance. For example: deque.popFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPopFirst013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number | string>();
      deque.insertEnd(8);
      deque.insertFront("一");
      let res = deque.popFirst();
      expect(res).assertEqual("一");
    });

    /**
     * @tc.name   testPopLast014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1300
     * @tc.desc   Delete the end element of a deque instance. For example: deque.popLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPopLast014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let deque = new Deque<number | string>();
      deque.insertEnd(8);
      deque.insertFront("一");
      deque.insertFront("二");
      let res = deque.popLast();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testForEach015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1400
     * @tc.desc   Traversing elements in deque instances. For example: deque.forEach((item, index) => {arr.push(item);}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testForEach015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test015()).assertTrue();
    });

    /**
     * @tc.name   testIterator016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1500
     * @tc.desc   Iterate over all elements in the deque instance. For example: for (let item of deque) { arr.push(item);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test016()).assertTrue();
    });

    /**
     * @tc.name   testInsertFront017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1600
     * @tc.desc   Add element to deque instance header. For example: deque.insertFront("$").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<string>();
      deque.insertFront("$");
      let res = deque.getFirst();
      expect(res).assertEqual("$");
    });

    /**
     * @tc.name   testInsertFront018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1700
     * @tc.desc   Add element to deque instance header. For example: deque.insertFront(" ").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<string>();
      deque.insertFront(" ");
      let res = deque.getFirst();
      expect(res).assertEqual(" ");
    });

    /**
     * @tc.name   testInsertFront019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1800
     * @tc.desc   Add element to deque instance header. For example: deque.insertFront(null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<Object>();
      deque.insertFront(null);
      let res = deque.getFirst();
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testInsertFront020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_1900
     * @tc.desc   Add element to deque instance header. For example: deque.insertFront(undefined).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<Object>();
      deque.insertFront(undefined);
      let res = deque.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testInsertFront021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2000
     * @tc.desc   Add element to deque instance header. For example: for (let i = 0; i < 100; i++) {deque.insertFront(i)}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      for (let i = 0; i < 100; i++) {
        deque.insertFront(i);
        let res = deque.getFirst();
        expect(res).assertEqual(i);
      }
      let res1 = deque.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.name   testInsertEnd022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2100
     * @tc.desc   Add element to deque instance end. For example: deque.insertEnd("$").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertEnd022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<string>();
      deque.insertEnd("$");
      let res = deque.getLast();
      expect(res).assertEqual("$");
    });

    /**
     * @tc.name   testInsertEnd023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2200
     * @tc.desc   Add element to deque instance end. For example: deque.insertEnd(" ").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertEnd023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<string>();
      deque.insertEnd(" ");
      let res = deque.getLast();
      expect(res).assertEqual(" ");
    });

    /**
     * @tc.name   testInsertEnd024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2300
     * @tc.desc   Add element to deque instance end. For example: deque.insertEnd(null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertEnd024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<Object>();
      deque.insertEnd(null);
      let res = deque.getLast();
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testInsertEnd025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2400
     * @tc.desc   Add element to deque instance end. For example: deque.insertEnd(undefined).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertEnd025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<Object>();
      deque.insertEnd(undefined);
      let res = deque.getLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testInsertFront026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2500
     * @tc.desc   Add element to deque instance end. For example: for (let i = 0; i < 100; i++) {deque.insertEnd(i);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      for (let i = 0; i < 100; i++) {
        deque.insertEnd(i);
        let res = deque.getLast();
        expect(res).assertEqual(i);
      }
      let res1 = deque.length;
      expect(res1).assertEqual(100);
    });

    /**
     * @tc.name   testHas027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2600
     * @tc.desc   Determine whether the deque instance contains the specified element. For example: deque.has(6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHas027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      let res = deque.has(6);
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testPopFirst028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2700
     * @tc.desc   Delete the header element of a deque instance. For example: deque.popFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPopFirst028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      let res = deque.popFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetFirst029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2800
     * @tc.desc   Get the header element of the deque instance. For example: deque.getFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetFirst029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      let res = deque.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testPopLast030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_2900
     * @tc.desc   Delete the end element of a deque instance. For example: deque.popLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPopLast030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      let res = deque.popLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testGetLast031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3000
     * @tc.desc   Get the end element of the deque instance. For example: deque.getLast().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetLast031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number>();
      let res = deque.getLast();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testForEach032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3100
     * @tc.desc   Traversing elements in deque instances. For example: deque.forEach((item, index) => {arr.push(item);}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test032()).assertTrue();
    });

    /**
     * @tc.name   testIterator033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3200
     * @tc.desc   Iterate over all elements in the deque instance. For example: for (let item of deque) { arr.push(item);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test033()).assertTrue();
    });

    /**
     * @tc.name   testIterator034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3300
     * @tc.desc   Iterate over all elements in the deque instance. For example: deque[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test034()).assertTrue();
    });

    /**
     * @tc.name   testLength035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3400
     * @tc.desc   Get the number of elements in the deque instance. For example: deque.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLength035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<number | string>();
      deque.insertEnd(8);
      deque.insertFront("a");
      deque.insertFront("b");
      deque.insertEnd(5);
      deque.insertEnd(6);
      deque.insertFront("s");
      deque.insertFront("z");
      deque.popFirst();
      deque.popLast();
      deque.insertFront("g");
      deque.insertEnd(6);
      let size = deque.length;
      expect(size).assertEqual(7);
    });

    /**
     * @tc.name   testInsertFront036Adapt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3500
     * @tc.desc   Add element to deque instance header.For example: let a = [1, 2, 3, 4]; deque.insertFront.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testInsertFront036Adapt001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let deque = new Deque<string>();
      try {
        deque.insertFront.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The insertFront method cannot be bound`);
      }
    });

    /**
     * @tc.name   testForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DEQUEFP1_3600
     * @tc.desc   Traversing elements in deque instances. For example: deque.forEach(123).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test037()).assertTrue();
    });
  });
}
