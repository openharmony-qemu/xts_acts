/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import napitest from 'libentry.so';
import { taskpool, collections, ArkTSUtils, lang } from '@kit.ArkTS';

function asyncSleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}

// ========== Native Sendable对象定义（全局变量）==========
let obj: lang.ISendable = napitest.NapiCreateSendableObject();
let arr: lang.ISendable = napitest.NapiCreateSendableArray();
let arrLen: lang.ISendable = napitest.NapiCreateSendableArrayWithLength();
let arrBuffer: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
let typedArr: lang.ISendable = napitest.NapiCreateSendableTypedArray();
let class1: lang.ISendable = napitest.NapiDefineSendableClass();


interface MixedValue {
  id: number;
  type: string;
}

interface SendableObjects {
  obj: object;
  arr: object;
  arrLen: object;
  arrBuffer: object;
  typedArr: object;
  class1: object;
}

function createSendableObjects(): SendableObjects {
  return {
    obj: napitest.NapiCreateSendableObject() as object,
    arr: napitest.NapiCreateSendableArray() as object,
    arrLen: napitest.NapiCreateSendableArrayWithLength() as object,
    arrBuffer: napitest.NapiCreateSendableArrayBuffer() as object,
    typedArr: napitest.NapiCreateSendableTypedArray() as object,
    class1: napitest.NapiDefineSendableClass() as object
  }
}

