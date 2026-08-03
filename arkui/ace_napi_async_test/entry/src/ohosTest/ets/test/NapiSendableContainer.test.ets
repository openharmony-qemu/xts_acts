/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import napitest from 'libentry.so';
import { taskpool, collections, ArrayList, LinkedList, Queue, Stack, lang, ArkTSUtils,
  TreeMap, TreeSet, LightWeightMap, LightWeightSet, PlainArray } from '@kit.ArkTS';
import { sleep } from './Utils';

let obj: lang.ISendable;
let arr: lang.ISendable;
let arrLen: lang.ISendable;
let arrBuffer: lang.ISendable;
let typedArr: lang.ISendable;
let class1: lang.ISendable;
const TEST_LOOP_COUNT: number = 100;
const EVENT_LOOP_YIELD_INTERVAL: number = 5;
const EVENT_LOOP_YIELD_DELAY_MS: number = 20;

async function yieldToEventLoopIfNeeded(index: number): Promise<void> {
  if ((index + 1) % EVENT_LOOP_YIELD_INTERVAL === 0) {
    await sleep(EVENT_LOOP_YIELD_DELAY_MS);
  }
}

export default function NapiSendableContainerTest() {

  describe('napiSendableContainerTest', () => {

    beforeAll(() => {
      obj = napitest.NapiCreateSendableObject();
      arr = napitest.NapiCreateSendableArray();
      arrLen = napitest.NapiCreateSendableArrayWithLength();
      arrBuffer = napitest.NapiCreateSendableArrayBuffer();
      typedArr = napitest.NapiCreateSendableTypedArray();
      class1 = napitest.NapiDefineSendableClass();
    });

    afterEach(async () => {
      console.info('[napiSendableContainerTest] after each called');
      await sleep(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0100
     * @tc.name   testBuiltinArrayWithSendableObj0001
     * @tc.desc   builtin Array push/pop sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayWithSendableObj0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinArrayWithSendableObj0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableArray: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          expect(sendableArray.length).assertEqual(6);
          expect(sendableArray[0]).assertEqual(obj);
          expect(sendableArray[1]).assertEqual(arr);
          sendableArray.push(obj);
          expect(sendableArray.length).assertEqual(7);
          let popItem = sendableArray.pop();
          expect(popItem).assertEqual(obj);
          expect(sendableArray.length).assertEqual(6);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0200
     * @tc.name   testBuiltinArrayWithSendableObj0002
     * @tc.desc   builtin Array shift/unshift sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayWithSendableObj0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinArrayWithSendableObj0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableArray: object[] = [arr, arrBuffer];
          sendableArray.unshift(obj);
          expect(sendableArray.length).assertEqual(3);
          expect(sendableArray[0]).assertEqual(obj);
          let shiftItem = sendableArray.shift();
          expect(shiftItem).assertEqual(obj);
          expect(sendableArray.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0300
     * @tc.name   testBuiltinArrayWithSendableObj0003
     * @tc.desc   builtin Array indexOf/lastIndexOf sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayWithSendableObj0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinArrayWithSendableObj0003';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableArray: object[] = [obj, arr, obj, class1];
          expect(sendableArray.indexOf(obj)).assertEqual(0);
          expect(sendableArray.lastIndexOf(obj)).assertEqual(2);
          expect(sendableArray.indexOf(arr)).assertEqual(1);
          expect(sendableArray.indexOf(class1)).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0400
     * @tc.name   testBuiltinMapWithSendableKey0001
     * @tc.desc   builtin Map set/get with sendable object as key test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinMapWithSendableKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinMapWithSendableKey0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableMap = new Map<object, string>();
          sendableMap.set(obj, 'objValue');
          sendableMap.set(arr, 'arrValue');
          sendableMap.set(class1, 'classValue');
          expect(sendableMap.size).assertEqual(3);
          expect(sendableMap.get(obj)).assertEqual('objValue');
          expect(sendableMap.get(arr)).assertEqual('arrValue');
          expect(sendableMap.has(obj)).assertTrue();
          expect(sendableMap.has(arr)).assertTrue();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0500
     * @tc.name   testBuiltinMapWithSendableValue0001
     * @tc.desc   builtin Map set/get with sendable object as value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinMapWithSendableValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinMapWithSendableValue0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableMap = new Map<string, object>();
          sendableMap.set('key1', obj);
          sendableMap.set('key2', arr);
          sendableMap.set('key3', arrBuffer);
          expect(sendableMap.size).assertEqual(3);
          expect(sendableMap.get('key1')).assertEqual(obj);
          expect(sendableMap.get('key2')).assertEqual(arr);
          expect(sendableMap.get('key3')).assertEqual(arrBuffer);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0600
     * @tc.name   testBuiltinMapWithSendableKV0001
     * @tc.desc   builtin Map with sendable object as both key and value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinMapWithSendableKV0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinMapWithSendableKV0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableMap = new Map<object, object>();
          sendableMap.set(obj, arr);
          sendableMap.set(arrBuffer, typedArr);
          sendableMap.set(class1, arrLen);
          expect(sendableMap.size).assertEqual(3);
          expect(sendableMap.get(obj)).assertEqual(arr);
          expect(sendableMap.get(arrBuffer)).assertEqual(typedArr);
          expect(sendableMap.get(class1)).assertEqual(arrLen);
          sendableMap.delete(obj);
          expect(sendableMap.has(obj)).assertFalse();
          expect(sendableMap.size).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0700
     * @tc.name   testBuiltinSetWithSendableObj0001
     * @tc.desc   builtin Set add/delete/has with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinSetWithSendableObj0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinSetWithSendableObj0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableSet = new Set<object>();
          sendableSet.add(obj);
          sendableSet.add(arr);
          sendableSet.add(arrBuffer);
          sendableSet.add(class1);
          expect(sendableSet.size).assertEqual(4);
          expect(sendableSet.has(obj)).assertTrue();
          expect(sendableSet.has(arr)).assertTrue();
          expect(sendableSet.has(arrBuffer)).assertTrue();
          sendableSet.delete(obj);
          expect(sendableSet.has(obj)).assertFalse();
          expect(sendableSet.size).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0800
     * @tc.name   testBuiltinSetWithSendableObj0002
     * @tc.desc   builtin Set forEach/values with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinSetWithSendableObj0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinSetWithSendableObj0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableSet = new Set<object>();
          sendableSet.add(obj);
          sendableSet.add(arr);
          sendableSet.add(typedArr);
          let count = 0;
          sendableSet.forEach((value: object) => {
            count++;
            expect(sendableSet.has(value)).assertTrue();
          });
          expect(count).assertEqual(3);
          let values = sendableSet.values();
          let valArray: object[] = [];
          for (let item of values) {
            valArray.push(item);
          }
          expect(valArray.length).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_0900
     * @tc.name   testArrayListWithSendableObj0001
     * @tc.desc   ArrayList add/get/remove with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListWithSendableObj0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testArrayListWithSendableObj0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let arrayList = new ArrayList<object>();
          arrayList.add(obj);
          arrayList.add(arr);
          arrayList.add(arrBuffer);
          arrayList.add(class1);
          expect(arrayList.length).assertEqual(4);
          expect(arrayList[0]).assertEqual(obj);
          expect(arrayList[1]).assertEqual(arr);
          expect(arrayList[2]).assertEqual(arrBuffer);
          expect(arrayList.has(obj)).assertTrue();
          arrayList.remove(obj);
          expect(arrayList.has(obj)).assertFalse();
          expect(arrayList.length).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1000
     * @tc.name   testArrayListWithSendableObj0002
     * @tc.desc   ArrayList insert/replace with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListWithSendableObj0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testArrayListWithSendableObj0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let arrayList = new ArrayList<object>();
          arrayList.add(arr);
          arrayList.insert(obj, 0);
          expect(arrayList.length).assertEqual(2);
          expect(arrayList[0]).assertEqual(obj);
          arrayList[1] = typedArr;
          expect(arrayList[1]).assertEqual(typedArr);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1100
     * @tc.name   testLinkedListWithSendableObj0001
     * @tc.desc   LinkedList add/get/removeFirst/removeLast with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListWithSendableObj0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLinkedListWithSendableObj0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let linkedList = new LinkedList<object>();
          linkedList.add(obj);
          linkedList.add(arr);
          linkedList.add(arrBuffer);
          expect(linkedList.length).assertEqual(3);
          expect(linkedList.get(0)).assertEqual(obj);
          let first = linkedList.removeFirst();
          expect(first).assertEqual(obj);
          expect(linkedList.length).assertEqual(2);
          let last = linkedList.removeLast();
          expect(last).assertEqual(arrBuffer);
          expect(linkedList.length).assertEqual(1);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1200
     * @tc.name   testLinkedListWithSendableObj0002
     * @tc.desc   LinkedList addFirst/addLast/getFirst/getLast with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListWithSendableObj0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLinkedListWithSendableObj0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let linkedList = new LinkedList<object>();
          linkedList.addFirst(obj);
          linkedList.add(arr);
          linkedList.add(class1);
          expect(linkedList.length).assertEqual(3);
          expect(linkedList.getFirst()).assertEqual(obj);
          expect(linkedList.getLast()).assertEqual(class1);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1300
     * @tc.name   testQueueWithSendableObj0001
     * @tc.desc   Queue add/remove/pop with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueWithSendableObj0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testQueueWithSendableObj0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let queue = new Queue<object>();
          queue.add(obj);
          queue.add(arr);
          queue.add(arrBuffer);
          expect(queue.length).assertEqual(3);
          let popItem = queue.pop();
          expect(popItem).assertEqual(obj);
          expect(queue.length).assertEqual(2);
          expect(queue.getFirst()).assertEqual(arr);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1400
     * @tc.name   testStackWithSendableObj0014
     * @tc.desc   Stack push/pop/peek with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackWithSendableObj0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testStackWithSendableObj0014';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let stack = new Stack<object>();
          stack.push(obj);
          stack.push(arr);
          stack.push(typedArr);
          expect(stack.length).assertEqual(3);
          let peekItem = stack.peek();
          expect(peekItem).assertEqual(typedArr);
          let popItem = stack.pop();
          expect(popItem).assertEqual(typedArr);
          expect(stack.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1500
     * @tc.name   testTreeMapWithSendableObj0015
     * @tc.desc   TreeMap set/get/remove with sendable object as value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeMapWithSendableObj0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testTreeMapWithSendableObj0015';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let treeMap = new TreeMap<string, object>();
          treeMap.set('key1', obj);
          treeMap.set('key2', arr);
          treeMap.set('key3', class1);
          expect(treeMap.length).assertEqual(3);
          expect(treeMap.get('key1')).assertEqual(obj);
          expect(treeMap.get('key2')).assertEqual(arr);
          expect(treeMap.hasKey('key1')).assertTrue();
          treeMap.remove('key1');
          expect(treeMap.hasKey('key1')).assertFalse();
          expect(treeMap.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1600
     * @tc.name   testTreeSetWithSendableObj0016
     * @tc.desc   TreeSet add/remove/has with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTreeSetWithSendableObj0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testTreeSetWithSendableObj0016';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          const sendableValues: object[] = [obj, arr, arrLen];
          let treeSet = new TreeSet<object>((firstValue: object, secondValue: object): boolean => {
            return sendableValues.indexOf(firstValue) < sendableValues.indexOf(secondValue);
          });
          treeSet.add(obj);
          treeSet.add(arr);
          treeSet.add(arrLen);
          expect(treeSet.length).assertEqual(3);
          expect(treeSet.has(obj)).assertTrue();
          expect(treeSet.has(arr)).assertTrue();
          treeSet.remove(obj);
          expect(treeSet.has(obj)).assertFalse();
          expect(treeSet.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1700
     * @tc.name   testLightWeightMapWithSendableObj0017
     * @tc.desc   LightWeightMap set/get/remove with sendable object as value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightMapWithSendableObj0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLightWeightMapWithSendableObj0017';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let lightWeightMap = new LightWeightMap<string, object>();
          lightWeightMap.set('key1', obj);
          lightWeightMap.set('key2', arrBuffer);
          lightWeightMap.set('key3', typedArr);
          expect(lightWeightMap.length).assertEqual(3);
          expect(lightWeightMap.get('key1')).assertEqual(obj);
          expect(lightWeightMap.get('key2')).assertEqual(arrBuffer);
          expect(lightWeightMap.hasKey('key1')).assertTrue();
          lightWeightMap.remove('key1');
          expect(lightWeightMap.hasKey('key1')).assertFalse();
          expect(lightWeightMap.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1800
     * @tc.name   testLightWeightSetWithSendableObj0018
     * @tc.desc   LightWeightSet add/remove/has with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSetWithSendableObj0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLightWeightSetWithSendableObj0018';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let lightWeightSet = new LightWeightSet<object>();
          lightWeightSet.add(obj);
          lightWeightSet.add(arr);
          lightWeightSet.add(class1);
          expect(lightWeightSet.length).assertEqual(3);
          expect(lightWeightSet.has(obj)).assertTrue();
          expect(lightWeightSet.has(arr)).assertTrue();
          lightWeightSet.remove(obj);
          expect(lightWeightSet.has(obj)).assertFalse();
          expect(lightWeightSet.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_1900
     * @tc.name   testPlainArrayWithSendableObj0019
     * @tc.desc   PlainArray add/get/remove with sendable object as value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayWithSendableObj0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testPlainArrayWithSendableObj0019';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let plainArray = new PlainArray<object>();
          plainArray.add(0, obj);
          plainArray.add(1, arr);
          plainArray.add(2, arrLen);
          expect(plainArray.length).assertEqual(3);
          expect(plainArray.get(0)).assertEqual(obj);
          expect(plainArray.get(1)).assertEqual(arr);
          expect(plainArray.has(0)).assertTrue();
          plainArray.remove(0);
          expect(plainArray.has(0)).assertFalse();
          expect(plainArray.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2000
     * @tc.name   testCollectionsMapWithSendableObj0020
     * @tc.desc   collections.Map set/get/delete with sendable object as key test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCollectionsMapWithSendableObj0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCollectionsMapWithSendableObj0020';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let collectionsMap = new collections.Map<lang.ISendable, string>();
          collectionsMap.set(obj, 'value1');
          collectionsMap.set(arr, 'value2');
          collectionsMap.set(class1, 'value3');
          expect(collectionsMap.size).assertEqual(3);
          expect(collectionsMap.get(obj)).assertEqual('value1');
          expect(collectionsMap.get(arr)).assertEqual('value2');
          expect(collectionsMap.has(obj)).assertTrue();
          collectionsMap.delete(obj);
          expect(collectionsMap.has(obj)).assertFalse();
          expect(collectionsMap.size).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2100
     * @tc.name   testCollectionsMapWithSendableValue0021
     * @tc.desc   collections.Map with sendable object as value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCollectionsMapWithSendableValue0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCollectionsMapWithSendableValue0021';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let collectionsMap = new collections.Map<string, lang.ISendable>();
          collectionsMap.set('key1', obj);
          collectionsMap.set('key2', arrBuffer);
          collectionsMap.set('key3', typedArr);
          expect(collectionsMap.size).assertEqual(3);
          expect(collectionsMap.get('key1')).assertEqual(obj);
          expect(collectionsMap.get('key2')).assertEqual(arrBuffer);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2200
     * @tc.name   testCollectionsSetWithSendableObj0022
     * @tc.desc   collections.Set add/delete/has with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCollectionsSetWithSendableObj0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCollectionsSetWithSendableObj0022';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let collectionsSet = new collections.Set<lang.ISendable>();
          collectionsSet.add(obj);
          collectionsSet.add(arr);
          collectionsSet.add(arrLen);
          collectionsSet.add(class1);
          expect(collectionsSet.size).assertEqual(4);
          expect(collectionsSet.has(obj)).assertTrue();
          expect(collectionsSet.has(arr)).assertTrue();
          collectionsSet.delete(obj);
          expect(collectionsSet.has(obj)).assertFalse();
          expect(collectionsSet.size).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2300
     * @tc.name   testCollectionsArrayWithSendableObj0023
     * @tc.desc   collections.Array push/pop with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCollectionsArrayWithSendableObj0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCollectionsArrayWithSendableObj0023';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let collectionsArr = new collections.Array<lang.ISendable>();
          collectionsArr.push(obj);
          collectionsArr.push(arr);
          collectionsArr.push(arrBuffer);
          collectionsArr.push(typedArr);
          expect(collectionsArr.length).assertEqual(4);
          expect(collectionsArr[0]).assertEqual(obj);
          expect(collectionsArr[1]).assertEqual(arr);
          let popItem = collectionsArr.pop();
          expect(popItem).assertEqual(typedArr);
          expect(collectionsArr.length).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2400
     * @tc.name   testCollectionsArrayWithSendableObj0024
     * @tc.desc   collections.Array forEach with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCollectionsArrayWithSendableObj0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCollectionsArrayWithSendableObj0024';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let collectionsArr = new collections.Array<lang.ISendable>();
          collectionsArr.push(obj);
          collectionsArr.push(arr);
          collectionsArr.push(class1);
          let count = 0;
          collectionsArr.forEach((value: object) => {
            count++;
          });
          expect(count).assertEqual(3);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2500
     * @tc.name   testSendableLRUCacheWithSendableObj0025
     * @tc.desc   ArkTSUtils.SendableLruCache put/get/remove with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheWithSendableObj0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableLRUCacheWithSendableObj0025';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let lruCache = new ArkTSUtils.SendableLruCache<string, lang.ISendable>(10);
          lruCache.put('key1', obj);
          lruCache.put('key2', arr);
          lruCache.put('key3', arrBuffer);
          expect(lruCache.length).assertEqual(3);
          expect(lruCache.get('key1')).assertEqual(obj);
          expect(lruCache.get('key2')).assertEqual(arr);
          expect(lruCache.contains('key1')).assertTrue();
          lruCache.remove('key1');
          expect(lruCache.contains('key1')).assertFalse();
          expect(lruCache.length).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2600
     * @tc.name   testSendableLRUCacheWithSendableObj0026
     * @tc.desc   ArkTSUtils.SendableLruCache clear/keys with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheWithSendableObj0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableLRUCacheWithSendableObj0026';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let lruCache = new ArkTSUtils.SendableLruCache<string, lang.ISendable>(5);
          lruCache.put('a', obj);
          lruCache.put('b', arr);
          lruCache.put('c', class1);
          expect(lruCache.length).assertEqual(3);
          let keys = lruCache.keys();
          expect(keys.length).assertEqual(3);
          lruCache.clear();
          expect(lruCache.length).assertEqual(0);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2700
     * @tc.name   testBuiltinArrayForEachSendable0027
     * @tc.desc   builtin Array forEach with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayForEachSendable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinArrayForEachSendable0027';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableArray: object[] = [obj, arr, arrBuffer, typedArr, class1];
          let count = 0;
          sendableArray.forEach((value: object) => {
            count++;
          });
          expect(count).assertEqual(5);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERTEST_2800
     * @tc.name   testBuiltinMapForEachSendable0028
     * @tc.desc   builtin Map forEach with sendable object test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuiltinMapForEachSendable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testBuiltinMapForEachSendable0028';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let sendableMap = new Map<object, object>();
          sendableMap.set(obj, arr);
          sendableMap.set(arrBuffer, typedArr);
          let count = 0;
          sendableMap.forEach((value: object, key: object) => {
            count++;
          });
          expect(count).assertEqual(2);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYBUILTINARRAY_0100
     * @tc.name   testEmptyBuiltinArrayPop0001
     * @tc.desc   builtin Array pop from empty array boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyBuiltinArrayPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyBuiltinArrayPop0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyArray: object[] = [];
          expect(emptyArray.length).assertEqual(0);
          let popItem = emptyArray.pop();
          expect(popItem).assertUndefined();
          expect(emptyArray.length).assertEqual(0);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYBUILTINARRAY_0200
     * @tc.name   testEmptyBuiltinArrayShift0002
     * @tc.desc   builtin Array shift from empty array boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyBuiltinArrayShift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyBuiltinArrayShift0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyArray: object[] = [];
          expect(emptyArray.length).assertEqual(0);
          let shiftItem = emptyArray.shift();
          expect(shiftItem).assertUndefined();
          expect(emptyArray.length).assertEqual(0);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYBUILTINARRAY_0300
     * @tc.name   testEmptyBuiltinMapGet0003
     * @tc.desc   builtin Map get from empty map with all sendable keys boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyBuiltinMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyBuiltinMapGet0003';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyMap = new Map<object, object>();
          expect(emptyMap.size).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyMap.get(sendableObj)).assertUndefined();
            expect(emptyMap.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYBUILTINARRAY_0400
     * @tc.name   testEmptyBuiltinSetHas0004
     * @tc.desc   builtin Set has on empty set with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyBuiltinSetHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyBuiltinSetHas0004';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptySet = new Set<object>();
          expect(emptySet.size).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptySet.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYBUILTINARRAY_0500
     * @tc.name   testEmptyArrayListHas0005
     * @tc.desc   ArrayList has on empty list with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyArrayListHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyArrayListHas0005';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyArrayList = new ArrayList<object>();
          expect(emptyArrayList.length).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyArrayList.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYLINKEDLISTGET_0100
     * @tc.name   testEmptyLinkedListGet0001
     * @tc.desc   LinkedList getFirst/getLast/has from empty list with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyLinkedListGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyLinkedListGet0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyLinkedList = new LinkedList<object>();
          expect(emptyLinkedList.length).assertEqual(0);
          let first = emptyLinkedList.getFirst();
          expect(first).assertUndefined();
          let last = emptyLinkedList.getLast();
          expect(last).assertUndefined();
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyLinkedList.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYQUEUEPOP_0100
     * @tc.name   testEmptyQueuePop0001
     * @tc.desc   Queue pop from empty queue boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyQueuePop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyQueuePop0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyQueue = new Queue<object>();
          expect(emptyQueue.length).assertEqual(0);
          let popItem = emptyQueue.pop();
          expect(popItem).assertUndefined();
          let peekItem = emptyQueue.getFirst();
          expect(peekItem).assertUndefined();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYSTACKPOP_0100
     * @tc.name   testEmptyStackPop0001
     * @tc.desc   Stack pop from empty stack boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyStackPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyStackPop0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyStack = new Stack<object>();
          expect(emptyStack.length).assertEqual(0);
          let popItem = emptyStack.pop();
          expect(popItem).assertUndefined();
          let peekItem = emptyStack.peek();
          expect(peekItem).assertUndefined();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYTREEMAPGET_0100
     * @tc.name   testEmptyTreeMapGet0001
     * @tc.desc   TreeMap get from empty map boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyTreeMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyTreeMapGet0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyTreeMap = new TreeMap<string, object>();
          expect(emptyTreeMap.length).assertEqual(0);
          expect(emptyTreeMap.get('key')).assertUndefined();
          expect(emptyTreeMap.hasKey('key')).assertFalse();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYTREEMAPSETHAS_0100
     * @tc.name   testEmptyTreeSetHas0001
     * @tc.desc   TreeSet has on empty set with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyTreeSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyTreeSetHas0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyTreeSet = new TreeSet<object>();
          expect(emptyTreeSet.length).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyTreeSet.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYLIGHTWEIGHT_0100
     * @tc.name   testEmptyLightWeightMapGet0001
     * @tc.desc   LightWeightMap get from empty map boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyLightWeightMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyLightWeightMapGet0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyLightWeightMap = new LightWeightMap<string, object>();
          expect(emptyLightWeightMap.length).assertEqual(0);
          expect(emptyLightWeightMap.get('key')).assertUndefined();
          expect(emptyLightWeightMap.hasKey('key')).assertFalse();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYLIGHTWEIGHT_0200
     * @tc.name   testEmptyLightWeightSetHas0001
     * @tc.desc   LightWeightSet has on empty set with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyLightWeightSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyLightWeightSetHas0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyLightWeightSet = new LightWeightSet<object>();
          expect(emptyLightWeightSet.length).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyLightWeightSet.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYLIGHTWEIGHT_0300
     * @tc.name   testEmptyPlainArrayGet0001
     * @tc.desc   PlainArray get from empty array boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyPlainArrayGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyPlainArrayGet0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyPlainArray = new PlainArray<object>();
          expect(emptyPlainArray.length).assertEqual(0);
          expect(emptyPlainArray.get(0)).assertUndefined();
          expect(emptyPlainArray.has(0)).assertFalse();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYLIGHTWEIGHT_0400
     * @tc.name   testEmptyCollectionsMapGet0001
     * @tc.desc   collections.Map get from empty map with all sendable keys boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyCollectionsMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyCollectionsMapGet0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyCollectionsMap = new collections.Map<lang.ISendable, lang.ISendable>();
          expect(emptyCollectionsMap.size).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyCollectionsMap.get(sendableObj)).assertUndefined();
            expect(emptyCollectionsMap.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYCOLLECTION_0100
     * @tc.name   testEmptyCollectionsSetHas0001
     * @tc.desc   collections.Set has on empty set with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyCollectionsSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyCollectionsSetHas0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyCollectionsSet = new collections.Set<lang.ISendable>();
          expect(emptyCollectionsSet.size).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyCollectionsSet.has(sendableObj)).assertFalse();
          }
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYCOLLECTION_0200
     * @tc.name   testEmptyCollectionsArrayPop0001
     * @tc.desc   collections.Array pop from empty array boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptyCollectionsArrayPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptyCollectionsArrayPop0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyCollectionsArr = new collections.Array<lang.ISendable>();
          expect(emptyCollectionsArr.length).assertEqual(0);
          let popItem = emptyCollectionsArr.pop();
          expect(popItem).assertUndefined();
          expect(emptyCollectionsArr.length).assertEqual(0);
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_EMPTYCOLLECTION_0300
     * @tc.name   testEmptySendableLRUCacheGet0001
     * @tc.desc   ArkTSUtils.SendableLruCache get from empty cache boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptySendableLRUCacheGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptySendableLRUCacheGet0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < TEST_LOOP_COUNT; i++) {
        try {
          let emptyLruCache = new ArkTSUtils.SendableLruCache<string, lang.ISendable>(10);
          expect(emptyLruCache.length).assertEqual(0);
          expect(emptyLruCache.get('key')).assertUndefined();
          expect(emptyLruCache.contains('key')).assertFalse();
          loopCount++;
          await yieldToEventLoopIfNeeded(i);
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(TEST_LOOP_COUNT);
      console.info(`${caseName} test end`);
    })
  })
}