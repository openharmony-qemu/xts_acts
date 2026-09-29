/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, afterEach, TestType, Size, Level } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@ohos.base';
import { ArrayList, HashMap, HashSet, LinkedList, List } from '@kit.ArkTS';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}

const promiseCase: Function = (): Promise<void | Object> => {
  let p: Promise<void | Object> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(0);
    }, 100);
  });
  return p;
}

function echoArrayList(arg: ArrayList<number>): ArrayList<number> {
  "use concurrent"
  return arg;
}

function echoHashMap(arg: HashMap<string, number>): HashMap<string, number> {
  "use concurrent"
  return arg;
}

function echoHashSet(arg: HashSet<number>): HashSet<number> {
  "use concurrent"
  return arg;
}

function echoList(arg: List<string>): List<string> {
  "use concurrent"
  return arg;
}

function echoLinkedList(arg: LinkedList<number>): LinkedList<number> {
  "use concurrent"
  return arg;
}

function arrayListLength(arg: ArrayList<number>): number {
  "use concurrent"
  return arg.length;
}

function hashMapLength(arg: HashMap<string, number>): number {
  "use concurrent"
  return arg.length;
}

function hashSetLength(arg: HashSet<number>): number {
  "use concurrent"
  return arg.length;
}

function listLength(arg: List<string>): number {
  "use concurrent"
  return arg.length;
}

function linkedListLength(arg: LinkedList<number>): number {
  "use concurrent"
  return arg.length;
}

