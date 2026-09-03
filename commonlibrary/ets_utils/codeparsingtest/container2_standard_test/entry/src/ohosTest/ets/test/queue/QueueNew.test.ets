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
import Queue from '@ohos.util.Queue';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { test007, test008, test017, test018, test019 } from './QueueResource';

export default function QueueNewTest() {
  describe("QueueNewTest", () => {

    /**
     * @tc.name   testAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0100
     * @tc.desc   Add element to Queue instance end. For example: queue.add("四").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let queue = new Queue<string>();
      queue.add("四");
      let res = queue.getFirst();
      expect(res).assertEqual("四");
    });

    /**
     * @tc.name   testAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0200
     * @tc.desc   Add element to Queue instance end. For example: queue.add(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let queue = new Queue<number>();
      queue.add(8);
      let res = queue.getFirst();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0300
     * @tc.desc   Add element to Queue instance end. For example: queue.add(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAdd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let queue = new Queue<string[]>();
      let a = ["a", "b", "c"];
      queue.add(a);
      let res = queue.getFirst();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testGetFirst005
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0400
     * @tc.desc   Get the header element of the queue instance. For example: queue.getFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetFirst005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let queue = new Queue<number | string>();
      queue.add(6);
      queue.add("四");
      let res = queue.getFirst();
      expect(res).assertEqual(6);
    });

    /**
     * @tc.name   testPop006
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0500
     * @tc.desc   Delete the header element of a queue instance. For example: queue.pop().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPop006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let queue = new Queue<number | string>();
      queue.add(6);
      queue.add("四");
      let res = queue.pop();
      let res1 = queue.getFirst();
      expect(res).assertEqual(6);
      expect(res1).assertEqual("四");
    });

    /**
     * @tc.name   testForEach007
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0600
     * @tc.desc   Traversing elements in queue instances. For example: queue.forEach((item, index) => {arr.push(item);}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testForEach007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test007()).assertTrue();
    });

    /**
     * @tc.name   testIterator008
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0700
     * @tc.desc   Iterate over all elements in the queue instance. For example: for (let item of queue) { arr.push(item);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIterator008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test008()).assertTrue();
    });

    /**
     * @tc.name   testLength009
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0800
     * @tc.desc   Get the number of elements in the queue instance. For example: queue.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testLength009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<number | string>();
      queue.add(8);
      queue.add("一");
      queue.add("二");
      queue.add(1);
      queue.add(2);
      queue.add(3);
      queue.add(4);
      queue.add(5);
      queue.add(6);
      let res = queue.length;
      expect(9).assertEqual(res);
    });

    /**
     * @tc.name   testAdd010
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_0900
     * @tc.desc   Add element to Queue instance end. For example: queue.add("$").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<string>();
      queue.add("$");
      let res = queue.getFirst();
      expect(res).assertEqual("$");
    });

    /**
     * @tc.name   testAdd011
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1000
     * @tc.desc   Add element to Queue instance end. For example: queue.add(" ").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<string>();
      queue.add(" ");
      let res = queue.getFirst();
      expect(res).assertEqual(" ");
    });

    /**
     * @tc.name   testAdd012
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1100
     * @tc.desc   Add element to Queue instance end. For example: queue.add(null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<Object>();
      queue.add(null);
      let res = queue.getFirst();
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testAdd013
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1200
     * @tc.desc   Add element to Queue instance end. For example: queue.add(undefined).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<Object>();
      queue.add(undefined);
      let res = queue.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testAdd014
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1300
     * @tc.desc   Add element to Queue instance end. For example: for (let i = 0; i < 100; i++) { queue.add(i);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<number>();
      for (let i = 0; i < 100; i++) {
        queue.add(i);
      }
      let res = queue.length;
      expect(res).assertEqual(100);
    });

    /**
     * @tc.name   testGetFirst015
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1400
     * @tc.desc   Get the header element of the queue instance. For example: queue.getFirst().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetFirst015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<number>();
      let res = queue.getFirst();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testPop016
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1500
     * @tc.desc   Delete the header element of a queue instance. For example: queue.pop().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPop016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<number>();
      let res = queue.pop();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testForEach017
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1600
     * @tc.desc   Traversing elements in queue instances. For example: queue.forEach((item, index) => {arr.push(item);}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test017()).assertTrue();
    });

    /**
     * @tc.name   testIterator018
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1700
     * @tc.desc   Iterate over all elements in the queue instance. For example: for (let item of queue) { arr.push(item);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test018()).assertTrue();
    });

    /**
     * @tc.name   testIterator019
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1800
     * @tc.desc   Iterate over all elements in the queue instance. For example: queue[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test019()).assertTrue();
    });

    /**
     * @tc.name   testAdd020Adapt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUEFP_1900
     * @tc.desc   Add element to Queue instance end. For example: queue.add.bind({}, 10)().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testAdd020Adapt001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue = new Queue<number>();
      try {
        queue.add.bind({}, 10)();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The add method cannot be bound`);
      }
    });
  });
}