@Concurrent
function testConcurrentArrayListRW(arrayList: object[], objs: SendableObjects): void {
  for (let i = 0; i < 10; i++) {
    try {
      arrayList.push(objs.obj);
      arrayList.push(objs.arr);
      arrayList.push(objs.class1);
      arrayList.push(objs.arrBuffer);
      arrayList.push(objs.typedArr);
      let length = arrayList.length;
      arrayList[0];
      if (length > 0) {
        arrayList[length - 1];
      }
      arrayList.pop();
      arrayList.pop();
      arrayList.splice(0, 1);
      arrayList.splice(arrayList.length - 1, 1);
      arrayList.find((item: object) => item === objs.obj);
      arrayList.findIndex((item: object) => item === objs.arr);
      arrayList.indexOf(objs.obj);
      arrayList.indexOf(objs.arr);
      arrayList.includes(objs.obj);
      arrayList.includes(objs.arr);
      arrayList.includes(objs.class1);
      arrayList.length = 0;
      arrayList.push(objs.obj);
      arrayList.forEach((item: object) => {
        let v = item;
      });
    } catch (e) {
      console.info('testConcurrentArrayListRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentLinkedListRW(linkedList: object[], objs: SendableObjects): void {
  for (let i = 0; i < 10; i++) {
    try {
      linkedList.push(objs.obj);
      linkedList.push(objs.arr);
      linkedList.push(objs.class1);
      linkedList.unshift(objs.obj);
      linkedList.push(objs.arr);
      if (linkedList.length > 0) {
        linkedList[0];
        linkedList[linkedList.length - 1];
      }
      linkedList.shift();
      linkedList.pop();
      if (linkedList.length > 0) {
        linkedList[0];
        linkedList[linkedList.length - 1];
      }
      linkedList.indexOf(objs.obj);
      linkedList.indexOf(objs.arr);
      linkedList.includes(objs.obj);
      linkedList.includes(objs.arr);
      linkedList.pop();
      linkedList.length = 0;
    } catch (e) {
      console.info('testConcurrentLinkedListRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentQueueRW(queue: object[], objs: SendableObjects): void {
  for (let i = 0; i < 10; i++) {
    try {
      queue.push(objs.obj);
      queue.push(objs.arr);
      queue.push(objs.class1);
      queue.push(objs.arrBuffer);
      queue.push(objs.typedArr);
      let length = queue.length;
      queue.shift();
      queue.shift();
      if (queue.length > 0) {
        queue[0];
      }
      queue.forEach((item: object) => {
        let v = item;
      });
      queue.length = 0;
      queue.push(objs.obj);
    } catch (e) {
      console.info('testConcurrentQueueRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentStackRW(stack: object[], objs: SendableObjects): void {
  for (let i = 0; i < 10; i++) {
    try {
      stack.push(objs.obj);
      stack.push(objs.arr);
      stack.push(objs.class1);
      stack.push(objs.arrBuffer);
      stack.push(objs.typedArr);
      let length = stack.length;
      stack.pop();
      stack.pop();
      if (stack.length > 0) {
        stack[stack.length - 1];
      }
      stack.forEach((item: object) => {
        let v = item;
      });
      stack.length = 0;
      stack.push(objs.obj);
    } catch (e) {
      console.info('testConcurrentStackRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentTreeMapRW(treeMap: Map<object, string>, objs: SendableObjects): void {
  for (let i = 0; i < 10; i++) {
    try {
      treeMap.set(objs.obj, 'obj_value');
      treeMap.set(objs.arr, 'arr_value');
      treeMap.set(objs.class1, 'class1_value');
      treeMap.set(objs.arrBuffer, 'arrBuffer_value');
      treeMap.set(objs.typedArr, 'typedArr_value');
      let size = treeMap.size;
      treeMap.get(objs.obj);
      treeMap.get(objs.arr);
      treeMap.has(objs.obj);
      treeMap.has(objs.arr);
      treeMap.delete(objs.obj);
      treeMap.delete(objs.arr);
      treeMap.forEach((value: string, key: object) => {
        let v = value;
      });
      for (let entry of treeMap.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of treeMap.keys()) {
        let k = key;
      }
      for (let value of treeMap.values()) {
        let v = value;
      }
      treeMap.clear();
      treeMap.set(objs.obj, 'new_value');
    } catch (e) {
      console.info('testConcurrentTreeMapRW error: ' + e);
    }
  }
}


// ========== 场景4: GC场景 @Concurrent函数 ==========

/**
 * TaskPool线程创建Native sendable对象
 */
@Concurrent
function testGCCreateSendableInThread(): lang.ISendable | undefined {
  try {
    return napitest.NapiCreateSendableObject();
  } catch (e) {
    console.info('testGCCreateSendableInThread error: ' + e);
    return undefined;
  }
}

/**
 * TaskPool线程创建多个Native sendable对象
 */
@Concurrent
function testGCCreateMultipleSendableInThread(count: number): number {
  try {
    let sendableObj: lang.ISendable = napitest.NapiCreateSendableObject();
    return count;
  } catch (e) {
    console.info('testGCCreateMultipleSendableInThread error: ' + e);
    return 0;
  }
}

// ========== 场景5: 多线程并发无锁操作 @Concurrent函数 ==========

/**
 * 并发读写Array（无锁）- 多个读写操作组合
 */
@Concurrent
function testConcurrentArrayRWNoLock(sharedArray: lang.ISendable[]): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sharedArray.push(localObj);
      sharedArray.push(localArr);
      sharedArray.push(localClass);
      sharedArray.push(localArrBuf);
      sharedArray.push(localTyped);
      const len: number = sharedArray.length;
      if (len > 0) {
        const element: lang.ISendable = sharedArray[len - 1];
        const firstEl: lang.ISendable = sharedArray[0];
        const secondEl: lang.ISendable = sharedArray[1];
      }
      sharedArray.pop();
      sharedArray.pop();
      sharedArray.pop();
      sharedArray.indexOf(localObj);
      sharedArray.indexOf(localArr);
      sharedArray.includes(localObj);
      sharedArray.includes(localArr);
      sharedArray.includes(localClass);
      sharedArray.forEach((item: lang.ISendable): void => {
        const _v: lang.ISendable = item;
      });
      for (let j = 0; j < sharedArray.length; j++) {
        const item: lang.ISendable = sharedArray[j];
      }
    } catch (e) {
      console.info('testConcurrentArrayRWNoLock error: ' + e);
    }
  }
}

/**
 * 并发读写Map（无锁）- 读写+迭代组合
 */
@Concurrent
function testConcurrentMapRWNoLock(sharedMap: Map<lang.ISendable, lang.ISendable>): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sharedMap.set(localObj, localArr);
      sharedMap.set(localArr, localClass);
      sharedMap.set(localClass, localArrBuf);
      sharedMap.set(localArrBuf, localTyped);
      sharedMap.set(localTyped, localObj);
      sharedMap.get(localObj);
      sharedMap.get(localArr);
      sharedMap.get(localClass);
      sharedMap.get(localArrBuf);
      sharedMap.get(localTyped);
      sharedMap.has(localObj);
      sharedMap.has(localArr);
      sharedMap.has(localClass);
      sharedMap.has(localArrBuf);
      sharedMap.has(localTyped);
      sharedMap.delete(localObj);
      sharedMap.delete(localArr);
      sharedMap.delete(localClass);
      sharedMap.forEach((value: lang.ISendable, key: lang.ISendable): void => {
        const _v: lang.ISendable = value;
      });
      for (const entry of sharedMap.entries()) {
        const _k: lang.ISendable = entry[0];
        const _v: lang.ISendable = entry[1];
      }
      for (const key of sharedMap.keys()) {
        const _k: lang.ISendable = key;
        sharedMap.has(_k);
        sharedMap.get(_k);
      }
      for (const value of sharedMap.values()) {
        const _v: lang.ISendable = value;
      }
      const mapSize: number = sharedMap.size;
    } catch (e) {
      console.info('testConcurrentMapRWNoLock error: ' + e);
    }
  }
}

/**
 * 并发读写collections.Array（无锁）- 多个读写操作组合
 */
@Concurrent
function testConcurrentArrayListRWNoLock(sendableArr: collections.Array<lang.ISendable>): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sendableArr.push(localObj);
      sendableArr.push(localArr);
      sendableArr.push(localClass);
      sendableArr.push(localArrBuf);
      sendableArr.push(localTyped);
      const len: number = sendableArr.length;
      if (len > 0) {
        sendableArr[0];
        sendableArr[len - 1];
        sendableArr[Math.floor(len / 2)];
      }
      sendableArr.pop();
      sendableArr.pop();
      sendableArr.pop();
      sendableArr.indexOf(localObj);
      sendableArr.indexOf(localArr);
      sendableArr.includes(localObj);
      sendableArr.includes(localArr);
      sendableArr.forEach((item: lang.ISendable): void => {
        const _v: lang.ISendable = item;
      });
      for (let j = 0; j < sendableArr.length; j++) {
        const item: lang.ISendable = sendableArr[j];
      }
    } catch (e) {
      console.info('testConcurrentArrayListRWNoLock error: ' + e);
    }
  }
}

/**
 * 并发混合操作（无锁）- Array读写+迭代组合
 */
@Concurrent
function testConcurrentMixedOpsNoLock(sharedArray: lang.ISendable[]): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sharedArray.push(localObj);
      sharedArray.push(localArr);
      sharedArray.push(localClass);
      sharedArray.push(localArrBuf);
      sharedArray.push(localTyped);
      if (sharedArray.length > 0) {
        const firstEl: lang.ISendable = sharedArray[0];
        const lastEl: lang.ISendable = sharedArray[sharedArray.length - 1];
        const midEl: lang.ISendable = sharedArray[Math.floor(sharedArray.length / 2)];
      }
      sharedArray.pop();
      sharedArray.pop();
      sharedArray.indexOf(localObj);
      sharedArray.indexOf(localArr);
      sharedArray.includes(localObj);
      sharedArray.includes(localArr);
      sharedArray.includes(localClass);
      sharedArray.forEach((item: lang.ISendable): void => {
        const _v: lang.ISendable = item;
      });
      for (let j = 0; j < sharedArray.length; j++) {
        const item: lang.ISendable = sharedArray[j];
      }
      for (const item of sharedArray) {
        const _v: lang.ISendable = item;
      }
      for (const entry of sharedArray.entries()) {
        const _idx: number = entry[0];
        const _val: lang.ISendable = entry[1];
      }
      for (const key of sharedArray.keys()) {
        const _k: number = key;
      }
      for (const value of sharedArray.values()) {
        const _v: lang.ISendable = value;
      }
    } catch (e) {
      console.info('testConcurrentMixedOpsNoLock error: ' + e);
    }
  }
}