export default function TaskpoolTestContainer() {
  describe('ActsTaskPoolContainerTest', () => {

    afterEach(async () => {
      await asyncSleep(1000);
    })

    /**
     * @tc.name   testTaskpoolContainerArrayList001
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0100
     * @tc.desc   test taskpool serialize ArrayList container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerArrayList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerArrayList001';
      console.info(`${caseName} test start`);
      try {
        const arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        const task: taskpool.Task = new taskpool.Task(echoArrayList, arrayList);
        const res: Object = await taskpool.execute(task, taskpool.Priority.HIGH);
        const recv: ArrayList<number> = res as ArrayList<number>;
        expect(recv.length).assertEqual(3);
        expect(recv[0]).assertEqual(1);
        expect(recv[1]).assertEqual(2);
        expect(recv[2]).assertEqual(3);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolContainerHashMap002
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0200
     * @tc.desc   test taskpool serialize HashMap container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerHashMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerHashMap002';
      console.info(`${caseName} test start`);
      try {
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('one', 1);
        hashMap.set('two', 2);
        hashMap.set('three', 3);
        const task: taskpool.Task = new taskpool.Task(echoHashMap, hashMap);
        const res: Object = await taskpool.execute(task, taskpool.Priority.HIGH);
        const recv: HashMap<string, number> = res as HashMap<string, number>;
        expect(recv.length).assertEqual(3);
        expect(recv.get('one')).assertEqual(1);
        expect(recv.get('two')).assertEqual(2);
        expect(recv.get('three')).assertEqual(3);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolContainerHashSet003
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0300
     * @tc.desc   test taskpool serialize HashSet container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerHashSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerHashSet003';
      console.info(`${caseName} test start`);
      try {
        const hashSet: HashSet<number> = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(2);
        hashSet.add(3);
        const task: taskpool.Task = new taskpool.Task(echoHashSet, hashSet);
        const res: Object = await taskpool.execute(task, taskpool.Priority.HIGH);
        const recv: HashSet<number> = res as HashSet<number>;
        expect(recv.length).assertEqual(3);
        expect(recv.has(1)).assertTrue();
        expect(recv.has(2)).assertTrue();
        expect(recv.has(3)).assertTrue();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolContainerList004
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0400
     * @tc.desc   test taskpool serialize List container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerList004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerList004';
      console.info(`${caseName} test start`);
      try {
        const list: List<string> = new List<string>();
        list.add('x');
        list.add('y');
        list.add('z');
        const task: taskpool.Task = new taskpool.Task(echoList, list);
        const res: Object = await taskpool.execute(task, taskpool.Priority.HIGH);
        const recv: List<string> = res as List<string>;
        expect(recv.length).assertEqual(3);
        expect(recv.get(0)).assertEqual('x');
        expect(recv.get(1)).assertEqual('y');
        expect(recv.get(2)).assertEqual('z');
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolContainerLinkedList005
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0500
     * @tc.desc   test taskpool serialize LinkedList container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerLinkedList005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerLinkedList005';
      console.info(`${caseName} test start`);
      try {
        const linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(10);
        linkedList.add(20);
        linkedList.add(30);
        const task: taskpool.Task = new taskpool.Task(echoLinkedList, linkedList);
        const res: Object = await taskpool.execute(task, taskpool.Priority.HIGH);
        const recv: LinkedList<number> = res as LinkedList<number>;
        expect(recv.length).assertEqual(3);
        expect(recv.get(0)).assertEqual(10);
        expect(recv.get(1)).assertEqual(20);
        expect(recv.get(2)).assertEqual(30);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolContainerLength006
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0600
     * @tc.desc   test taskpool serialize containers and read length in task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerLength006';
      console.info(`${caseName} test start`);
      try {
        const arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('k1', 1);
        hashMap.set('k2', 2);
        hashMap.set('k3', 3);
        const hashSet: HashSet<number> = new HashSet<number>();
        hashSet.add(1);
        const list: List<string> = new List<string>();
        list.add('a');
        list.add('b');
        const linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(100);

        const task1: taskpool.Task = new taskpool.Task(arrayListLength, arrayList, taskpool.Priority.HIGH);
        const task2: taskpool.Task = new taskpool.Task(hashMapLength, hashMap, taskpool.Priority.HIGH);
        const task3: taskpool.Task = new taskpool.Task(hashSetLength, hashSet, taskpool.Priority.HIGH);
        const task4: taskpool.Task = new taskpool.Task(listLength, list, taskpool.Priority.HIGH);
        const task5: taskpool.Task = new taskpool.Task(linkedListLength, linkedList, taskpool.Priority.HIGH);

        const res1: number = await taskpool.execute(task1) as number;
        const res2: number = await taskpool.execute(task2) as number;
        const res3: number = await taskpool.execute(task3) as number;
        const res4: number = await taskpool.execute(task4) as number;
        const res5: number = await taskpool.execute(task5) as number;

        expect(res1).assertEqual(2);
        expect(res2).assertEqual(3);
        expect(res3).assertEqual(1);
        expect(res4).assertEqual(2);
        expect(res5).assertEqual(1);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolContainerEmpty007
     * @tc.number SUB_Runtime_Language_Backend_TaskpoolConcurrency_Container_0700
     * @tc.desc   test taskpool serialize empty containers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolContainerEmpty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolContainerEmpty007';
      console.info(`${caseName} test start`);
      try {
        const task1: taskpool.Task = new taskpool.Task(echoArrayList, new ArrayList<number>());
        const task2: taskpool.Task = new taskpool.Task(echoHashMap, new HashMap<string, number>());
        const task3: taskpool.Task = new taskpool.Task(echoHashSet, new HashSet<number>());
        const task4: taskpool.Task = new taskpool.Task(echoList, new List<string>());
        const task5: taskpool.Task = new taskpool.Task(echoLinkedList, new LinkedList<number>());

        const res1: Object = await taskpool.execute(task1, taskpool.Priority.HIGH);
        const res2: Object = await taskpool.execute(task2, taskpool.Priority.HIGH);
        const res3: Object = await taskpool.execute(task3, taskpool.Priority.HIGH);
        const res4: Object = await taskpool.execute(task4, taskpool.Priority.HIGH);
        const res5: Object = await taskpool.execute(task5, taskpool.Priority.HIGH);

        expect((res1 as ArrayList<number>).length).assertEqual(0);
        expect((res2 as HashMap<string, number>).length).assertEqual(0);
        expect((res3 as HashSet<number>).length).assertEqual(0);
        expect((res4 as List<string>).length).assertEqual(0);
        expect((res5 as LinkedList<number>).length).assertEqual(0);
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${(error as BusinessError).code} message => ${(error as BusinessError).message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
      done();
    });
  });
}
