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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArrayList, HashMap, HashSet, LinkedList, List, taskpool, TreeSet, worker } from '@kit.ArkTS';
import {
  arrayListTask,
  arrayListTaskFunc,
  concurrentReadWrite,
  hashMapTaskFunc,
  hashSetTaskFunc,
  linkedListTask,
  listTask,
  objectTaskFunc,
  TestClass,
  TestClassWithContainers,
  traverseArrayListAllInterfaces,
  traverseContainAllContainers,
  traverseHashMapAllInterfaces,
  traverseHashSetAllInterfaces,
  traverseLinkedListAllInterfaces,
  traverseListAllInterfaces,
  traverseTreeSetAllInterfaces,
  treeSetComparator,
  treeSetComparator2,
  treeSetComparator3,
  treeSetTask
} from './taskFunc';
import { Sleep } from '../utils/utils';

@Concurrent
function treeSetTask3(set: TreeSet<TestClass>): TreeSet<TestClass> {
  set.clear();
  set.add(new TestClass(10));
  set.add(new TestClass(5));
  set.add(new TestClass(1));
  set.add(new TestClass(0));
  return set;
}

export default function containerSerializeTest() {
  describe('containerSerializeTest', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0100
     * @tc.name testArrayListCompletePathwayWithExecute
     * @tc.desc Test ArrayList complete pathway with TaskPool.execute() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testArrayListCompletePathwayWithExecute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testArrayListCompletePathwayWithExecute';
        console.info(`${caseName} test start`);

        const arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.insert(100, 1);

        const result = await taskpool.execute(traverseArrayListAllInterfaces, arrayList) as ArrayList<number>;

        expect(result.length).assertEqual(3);
        expect(result.has(1)).assertTrue();
        expect(result.has(2)).assertTrue();
        expect(result.has(3)).assertTrue();
        expect(result.isEmpty()).assertFalse();
        expect(result[0]).assertEqual(1);
        expect(result.getIndexOf(1)).assertEqual(0);
        expect(result.getLastIndexOf(3)).assertEqual(2);
        expect(result.getCapacity()).assertLarger(0);
        const clonedResult = result.clone();
        expect(clonedResult.length).assertEqual(3);
        const arrResult = result.convertToArray();
        expect(arrResult.length).assertEqual(3);
        result.forEach((value: number, index?: number) => {
          console.info(`Main thread ArrayList forEach: ${index} - ${value}`);
        });
        const subResult = result.subArrayList(0, 2);
        expect(subResult.length).assertEqual(2);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0200
     * @tc.name testHashMapCompletePathwayWithTask
     * @tc.desc Test HashMap complete pathway with TaskPool.Task constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHashMapCompletePathwayWithTask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testHashMapCompletePathwayWithTask';
        console.info(`${caseName} test start`);

        const hashMap = new HashMap<string, number>();
        hashMap.set('a', 1);
        hashMap.set('b', 2);
        hashMap.set('c', 3);

        const task = new taskpool.Task(traverseHashMapAllInterfaces, hashMap);
        const result = await taskpool.execute(task) as HashMap<string, number>;

        expect(result.length).assertEqual(3);
        expect(result.hasKey('x')).assertTrue();
        expect(result.hasKey('y')).assertTrue();
        expect(result.hasKey('z')).assertTrue();
        expect(result.isEmpty()).assertFalse();
        expect(result.hasValue(1)).assertTrue();
        expect(result.hasValue(2)).assertTrue();
        expect(result.hasValue(3)).assertTrue();
        expect(result.get('x')).assertEqual(1);
        expect(result.get('y')).assertEqual(2);
        expect(result.get('z')).assertEqual(3);
        const keysIter = result.keys();
        expect(keysIter !== undefined).assertTrue();
        const valuesIter = result.values();
        expect(valuesIter !== undefined).assertTrue();
        const entriesIter = result.entries();
        expect(entriesIter !== undefined).assertTrue();
        result.forEach((value?: number, key?: string) => {
          console.info(`Main thread HashMap forEach: ${key} - ${value}`);
        });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0300
     * @tc.name testHashSetCompletePathwayWithLongTask
     * @tc.desc Test HashSet complete pathway with TaskPool LongTask mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHashSetCompletePathwayWithLongTask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testHashSetCompletePathwayWithLongTask';
        console.info(`${caseName} test start`);
        const hashSet = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(2);
        hashSet.add(3);

        const longTask = new taskpool.LongTask(traverseHashSetAllInterfaces, hashSet);
        const result = await taskpool.execute(longTask) as HashSet<number>;
        taskpool.terminateTask(longTask)

        expect(result.length).assertEqual(3);
        expect(result.has(10)).assertTrue();
        expect(result.has(20)).assertTrue();
        expect(result.has(30)).assertTrue();
        expect(result.isEmpty()).assertFalse();
        const valuesIter = result.values();
        expect(valuesIter !== undefined).assertTrue();
        const entriesIter = result.entries();
        expect(entriesIter !== undefined).assertTrue();
        result.forEach((value?: number, key?: number) => {
          console.info(`Main thread HashSet forEach: ${value}`);
        });

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0400
     * @tc.name testTreeSetCompletePathwayWithReturn
     * @tc.desc Test TreeSet complete pathway with custom comparator and task return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTreeSetCompletePathwayWithReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testTreeSetCompletePathwayWithReturn';
        console.info(`${caseName} test start`);
        const treeSet = new TreeSet<number>(treeSetComparator);
        treeSet.add(3);
        treeSet.add(1);
        treeSet.add(2);

        const result = await taskpool.execute(traverseTreeSetAllInterfaces, treeSet) as TreeSet<number>;

        console.info(`TreeSet result length: ${result.length}`);
        console.info(`TreeSet has 1: ${result.has(1)}, has 2: ${result.has(2)}, has 3: ${result.has(3)}`);

        const firstVal = result.getFirstValue();
        const lastVal = result.getLastValue();
        console.info(`TreeSet firstValue: ${firstVal}, lastValue: ${lastVal}`);

        expect(result.length).assertEqual(3);
        expect(result.has(1)).assertTrue();
        expect(result.has(2)).assertTrue();
        expect(result.has(3)).assertTrue();
        expect(result.isEmpty()).assertFalse();

        expect(firstVal).assertEqual(3);
        expect(lastVal).assertEqual(1);
        const valuesIter = result.values();
        expect(valuesIter !== undefined).assertTrue();
        const entriesIter = result.entries();
        expect(entriesIter !== undefined).assertTrue();
        result.forEach((value?: number, key?: number) => {
          console.info(`Main thread TreeSet forEach: ${value}`);
        });

        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0411
     * @tc.name testTreeSetCompletePathwayWithReturn2
     * @tc.desc Test TreeSet complete pathway with custom comparator and task return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTreeSetCompletePathwayWithReturn2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testTreeSetCompletePathwayWithReturn2';
        console.info(`${caseName} test start`);
        const treeSet = new TreeSet<number>(treeSetComparator2);
        treeSet.add(3);
        treeSet.add(1);
        treeSet.add(2);

        const result = await taskpool.execute(traverseTreeSetAllInterfaces, treeSet) as TreeSet<number>;

        console.info(`TreeSet result length: ${result.length}`);
        console.info(`TreeSet has 1: ${result.has(1)}, has 2: ${result.has(2)}, has 3: ${result.has(3)}`);

        const firstVal = result.getFirstValue();
        const lastVal = result.getLastValue();
        console.info(`TreeSet firstValue: ${firstVal}, lastValue: ${lastVal}`);

        expect(result.length).assertEqual(3);
        expect(result.has(1)).assertTrue();
        expect(result.has(2)).assertTrue();
        expect(result.has(3)).assertTrue();
        expect(result.isEmpty()).assertFalse();

        expect(firstVal).assertEqual(1);
        expect(lastVal).assertEqual(3);
        const valuesIter = result.values();
        expect(valuesIter !== undefined).assertTrue();
        const entriesIter = result.entries();
        expect(entriesIter !== undefined).assertTrue();
        result.forEach((value?: number, key?: number) => {
          console.info(`Main thread TreeSet forEach: ${value}`);
        });

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0500
     * @tc.name testLinkedListCompletePathwayWithSendData
     * @tc.desc Test LinkedList complete pathway with TaskPool.sendData() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testLinkedListCompletePathwayWithSendData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testLinkedListCompletePathwayWithSendData';
        console.info(`${caseName} test start`);
        const linkedList = new LinkedList<number>();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.add(3);

        const task = new taskpool.Task(traverseLinkedListAllInterfaces, linkedList);
        task.onReceiveData((data: Object) => {
          const receivedList = data as LinkedList<number>;
          expect(receivedList.has(999)).assertTrue();
        });

        const result = await taskpool.execute(task) as LinkedList<number>;

        expect(result.length).assertEqual(3);
        expect(result.has(1)).assertTrue();
        expect(result.has(2)).assertTrue();
        expect(result.has(3)).assertTrue();
        expect(result.get(0)).assertEqual(1);
        expect(result.get(1)).assertEqual(2);
        expect(result.get(2)).assertEqual(3);
        expect(result.getIndexOf(1)).assertEqual(0);
        expect(result.getIndexOf(2)).assertEqual(1);
        expect(result.getLastIndexOf(3)).assertEqual(2);
        expect(result.getFirst()).assertEqual(1);
        expect(result.getLast()).assertEqual(3);
        const clonedResult = result.clone();
        expect(clonedResult.length).assertEqual(3);
        const arrResult = result.convertToArray();
        expect(arrResult.length).assertEqual(3);
        result.forEach((value: number, index?: number) => {
          console.info(`Main thread LinkedList forEach: ${index} - ${value}`);
        });

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0600
     * @tc.name testListCompletePathway
     * @tc.desc Test List complete pathway with TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testListCompletePathway', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const caseName = 'testListCompletePathway';
        console.info(`${caseName} test start`);
        const list = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);

        const task = new taskpool.Task(traverseListAllInterfaces, list);
        const result = await taskpool.execute(task) as List<number>;

        expect(result.length).assertEqual(3);
        expect(result.has(10)).assertTrue();
        expect(result.has(20)).assertTrue();
        expect(result.has(30)).assertTrue();
        expect(result.isEmpty()).assertFalse();
        expect(result.get(0)).assertEqual(10);
        expect(result.get(1)).assertEqual(20);
        expect(result.get(2)).assertEqual(30);
        expect(result.getIndexOf(10)).assertEqual(0);
        expect(result.getIndexOf(20)).assertEqual(1);
        expect(result.getLastIndexOf(30)).assertEqual(2);
        expect(result.getFirst()).assertEqual(10);
        expect(result.getLast()).assertEqual(30);
        const arrResult = result.convertToArray();
        expect(arrResult.length).assertEqual(3);
        result.forEach((value: number, index?: number) => {
          console.info(`Main thread List forEach: ${index} - ${value}`);
        });

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0700
     * @tc.name testTaskPoolPriorityExtended
     * @tc.desc Test TaskPool priority with multiple containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTaskPoolPriorityExtended', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'testTaskPoolPriorityExtended';
        console.info(`${caseName} test start`);
        const arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);

        const hashMap = new HashMap<string, number>();
        hashMap.set('a', 1);

        const hashSet = new HashSet<number>();
        hashSet.add(1);

        const treeSet = new TreeSet<number>(treeSetComparator);
        treeSet.add(1);

        const linkedList = new LinkedList<number>();
        linkedList.add(1);

        const list = new List<number>();
        list.add(1);

        const arrayListTask = new taskpool.Task(arrayListTaskFunc, arrayList);
        const hashMapTask = new taskpool.Task(hashMapTaskFunc, hashMap);
        const hashSetTask = new taskpool.Task(hashSetTaskFunc, hashSet);
        const treeSetTaskInst = new taskpool.Task(treeSetTask, treeSet);
        const linkedListTaskInst = new taskpool.Task(linkedListTask, linkedList);
        const listTaskInst = new taskpool.Task(listTask, list);

        const resultArrayList =
          await taskpool.execute(arrayListTask, taskpool.Priority.HIGH) as ArrayList<number>;
        const resultHashMap =
          await taskpool.execute(hashMapTask, taskpool.Priority.MEDIUM) as HashMap<string, number>;
        const resultHashSet =
          await taskpool.execute(hashSetTask, taskpool.Priority.LOW) as HashSet<number>;
        const resultTreeSet =
          await taskpool.execute(treeSetTaskInst, taskpool.Priority.HIGH) as TreeSet<number>;
        const resultLinkedList =
          await taskpool.execute(linkedListTaskInst, taskpool.Priority.MEDIUM) as number;
        const resultList =
          await taskpool.execute(listTaskInst, taskpool.Priority.LOW) as List<number>;

        expect(resultArrayList.length).assertEqual(3);
        expect(resultArrayList.has(4)).assertTrue();

        expect(resultHashMap.length).assertEqual(2);
        expect(resultHashMap.hasKey('b')).assertTrue();

        expect(resultHashSet.length).assertEqual(2);
        expect(resultHashSet.has(2)).assertTrue();

        expect(resultTreeSet.length).assertEqual(2);

        expect(resultLinkedList).assertEqual(3);

        expect(resultList.length).assertEqual(2);

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_0800
     * @tc.name testTaskPoolTaskGroupExtended
     * @tc.desc Test TaskPool TaskGroup with multiple containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTaskPoolTaskGroupExtended', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'testTaskPoolTaskGroupExtended';
        console.info(`${caseName} test start`);
        const arrayList1 = new ArrayList<number>();
        arrayList1.add(1);
        const arrayList2 = new ArrayList<number>();
        arrayList2.add(2);

        const hashMap1 = new HashMap<string, number>();
        hashMap1.set('a', 1);
        const hashMap2 = new HashMap<string, number>();
        hashMap2.set('b', 2);

        const hashSet1 = new HashSet<number>();
        hashSet1.add(1);
        const hashSet2 = new HashSet<number>();
        hashSet2.add(2);

        const treeSet1 = new TreeSet<number>(treeSetComparator);
        treeSet1.add(1);
        const treeSet2 = new TreeSet<number>(treeSetComparator);
        treeSet2.add(2);

        const linkedList1 = new LinkedList<number>();
        linkedList1.add(1);
        const linkedList2 = new LinkedList<number>();
        linkedList2.add(2);

        const list1 = new List<number>();
        list1.add(1);
        const list2 = new List<number>();
        list2.add(2);

        const taskGroup = new taskpool.TaskGroup();

        taskGroup.addTask(arrayListTaskFunc, arrayList1);
        taskGroup.addTask(arrayListTaskFunc, arrayList2);
        taskGroup.addTask(hashMapTaskFunc, hashMap1);
        taskGroup.addTask(hashMapTaskFunc, hashMap2);
        taskGroup.addTask(hashSetTaskFunc, hashSet1);
        taskGroup.addTask(hashSetTaskFunc, hashSet2);
        taskGroup.addTask(treeSetTask, treeSet1);
        taskGroup.addTask(treeSetTask, treeSet2);

        const results = await taskpool.execute(taskGroup) as Object[];

        expect(results.length).assertEqual(8);

        const resultArrayList1 = results[0] as ArrayList<number>;
        expect(resultArrayList1.length).assertEqual(2);
        expect(resultArrayList1.has(4)).assertTrue();

        const resultArrayList2 = results[1] as ArrayList<number>;
        expect(resultArrayList2.length).assertEqual(2);
        expect(resultArrayList2.has(4)).assertTrue();

        const resultHashMap1 = results[2] as HashMap<string, number>;
        expect(resultHashMap1.length).assertEqual(2);
        expect(resultHashMap1.hasKey('b')).assertTrue();

        const resultHashMap2 = results[3] as HashMap<string, number>;
        expect(resultHashMap2.length).assertEqual(1);
        expect(resultHashMap2.hasKey('b')).assertTrue();

        const resultHashSet1 = results[4] as HashSet<number>;
        expect(resultHashSet1.length).assertEqual(2);
        expect(resultHashSet1.has(2)).assertTrue();

        const resultHashSet2 = results[5] as HashSet<number>;
        expect(resultHashSet2.length).assertEqual(1);
        expect(resultHashSet2.has(2)).assertTrue();

        const resultTreeSet1 = results[6] as TreeSet<number>;
        expect(resultTreeSet1.length).assertEqual(2);

        const resultTreeSet2 = results[7] as TreeSet<number>;
        expect(resultTreeSet2.length).assertEqual(3);

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_2800
     * @tc.name testSequenceRunnerSerialQueue
     * @tc.desc Test SequenceRunner serial queue with containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testSequenceRunnerSerialQueue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'testSequenceRunnerSerialQueue';
        console.info(`${caseName} test start`);
        const seqRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);

        const arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);

        const hashMap = new HashMap<string, number>();
        hashMap.set('a', 1);

        const hashSet = new HashSet<number>();
        hashSet.add(1);

        const arrayListTask = new taskpool.Task(arrayListTaskFunc, arrayList);
        const hashMapTask = new taskpool.Task(hashMapTaskFunc, hashMap);
        const hashSetTask = new taskpool.Task(hashSetTaskFunc, hashSet);

        const executionOrder: number[] = [];

        await seqRunner.execute(arrayListTask).then((res) => {
          executionOrder.push(1);
          let result = res as ArrayList<number>
          expect(result.length).assertEqual(3);
          expect(result.has(4)).assertTrue();
        });
        expect(arrayListTask.isDone()).assertTrue();
        expect(executionOrder[0]).assertEqual(1);
        expect(arrayList.length).assertEqual(2);
        expect(arrayList.has(4)).assertFalse();

        await seqRunner.execute(hashMapTask).then((res) => {
          executionOrder.push(2);
          let result = res as HashMap<string, number>
          expect(result.length).assertEqual(2);
          expect(result.hasKey('b')).assertTrue();
        });
        expect(hashMapTask.isDone()).assertTrue();
        expect(executionOrder[1]).assertEqual(2);
        expect(hashMap.length).assertEqual(1);
        expect(hashMap.hasKey('b')).assertFalse();

        await seqRunner.execute(hashSetTask).then((res) => {
          executionOrder.push(3);
          let result = res as HashSet<number>
          expect(result.length).assertEqual(2);
          expect(result.has(2)).assertTrue();
        });
        expect(hashSetTask.isDone()).assertTrue();
        expect(executionOrder[2]).assertEqual(3);
        expect(hashSet.length).assertEqual(1);
        expect(hashSet.has(2)).assertFalse();

        expect(executionOrder.length).assertEqual(3);
        expect(executionOrder[0]).assertEqual(1);
        expect(executionOrder[1]).assertEqual(2);
        expect(executionOrder[2]).assertEqual(3);

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_2900
     * @tc.name testAsyncRunnerConcurrentQueue
     * @tc.desc Test AsyncRunner concurrent queue with containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testAsyncRunnerConcurrentQueue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'testAsyncRunnerConcurrentQueue';
        console.info(`${caseName} test start`);
        const asyncRunner = new taskpool.AsyncRunner(3, 10);

        const arrayList1 = new ArrayList<number>();
        arrayList1.add(1);

        const hashMap1 = new HashMap<string, number>();
        hashMap1.set('a', 1);

        const hashSet1 = new HashSet<number>();
        hashSet1.add(1);

        const treeSet1 = new TreeSet<number>(treeSetComparator);
        treeSet1.add(1);

        const linkedList1 = new LinkedList<number>();
        linkedList1.add(1);

        const list1 = new List<number>();
        list1.add(1);

        let count = 0
        const task1 = new taskpool.Task(objectTaskFunc, hashMap1);
        task1.onReceiveData((obj: object) => {
          count++
        })
        const task2 = new taskpool.Task(objectTaskFunc, hashSet1);
        task2.onReceiveData((obj: object) => {
          count++
        })
        const task3 = new taskpool.Task(objectTaskFunc, treeSet1);
        task3.onReceiveData((obj: object) => {
          count++
        })
        const task4 = new taskpool.Task(objectTaskFunc, linkedList1);
        task4.onReceiveData((obj: object) => {
          count++
        })
        const task5 = new taskpool.Task(objectTaskFunc, list1);
        task5.onReceiveData((obj: object) => {
          count++
        })
        const task6 = new taskpool.Task(objectTaskFunc, arrayList1);
        task6.onReceiveData((obj: object) => {
          count++
        })
        let completedCount = 0;
        const totalTasks = 6;

        const executePromises: Promise<void>[] = [
          asyncRunner.execute(task1, taskpool.Priority.HIGH).then(() => {
            completedCount++;
          }), asyncRunner.execute(task2, taskpool.Priority.HIGH).then(() => {
          completedCount++;
        }), asyncRunner.execute(task3, taskpool.Priority.HIGH).then(() => {
          completedCount++;
        }), asyncRunner.execute(task4, taskpool.Priority.HIGH).then(() => {
          completedCount++;
        }), asyncRunner.execute(task5, taskpool.Priority.HIGH).then(() => {
          completedCount++;
        }), asyncRunner.execute(task6, taskpool.Priority.HIGH).then(() => {
          completedCount++;
        }),
        ];

        await Promise.all(executePromises);
        while (count < 6) {
          await Sleep(100)
        }

        expect(completedCount).assertEqual(totalTasks);
        expect(count === 6).assertTrue();

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_1500
     * @tc.name testEmptyContainerSerialize
     * @tc.desc Test empty container serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEmptyContainerSerialize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testEmptyContainerSerialize';
      console.info(`${caseName} test start`);
      const emptyArrayList = new ArrayList<number>();

      expect(emptyArrayList.isEmpty()).assertTrue();
      expect(emptyArrayList.length).assertEqual(0);

      const result = await taskpool.execute(arrayListTask, emptyArrayList) as ArrayList<number>;

      expect(result.length).assertEqual(1);
      expect(result.has(4)).assertTrue();

      console.info(`${caseName} test end`);

      done();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_1700
     * @tc.name testUnsupportedTypeSerialize
     * @tc.desc Test unsupported type serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testUnsupportedTypeSerialize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testUnsupportedTypeSerialize';
      console.info(`${caseName} test start`);

      const unsupportedData = new TreeSet<number>((a, b) => a > b);
      unsupportedData.add(12);
      try {
        const result = await taskpool.execute(treeSetTask, unsupportedData);
        expect().assertFail();
      } catch (err) {
        console.info(`${caseName} catch err:` + err);
        expect(err.code).assertEqual(10200006);
      }

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_1800
     * @tc.name testTreeSetCustomComparator
     * @tc.desc Test TreeSet custom comparator serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTreeSetCustomComparator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testTreeSetCustomComparator';
      console.info(`${caseName} test start`);

      const treeSet = new TreeSet<TestClass>(treeSetComparator3);
      treeSet.add(new TestClass(10));
      treeSet.add(new TestClass(5));
      treeSet.add(new TestClass(1));

      const result = await taskpool.execute(treeSetTask3, treeSet) as TreeSet<TestClass>;

      console.info(`TC013 TreeSet result length: ${result.length}`);
      console.info(`TC013 TreeSet isEmpty: ${result.isEmpty()}`);

      expect(result.getFirstValue().value).assertEqual(10);
      expect(result.getLastValue().value).assertEqual(0);
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_1900
     * @tc.name testContainerWithClassInstance
     * @tc.desc Test container with class instance serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testContainerWithClassInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName = 'testContainerWithClassInstance';
        console.info(`${caseName} test start`);

        const clas = new TestClassWithContainers();

        // ArrayList initial data
        clas.arrayList.add('init1');
        clas.arrayList.add('init2');

        // HashMap initial data
        clas.hashMap.set('init1', 100);
        clas.hashMap.set('init2', 200);

        // HashSet initial data
        clas.hashSet.add(100);
        clas.hashSet.add(200);

        // TreeSet initial data
        clas.treeSet.add(100);
        clas.treeSet.add(200);

        // LinkedList initial data
        clas.linkedList.add('init1');
        clas.linkedList.add('init2');

        // List initial data
        clas.list.add('init1');
        clas.list.add('init2');

        const result = await taskpool.execute(traverseContainAllContainers, clas) as TestClassWithContainers;

        // ArrayList verification
        expect(result.arrayList.length).assertEqual(2);
        expect(result.arrayList.has('1')).assertTrue();
        expect(result.arrayList.has('3')).assertTrue();
        expect(result.arrayList.has('2')).assertFalse();
        expect(result.arrayList.has('init1')).assertFalse();

        // HashMap verification
        expect(result.hashMap.length).assertEqual(2);
        expect(result.hashMap.hasKey('a')).assertTrue();
        expect(result.hashMap.hasKey('c')).assertTrue();
        expect(result.hashMap.hasKey('b')).assertFalse();
        expect(result.hashMap.hasKey('init1')).assertFalse();
        expect(result.hashMap.hasValue(1)).assertTrue();
        expect(result.hashMap.hasValue(3)).assertTrue();

        // HashSet verification
        expect(result.hashSet.length).assertEqual(2);
        expect(result.hashSet.has(1)).assertTrue();
        expect(result.hashSet.has(3)).assertTrue();
        expect(result.hashSet.has(2)).assertFalse();
        expect(result.hashSet.has(100)).assertFalse();

        // TreeSet verification
        expect(result.treeSet.length).assertEqual(2);
        expect(result.treeSet.has(1)).assertTrue();
        expect(result.treeSet.has(3)).assertTrue();
        expect(result.treeSet.has(2)).assertFalse();
        expect(result.treeSet.has(100)).assertFalse();

        // LinkedList verification
        expect(result.linkedList.length).assertEqual(2);
        expect(result.linkedList.has('1')).assertTrue();
        expect(result.linkedList.has('3')).assertTrue();
        expect(result.linkedList.has('2')).assertFalse();
        expect(result.linkedList.has('init1')).assertFalse();

        // List verification
        expect(result.list.length).assertEqual(2);
        expect(result.list.has('1')).assertTrue();
        expect(result.list.has('3')).assertTrue();
        expect(result.list.has('2')).assertFalse();
        expect(result.list.has('init1')).assertFalse();

        console.info(`${caseName} test end`);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_2000
     * @tc.name testMultiThreadConcurrency
     * @tc.desc Test multi-thread concurrency with containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMultiThreadConcurrency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'testMultiThreadConcurrency';
      console.info(`${caseName} test start`);
      const arrayList = new ArrayList<number>();
      arrayList.add(1);
      arrayList.add(2);
      let count = 0
      for (let i = 0; i < 1000; i++) {
        taskpool.execute(concurrentReadWrite, arrayList).then((res) => {
          expect(res as number).assertEqual(3);
          count++
        })
      }
      while (count < 1000) {
        await Sleep(100)
      }
      expect(count).assertEqual(1000);
      expect(arrayList.length).assertEqual(2);

      console.info(`${caseName} test end`);

      done();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_2400
     * @tc.name testLargeDataLoop
     * @tc.desc Test large data loop stress
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testLargeDataLoop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testLargeDataLoop';
      console.info(`${caseName} test start`);
      let count = 0
      for (let i = 0; i < 10; i++) {
        const set = new TreeSet<number>(treeSetComparator);

        for (let j = 0; j < 100; j++) {
          set.add(j);
        }
        taskpool.execute(treeSetTask, set).then((res) => {
          let result = res as TreeSet<number>
          expect(result.length).assertEqual(99);
          expect(result.getFirstValue()).assertEqual(99);
          expect(result.getLastValue()).assertEqual(0);
          count++
        });
      }
      while (count < 10) {
        await Sleep(100)
      }
      console.info(`${caseName} test end`);

      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_1200
     * @tc.name testWorkerReturn
     * @tc.desc Test Worker return with ArrayList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testWorkerReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testWorkerReturn';
      console.info(`${caseName} test start`);
      try {
        const workerInstance =
          new worker.ThreadWorker('./workers/ContainerReturnWorker.ets');

        workerInstance.onmessage = (e) => {
          const result = e.data as ArrayList<number>;
          expect(result.length).assertEqual(3);
          expect(result.has(4)).assertTrue();
          expect(result.has(2)).assertTrue();
          expect(result.has(3)).assertTrue();
          workerInstance.terminate();
          console.info(`${caseName} test end`);
        };
        workerInstance.onexit = (err) => {
          console.error('TC013 Worker onexit:', err);
          done();
        };
        workerInstance.onerror = (err) => {
          console.error('TC012 Worker error:', err);
          expect().assertFail();
          workerInstance.terminate();
          done();
        };

        workerInstance.postMessage('start');
      } catch (err) {
        console.error(`${caseName} failed:`, err);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_SERIALIZE_1300
     * @tc.name testWorkerLifecycleWithAllContainers
     * @tc.desc Test Worker lifecycle with all 6 containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testWorkerLifecycleWithAllContainers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'testWorkerLifecycleWithAllContainers';
        console.info(`${caseName} test start`);
        try {
          const workerInstance =
            new worker.ThreadWorker('./workers/ContainerLifecycleWorker.ets');

          const arrayList = new ArrayList<number>();
          arrayList.add(1);
          arrayList.add(2);
          arrayList.add(3);

          const hashMap = new HashMap<string, number>();
          hashMap.set('a', 100);
          hashMap.set('b', 200);

          const treeSet = new TreeSet<number>(treeSetComparator);
          treeSet.add(1);
          treeSet.add(2);
          treeSet.add(3);

          const linkedList = new LinkedList<number>();
          linkedList.add(1);
          linkedList.add(2);
          linkedList.add(3);

          const list = new List<number>();
          list.add(1);
          list.add(2);
          list.add(3);
          const hashSet = new HashSet<number>();
          hashSet.add(1);
          hashSet.add(2);
          hashSet.add(3);

          let receivedCount = 0;

          workerInstance.onmessage = (e) => {
            const data: object = e.data;

            if (data instanceof HashSet) {
              const hashSetResult = data as HashSet<number>;
              expect(hashSetResult.length).assertEqual(3);
              expect(hashSetResult.has(1)).assertTrue();
              expect(hashSetResult.has(2)).assertTrue();
              expect(hashSetResult.has(3)).assertTrue();
            } else if (data instanceof List) {
              const listResult = data as List<number>;
              expect(listResult.length).assertEqual(6);
              expect(listResult.has(10)).assertTrue();
              expect(listResult.has(20)).assertTrue();
              expect(listResult.has(30)).assertTrue();
            } else if (data instanceof ArrayList) {
              const arrayListResult = data as ArrayList<number>;
              expect(arrayListResult.length).assertEqual(3);
              expect(arrayListResult.has(100)).assertTrue();
              expect(arrayListResult.has(2)).assertFalse();
            } else if (data instanceof HashMap) {
              const hashMapResult = data as HashMap<string, number>;
              expect(hashMapResult.length).assertEqual(2);
              expect(hashMapResult.hasKey('workerKey')).assertTrue();
              expect(hashMapResult.hasKey('a')).assertFalse();
            } else if (data instanceof TreeSet) {
              const treeSetResult = data as TreeSet<number>;
              expect(treeSetResult.length).assertEqual(3);
              expect(treeSetResult.getFirstValue()).assertEqual(100);
              expect(treeSetResult.has(1)).assertFalse();
            } else if (data instanceof LinkedList) {
              const linkedListResult = data as LinkedList<number>;
              expect(linkedListResult.length).assertEqual(3);
              expect(linkedListResult.has(100)).assertTrue();
              expect(linkedListResult.has(2)).assertFalse();
            }
            receivedCount++;

            if (receivedCount === 36) {
              workerInstance.terminate();
              console.info(`${caseName} test end`);
            }
          };

          workerInstance.onexit = (err) => {
            console.error('TC013 Worker onexit:', err);
            done();
          };
          workerInstance.onAllErrors = (err) => {
            console.error('TC013 Worker onAllErrors:', err);
            done();
          };

          workerInstance.postMessage(arrayList);
          workerInstance.postMessage(hashMap);
          workerInstance.postMessage(treeSet);
          workerInstance.postMessage(linkedList);
          workerInstance.postMessage(list);
          workerInstance.postMessage(hashSet);
          workerInstance.postMessageWithSharedSendable(arrayList);
          workerInstance.postMessageWithSharedSendable(hashMap);
          workerInstance.postMessageWithSharedSendable(treeSet);
          workerInstance.postMessageWithSharedSendable(linkedList);
          workerInstance.postMessageWithSharedSendable(list);
          workerInstance.postMessageWithSharedSendable(hashSet);
        } catch (err) {
          console.error(`${caseName} failed:`, err);
          expect().assertFail();
          done();
        }
      });

  });
}