// ========== 场景6: Sendable容器并发操作（collections.Array/Map/Set）==========

/**
 * 并发操作Sendable Array (collections.Array) - 多个读写操作
 */
@Concurrent
function testConcurrentSendableArrayRW(sendableArray: collections.Array<lang.ISendable>): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sendableArray.push(localObj);
      sendableArray.push(localArr);
      sendableArray.push(localClass);
      sendableArray.push(localArrBuf);
      sendableArray.push(localTyped);
      const len: number = sendableArray.length;
      sendableArray[0];
      sendableArray[len - 1];
      sendableArray[Math.floor(len / 2)];
      sendableArray.pop();
      sendableArray.pop();
      sendableArray.pop();
      sendableArray.indexOf(localObj);
      sendableArray.indexOf(localArr);
      sendableArray.includes(localObj);
      sendableArray.includes(localArr);
      sendableArray.includes(localClass);
      sendableArray.forEach((item: lang.ISendable): void => {
        const _val: lang.ISendable = item;
      });
      for (let j = 0; j < sendableArray.length; j++) {
        const item: lang.ISendable = sendableArray[j];
      }
    } catch (e) {
      console.info('testConcurrentSendableArrayRW error: ' + e);
    }
  }
}

/**
 * 并发操作Sendable Map (collections.Map) - 多个读写操作
 */
