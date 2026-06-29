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
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium'
import worker, { ErrorEvent, MessageEvents } from '@ohos.worker'
import { ArrayList, HashMap, HashSet, LinkedList, List } from '@kit.ArkTS';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}

interface ContainerPayload {
  arrayList: ArrayList<number>;
  hashMap: HashMap<string, number>;
  hashSet: HashSet<string>;
  list: List<number>;
  linkedList: LinkedList<number>;
}

export default function workerTestContainer() {
  describe('ActsWorkerTestContainer', () => {

    /**
     * @tc.name   testWorkerContainerArrayList001
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0100
     * @tc.desc   test worker serialize ArrayList container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerArrayList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerArrayList001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const arrayList: ArrayList<string> = new ArrayList<string>();
        arrayList.add('a');
        arrayList.add('b');
        arrayList.add('c');
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          const recv: ArrayList<string> = e.data as ArrayList<string>;
          expect(recv.length).assertEqual(3);
          expect(recv[0]).assertEqual('a');
          expect(recv[1]).assertEqual('b');
          expect(recv[2]).assertEqual('c');
        }
        workerInstance.postMessage(arrayList);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerContainerHashMap002
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0200
     * @tc.desc   test worker serialize HashMap container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerHashMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerHashMap002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('one', 1);
        hashMap.set('two', 2);
        hashMap.set('three', 3);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          const recv: HashMap<string, number> = e.data as HashMap<string, number>;
          expect(recv.length).assertEqual(3);
          expect(recv.get('one')).assertEqual(1);
          expect(recv.get('two')).assertEqual(2);
          expect(recv.get('three')).assertEqual(3);
        }
        workerInstance.postMessage(hashMap);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerContainerHashSet003
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0300
     * @tc.desc   test worker serialize HashSet container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerHashSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerHashSet003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const hashSet: HashSet<number> = new HashSet<number>();
        hashSet.add(1);
        hashSet.add(2);
        hashSet.add(3);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          const recv: HashSet<number> = e.data as HashSet<number>;
          expect(recv.length).assertEqual(3);
          expect(recv.has(1)).assertTrue();
          expect(recv.has(2)).assertTrue();
          expect(recv.has(3)).assertTrue();
        }
        workerInstance.postMessage(hashSet);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerContainerList004
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0400
     * @tc.desc   test worker serialize List container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerList004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerList004';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const list: List<string> = new List<string>();
        list.add('x');
        list.add('y');
        list.add('z');
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          const recv: List<string> = e.data as List<string>;
          expect(recv.length).assertEqual(3);
          expect(recv.get(0)).assertEqual('x');
          expect(recv.get(1)).assertEqual('y');
          expect(recv.get(2)).assertEqual('z');
        }
        workerInstance.postMessage(list);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerContainerLinkedList005
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0500
     * @tc.desc   test worker serialize LinkedList container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerLinkedList005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerLinkedList005';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(10);
        linkedList.add(20);
        linkedList.add(30);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          const recv: LinkedList<number> = e.data as LinkedList<number>;
          expect(recv.length).assertEqual(3);
          expect(recv.get(0)).assertEqual(10);
          expect(recv.get(1)).assertEqual(20);
          expect(recv.get(2)).assertEqual(30);
        }
        workerInstance.postMessage(linkedList);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerContainerMixed006
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0600
     * @tc.desc   test worker serialize multiple containers in one message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerMixed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerMixed006';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const arrayList: ArrayList<number> = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        const hashMap: HashMap<string, number> = new HashMap<string, number>();
        hashMap.set('k', 100);
        const hashSet: HashSet<string> = new HashSet<string>();
        hashSet.add('v');
        const list: List<number> = new List<number>();
        list.add(7);
        const linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(9);
        const payload: ContainerPayload = {
          arrayList: arrayList,
          hashMap: hashMap,
          hashSet: hashSet,
          list: list,
          linkedList: linkedList
        };
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage`);
          flag = true;
          const recv: ContainerPayload = e.data as ContainerPayload;
          expect(recv.arrayList.length).assertEqual(2);
          expect(recv.arrayList[0]).assertEqual(1);
          expect(recv.arrayList[1]).assertEqual(2);
          expect(recv.hashMap.length).assertEqual(1);
          expect(recv.hashMap.get('k')).assertEqual(100);
          expect(recv.hashSet.length).assertEqual(1);
          expect(recv.hashSet.has('v')).assertTrue();
          expect(recv.list.length).assertEqual(1);
          expect(recv.list.get(0)).assertEqual(7);
          expect(recv.linkedList.length).assertEqual(1);
          expect(recv.linkedList.get(0)).assertEqual(9);
        }
        workerInstance.postMessage(payload);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerContainerEmpty007
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_Container_0700
     * @tc.desc   test worker serialize empty containers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerContainerEmpty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerContainerEmpty007';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage`);
          flag = true;
          const recv: ContainerPayload = e.data as ContainerPayload;
          expect(recv.arrayList.length).assertEqual(0);
          expect(recv.hashMap.length).assertEqual(0);
          expect(recv.hashSet.length).assertEqual(0);
          expect(recv.list.length).assertEqual(0);
          expect(recv.linkedList.length).assertEqual(0);
        }
        const payload: ContainerPayload = {
          arrayList: new ArrayList<number>(),
          hashMap: new HashMap<string, number>(),
          hashSet: new HashSet<string>(),
          list: new List<number>(),
          linkedList: new LinkedList<number>()
        };
        workerInstance.postMessage(payload);
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}
