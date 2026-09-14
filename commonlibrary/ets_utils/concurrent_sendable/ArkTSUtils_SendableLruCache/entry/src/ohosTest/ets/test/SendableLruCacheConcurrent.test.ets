/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { ArkTSUtils, taskpool } from '@kit.ArkTS'
import type { BusinessError } from '@ohos.base'
import { ContainsLruCache, ChildLruCache, testWorkerReceiveCache001, testWorkerReceiveCache002, testWorkerSendCache001, testTaskPoolCreateCacheInMainThread001, testTaskPoolCreateCacheInMainThread002, testTaskPoolCreateCacheInTaskThread001 } from './SendableLruCache'
import { sleep, CreateDefaultLruCache, concurrentPutWithLock, concurrentGetSideEffect, taskPoolAllApisTest, taskPoolCreateDefaultTest, concurrentAllOpsTryCatch, concurrentAllOpsWithLock } from './SendableLruCacheHelpers'
import { test_sendable_0100, test_sendable_0200, test_sendable_0300, test_sendable_0500, test_sendable_0600, test_sendable_0700, test_sendable_0800, test_sendable_0900, test_sendable_1000, test_sendable_1400, test_sendable_1600 } from '../testability/pages/Sendablefunction'

declare class ArkTools {
  static forceFullGC(): void
}

let concurrentNum = 100
let arrCount = 1000

function getsendablepro(): ArkTSUtils.SendableLruCache<number, number> {
  let pro = new ArkTSUtils.SendableLruCache<number, number>();
  for (let i = 9999; i < 9999 + arrCount; i++) {
    pro.put(i + 1, 1);
  }
  return pro
}