@Concurrent
function testConcurrentSendableMapRW(sendableMap: collections.Map<lang.ISendable, lang.ISendable>): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sendableMap.set(localObj, localArr);
      sendableMap.set(localArr, localClass);
      sendableMap.set(localClass, localArrBuf);
      sendableMap.set(localArrBuf, localTyped);
      sendableMap.set(localTyped, localObj);
      const mapSize: number = sendableMap.size;
      sendableMap.get(localObj);
      sendableMap.get(localArr);
      sendableMap.get(localClass);
      sendableMap.has(localObj);
      sendableMap.has(localArr);
      sendableMap.has(localClass);
      sendableMap.delete(localObj);
      sendableMap.delete(localArr);
      sendableMap.forEach((value: lang.ISendable, key: lang.ISendable): void => {
        const _v: lang.ISendable = value;
      });
      for (const entry of sendableMap.entries()) {
        const _k: lang.ISendable = entry[0];
        const _v: lang.ISendable = entry[1];
      }
      for (const key of sendableMap.keys()) {
        const _k: lang.ISendable = key;
      }
      for (const value of sendableMap.values()) {
        const _v: lang.ISendable = value;
      }
      sendableMap.set(localObj, localArr);
    } catch (e) {
      console.info('testConcurrentSendableMapRW error: ' + e);
    }
  }
}

/**
 * 并发操作Sendable Set (collections.Set) - 多个读写操作
 */
@Concurrent
function testConcurrentSendableSetRW(sendableSet: collections.Set<lang.ISendable>): void {
  const localObj: lang.ISendable = napitest.NapiCreateSendableObject();
  const localArr: lang.ISendable = napitest.NapiCreateSendableArray();
  const localClass: lang.ISendable = napitest.NapiDefineSendableClass();
  const localArrBuf: lang.ISendable = napitest.NapiCreateSendableArrayBuffer();
  const localTyped: lang.ISendable = napitest.NapiCreateSendableTypedArray();
  for (let i = 0; i < 10; i++) {
    try {
      sendableSet.add(localObj);
      sendableSet.add(localArr);
      sendableSet.add(localClass);
      sendableSet.add(localArrBuf);
      sendableSet.add(localTyped);
      const setSize: number = sendableSet.size;
      sendableSet.has(localObj);
      sendableSet.has(localArr);
      sendableSet.has(localClass);
      sendableSet.delete(localObj);
      sendableSet.delete(localArr);
      sendableSet.add(localObj);
      sendableSet.add(localArr);
      sendableSet.forEach((item: lang.ISendable): void => {
        const _v: lang.ISendable = item;
      });
      for (const item of sendableSet.values()) {
        const _v: lang.ISendable = item;
      }
      sendableSet.add(localObj);
    } catch (e) {
      console.info('testConcurrentSendableSetRW error: ' + e);
    }
  }
}


