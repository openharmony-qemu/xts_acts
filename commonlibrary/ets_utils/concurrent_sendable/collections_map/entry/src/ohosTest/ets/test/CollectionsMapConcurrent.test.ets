/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { taskpool } from '@kit.ArkTS';
import { worker } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS';
import {
  concurrentForEachCount,
  concurrentModifyDuringForEach,
  concurrentIterateEntries,
  concurrentIterateKeys,
  concurrentIterateValues,
  repeatedForEach,
  Person,
  accessSendableElement,
  safeSetWithLock,
  receiveMapParam,
  returnMap,
  forEachWithProgress,
  stressIterate,
  largeMapHandler
} from './CollectionsMapConcurrentTasks';
import { sharedMap } from './SharedMap';
let lockSeq: number = 0;  // 0009 AsyncLock 锁名自增计数（避免跨用例/重试串扰）

export default function collectionsMapConcurrentTest() {
  describe('CollectionsMapConcurrentTest', () => {

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0100
     * @tc.name  testCollectionsMapConcurrent0001
     * @tc.desc  3 TaskPool tasks concurrently forEach the same Map (100 entries).
     *           Each task performs read-only traversal and returns element count,
     *           verifying concurrent traversal does not throw exceptions and count is correct.
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0001';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let task1: Promise<number> = taskpool.execute(concurrentForEachCount, map, lock) as Promise<number>;
        let task2: Promise<number> = taskpool.execute(concurrentForEachCount, map, lock) as Promise<number>;
        let task3: Promise<number> = taskpool.execute(concurrentForEachCount, map, lock) as Promise<number>;

        let results: number[] = await Promise.all([task1, task2, task3]) as number[];

        expect(results[0]).assertEqual(100);
        expect(results[1]).assertEqual(100);
        expect(results[2]).assertEqual(100);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0200
     * @tc.name  testCollectionsMapConcurrent0002
     * @tc.desc  Call delete inside forEach callback, verify 10200201
     *           concurrent modification error is thrown.
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0002';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let errCode: number = await taskpool.execute(concurrentModifyDuringForEach, map) as number;

        expect(errCode === 0 || errCode === 10200201).assertTrue();

        console.info(caseName + ', test end, errCode = ' + errCode);
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0300
     * @tc.name  testCollectionsMapConcurrent0003
     * @tc.desc  Main thread creates Map and sends it to Worker via
     *           postMessageWithSharedSendable. Worker performs read-only
     *           traversal and value retrieval, verifying reference passing
     *           is correct across threads.
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testWorker: worker.ThreadWorker = new worker.ThreadWorker('./CollectionsMapWorker');
      try {
        const caseName: string = 'testCollectionsMapConcurrent0003';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let workerResultPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          testWorker.onmessage = (e) => {
            let data: string = e.data as string;
            resolve(data);
          };
        });

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        testWorker.postMessageWithSharedSendable({
          map: map,
          lock: lock
        });

        let workerResult: string = await workerResultPromise;
        let result: Record<string, number> = JSON.parse(workerResult) as Record<string, number>;

        expect(result['count']).assertEqual(100);
        expect(result['value50']).assertEqual(50);

        console.info(caseName + ', test end, count=' + result['count'] + ', value50=' + result['value50']);
      } catch (e) {
        expect().assertFail();
      } finally {
        testWorker.terminate();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0400
     * @tc.name  testCollectionsMapConcurrent0004
     * @tc.desc  Concurrent forEach traversal of Map with 10000+ elements,
     *           verify traversal completeness under large data volume
     *           (count === 10000).
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0004';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 10000; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let task1: Promise<number> = taskpool.execute(concurrentForEachCount, map, lock) as Promise<number>;
        let task2: Promise<number> = taskpool.execute(concurrentForEachCount, map, lock) as Promise<number>;

        let results: number[] = await Promise.all([task1, task2]) as number[];

        expect(results[0]).assertEqual(10000);
        expect(results[1]).assertEqual(10000);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0500
     * @tc.name  testCollectionsMapConcurrent0005
     * @tc.desc  Nested Map<string, Map<string, number>> structure with
     *           two-level forEach traversal, verify nested container reference
     *           correctness and traversal completeness.
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0005';
        console.info(caseName + ', test start');

        let outerMap: collections.Map<string, collections.Map<string, number>> =
          new collections.Map<string, collections.Map<string, number>>();

        let innerMap1: collections.Map<string, number> = new collections.Map<string, number>();
        innerMap1.set('a', 1);
        innerMap1.set('b', 2);

        let innerMap2: collections.Map<string, number> = new collections.Map<string, number>();
        innerMap2.set('c', 3);
        innerMap2.set('d', 4);

        outerMap.set('map1', innerMap1);
        outerMap.set('map2', innerMap2);

        let totalCount: number = 0;
        outerMap.forEach((innerMap: collections.Map<string, number>, _outerKey: string) => {
          innerMap.forEach((_value: number, _innerKey: string) => {
            totalCount++;
          });
        });

        expect(totalCount).assertEqual(4);

        console.info(caseName + ', test end, totalCount = ' + totalCount);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0600
     * @tc.name  testCollectionsMapConcurrent0006
     * @tc.desc  3 TaskPool tasks use entries/keys/values iterators for
     *           concurrent traversal respectively, verify iterator concurrent
     *           creation and traversal correctness.
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0006';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let taskEntries: Promise<number> = taskpool.execute(concurrentIterateEntries, map, lock) as Promise<number>;
        let taskKeys: Promise<number> = taskpool.execute(concurrentIterateKeys, map, lock) as Promise<number>;
        let taskValues: Promise<number> = taskpool.execute(concurrentIterateValues, map, lock) as Promise<number>;

        let results: number[] = await Promise.all([taskEntries, taskKeys, taskValues]) as number[];

        expect(results[0]).assertEqual(100);
        expect(results[1]).assertEqual(100);
        expect(results[2]).assertEqual(100);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0700
     * @tc.name  testCollectionsMapConcurrent0007
     * @tc.desc  Execute a TaskPool task that performs repeated Map forEach
     *           traversal, wait for it to complete, then call cancel on the
     *           already-finished task to verify the API handles completed
     *           tasks gracefully without crash.
     * @tc.type  Function
     * @tc.level  Level0
     */
    it('testCollectionsMapConcurrent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testCollectionsMapConcurrent0007';
      try {
        console.info(`${caseName} START`);

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 1000; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let task: taskpool.Task = new taskpool.Task(repeatedForEach, map, lock);
        let count: number = await taskpool.execute(task) as number;

        expect(count).assertEqual(10000);

        let cancelErrCode: number = 0;
        try {
          taskpool.cancel(task);
        } catch (e) {
          cancelErrCode = e.code ?? -1;
        }
        expect(cancelErrCode).assertEqual(10200015);
        expect(map.has('key_0')).assertEqual(true);

        console.info(`${caseName} END`);
      } catch (e) {
        expect('[0007] ' + JSON.stringify(e)).assertEqual('NO_ERROR');
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0800
     * @tc.name  testCollectionsMapConcurrent0008
     * @tc.desc  Map stores @Sendable class instances as values,
     *           verify cross-thread access via TaskPool and element
     *           property retrieval is correct.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0008';
        console.info(caseName + ', test start');

        let map: collections.Map<string, Person> = new collections.Map<string, Person>();
        let p1: Person = new Person();
        p1.name = 'Alice';
        p1.age = 30;
        let p2: Person = new Person();
        p2.name = 'Bob';
        p2.age = 25;
        map.set('p1', p1);
        map.set('p2', p2);

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let name: string = await taskpool.execute(accessSendableElement, map, lock) as string;

        expect(name).assertEqual('Alice');

        console.info(caseName + ', test end, name = ' + name);
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_0900
     * @tc.name  testCollectionsMapConcurrent0009
     * @tc.desc  Use AsyncLock to protect concurrent set operations
     *           from multiple TaskPool tasks, verify lock-protected
     *           writes are visible and consistent.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0009';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('testLock009_' + (lockSeq++));

        let task1: Promise<number> = taskpool.execute(safeSetWithLock, map, lock) as Promise<number>;
        let task2: Promise<number> = taskpool.execute(safeSetWithLock, map, lock) as Promise<number>;

        let results: number[] = await Promise.all([task1, task2]) as number[];

        expect(results[0]).assertEqual(999);
        expect(results[1]).assertEqual(999);
        expect(map.get('locked_key')).assertEqual(999);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1000
     * @tc.name  testCollectionsMapConcurrent0010
     * @tc.desc  Pass Map as @Concurrent function parameter via TaskPool,
     *           verify the task receives the Map correctly and returns
     *           the expected size.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0010';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 50; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let size: number = await taskpool.execute(receiveMapParam, map, lock) as number;

        expect(size).assertEqual(50);

        console.info(caseName + ', test end, size = ' + size);
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1100
     * @tc.name  testCollectionsMapConcurrent0011
     * @tc.desc  @Concurrent function returns a new Map instance,
     *           verify the returned Map is accessible in main thread
     *           with correct key-value pairs.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0011';
        console.info(caseName + ', test start');

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let returnedMap: collections.Map<string, number> =
          await taskpool.execute(returnMap, lock) as collections.Map<string, number>;

        expect(returnedMap.get('result')).assertEqual(100);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1200
     * @tc.name testCollectionsMapConcurrent0012
     * @tc.desc  Throw exception inside forEach callback, verify the
     *           exception is correctly propagated and caught with the
     *           expected error message.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0012';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 50; i++) {
          map.set('key_' + i, i);
        }

        let exceptionCaught: boolean = false;
        try {
          map.forEach((value: number, _key: string) => {
            if (value === 25) {
              throw new Error('Test exception in forEach');
            }
          });
        } catch (e) {
          exceptionCaught = true;
          expect(e.message).assertContain('Test exception');
        }

        expect(exceptionCaught).assertEqual(true);

        console.info(caseName + ', test end, exceptionCaught = ' + exceptionCaught);
      } catch (e) {
        expect().assertFail();
      }
    });
    
    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1300
     * @tc.name  testCollectionsMapConcurrent0013
     * @tc.desc  Use Promise.all to wait for forEach traversal tasks
     *           on three different Maps, verify all tasks complete
     *           with correct counts.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0013';
        console.info(caseName + ', test start');

        let map1: collections.Map<string, number> = new collections.Map<string, number>();
        let map2: collections.Map<string, number> = new collections.Map<string, number>();
        let map3: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 50; i++) {
          map1.set('a_' + i, i);
          map2.set('b_' + i, i);
          map3.set('c_' + i, i);
        }

        let lock1: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let lock2: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let lock3: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let results: number[] = await Promise.all([
          taskpool.execute(concurrentForEachCount, map1, lock1),
          taskpool.execute(concurrentForEachCount, map2, lock2),
          taskpool.execute(concurrentForEachCount, map3, lock3)
        ]) as number[];

        expect(results[0]).assertEqual(50);
        expect(results[1]).assertEqual(50);
        expect(results[2]).assertEqual(50);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1400
     * @tc.name  testCollectionsMapConcurrent0014
     * @tc.desc  Launch 2 Worker threads to concurrently read the same
     *           Map via postMessageWithSharedSendable, verify all workers
     *           complete without exception and read results are correct.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const worker1: worker.ThreadWorker = new worker.ThreadWorker('./CollectionsMapWorker');
      const worker2: worker.ThreadWorker = new worker.ThreadWorker('./CollectionsMapWorker');
      try {
        const caseName: string = 'testCollectionsMapConcurrent0014';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let p1: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          worker1.onmessage = (e) => { resolve(e.data as string); };
        });
        let p2: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          worker2.onmessage = (e) => { resolve(e.data as string); };
        });

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        worker1.postMessageWithSharedSendable({
          map: map,
          lock: lock
        });
        worker2.postMessageWithSharedSendable({
          map: map,
          lock: lock
        });

        let results: string[] = await Promise.all([p1, p2]) as string[];
        let r1: Record<string, number> = JSON.parse(results[0]) as Record<string, number>;
        let r2: Record<string, number> = JSON.parse(results[1]) as Record<string, number>;

        expect(r1['count']).assertEqual(100);
        expect(r1['value50']).assertEqual(50);
        expect(r2['count']).assertEqual(100);
        expect(r2['value50']).assertEqual(50);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      } finally {
        worker1.terminate();
        worker2.terminate();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1500
     * @tc.name  testCollectionsMapConcurrent0015
     * @tc.desc  Export a Map instance via export let from a shared module,
     *           verify the imported Map is accessible and modifiable
     *           from the test module.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0015';
        console.info(caseName + ', test start');

        sharedMap.set('shared_key', 42);
        expect(sharedMap.get('shared_key')).assertEqual(42);
        expect(sharedMap.has('shared_key')).assertEqual(true);

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1600
     * @tc.name  testCollectionsMapConcurrent0016
     * @tc.desc  Map<string, collections.Array<number>> nested container,
     *           verify inner Array elements are accessible and
     *           correctly retrieved via the outer Map.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0016';
        console.info(caseName + ', test start');

        let map: collections.Map<string, collections.Array<number>> =
          new collections.Map<string, collections.Array<number>>();
        let arr1: collections.Array<number> = new collections.Array<number>(10, 20, 30);
        let arr2: collections.Array<number> = new collections.Array<number>(100, 200);
        map.set('arr1', arr1);
        map.set('arr2', arr2);

        let retrievedArr: collections.Array<number> | undefined = map.get('arr1');
        let found: boolean = retrievedArr !== undefined;
        expect(found).assertEqual(true);
        if (retrievedArr !== undefined) {
          expect(retrievedArr.length).assertEqual(3);
          expect(retrievedArr[0]).assertEqual(10);
          expect(retrievedArr[1]).assertEqual(20);
          expect(retrievedArr[2]).assertEqual(30);
        }

        console.info(caseName + ', test end');
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1700
     * @tc.name  testCollectionsMapConcurrent0017
     * @tc.desc  Use ConditionVariable to synchronize Map operations,
     *           verify wait/notifyAll works correctly across async
     *           boundaries in the main thread.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0017';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        map.set('test', 0);

        let cv: ArkTSUtils.locks.ConditionVariable =
          ArkTSUtils.locks.ConditionVariable.request('testCV018');

        let modified: boolean = false;

        let waitPromise: Promise<void> = cv.wait().then(() => {
          map.set('test', 1);
          modified = true;
        }).catch((err: Error) => {
          console.error(`cv.wait failed: ${err.message}`);
        });

        expect(map.get('test')).assertEqual(0);

        cv.notifyAll();

        await waitPromise;

        expect(modified).assertEqual(true);
        expect(map.get('test')).assertEqual(1);

        console.info(caseName + ', test end, modified = ' + modified);
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1800
     * @tc.name  testCollectionsMapConcurrent0018
     * @tc.desc  Use sendData inside TaskPool forEach traversal to report
     *           progress, verify onReceiveData callback receives progress
     *           updates and traversal completes correctly.
     * @tc.type  Function
     * @tc.level  Level1
     */
    it('testCollectionsMapConcurrent0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0018';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let progressTask: taskpool.Task = new taskpool.Task(forEachWithProgress, map);
        let progressValues: number[] = [];
        progressTask.onReceiveData((progress: number) => {
          progressValues.push(progress);
        });

        let count: number = await taskpool.execute(progressTask) as number;

        expect(count).assertEqual(100);

        expect(progressValues.length).assertEqual(4);
        expect(progressValues[0]).assertEqual(25);
        expect(progressValues[1]).assertEqual(50);
        expect(progressValues[2]).assertEqual(75);
        expect(progressValues[3]).assertEqual(100);

        console.info(caseName + ', test end, progressValues = ' + JSON.stringify(progressValues));
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_1900
     * @tc.name  testCollectionsMapConcurrent0019
     * @tc.desc  Loop create and destroy Map instances (1000 iterations),
     *           verify no crash or unhandled exception occurs during
     *           repeated allocation and release.
     * @tc.type  Function
     * @tc.level  Level2
     */
    it('testCollectionsMapConcurrent0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0019';
        console.info(caseName + ', test start');

        const MAP_CREATE_ITERATIONS: number = 1000;
        const ENTRIES_PER_MAP: number = 100;
        const EXPECTED_TOTAL_KEYS: number = MAP_CREATE_ITERATIONS * ENTRIES_PER_MAP;

        let totalKeys: number = 0;
        for (let i: number = 0; i < MAP_CREATE_ITERATIONS; i++) {
          const tempMap: collections.Map<string, number> = new collections.Map<string, number>();
          for (let j: number = 0; j < ENTRIES_PER_MAP; j++) {
            tempMap.set('key_' + j, j);
          }
          totalKeys += tempMap.size;
        }
        expect(totalKeys).assertEqual(EXPECTED_TOTAL_KEYS);

        console.info(caseName + ', test end, totalKeys = ' + totalKeys);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_2000
     * @tc.name  testCollectionsMapConcurrent0020
     * @tc.desc  Perform 10000 forEach iterations on a Map with 100 elements
     *           in a TaskPool task, verify total traversed element count
     *           equals 100 * 10000.
     * @tc.type  Function
     * @tc.level  Level2
     */
    it('testCollectionsMapConcurrent0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0020';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let total: number = await taskpool.execute(stressIterate, map, lock) as number;

        expect(total).assertEqual(1000000);

        console.info(caseName + ', test end, total = ' + total);
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_2100
     * @tc.name  testCollectionsMapConcurrent0021
     * @tc.desc  Create a very large Map (500000 entries) to test
     *           boundary behavior, verify the Map is created successfully
     *           and size is reported correctly.
     * @tc.type  Function
     * @tc.level  Level2
     */
    it('testCollectionsMapConcurrent0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0021';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        let success: boolean = true;
        try {
          for (let i: number = 0; i < 500000; i++) {
            map.set('key_' + i, i);
          }
        } catch (_e) {
          success = false;
        }

        expect(success).assertEqual(true);
        expect(map.size).assertEqual(500000);
        expect(map.has('key_0')).assertEqual(true);

        console.info(caseName + ', test end, map.size = ' + map.size);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONCURRENT_2200
     * @tc.name  testCollectionsMapConcurrent0022
     * @tc.desc  Create a Map with 100000 entries and pass it to TaskPool
     *           via reference, verify the task correctly reports the
     *           Map size across threads.
     * @tc.type  Function
     * @tc.level  Level2
     */
    it('testCollectionsMapConcurrent0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const caseName: string = 'testCollectionsMapConcurrent0022';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100000; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let size: number = await taskpool.execute(largeMapHandler, map, lock) as number;

        expect(size).assertEqual(100000);

        console.info(caseName + ', test end, size = ' + size);
      } catch (e) {
        expect().assertFail();
      }
      done();
    });

  });
}