export default function SendableLruCacheConcurrentTest() {
  let cycleMaxCount = 10;
  describe('SendableLruCacheConcurrentTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheCombine001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0001
     * @tc.desc   Test multi different APIs in the same scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCombine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine001';
      console.log(`${TAG} test start `);
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(10)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        ArkTools.forceFullGC();
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        console.log(`${TAG} testSendableLRUCacheCombine001 array content:` + arr.toString());
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSendableLRUCacheCombine002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0002
     * @tc.desc   Test LruCache as class property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCombine002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine002';
      console.log(`${TAG} test start `);
      try {
        let cacheTest: ContainsLruCache = new ContainsLruCache()
        let result = cacheTest.TestCache1()
        console.log(`${TAG} Test Cache1 result:` + result);
        expect(result).assertEqual(true)
        result = cacheTest.TestCache2()
        console.log(`${TAG} Test Cache2 result:` + result);
        expect(result).assertEqual(true)
        result = cacheTest.TestCache3()
        console.log(`${TAG} Test Cache3 result:` + result);
        expect(result).assertEqual(true)
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCombine003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0003
     * @tc.desc   Test LruCache child class to override toString, contains .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCombine003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine003';
      console.log(`${TAG} test start `);
      try {
        let childCache = new ChildLruCache<number | string, number | string>()
        childCache.put('1111', 'bcjdshc')
        childCache.put(20, 'cdjcaxb')
        childCache.put('abcd', 15)
        let result1 = childCache.get('1111')
        let result2 = childCache.get(20)
        let result3 = childCache.get('abcd')
        let result4 = childCache.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
        let strResult = childCache.toString()
        expect(strResult).assertEqual("Test ChildLruCache")
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCombine004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0004
     * @tc.desc   Test LruCache child class to override contains interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCombine004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheCombine004';
      console.log(`${TAG} test start `);
      try {
        let childCache = new ChildLruCache<number | string | undefined, number | string>()
        childCache.put('1111', 'bcjdshc')
        childCache.put(20, 'cdjcaxb')
        childCache.put('abcd', 15)
        try {
          let pos = childCache.contains(undefined)
        } catch (e) {
          expect(e.message).assertEqual('ChildLruCache input type error.')
        }
        let isExist = childCache.contains(20)
        expect(isExist).assertEqual(true)
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSendableLRUCacheWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0005
     * @tc.desc   Test LruCache worker scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheWorker001';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testWorkerReceiveCache001()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0006
     * @tc.desc   Test LruCache worker scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheWorker002';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testWorkerReceiveCache002()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0007
     * @tc.desc   Test LruCache worker scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheWorker003';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testWorkerSendCache001()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheTaskPool001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0008
     * @tc.desc   Test LruCache taskpool scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheTaskPool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheTaskPool001';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testTaskPoolCreateCacheInMainThread001()
          console.log('testSendableLRUCacheTaskPool001 last result:' + result);
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSendableLRUCacheTaskPool002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0009
     * @tc.desc   Test LruCache taskpool scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheTaskPool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheTaskPool002';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testTaskPoolCreateCacheInMainThread002()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSendableLRUCacheTaskPool003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0010
     * @tc.desc   Test LruCache taskpool scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheTaskPool003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG: string = 'testSendableLRUCacheTaskPool003';
      console.log(`${TAG} test start `);
      try {
        for (let i = 0; i < cycleMaxCount; i++) {
          let result = await testTaskPoolCreateCacheInTaskThread001()
          expect(result).assertEqual(true)
        }
        done();
      } catch (error) {
        console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSendableLRUCacheConcurrent001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0011
     * @tc.desc   Concurrent put via TaskGroup with AsyncLock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheConcurrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConcurrent001";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>();
        let lock = new ArkTSUtils.locks.AsyncLock()
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 10);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 20);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 30);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 40);
        taskGroup.addTask(concurrentPutWithLock, cache, lock, 50);
        await taskpool.execute(taskGroup)
        ArkTools.forceFullGC()
        let len = cache.length
        expect(len).assertEqual(5)
        expect(cache.contains(10)).assertEqual(true)
        expect(cache.contains(20)).assertEqual(true)
        expect(cache.contains(30)).assertEqual(true)
        expect(cache.contains(40)).assertEqual(true)
        expect(cache.contains(50)).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheConcurrent002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0012
     * @tc.desc   Concurrent get via TaskGroup with AsyncLock, verify match count after concurrent hits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheConcurrent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConcurrent002";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>();
        let lock = new ArkTSUtils.locks.AsyncLock()
        cache.put(10, 11)
        cache.put(20, 21)
        cache.put(30, 31)
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(concurrentGetSideEffect, cache, lock, 10);
        taskGroup.addTask(concurrentGetSideEffect, cache, lock, 20);
        taskGroup.addTask(concurrentGetSideEffect, cache, lock, 30);
        await taskpool.execute(taskGroup)
        ArkTools.forceFullGC()
        let matchCount = cache.getMatchCount()
        expect(matchCount >= 3).assertTrue()
        expect(cache.get(10)).assertEqual(11)
        expect(cache.get(20)).assertEqual(21)
        expect(cache.get(30)).assertEqual(31)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheTaskPoolAllApis001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0013
     * @tc.desc   Verify all SendableLruCache APIs (except createDefault) work correctly in taskpool worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheTaskPoolAllApis001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheTaskPoolAllApis001";
      let task: taskpool.Task = new taskpool.Task(taskPoolAllApisTest)
      let result = await taskpool.execute(task) as boolean
      ArkTools.forceFullGC()
      expect(result).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheTaskPoolCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0014
     * @tc.desc   Verify createDefault override works in taskpool worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheTaskPoolCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheTaskPoolCreateDefault001";
      let cache = new CreateDefaultLruCache()
      let task: taskpool.Task = new taskpool.Task(taskPoolCreateDefaultTest, cache)
      let result = await taskpool.execute(task) as boolean
      ArkTools.forceFullGC()
      expect(result).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheConcurrentAllOpsTryCatch
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0015
     * @tc.desc   SendableLruCache concurrent: 10 loops, main thread + TaskPool simultaneously call all interfaces, try-catch, only assert task completed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheConcurrentAllOpsTryCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testSendableLRUCacheConcurrentAllOpsTryCatch";
        let cache = new ArkTSUtils.SendableLruCache<number, number>(64);
        for (let i = 0; i < 10; i++) {
          cache.put(i, i * 2);
        }

        let count: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(concurrentAllOpsTryCatch, cache, 10);
          taskpool.execute(task).then((result: Object) => {
            count++;
          });
          concurrentAllOpsTryCatch(cache, 10);
        }
        let waitCount: number = 0;
        while (count < 10 && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        expect(count).assertEqual(10);
        done();
      });

    /**
     * @tc.name   testSendableLRUCacheConcurrentWithLock
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0016
     * @tc.desc   SendableLruCache with AsyncLock: 10 loops, TaskPool + main thread both acquire lock, serialized, assert data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheConcurrentWithLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TAG = "testSendableLRUCacheConcurrentWithLock";
        let cache = new ArkTSUtils.SendableLruCache<number, number>(64);
        for (let i = 0; i < 10; i++) {
          cache.put(i, i * 2);
        }
        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let count: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(concurrentAllOpsWithLock, cache, lock, 10);
          taskpool.execute(task).then((result: Object) => {
            count++;
          }).catch((err: Error) => { console.error(err.message); done(); });
          concurrentAllOpsWithLock(cache, lock, 10);
        }
        let waitCount: number = 0;
        while (count < 10 && waitCount < 100) {
          await sleep(100);
          waitCount++;
        }
        expect(count).assertEqual(10);
        expect(cache.length).assertEqual(10);
        expect(cache.contains(0)).assertEqual(true);
        expect(cache.contains(9)).assertEqual(true);
        done();
      });

    /**
     * @tc.name   test_sendable_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0017
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0100';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0100, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(66);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0018
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0200';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0200, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.toString()).assertContain('hits = 99');
          expect(arr.length).assertEqual(50);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0019
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0300';
        console.info(`${caseName} test start`);
        let flag: Boolean = false;
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0300, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect(e.message).assertContain('The type of 0 must be small integer')
            flag = true;
          })
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          flag = true;
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0020
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0500';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0500, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(0);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0021
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0600';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0600, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.toString()).assertContain('maxSize = 364');
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0022
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0700';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0700, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.getMissCount();
          expect(result).assertEqual(600);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0023
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0800';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0800, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result1 = arr.getRemoveCount();
          expect(result1).assertEqual(938);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_0900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0024
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_0900';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0900, arr, caseName, i)
          }
          await taskpool.execute(group).then((res) => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.getMatchCount();
          expect(result).assertEqual(300);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0025
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1000';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0900, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.getPutCount();
          expect(result).assertEqual(1300);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0026
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1100';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_0900, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.isEmpty();
          expect(result).assertFalse();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0027
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1200';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1000, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.values();
          console.info('result = ' + result);
          expect(result.length).assertEqual(64);
          expect(result).assertContain(99);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0028
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1300';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1000, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.keys();
          console.info('result = ' + result);
          expect(result.length).assertEqual(64);
          expect(result).assertContain(99);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0029
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1400';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1400, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(63);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0030
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1500';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1000, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          let result = arr.contains(99);
          expect(result).assertTrue()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   test_sendable_1600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0031
     * @tc.desc   SendableLruCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_sendable_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_sendable_1600';
        console.info(`${caseName} test start`);
        let arr = getsendablepro()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_sendable_1600, arr, caseName, i)
          }
          await taskpool.execute(group).then(() => {
            console.info(`${caseName} Task execution success`);
          }).catch((e: BusinessError) => {
            console.info(`${caseName} Task execution catch1: ${e.message}, code: ${e.code}`);
            expect().assertFail()
          })
          console.info(`${caseName} Task result: ${arr}`)
          console.info(`${caseName} Task result: ${arr.length}`);
          expect(arr.length).assertEqual(163)
        } catch (e) {
          console.info(`${caseName} Task execution failed with error2: ${e.message}, code: ${e.code}`);
          expect().assertFail()
        }
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   SendableLruCachetestConcatArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0032
     * @tc.desc   constructor 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCachetestConcatArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'SendableLruCachetestConcatArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let cache = new ArkTSUtils.SendableLruCache<number, number>(0);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.name   SendableLruCachetestConcatArray0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONCURRENT_0033
     * @tc.desc   updateCapacity 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCachetestConcatArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'SendableLruCachetestConcatArray0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let cache = new ArkTSUtils.SendableLruCache<number, number>(10);
        const unboundUpdate = cache.updateCapacity;
        const boundUpdate: () => void = unboundUpdate.bind(cache, -5);
        try {
          boundUpdate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })

  })
}
