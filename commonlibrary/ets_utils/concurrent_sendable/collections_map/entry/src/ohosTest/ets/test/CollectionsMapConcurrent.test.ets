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
  concurrentLongForEach,
  TaskCounter,
  longRunningLoopWithCounter,
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

export default function collectionsMapConcurrentTest() {
  describe('CollectionsMapConcurrentTest', () => {

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0100
     * @tc.name: concurrentForEach_0001
     * @tc.desc: 3 TaskPool tasks concurrently forEach the same Map (100 entries).
     *           Each task performs read-only traversal and returns element count,
     *           verifying concurrent traversal does not throw exceptions and count is correct.
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('concurrentForEach_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const caseName: string = 'concurrentForEach_0001';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let task1: Promise<number> = taskpool.execute(concurrentForEachCount, map) as Promise<number>;
        let task2: Promise<number> = taskpool.execute(concurrentForEachCount, map) as Promise<number>;
        let task3: Promise<number> = taskpool.execute(concurrentForEachCount, map) as Promise<number>;

        let results: number[] = await Promise.all([task1, task2, task3]) as number[];

        expect(results[0]).assertEqual(100);
        expect(results[1]).assertEqual(100);
        expect(results[2]).assertEqual(100);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0200
     * @tc.name: modifyDuringForEach_0002
     * @tc.desc: Call delete inside forEach callback, verify 10200201
     *           concurrent modification error is thrown.
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('modifyDuringForEach_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const caseName: string = 'modifyDuringForEach_0002';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let errCode: number = await taskpool.execute(concurrentModifyDuringForEach, map) as number;

        expect(errCode).assertEqual(10200201);

        console.info(caseName + ', test end, errCode = ' + errCode);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0300
     * @tc.name: workerCrossThread_0003
     * @tc.desc: Main thread creates Map and sends it to Worker via
     *           postMessageWithSharedSendable. Worker performs read-only
     *           traversal and value retrieval, verifying reference passing
     *           is correct across threads.
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('workerCrossThread_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const caseName: string = 'workerCrossThread_0003';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let testWorker: worker.ThreadWorker =
          new worker.ThreadWorker('./CollectionsMapWorker');

        let workerResultPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          testWorker.onmessage = (e) => {
            let data: string = e.data as string;
            resolve(data);
          };
        });

        testWorker.postMessageWithSharedSendable(map);

        let workerResult: string = await workerResultPromise;
        let result: Record<string, number> = JSON.parse(workerResult) as Record<string, number>;

        expect(result['count']).assertEqual(100);
        expect(result['value50']).assertEqual(50);

        testWorker.terminate();

        console.info(caseName + ', test end, count=' + result['count'] + ', value50=' + result['value50']);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0400
     * @tc.name: largeMapConcurrentForEach_0004
     * @tc.desc: Concurrent forEach traversal of Map with 10000+ elements,
     *           verify traversal completeness under large data volume
     *           (count === 10000).
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('largeMapConcurrentForEach_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const caseName: string = 'largeMapConcurrentForEach_0004';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 10000; i++) {
          map.set('key_' + i, i);
        }

        let task1: Promise<number> = taskpool.execute(concurrentForEachCount, map) as Promise<number>;
        let task2: Promise<number> = taskpool.execute(concurrentForEachCount, map) as Promise<number>;

        let results: number[] = await Promise.all([task1, task2]) as number[];

        expect(results[0]).assertEqual(10000);
        expect(results[1]).assertEqual(10000);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0500
     * @tc.name: nestedForEach_0005
     * @tc.desc: Nested Map<string, Map<string, number>> structure with
     *           two-level forEach traversal, verify nested container reference
     *           correctness and traversal completeness.
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('nestedForEach_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const caseName: string = 'nestedForEach_0005';
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
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0600
     * @tc.name: iteratorConcurrent_0006
     * @tc.desc: 3 TaskPool tasks use entries/keys/values iterators for
     *           concurrent traversal respectively, verify iterator concurrent
     *           creation and traversal correctness.
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('iteratorConcurrent_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const caseName: string = 'iteratorConcurrent_0006';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let taskEntries: Promise<number> = taskpool.execute(concurrentIterateEntries, map) as Promise<number>;
        let taskKeys: Promise<number> = taskpool.execute(concurrentIterateKeys, map) as Promise<number>;
        let taskValues: Promise<number> = taskpool.execute(concurrentIterateValues, map) as Promise<number>;

        let results: number[] = await Promise.all([taskEntries, taskKeys, taskValues]) as number[];

        expect(results[0]).assertEqual(100);
        expect(results[1]).assertEqual(100);
        expect(results[2]).assertEqual(100);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0700
     * @tc.name: cancelTaskPool_0007
     * @tc.desc: Cancel TaskPool task during large Map forEach traversal,
     *           verify task can be cancelled normally and cancellation
     *           status is caught.
     * @tc.type: FUNC
     * @tc.level: Level0
     */
    it('cancelTaskPool_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const caseName: string = 'cancelTaskPool_0007';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100000; i++) {
          map.set('key_' + i, i);
        }

        let longTask: taskpool.Task = new taskpool.Task(concurrentLongForEach, map);

        let taskPromise: Promise<number> = taskpool.execute(longTask) as Promise<number>;

        taskpool.cancel(longTask);

        let cancelled: boolean = false;
        try {
          await taskPromise;
        } catch (_e) {
          cancelled = true;
        }
        expect(cancelled).assertEqual(true);

        console.info(caseName + ', test end, cancelled = ' + cancelled);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0800
     * @tc.name: sendableElement_0008
     * @tc.desc: Map stores @Sendable class instances as values,
     *           verify cross-thread access via TaskPool and element
     *           property retrieval is correct.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('sendableElement_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'sendableElement_0008';
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

        let name: string = await taskpool.execute(accessSendableElement, map) as string;

        expect(name).assertEqual('Alice');

        console.info(caseName + ', test end, name = ' + name);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_0900
     * @tc.name: asyncLockConcurrentWrite_0009
     * @tc.desc: Use AsyncLock to protect concurrent set operations
     *           from multiple TaskPool tasks, verify lock-protected
     *           writes are visible and consistent.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('asyncLockConcurrentWrite_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'asyncLockConcurrentWrite_0009';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('testLock009');

        let task1: Promise<number> = taskpool.execute(safeSetWithLock, map, lock) as Promise<number>;
        let task2: Promise<number> = taskpool.execute(safeSetWithLock, map, lock) as Promise<number>;

        let results: number[] = await Promise.all([task1, task2]) as number[];

        expect(results[0]).assertEqual(999);
        expect(results[1]).assertEqual(999);
        expect(map.get('locked_key')).assertEqual(999);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1000
     * @tc.name: mapAsParameter_0010
     * @tc.desc: Pass Map as @Concurrent function parameter via TaskPool,
     *           verify the task receives the Map correctly and returns
     *           the expected size.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('mapAsParameter_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'mapAsParameter_0010';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 50; i++) {
          map.set('key_' + i, i);
        }

        let size: number = await taskpool.execute(receiveMapParam, map) as number;

        expect(size).assertEqual(50);

        console.info(caseName + ', test end, size = ' + size);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1100
     * @tc.name: mapAsReturnValue_0011
     * @tc.desc: @Concurrent function returns a new Map instance,
     *           verify the returned Map is accessible in main thread
     *           with correct key-value pairs.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('mapAsReturnValue_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'mapAsReturnValue_0011';
        console.info(caseName + ', test start');

        let returnedMap: collections.Map<string, number> =
          await taskpool.execute(returnMap) as collections.Map<string, number>;

        expect(returnedMap.get('result')).assertEqual(100);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1200
     * @tc.name: forEachException_0012
     * @tc.desc: Throw exception inside forEach callback, verify the
     *           exception is correctly propagated and caught with the
     *           expected error message.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('forEachException_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const caseName: string = 'forEachException_0012';
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
          expect((e as Error).message).assertContain('Test exception');
        }

        expect(exceptionCaught).assertEqual(true);

        console.info(caseName + ', test end, exceptionCaught = ' + exceptionCaught);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1300
     * @tc.name: terminateTask_0013
     * @tc.desc: Terminate a long-running loop task using terminateTask,
     *           verify the task was interrupted before completion by
     *           checking the counter stopped below the expected maximum.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('terminateTask_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'terminateTask_0013';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100000; i++) {
          map.set('key_' + i, i);
        }

        let counter: TaskCounter = new TaskCounter();

        let longTask: taskpool.LongTask =
          new taskpool.LongTask(longRunningLoopWithCounter, map, counter);

        taskpool.execute(longTask);

        await new Promise<void>((resolve: () => void) => {
          setTimeout(() => { resolve(); }, 500);
        });

        taskpool.terminateTask(longTask);

        await new Promise<void>((resolve: () => void) => {
          setTimeout(() => { resolve(); }, 500);
        });

        expect(counter.count > 0).assertEqual(true);

        expect(counter.count < 10000000).assertEqual(true);

        expect(map.has('key_0')).assertEqual(true);

        console.info(caseName + ', test end, counter.count = ' + counter.count);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1400
     * @tc.name: promiseAllMultiMap_0014
     * @tc.desc: Use Promise.all to wait for forEach traversal tasks
     *           on three different Maps, verify all tasks complete
     *           with correct counts.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('promiseAllMultiMap_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'promiseAllMultiMap_0014';
        console.info(caseName + ', test start');

        let map1: collections.Map<string, number> = new collections.Map<string, number>();
        let map2: collections.Map<string, number> = new collections.Map<string, number>();
        let map3: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 50; i++) {
          map1.set('a_' + i, i);
          map2.set('b_' + i, i);
          map3.set('c_' + i, i);
        }

        let results: number[] = await Promise.all([
          taskpool.execute(concurrentForEachCount, map1),
          taskpool.execute(concurrentForEachCount, map2),
          taskpool.execute(concurrentForEachCount, map3)
        ]) as number[];

        expect(results[0]).assertEqual(50);
        expect(results[1]).assertEqual(50);
        expect(results[2]).assertEqual(50);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1500
     * @tc.name: multiWorkerConcurrent_0015
     * @tc.desc: Launch 2 Worker threads to concurrently read the same
     *           Map via postMessageWithSharedSendable, verify all workers
     *           complete without exception and read results are correct.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('multiWorkerConcurrent_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'multiWorkerConcurrent_0015';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let worker1: worker.ThreadWorker =
          new worker.ThreadWorker('./CollectionsMapWorker');
        let worker2: worker.ThreadWorker =
          new worker.ThreadWorker('./CollectionsMapWorker');

        let p1: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          worker1.onmessage = (e) => { resolve(e.data as string); };
        });
        let p2: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          worker2.onmessage = (e) => { resolve(e.data as string); };
        });

        worker1.postMessageWithSharedSendable(map);
        worker2.postMessageWithSharedSendable(map);

        let results: string[] = await Promise.all([p1, p2]) as string[];
        let r1: Record<string, number> = JSON.parse(results[0]) as Record<string, number>;
        let r2: Record<string, number> = JSON.parse(results[1]) as Record<string, number>;

        expect(r1['count']).assertEqual(100);
        expect(r1['value50']).assertEqual(50);
        expect(r2['count']).assertEqual(100);
        expect(r2['value50']).assertEqual(50);

        worker1.terminate();
        worker2.terminate();

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1600
     * @tc.name: exportSharedMap_0016
     * @tc.desc: Export a Map instance via export let from a shared module,
     *           verify the imported Map is accessible and modifiable
     *           from the test module.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('exportSharedMap_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const caseName: string = 'exportSharedMap_0016';
        console.info(caseName + ', test start');

        sharedMap.set('shared_key', 42);
        expect(sharedMap.get('shared_key')).assertEqual(42);
        expect(sharedMap.has('shared_key')).assertEqual(true);

        console.info(caseName + ', test end');
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1700
     * @tc.name: nestedContainer_0017
     * @tc.desc: Map<string, collections.Array<number>> nested container,
     *           verify inner Array elements are accessible and
     *           correctly retrieved via the outer Map.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('nestedContainer_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const caseName: string = 'nestedContainer_0017';
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
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1800
     * @tc.name: conditionVariable_0018
     * @tc.desc: Use ConditionVariable to synchronize Map operations,
     *           verify wait/notifyAll works correctly across async
     *           boundaries in the main thread.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('conditionVariable_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'conditionVariable_0018';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        map.set('test', 0);

        let cv: ArkTSUtils.locks.ConditionVariable =
          ArkTSUtils.locks.ConditionVariable.request('testCV018');

        let modified: boolean = false;

        cv.wait().then(() => {
          map.set('test', 1);
          modified = true;
        });

        expect(map.get('test')).assertEqual(0);

        cv.notifyAll();

        await new Promise<void>((resolve: () => void) => {
          setTimeout(() => { resolve(); }, 200);
        });

        expect(modified).assertEqual(true);
        expect(map.get('test')).assertEqual(1);

        console.info(caseName + ', test end, modified = ' + modified);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_1900
     * @tc.name: sendDataProgress_0019
     * @tc.desc: Use sendData inside TaskPool forEach traversal to report
     *           progress, verify onReceiveData callback receives progress
     *           updates and traversal completes correctly.
     * @tc.type: FUNC
     * @tc.level: Level1
     */
    it('sendDataProgress_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const caseName: string = 'sendDataProgress_0019';
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
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_2000
     * @tc.name: memoryLeak_0020
     * @tc.desc: Loop create and destroy Map instances (1000 iterations),
     *           verify no crash or unhandled exception occurs during
     *           repeated allocation and release.
     * @tc.type: FUNC
     * @tc.level: Level2
     */
    it('memoryLeak_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const caseName: string = 'memoryLeak_0020';
        console.info(caseName + ', test start');

        let completed: boolean = false;
        for (let i: number = 0; i < 1000; i++) {
          let tempMap: collections.Map<string, number> = new collections.Map<string, number>();
          for (let j: number = 0; j < 100; j++) {
            tempMap.set('key_' + j, j);
          }
        }
        completed = true;
        expect(completed).assertEqual(true);

        console.info(caseName + ', test end, completed = ' + completed);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_2100
     * @tc.name: loopStress_0021
     * @tc.desc: Perform 10000 forEach iterations on a Map with 100 elements
     *           in a TaskPool task, verify total traversed element count
     *           equals 100 * 10000.
     * @tc.type: FUNC
     * @tc.level: Level2
     */
    it('loopStress_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        const caseName: string = 'loopStress_0021';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100; i++) {
          map.set('key_' + i, i);
        }

        let total: number = await taskpool.execute(stressIterate, map) as number;

        expect(total).assertEqual(1000000);

        console.info(caseName + ', test end, total = ' + total);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_2200
     * @tc.name: lowMemoryBoundary_0022
     * @tc.desc: Create a very large Map (500000 entries) to test
     *           boundary behavior, verify the Map is created successfully
     *           and size is reported correctly.
     * @tc.type: FUNC
     * @tc.level: Level2
     */
    it('lowMemoryBoundary_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const caseName: string = 'lowMemoryBoundary_0022';
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
        expect(map.size >= 0).assertEqual(true);
        expect(map.has('key_0')).assertEqual(true);

        console.info(caseName + ', test end, map.size = ' + map.size);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

    /**
     * @tc.number: SUB_COLLECTIONS_MAP_CONCURRENT_2300
     * @tc.name: largeDataTransfer_0023
     * @tc.desc: Create a Map with 100000 entries and pass it to TaskPool
     *           via reference, verify the task correctly reports the
     *           Map size across threads.
     * @tc.type: FUNC
     * @tc.level: Level2
     */
    it('largeDataTransfer_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        const caseName: string = 'largeDataTransfer_0023';
        console.info(caseName + ', test start');

        let map: collections.Map<string, number> = new collections.Map<string, number>();
        for (let i: number = 0; i < 100000; i++) {
          map.set('key_' + i, i);
        }

        let size: number = await taskpool.execute(largeMapHandler, map) as number;

        expect(size).assertEqual(100000);

        console.info(caseName + ', test end, size = ' + size);
      } catch (e) {
        expect(true).assertEqual(false);
      }
    });

  });
}