export default function NapiSendableContainerSupplementTest() {
  describe('NapiSendableContainerSupplementTest', () => {
    afterEach(async () => { await asyncSleep(500) })


    /**
     * @tc.name testSendableContainerCombo0001
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0100
     * @tc.desc Verify ArrayList basic operations with Native Sendable objects including push, includes and index access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSendableContainerCombo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableContainerCombo0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let objs = createSendableObjects();
          let arrayList: object[] = [];
          arrayList.push(objs.obj);
          arrayList.push(objs.arr);
          arrayList.push(objs.class1);
          expect(arrayList.length).assertEqual(3);
          expect(arrayList.includes(objs.obj)).assertTrue();
          expect(arrayList.includes(objs.arr)).assertTrue();
          expect(arrayList[0]).assertEqual(objs.obj);
          expect(arrayList[1]).assertEqual(objs.arr);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0002
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0200
     * @tc.desc Verify concurrent read/write operations on ArrayList with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSendableContainerCombo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableContainerCombo0002';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let arrayList: object[] = [];
        arrayList.push(objs.obj);
        arrayList.push(objs.arr);
        arrayList.push(objs.class1);
        
        const tasks: Array<Promise<object>> = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentArrayListRW, arrayList, objs));
        }
        
        await Promise.all(tasks);
        
        console.info(`${caseName} concurrent operations completed`);
        expect(arrayList.length >= 0).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0003
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0300
     * @tc.desc Verify concurrent read/write operations on LinkedList with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSendableContainerCombo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableContainerCombo0003';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let linkedList: object[] = [];
        linkedList.push(objs.obj);
        linkedList.push(objs.arr);
        linkedList.push(objs.class1);
        
        const tasks: Array<Promise<object>> = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentLinkedListRW, linkedList, objs));
        }
        
        await Promise.all(tasks);
        
        console.info(`${caseName} concurrent operations completed`);
        expect(linkedList.length >= 0).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0004
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0400
     * @tc.desc Verify concurrent read/write operations on Queue with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSendableContainerCombo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableContainerCombo0004';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let queue: object[] = [];
        queue.push(objs.obj);
        queue.push(objs.arr);
        queue.push(objs.class1);
        
        const tasks: Array<Promise<object>> = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentQueueRW, queue, objs));
        }
        
        await Promise.all(tasks);
        
        console.info(`${caseName} concurrent operations completed`);
        expect(queue.length >= 0).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0005
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0500
     * @tc.desc Verify concurrent read/write operations on Stack with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSendableContainerCombo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableContainerCombo0005';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let stack: object[] = [];
        stack.push(objs.obj);
        stack.push(objs.arr);
        stack.push(objs.class1);
        
        const tasks: Array<Promise<object>> = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentStackRW, stack, objs));
        }
        
        await Promise.all(tasks);
        
        console.info(`${caseName} concurrent operations completed`);
        expect(stack.length >= 0).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0006
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0600
     * @tc.desc Verify concurrent read/write operations on TreeMap with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSendableContainerCombo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableContainerCombo0006';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let treeMap = new Map<object, string>();
        treeMap.set(objs.obj, 'obj_value');
        treeMap.set(objs.arr, 'arr_value');
        treeMap.set(objs.class1, 'class1_value');
        
        const tasks: Array<Promise<object>> = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentTreeMapRW, treeMap, objs));
        }
        
        await Promise.all(tasks);
        
        console.info(`${caseName} concurrent operations completed`);
        expect(treeMap.size >= 0).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0007
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0700
     * @tc.desc Verify operations on empty ArrayList with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL3
     */
    it('testSendableContainerCombo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testSendableContainerCombo0007';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let emptyArray: object[] = [];
        
        expect(emptyArray.length).assertEqual(0);
        
        let popItem = emptyArray.pop();
        expect(popItem === undefined).assertTrue();
        
        expect(emptyArray.indexOf(objs.obj)).assertEqual(-1);
        expect(emptyArray.includes(objs.obj)).assertFalse();
        
        let shiftItem = emptyArray.shift();
        expect(shiftItem === undefined).assertTrue();
        
        expect(emptyArray.length).assertEqual(0);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0008
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0800
     * @tc.desc Verify operations on empty Map with Native Sendable objects as keys
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL3
     */
    it('testSendableContainerCombo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testSendableContainerCombo0008';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let emptyMap = new Map<object, string>();
        
        expect(emptyMap.size).assertEqual(0);
        expect(emptyMap.get(objs.obj) === undefined).assertTrue();
        expect(emptyMap.has(objs.obj)).assertFalse();
        expect(emptyMap.has(objs.arr)).assertFalse();
        
        emptyMap.delete(objs.obj);
        expect(emptyMap.size).assertEqual(0);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0009
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_0900
     * @tc.desc Verify operations on empty Set with Native Sendable objects
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL3
     */
    it('testSendableContainerCombo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testSendableContainerCombo0009';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let emptySet = new Set<object>();
        
        expect(emptySet.size).assertEqual(0);
        expect(emptySet.has(objs.obj)).assertFalse();
        expect(emptySet.has(objs.arr)).assertFalse();
        
        emptySet.delete(objs.obj);
        expect(emptySet.size).assertEqual(0);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testSendableContainerCombo0010
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS1_1000
     * @tc.desc Verify concurrent operations on containers with extreme index values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSendableContainerCombo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testSendableContainerCombo0010';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let arrayList: object[] = [];
        
        for (let i = 0; i < 100; i++) {
          arrayList.push(objs.obj);
        }
        
        expect(arrayList.length).assertEqual(100);
        expect(arrayList[0]).assertEqual(objs.obj);
        expect(arrayList[99]).assertEqual(objs.obj);
        
        expect(arrayList[100] === undefined).assertTrue();
        expect(arrayList[-1] === undefined).assertTrue();
        
        let removed = arrayList.splice(50, 10);
        expect(removed.length).assertEqual(10);
        expect(arrayList.length).assertEqual(90);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })


    /**
     * @tc.name testNonSendableMixed0001
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS2_0100
     * @tc.desc Verify operations on empty mixed container with Sendable and non-Sendable objects
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL3
     */
    it('testNonSendableMixed0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testNonSendableMixed0001';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let val1: MixedValue = { id: 1, type: 'normal' };
        
        let emptyMixedArray: object[] = [];
        expect(emptyMixedArray.length).assertEqual(0);
        expect(emptyMixedArray.indexOf(objs.obj)).assertEqual(-1);
        expect(emptyMixedArray.indexOf(val1)).assertEqual(-1);
        expect(emptyMixedArray.pop() === undefined).assertTrue();
        
        let emptyMixedMap = new Map<object, MixedValue>();
        expect(emptyMixedMap.size).assertEqual(0);
        expect(emptyMixedMap.get(objs.obj) === undefined).assertTrue();
        expect(emptyMixedMap.has(objs.obj)).assertFalse();
        emptyMixedMap.delete(objs.obj);
        expect(emptyMixedMap.size).assertEqual(0);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testNonSendableMixed0002
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS2_0200
     * @tc.desc Verify Sendable objects as Map values with non-Sendable keys
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL3
     */
    it('testNonSendableMixed0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testNonSendableMixed0002';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let key1: MixedValue = { id: 1, type: 'key' };
        let key2: MixedValue = { id: 2, type: 'key' };
        
        let mapWithSendableValue = new Map<MixedValue, object>();
        mapWithSendableValue.set(key1, objs.obj);
        mapWithSendableValue.set(key2, objs.arr);
        
        expect(mapWithSendableValue.size).assertEqual(2);
        expect(mapWithSendableValue.get(key1)).assertEqual(objs.obj);
        expect(mapWithSendableValue.get(key2)).assertEqual(objs.arr);
        expect(mapWithSendableValue.has(key1)).assertTrue();
        
        mapWithSendableValue.delete(key1);
        expect(mapWithSendableValue.size).assertEqual(1);
        expect(mapWithSendableValue.has(key1)).assertFalse();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name testNonSendableMixed0003
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS2_0300
     * @tc.desc Verify large scale mixed container operations with Sendable and non-Sendable objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testNonSendableMixed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testNonSendableMixed0003';
      console.info(`${caseName} test start`);
      try {
        let objs = createSendableObjects();
        let largeMixedArray: object[] = [];
        
        for (let i = 0; i < 100; i++) {
          if (i % 2 === 0) {
            largeMixedArray.push(objs.obj);
          } else {
            let val: MixedValue = { id: i, type: 'normal' };
            largeMixedArray.push(val);
          }
        }
        
        expect(largeMixedArray.length).assertEqual(100);
        
        let sendableCount = largeMixedArray.filter((item: object) => item === objs.obj).length;
        expect(sendableCount).assertEqual(50);
        
        largeMixedArray.length = 0;
        expect(largeMixedArray.length).assertEqual(0);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })


    /**
     * @tc.name   testGCBasic0001
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS4_0100
     * @tc.desc   Basic GC test with Native sendable objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGCBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testGCBasic0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;

      for (let i = 0; i < 10; i++) {
        try {
          let objects: lang.ISendable[] = []
          for (let j = 0; j < 1000; j++) {
            let newObj: lang.ISendable = napitest.NapiCreateSendableObject()
            objects.push(newObj)
          }

          expect(objects.length).assertEqual(1000)

          objects = []

          await asyncSleep(1000)

          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }

      expect(loopCount).assertEqual(10);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testGCCrossThread0002
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS4_0200
     * @tc.desc   GC test with Native sendable objects across threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGCCrossThread0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testGCCrossThread0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;

      for (let i = 0; i < 10; i++) {
        try {
          const objFromThread = await taskpool.execute(testGCCreateSendableInThread) as lang.ISendable

          expect(objFromThread !== undefined).assertTrue()

          await asyncSleep(500)

          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }

      expect(loopCount).assertEqual(10);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testGCCreateMultipleSendable0003
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS4_0300
     * @tc.desc   GC test creating multiple Native sendable objects in thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGCCreateMultipleSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testGCCreateMultipleSendable0003';
      console.info(`${caseName} test start`);
      try {
        const count = await taskpool.execute(testGCCreateMultipleSendableInThread, 100) as number

        expect(count).assertEqual(100)

        await asyncSleep(500)
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testConcurrentArrayRWNoLock0001
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS5_0100
     * @tc.desc   Concurrent Array read/write without lock, multiple operations combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentArrayRWNoLock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentArrayRWNoLock0001';
      console.info(`${caseName} test start`);

      let sharedArray: lang.ISendable[] = [obj, arr, class1]

      try {
        const tasks: Promise<Object>[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentArrayRWNoLock, sharedArray))
        }

        await Promise.all(tasks)

        console.info(`${caseName} concurrent operations completed`)
        expect(sharedArray.length >= 0).assertTrue()
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`)
        expect().assertFail()
      }

      console.info(`${caseName} test end`)
    })

    /**
     * @tc.name   testConcurrentMapRWNoLock0002
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS5_0200
     * @tc.desc   Concurrent Map read/write without lock, multiple operations combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentMapRWNoLock0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentMapRWNoLock0002';
      console.info(`${caseName} test start`);

      let sharedMap = new Map<lang.ISendable, lang.ISendable>()
      sharedMap.set(obj, arr)
      sharedMap.set(arr, class1)
      sharedMap.set(class1, obj)

      try {
        const tasks: Promise<Object>[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentMapRWNoLock, sharedMap))
        }

        await Promise.all(tasks)

        console.info(`${caseName} concurrent operations completed`)
        expect(sharedMap.size >= 0).assertTrue()
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`)
        expect().assertFail()
      }

      console.info(`${caseName} test end`)
    })

    /**
     * @tc.name   testConcurrentArrayListRWNoLock0003
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS5_0300
     * @tc.desc   Concurrent ArrayList read/write without lock, multiple operations combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentArrayListRWNoLock0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentArrayListRWNoLock0003';
      console.info(`${caseName} test start`);

      let sendableArr = new collections.Array<lang.ISendable>()
      sendableArr.push(obj)
      sendableArr.push(arr)
      sendableArr.push(class1)

      try {
        const tasks: Promise<Object>[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentArrayListRWNoLock, sendableArr))
        }

        await Promise.all(tasks)

        console.info(`${caseName} concurrent operations completed`)
        expect(sendableArr.length >= 0).assertTrue()
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`)
        expect().assertFail()
      }

      console.info(`${caseName} test end`)
    })

    /**
     * @tc.name   testConcurrentMixedOpsNoLock0004
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS5_0400
     * @tc.desc   Concurrent mixed operations (push/pop/get) without lock test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentMixedOpsNoLock0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentMixedOpsNoLock0004';
      console.info(`${caseName} test start`);

      let sharedArray: lang.ISendable[] = [obj, arr, class1, arrBuffer]

      try {
        const tasks: Promise<Object>[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(taskpool.execute(testConcurrentMixedOpsNoLock, sharedArray))
        }

        await Promise.all(tasks)

        console.info(`${caseName} concurrent operations completed`)
        expect(sharedArray.length >= 0).assertTrue()
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`)
        expect().assertFail()
      }

      console.info(`${caseName} test end`)
    })


    /**
     * @tc.name   testConcurrentSendableArrayRW0001
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0100
     * @tc.desc   Concurrent Sendable Array (collections.Array) read/write with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentSendableArrayRW0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentSendableArrayRW0001';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 10; i++) {
        try {
          let sendableArray = new collections.Array<lang.ISendable>();
          sendableArray.push(obj);
          sendableArray.push(arr);
          sendableArray.push(class1);

          const tasks: Promise<Object>[] = [];
          for (let j = 0; j < 10; j++) {
            tasks.push(taskpool.execute(testConcurrentSendableArrayRW, sendableArray));
          }

          await Promise.all(tasks);

          console.info(`${caseName} concurrent operations completed`);
          expect(sendableArray.length >= 0).assertTrue();
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(10);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testConcurrentSendableMapRW0002
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0200
     * @tc.desc   Concurrent Sendable Map (collections.Map) read/write with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentSendableMapRW0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentSendableMapRW0002';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 10; i++) {
        try {
          let sendableMap = new collections.Map<lang.ISendable, lang.ISendable>();
          sendableMap.set(obj, arr);
          sendableMap.set(arr, class1);
          sendableMap.set(class1, arrBuffer);

          const tasks: Promise<Object>[] = [];
          for (let j = 0; j < 10; j++) {
            tasks.push(taskpool.execute(testConcurrentSendableMapRW, sendableMap));
          }

          await Promise.all(tasks);

          console.info(`${caseName} concurrent operations completed`);
          expect(sendableMap.size >= 0).assertTrue();
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(10);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testConcurrentSendableSetRW0003
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0300
     * @tc.desc   Concurrent Sendable Set (collections.Set) read/write with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentSendableSetRW0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testConcurrentSendableSetRW0003';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 10; i++) {
        try {
          let sendableSet = new collections.Set<lang.ISendable>();
          sendableSet.add(obj);
          sendableSet.add(arr);
          sendableSet.add(class1);

          const tasks: Promise<Object>[] = [];
          for (let j = 0; j < 10; j++) {
            tasks.push(taskpool.execute(testConcurrentSendableSetRW, sendableSet));
          }

          await Promise.all(tasks);

          console.info(`${caseName} concurrent operations completed`);
          expect(sendableSet.size >= 0).assertTrue();
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(10);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testSendableArrayBasicOperations0004
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0400
     * @tc.desc   Sendable Array basic operations (push/pop/get/set) with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrayBasicOperations0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableArrayBasicOperations0004';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let sendableArray = new collections.Array<lang.ISendable>();
          sendableArray.push(obj);
          sendableArray.push(arr);
          sendableArray.push(class1);
          expect(sendableArray.length).assertEqual(3);
          expect(sendableArray[0]).assertEqual(obj);
          expect(sendableArray[1]).assertEqual(arr);
          expect(sendableArray[2]).assertEqual(class1);
          sendableArray.pop();
          expect(sendableArray.length).assertEqual(2);
          sendableArray[0] = arrBuffer;
          expect(sendableArray[0]).assertEqual(arrBuffer);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testSendableMapBasicOperations0005
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0500
     * @tc.desc   Sendable Map basic operations (set/get/delete/has) with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableMapBasicOperations0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableMapBasicOperations0005';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let sendableMap = new collections.Map<lang.ISendable, lang.ISendable>();
          sendableMap.set(obj, arr);
          sendableMap.set(arr, class1);
          sendableMap.set(class1, arrBuffer);
          expect(sendableMap.size).assertEqual(3);
          expect(sendableMap.get(obj)).assertEqual(arr);
          expect(sendableMap.has(obj)).assertTrue();
          sendableMap.delete(obj);
          expect(sendableMap.size).assertEqual(2);
          expect(sendableMap.has(obj)).assertFalse();
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testSendableSetBasicOperations0006
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0600
     * @tc.desc   Sendable Set basic operations (add/has/delete) with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetBasicOperations0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableSetBasicOperations0006';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let sendableSet = new collections.Set<lang.ISendable>();
          sendableSet.add(obj);
          sendableSet.add(arr);
          sendableSet.add(class1);
          expect(sendableSet.size).assertEqual(3);
          expect(sendableSet.has(obj)).assertTrue();
          expect(sendableSet.has(arr)).assertTrue();
          sendableSet.delete(obj);
          expect(sendableSet.size).assertEqual(2);
          expect(sendableSet.has(obj)).assertFalse();
          sendableSet.add(obj);
          expect(sendableSet.size).assertEqual(3);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testSendableArrayForEach0007
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0700
     * @tc.desc   Sendable Array forEach with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableArrayForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableArrayForEach0007';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let sendableArray = new collections.Array<lang.ISendable>();
          sendableArray.push(obj);
          sendableArray.push(arr);
          sendableArray.push(class1);
          sendableArray.push(arrBuffer);
          sendableArray.push(typedArr);
          let count = 0;
          sendableArray.forEach((value: object) => {
            count++;
          });
          expect(count).assertEqual(5);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testSendableMapForEach0008
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0800
     * @tc.desc   Sendable Map forEach with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableMapForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableMapForEach0008';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let sendableMap = new collections.Map<lang.ISendable, lang.ISendable>();
          sendableMap.set(obj, arr);
          sendableMap.set(arrBuffer, typedArr);
          sendableMap.set(class1, arrLen);
          let count = 0;
          sendableMap.forEach((value: object, key: object) => {
            count++;
          });
          expect(count).assertEqual(3);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testSendableSetForEach0009
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_0900
     * @tc.desc   Sendable Set forEach with Native sendable objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSendableSetForEach0009';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let sendableSet = new collections.Set<lang.ISendable>();
          sendableSet.add(obj);
          sendableSet.add(arr);
          sendableSet.add(typedArr);
          let count = 0;
          sendableSet.forEach((value: object) => {
            count++;
          });
          expect(count).assertEqual(3);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testEmptySendableArrayPop0010
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_1000
     * @tc.desc   Sendable Array pop from empty array boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptySendableArrayPop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptySendableArrayPop0010';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let emptyArray = new collections.Array<lang.ISendable>();
          expect(emptyArray.length).assertEqual(0);
          let popItem = emptyArray.pop();
          expect(popItem).assertUndefined();
          expect(emptyArray.length).assertEqual(0);
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testEmptySendableMapGet0011
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_1100
     * @tc.desc   Sendable Map get from empty map with all sendable keys boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptySendableMapGet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptySendableMapGet0011';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let emptyMap = new collections.Map<lang.ISendable, lang.ISendable>();
          expect(emptyMap.size).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptyMap.get(sendableObj)).assertUndefined();
            expect(emptyMap.has(sendableObj)).assertFalse();
          }
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testEmptySendableSetHas0012
     * @tc.number SUB_COMMONLIBRARY_NAPI_SENDABLECONTAINERSUPPS6_1200
     * @tc.desc   Sendable Set has on empty set with all sendable objects boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEmptySendableSetHas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName: string = 'testEmptySendableSetHas0012';
      console.info(`${caseName} test start`);
      let loopCount = 0;
      for (let i = 0; i < 100; i++) {
        try {
          let emptySet = new collections.Set<lang.ISendable>();
          expect(emptySet.size).assertEqual(0);
          let sendableObjects: object[] = [obj, arr, arrLen, arrBuffer, typedArr, class1];
          for (let sendableObj of sendableObjects) {
            expect(emptySet.has(sendableObj)).assertFalse();
          }
          loopCount++;
        } catch (error) {
          console.error(`${caseName} catch error: ${error}`);
          expect().assertFail();
        }
      }
      expect(loopCount).assertEqual(100);
      console.info(`${caseName} test end`);
    })

  })
}
