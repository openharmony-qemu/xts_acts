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
import Stack from '@ohos.util.Stack';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { test004, test006, test007, test009, test010, test021, test032, test033, test035 } from './StackResource';

export default function StackTest() {
  describe("StackTest", () => {
    /**
     * @tc.name   testPush002
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0100
     * @tc.desc   Insert element at top of stack.For example: stack.push("四").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPush002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<string>();
      stack.push("四");
      let res = stack.peek();
      expect(res).assertEqual("四");
    });

    /**
     * @tc.name   testPush003
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0200
     * @tc.desc   Insert element at top of stack.For example: stack.push(8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPush003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<number>();
      stack.push(8);
      let res = stack.peek();
      expect(res).assertEqual(8);
    });

    /**
     * @tc.name   testPush004
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0300
     * @tc.desc   Insert element at top of stack.For example: let a = {name: "lala", age: "13岁"}; stack.push(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPush004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test004()).assertTrue();
    });

    /**
     * @tc.name   testPush005
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0400
     * @tc.desc   Insert element at top of stack.For example: let a = [1, 2, 3, 4]; stack.push(a).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPush005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<number[]>();
      let a = [1, 2, 3, 4];
      stack.push(a);
      let res = stack.peek();
      expect(res).assertEqual(a);
    });

    /**
     * @tc.name   testPeek006
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0500
     * @tc.desc   Get stack top element. For example: stack.peek().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPeek006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test006()).assertTrue();
    });

    /**
     * @tc.name   testLocate007
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0600
     * @tc.desc   Get the index corresponding to the element in the stack. For example: stack.locate("A").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLocate007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test007()).assertTrue();
    });

    /**
     * @tc.name   testPop008
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0700
     * @tc.desc   Delete top of stack element. For example: stack.pop().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testPop008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<number | string>();
      stack.push("B");
      stack.push(1);
      let res = stack.pop();
      let res1 = stack.peek();
      expect(res).assertEqual(1);
      expect(res1).assertEqual("B");
    });

    /**
     * @tc.name   testForEach009
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0800
     * @tc.desc   Traversing elements in stack instances. For example: stack.forEach((item, index) => {arr.push(item);}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testForEach009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test009()).assertTrue();
    });

    /**
     * @tc.name   testIterator010
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_0900
     * @tc.desc   Iterate over all elements in the stack instance. For example: for (let item of stack) {arr.push(item);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIterator010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test010()).assertTrue();
    });

    /**
     * @tc.name   testLength011
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1000
     * @tc.desc   Get the number of elements in the stack instance. For example: stack.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<number | string>();
      stack.push(8);
      stack.push("一");
      stack.push("二");
      stack.push(5);
      let res = stack.length;
      expect(4).assertEqual(res);
    });

    /**
     * @tc.name   testLength012
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1100
     * @tc.desc   Get the number of elements in the stack instance. For example: stack.length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testLength012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<number>();
      let res = stack.length;
      expect(0).assertEqual(res);
    });

    /**
     * @tc.name   testIsEmpty013
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1200
     * @tc.desc   Determine whether the Stack instance is empty. For example: stack.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testIsEmpty013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stack = new Stack<number | string>();
      stack.push(8);
      stack.push("一");
      stack.push("二");
      stack.push(5);
      let res = stack.isEmpty();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testIsEmpty014
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1300
     * @tc.desc   Determine whether the Stack instance is empty. For example: stack.isEmpty().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIsEmpty014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      let res = stack.isEmpty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testPush015
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1400
     * @tc.desc   Insert element at top of stack.For example: stack.push("你好世界").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<string>();
      stack.push("你好世界");
      let res = stack.peek();
      expect(res).assertEqual("你好世界");
    });

    /**
     * @tc.name   testPush016
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1500
     * @tc.desc   Insert element at top of stack.For example: stack.push(1234).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      stack.push(1234);
      let res = stack.peek();
      expect(res).assertEqual(1234);
    });

    /**
     * @tc.name   testPush017
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1600
     * @tc.desc   Insert element at top of stack.For example: stack.push(1.234).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      stack.push(1.234);
      let res = stack.peek();
      expect(res).assertEqual(1.234);
    });

    /**
     * @tc.name   testPush018
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1700
     * @tc.desc   Insert element at top of stack.For example: stack.push(-1234).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      stack.push(-1234);
      let res = stack.peek();
      expect(res).assertEqual(-1234);
    });

    /**
     * @tc.name   testPush019
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1800
     * @tc.desc   Insert element at top of stack.For example: stack.push(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      stack.push(0);
      let res = stack.peek();
      expect(res).assertEqual(0);
    });

    /**
     * @tc.name   testPush020
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_1900
     * @tc.desc   Insert element at top of stack.For example: stack.push("*").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number | string>();
      stack.push(10);
      stack.push(3.14);
      stack.push(-2);
      stack.push("AB");
      stack.push("*");
      let res = stack.peek();
      expect(res).assertEqual("*");
    });

    /**
     * @tc.name   testPush021
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2000
     * @tc.desc   Insert element at top of stack.For example: let arr = {}; stack.push(arr).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test021()).assertTrue();
    });

    /**
     * @tc.name   testPush022
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2100
     * @tc.desc   Insert element at top of stack.For example: let arr = []; stack.push(arr).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<Object>();
      let arr = [];
      stack.push(arr);
      let res = stack.peek();
      expect(res).assertEqual(arr);
    });

    /**
     * @tc.name   testPush023
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2200
     * @tc.desc   Insert element at top of stack.For example: stack.push("hello world").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<string>();
      stack.push("hello world");
      let res = stack.peek();
      expect(res).assertEqual("hello world");
    });

    /**
     * @tc.name   testPush024
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2300
     * @tc.desc   Insert element at top of stack.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<string>();
      stack.push("~!@#$^&*()_+-*/=.?<>:;|{}[]");
      let res = stack.peek();
      expect(res).assertEqual("~!@#$^&*()_+-*/=.?<>:;|{}[]");
    });

    /**
     * @tc.name   testPush025
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2400
     * @tc.desc   Insert element at top of stack. For example: stack.push("").
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<string>();
      stack.push("");
      let res = stack.peek();
      expect(res).assertEqual("");
    });

    /**
     * @tc.name   testPush026
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2500
     * @tc.desc   Insert element at top of stack. For example: stack.push(true).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<boolean>();
      stack.push(true);
      let res = stack.peek();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   testPush027
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2600
     * @tc.desc   Insert element at top of stack. For example: stack.push(false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<boolean>();
      stack.push(false);
      let res = stack.peek();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   testPush028
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2700
     * @tc.desc   Insert element at top of stack. For example: stack.push(null).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<Object>();
      stack.push(null);
      let res = stack.peek();
      expect(res).assertEqual(null);
    });

    /**
     * @tc.name   testPush029
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2800
     * @tc.desc   Insert element at top of stack. For example: stack.push(undefined).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<Object>();
      stack.push(undefined);
      let res = stack.peek();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testPeek030
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_2900
     * @tc.desc   Get stack top element. For example: stack.peek().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPeek030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      let res = stack.peek();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testPop031
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3000
     * @tc.desc   Delete top of stack element. For example: stack.pop().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPop031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      let res = stack.pop();
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.name   testForEach032
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3100
     * @tc.desc   Traversing elements in stack instances. For example: stack.forEach((item, index) => {arr.push(item);}).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testForEach032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test032()).assertTrue();
    });

    /**
     * @tc.name   testIterator033
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3200
     * @tc.desc   Iterate over all elements in the stack instance. For example: for (let item of stack) {arr.push(item);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test033()).assertTrue();
    });

    /**
     * @tc.name   testPush034
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3300
     * @tc.desc   Insert element at top of stack. For example: for (let i = 0; i < 1000; i++) {stack.push(i);}.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      for (let i = 0; i < 1000; i++) {
        stack.push(i);
      }
      let res = stack.length;
      expect(res).assertEqual(1000);
      let res1 = stack.peek();
      expect(res1).assertEqual(999);
    });

    /**
     * @tc.name   testIterator035
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3400
     * @tc.desc   Iterate over all elements in the stack instance. For example: stack[Symbol.iterator]().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testIterator035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test035()).assertTrue();
    });

    /**
     * @tc.name   testPush036
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3500
     * @tc.desc   Insert element at top of stack. For example: stack.push.bind({}, 10)().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testPush036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<number>();
      try {
        stack.push.bind({}, 10)();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The push method cannot be bound`);
      }
    });

    /**
     * @tc.name   testIsEmpty037
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3600
     * @tc.desc   Determine whether the Stack instance is empty. For example: stack.isEmpty.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsEmpty037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<string>();
      try {
        stack.isEmpty.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The isEmpty method cannot be bound`);
      }
    });

    /**
     * @tc.name   testPop038
     * @tc.number SUB_COMMONLIBRARY_UTIL_STACKFP_3700
     * @tc.desc   Delete top of stack element. For example: stack.pop.bind({}, "a")().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPop038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack = new Stack<string>();
      try {
        stack.pop.bind({}, "a")();
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200011);
        expect(err.message).assertEqual(`The pop method cannot be bound`);
      }
    });
  });
}
