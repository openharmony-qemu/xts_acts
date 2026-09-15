/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import { taskpool, collections, TreeSet, MessageEvents } from '@kit.ArkTS'
import worker from '@ohos.worker'
import { BusinessError } from '@ohos.base'
import { currentFun, transferArrayBuffer, transferAtomics, setCloneListTest, setTransferListTest,
  testString, testTime, testNumber, testTaskPool, promiseCase, asyncSum,
  printArgsFunc, Sum, delaySum, Add, funcStrCat, arraySum, objectSum, Multi, AdditionDelay, WaitforRunner,
  errorTest, testCancelDelayed, dependend, hashMapTest, delay, randomTest, outerTaskFunc,
  isConcurrentTest1, isConcurrentTest2, sequenceRunnerTest, sequenceRunnerPriorityTest, CancelAndExecuteDelayed,
  errorManageTest, dealHashMapTest, noUseConcurrentTest, sendDataTest, sendableClassTestFunc, Int8ArrayTestFunc,
  SetTestFunc, MapTestFunc, simpleSendableClassTestFunc, Uint8ClampedArrayTestFunc, testWithThreeParams, testWithArray,
  sendableFuncTest, sendableClassTest, promiseTest, measureTest, loop, returnError, longString, sendableClassArrFunc,
  promiseNumber, TreeSetTestFunc, getCreateTaskId, taskSendManyFunc, taskErrFunc } from './testFunclist'
import { A, B, StrCat, printArgs, printStrArgs, fun, cancelById, getLongString, getTaskResult } from './exportFunclist'
import { SendableClass, SimpleSendable, sendableFunc, SendableClassTest, TaskInfoClass } from './sendable';
import HashMap from '@ohos.util.HashMap';

export default function TaskPoolTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   TaskPoolTestClass001
     * @tc.number TaskPoolTestClass001
     * @tc.desc   Test Simultaneous use taskpool and worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ss: worker.ThreadWorker = new worker.ThreadWorker("../workers/worker.ts")
      let res:number = 0
      let flag:boolean = false
      ss.onexit = () => {
        flag = true
        res++
      }
      testTaskPool();
      ss.terminate();
      while (!flag) {
        await promiseCase()
      }
      expect(res).assertEqual(1)
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass002
     * @tc.number TaskPoolTestClass002
     * @tc.desc   TaskPoolTestClass002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = await taskpool.execute(Sum, 10, 20);
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass003
     * @tc.number TaskPoolTestClass003
     * @tc.desc   TaskPoolTestClass003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result:boolean = await taskpool.execute(Add, true, true) as boolean;
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass004
     * @tc.number TaskPoolTestClass004
     * @tc.desc   TaskPoolTestClass004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass005
     * @tc.number TaskPoolTestClass005
     * @tc.desc   TaskPoolTestClass005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
      result = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass006
     * @tc.number TaskPoolTestClass006
     * @tc.desc   TaskPoolTestClass006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: string = await taskpool.execute(funcStrCat, "abc", "def", "hello") as string;
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass007
     * @tc.number TaskPoolTestClass007
     * @tc.desc   TaskPoolTestClass007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = await taskpool.execute(arraySum, [1,2], [3,4]) as Array<number>;
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass008
     * @tc.number TaskPoolTestClass008
     * @tc.desc   TaskPoolTestClass008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let result: A = await taskpool.execute(objectSum, aa, bb) as A;
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass009
     * @tc.number TaskPoolTestClass009
     * @tc.desc   TaskPoolTestClass009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = await taskpool.execute(Sum, 10) as number;
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass010
     * @tc.number TaskPoolTestClass010
     * @tc.desc   TaskPoolTestClass010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = await taskpool.execute(Sum, 10, 20, 30) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass011
     * @tc.number TaskPoolTestClass011
     * @tc.desc   TaskPoolTestClass011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Sum, 30, 40) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass012
     * @tc.number TaskPoolTestClass012
     * @tc.desc   TaskPoolTestClass012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Sum, 10, 20) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass013
     * @tc.number TaskPoolTestClass013
     * @tc.desc   TaskPoolTestClass013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Multi, 10, 20) as number;
      let result3: number = await taskpool.execute(Sum, 10, 30) as number;
      let result4: number = await taskpool.execute(Multi, 20, 20) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass014
     * @tc.number TaskPoolTestClass014
     * @tc.desc   TaskPoolTestClass014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass015
     * @tc.number TaskPoolTestClass015
     * @tc.desc   TaskPoolTestClass015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Add, true, true);
      let result: boolean = await taskpool.execute(task)  as boolean;
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass016
     * @tc.number TaskPoolTestClass016
     * @tc.desc   TaskPoolTestClass016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def");
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass017
     * @tc.number TaskPoolTestClass017
     * @tc.desc   TaskPoolTestClass017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass018
     * @tc.number TaskPoolTestClass018
     * @tc.desc   TaskPoolTestClass018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(arraySum, [1,2], [3,4]);
      let result: Array<number> = await taskpool.execute(task) as Array<number>;
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass019
     * @tc.number TaskPoolTestClass019
     * @tc.desc   TaskPoolTestClass019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
      let result: A = await taskpool.execute(task) as A;
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass020
     * @tc.number TaskPoolTestClass020
     * @tc.desc   TaskPoolTestClass020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10);
      let result: number = await taskpool.execute(task) as number;
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass021
     * @tc.number TaskPoolTestClass021
     * @tc.desc   TaskPoolTestClass021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20, 30);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass022
     * @tc.number TaskPoolTestClass022
     * @tc.desc   TaskPoolTestClass022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task) as number;
      let result2: number = await taskpool.execute(task) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass023
     * @tc.number TaskPoolTestClass023
     * @tc.desc   TaskPoolTestClass023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let task2: taskpool.Task = new taskpool.Task(Sum, 30, 40);
      let result1: number = await taskpool.execute(task1) as number;
      let result2: number = await taskpool.execute(task2) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass024
     * @tc.number TaskPoolTestClass024
     * @tc.desc   TaskPoolTestClass024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let task2: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task1) as number;
      let result2: number = await taskpool.execute(task2) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass025
     * @tc.number TaskPoolTestClass025
     * @tc.desc   TaskPoolTestClass025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task1) as number;
      let task2: taskpool.Task = new taskpool.Task(Multi, 10, 20);
      let result2: number = await taskpool.execute(task2) as number;
      let task3: taskpool.Task = new taskpool.Task(Sum, 10, 30);
      let result3: number = await taskpool.execute(task3) as number;
      let task4: taskpool.Task = new taskpool.Task(Multi, 20, 20);
      let result4: number = await taskpool.execute(task4) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass026
     * @tc.number TaskPoolTestClass026
     * @tc.desc   TaskPoolTestClass026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass027
     * @tc.number TaskPoolTestClass027
     * @tc.desc   TaskPoolTestClass027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Add, true, true)
      let result: boolean = false;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as boolean;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass028
     * @tc.number TaskPoolTestClass028
     * @tc.desc   TaskPoolTestClass028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def")
      let result: string = '';
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass029
     * @tc.number TaskPoolTestClass029
     * @tc.desc   TaskPoolTestClass029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
      let result: string = '';
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass030
     * @tc.number TaskPoolTestClass030
     * @tc.desc   TaskPoolTestClass030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(arraySum, [1,2], [3,4]);
      let isTerminate: boolean = false;
      let result: Array<number> = [];
      taskpool.execute(task).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass031
     * @tc.number TaskPoolTestClass031
     * @tc.desc   TaskPoolTestClass031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
      let result: A = aa;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as A;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass032
     * @tc.number TaskPoolTestClass032
     * @tc.desc   TaskPoolTestClass032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10);
      let result: number = 0;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass033
     * @tc.number TaskPoolTestClass033
     * @tc.desc   TaskPoolTestClass033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20, 30);
      let result: number = 0;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass034
     * @tc.number TaskPoolTestClass034
     * @tc.desc   TaskPoolTestClass034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = 0;
      taskpool.execute(task1).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })

      let task2: taskpool.Task = new taskpool.Task(Sum, 30, 40);
      let result2: number = 0;
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass035
     * @tc.number TaskPoolTestClass035
     * @tc.desc   TaskPoolTestClass035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task1).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })

      let task2: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      let result2: number = 0;
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass036
     * @tc.number TaskPoolTestClass036
     * @tc.desc   TaskPoolTestClass036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(task).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass037
     * @tc.number TaskPoolTestClass037
     * @tc.desc   TaskPoolTestClass037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let isTerminate4: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      let result3: number = 0;
      let result4: number = 0;

      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      taskpool.execute(task1).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      let task2: taskpool.Task = new taskpool.Task(Multi, 10, 20);
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      let task3: taskpool.Task = new taskpool.Task(Sum, 10, 30);
      taskpool.execute(task3).then((ret3) => {
        result3 = ret3 as number;
        isTerminate3 = true;
      })
      let task4: taskpool.Task = new taskpool.Task(Multi, 20, 20);
      taskpool.execute(task4).then((ret4) => {
        result4 = ret4 as number;
        isTerminate4 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
        await promiseCase()
      }

      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass038
     * @tc.number TaskPoolTestClass038
     * @tc.desc   TaskPoolTestClass038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      taskpool.execute(Sum, 10, 20).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass039
     * @tc.number TaskPoolTestClass039
     * @tc.desc   TaskPoolTestClass039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: boolean = false;
      taskpool.execute(Add, true, true).then((ret) => {
        result = ret as boolean;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass040
     * @tc.number TaskPoolTestClass040
     * @tc.desc   TaskPoolTestClass040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: string = '';
      taskpool.execute(StrCat, "abc", "def").then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass041
     * @tc.number TaskPoolTestClass041
     * @tc.desc   TaskPoolTestClass041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: string = '';
      taskpool.execute(funcStrCat, "abc", "def", "hello").then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass042
     * @tc.number TaskPoolTestClass042
     * @tc.desc   TaskPoolTestClass042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: Array<number> = [];
      taskpool.execute(arraySum, [1,2], [3,4]).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass043
     * @tc.number TaskPoolTestClass043
     * @tc.desc   TaskPoolTestClass043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let isTerminate: boolean = false;
      let result: A = aa;
      taskpool.execute(objectSum, aa, bb).then((ret) => {
        result = ret as A;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass044
     * @tc.number TaskPoolTestClass044
     * @tc.desc   TaskPoolTestClass044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      taskpool.execute(Sum, 10).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass045
     * @tc.number TaskPoolTestClass045
     * @tc.desc   TaskPoolTestClass045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      taskpool.execute(Sum, 10, 20, 30).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass046
     * @tc.number TaskPoolTestClass046
     * @tc.desc   TaskPoolTestClass046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      taskpool.execute(Sum, 10, 20).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(Sum, 30, 40).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass047
     * @tc.number TaskPoolTestClass047
     * @tc.desc   TaskPoolTestClass047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      taskpool.execute(Sum, 10, 20).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(Sum, 10, 20).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass048
     * @tc.number TaskPoolTestClass048
     * @tc.desc   TaskPoolTestClass048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let isTerminate4: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      let result3: number = 0;
      let result4: number = 0;

      taskpool.execute(Sum, 10, 20).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(Multi, 10, 20).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      taskpool.execute(Sum, 10, 30).then((ret3) => {
        result3 = ret3 as number;
        isTerminate3 = true;
      })
      taskpool.execute(Multi, 20, 20).then((ret4) => {
        result4 = ret4 as number;
        isTerminate4 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
        await promiseCase()
      }

      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass049
     * @tc.number TaskPoolTestClass049
     * @tc.desc   TaskPoolTestClass049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await taskpool.execute(Sum) as number;
      } catch(e) {
        expect().assertEqual("BusinessError: taskpool:: first param must be object when argc is one");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0050
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        finalString += 'a';
      });
      runner.execute(task2).then(() => {
        finalString += 'b';
      });
      runner.execute(task3).then(() => {
        finalString += 'c';
      });

      await runner.execute(task4);
      expect(finalString).assertEqual("abc");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0051
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
      task1.addDependency(task2);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        runner.execute(task1).then(() => {
          finalString += 'a';
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0052
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;

      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 300)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 500)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1).then(() => {
        finalString += "a";
        isTerminate1 = true;
      })
      taskpool.execute(task2).then(() => {
        finalString += "b";
        isTerminate2 = true;
      })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }
      expect(finalString).assertEqual("cba");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0053
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;

      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 300)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 500)
      task1.addDependency(task2);
      task2.addDependency(task3);
      task1.removeDependency(task2);
      task2.removeDependency(task3);
      taskpool.execute(task1).then(() => {
        finalString += "a";
        isTerminate1 = true;
      })
      taskpool.execute(task2).then(() => {
        finalString += "b";
        isTerminate2 = true;
      })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }
      expect(finalString.charAt(2)).assertEqual("c");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0054
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 300)
      let task4: taskpool.Task = new taskpool.Task(delaySum, 20, 20, 100)
      let task5: taskpool.Task = new taskpool.Task(delaySum, 40, 40, 200)
      let task6: taskpool.Task = new taskpool.Task(delaySum, 60, 60, 300)

      try {
        task1.addDependency(task2);
        task2.addDependency(task3);
        task3.addDependency(task4);
        task4.addDependency(task5);
        task5.addDependency(task6);
        task6.addDependency(task1);
        task1.addDependency(task3);
        task1.addDependency(task5);
        task3.addDependency(task6);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: There is a circular dependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0055
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 300)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1).then(()=>{
        console.info("task1 success");
      })
      taskpool.execute(task2).then(()=>{
        console.info("task2 success");
      })
      taskpool.execute(task3).then(()=>{
        console.info("task3 success");
      })

      try {
        task2.removeDependency(task3);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The dependency does not exist, taskpool:: executedTask cannot removeDependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0056
     * @tc.desc   executeDelayed for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(WaitforRunner, "a");
      let task2: taskpool.Task = new taskpool.Task(WaitforRunner, "b");
      let task3: taskpool.Task = new taskpool.Task(WaitforRunner, "c");

      taskpool.executeDelayed(500, task1).then(() => {
        finalString += 'a';
        isTerminate1 = true;
      });
      taskpool.executeDelayed(300, task2).then(() => {
        finalString += 'b';
        isTerminate2 = true;
      });
      taskpool.executeDelayed(100, task3).then(() => {
        finalString += 'c';
        isTerminate3 = true;
      });
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }

      expect(finalString).assertEqual("cba");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0057
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let totalDuration: number = 0;
      let cpuDuration: number = 0;
      let ioDuration: number = 0;

      let task: taskpool.Task = new taskpool.Task(testString, "hello");
      await taskpool.execute(task);
      totalDuration = task.totalDuration;
      cpuDuration = task.cpuDuration;
      ioDuration = task.ioDuration;
      expect(totalDuration != 0).assertTrue();
      expect(cpuDuration != -1).assertTrue();
      expect(ioDuration != 0).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0058
     * @tc.desc   concurrentFunc for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = await taskpool.execute(printArgsFunc, Sum, 10, 20) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass059
     * @tc.number TaskPoolTestClass059
     * @tc.desc   Execute priority tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let allCount = 100; // 100: test number
      let taskArray: Array<taskpool.Task> = [];
      let begin: number = Date.now();
      let highTime: number = 0;
      let mediumTime: number = 0;
      let lowTime: number = 0;

      for (let i: number = 0; i < allCount; i++) {
        let task1: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task1);
        let task2: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task2);
        let task3: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task3);
      }

      for (let i: number = 0; i < allCount; i+=3) {
        let res1: number = await taskpool.execute(taskArray[i], taskpool.Priority.HIGH) as number;
        lowTime += (res1 - begin);
        let res2: number = await taskpool.execute(taskArray[i + 1], taskpool.Priority.LOW) as number;
        mediumTime += (res2 - begin);
        let res3: number = await taskpool.execute(taskArray[i + 2], taskpool.Priority.MEDIUM) as number;
        highTime += (res3 - begin);
      }

      expect(lowTime > mediumTime && mediumTime > highTime);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass060
     * @tc.number TaskPoolTestClass060
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = await taskpool.execute(asyncSum, 10, 20) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass061
     * @tc.number TaskPoolTestClass061
     * @tc.desc   Execute async function task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(testNumber, 10, 20);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass062
     * @tc.number TaskPoolTestClass062
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = [];
      let isTerminate: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs, 10);
      taskGroup.addTask(printArgs, 20);
      taskGroup.addTask(printArgs, 30);
      taskpool.execute(taskGroup).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass063
     * @tc.number TaskPoolTestClass063
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = [];
      let isTerminate: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      taskpool.execute(taskGroup).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass064
     * @tc.number TaskPoolTestClass064
     * @tc.desc   Set transfer list for the task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint8Array = new Uint8Array(buffer);
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let view1: Uint8Array = new Uint8Array(buffer1);

      let task: taskpool.Task = new taskpool.Task(setTransferListTest, view, view1);
      task.setTransferList([view.buffer, view1.buffer]);
      taskpool.execute(task).then((ret)=>{
        result = ret as number;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(24);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass065
     * @tc.number TaskPoolTestClass065
     * @tc.desc   Get the taskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let highCount: number = 0;
      let mediumCount: number = 0;
      let lowCount: number = 0;
      let allCount: number = 100;
      for (let i: number = 0; i < allCount; i++) {
        let task1: taskpool.Task = new taskpool.Task(currentFun);
        let task2: taskpool.Task = new taskpool.Task(currentFun);
        let task3: taskpool.Task = new taskpool.Task(currentFun);
        taskpool.execute(task1, taskpool.Priority.LOW).then(() => {
          lowCount++;
        }).catch((e: BusinessError) => {
          console.error("low task error: " + e);
        })
        taskpool.execute(task2, taskpool.Priority.MEDIUM).then(() => {
          mediumCount++;
        }).catch((e: BusinessError) => {
          console.error("medium task error: " + e);
        })
        taskpool.execute(task3, taskpool.Priority.HIGH).then(() => {
          highCount++;
        }).catch((e: BusinessError) => {
          console.error("high task error: " + e);
        })
      }

      let start: number = new Date().getTime();
      while (new Date().getTime() - start < 1000) {
        continue;
      }

      let taskpoolInfo = taskpool.getTaskPoolInfo();
      let tid: number = 0;
      let taskIds: Array<number> = [];
      let priority: number = 0;
      let taskId: number = 0;
      let state: number = 0;
      let duration: number = 0;

      for (let threadInfo of taskpoolInfo.threadInfos) {
        tid += threadInfo.tid;
        if(threadInfo.taskIds != undefined) {
          taskIds.length += threadInfo.taskIds.length;
        }
        if(threadInfo.priority != undefined) {
          priority += threadInfo.priority;
        }
      }

      for (let taskInfo of taskpoolInfo.taskInfos) {
        taskId += Number(taskInfo.taskId);
        state += taskInfo.state;
        if(taskInfo.duration != undefined) {
          duration += taskInfo.duration;
        }
      }
      console.info("task duration is: " + duration);
      expect(tid != 0).assertTrue();
      expect(taskIds.length != -1).assertTrue();
      expect(priority != -1).assertTrue();
      expect(taskId != 0).assertTrue();
      expect(state != 0).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass066
     * @tc.number TaskPoolTestClass066
     * @tc.desc   exeute task at taskpool thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let outerTask1 = new taskpool.Task(outerTaskFunc, "001")
      let res1: string = await taskpool.execute(outerTask1) as string;
      expect(res1).assertEqual("outerTaskRes-001");

      let outerTask2 = new taskpool.Task(outerTaskFunc, "002")
      let res2: string = await taskpool.execute(outerTask2) as string;
      expect(res2).assertEqual("outerTaskRes-002");

      let res3: string = await taskpool.execute(outerTaskFunc, "001") as string;
      expect(res3).assertEqual("outerTaskRes-001");

      let res4: string = await taskpool.execute(outerTaskFunc, "002") as string;
      expect(res4).assertEqual("outerTaskRes-002");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass067
     * @tc.number TaskPoolTestClass067
     * @tc.desc   transfer SharedArrayBuffer with taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let sab: SharedArrayBuffer = new SharedArrayBuffer(20);
      let int32 = new Uint32Array(sab);
      let task: taskpool.Task = new taskpool.Task(transferArrayBuffer, int32);
      await taskpool.execute(task).then(()=> {
        let result = int32[0] + int32[1] + int32[2] + int32[3];
        expect(result).assertEqual(1000);
      });
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass068
     * @tc.number TaskPoolTestClass068
     * @tc.desc   transfer SharedArrayBuffer and Atomics with taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let sab: SharedArrayBuffer = new SharedArrayBuffer(20);
      let int32 = new Int32Array(sab);

      let task: taskpool.Task = new taskpool.Task(transferAtomics, int32);
      taskpool.execute(task).then((res) => {
        expect(res).assertEqual("ok");
      });

      let t = Date.now()
      while ((Date.now() - t) < 1000) {
        continue;
      }
      Atomics.notify(int32, 0, 1);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0069
     * @tc.desc   sendData and onReceiveData for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 1, 3);
      task.onReceiveData(printArgs);
      taskpool.execute(task)
      try {
        taskpool.Task.sendData(4);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The function is not called in the TaskPool thread");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0070
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let taskname: string = "taskName";
      let task: taskpool.Task = new taskpool.Task(taskname, Sum, 10, 20);
      let name: string = task.name;
      expect(name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0071
     * @tc.desc   add name of taskGroup for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let taskGroupName: string = "groupName";
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
      taskGroup.addTask(printArgs, 10);
      taskGroup.addTask(printArgs, 20);
      taskGroup.addTask(printArgs, 30);

      taskpool.execute(taskGroup).then((res) => {
        expect(res[0]).assertEqual(10);
        expect(res[1]).assertEqual(20);
        expect(res[2]).assertEqual(30);
      });
      let name: string = taskGroup.name;
      expect(name).assertEqual("groupName");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass072
     * @tc.number TaskPoolTestClass072
     * @tc.desc   Cancel tasks that have not been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 1, 1, 1000);
      let task2: taskpool.Task = new taskpool.Task(delaySum, 2, 2, 1000);
      let task3: taskpool.Task = new taskpool.Task(delaySum, 3, 3, 1000);
      let task4: taskpool.Task = new taskpool.Task(delaySum, 4, 4, 1000);

      taskpool.execute(task1);
      taskpool.execute(task2);
      taskpool.execute(task3);
      taskpool.execute(task4);

      let t = Date.now()
      while ((Date.now() - t) < 500) {
        continue;
      }
      taskpool.cancel(task4);;
      expect(taskpool.Task.isCanceled() == false).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass073
     * @tc.number TaskPoolTestClass073
     * @tc.desc   Cancel the task in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 400);
        let task5: taskpool.Task = new taskpool.Task(printArgs, 500);
        let task6: taskpool.Task = new taskpool.Task(printArgs, 600);
        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        taskpool.execute(task4);
        taskpool.execute(task5);
        taskpool.execute(task6);

        taskpool.execute(task1);
        taskpool.cancel(task1);
      } catch(e) {
        expect(e).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      expect(taskpool.Task.isCanceled() == false);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass074
     * @tc.number TaskPoolTestClass074
     * @tc.desc   Cancel the executed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);
        await taskpool.execute(task3);

        taskpool.cancel(task1);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass075
     * @tc.number TaskPoolTestClass075
     * @tc.desc   Cancel nonexistent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);

        taskpool.cancel(task3);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass076
     * @tc.number TaskPoolTestClass076
     * @tc.desc   Canceling unexecuted tasks multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);
        await taskpool.execute(task3);

        taskpool.cancel(task3);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass077
     * @tc.number TaskPoolTestClass077
     * @tc.desc   Cancel all tasks in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 400);
        let task5: taskpool.Task = new taskpool.Task(printArgs, 500);
        let task6: taskpool.Task = new taskpool.Task(printArgs, 600);

        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        taskpool.execute(task4);
        taskpool.execute(task5);
        taskpool.execute(task6);

        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 100) {
          continue;
        }

        taskpool.cancel(task6);
        taskpool.cancel(task5);
        taskpool.cancel(task4);
        taskpool.cancel(task3);
        taskpool.cancel(task2);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass078
     * @tc.number TaskPoolTestClass078
     * @tc.desc   Cancel the taskGroup in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let i: number = 10;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(AdditionDelay, 10);
      taskGroup1.addTask(AdditionDelay, 20);
      taskGroup1.addTask(AdditionDelay, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);
      taskpool.execute(taskGroup1).then(() => {
        ++i;
      });
      taskpool.execute(taskGroup2);

      taskpool.cancel(taskGroup1);
      expect(i).assertEqual(10)
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass079
     * @tc.number TaskPoolTestClass079
     * @tc.desc   Cancel the taskGroup that have not been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let i: number = 10;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(AdditionDelay, 10);
      taskGroup1.addTask(AdditionDelay, 20);
      taskGroup1.addTask(AdditionDelay, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);
      taskpool.execute(taskGroup1);
      taskpool.execute(taskGroup2).then(() => {
        ++i;
      });

      taskpool.cancel(taskGroup2);
      expect(i).assertEqual(10)
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass080
     * @tc.number TaskPoolTestClass080
     * @tc.desc   Cancel the non-existent taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskpool.cancel(taskGroup);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task group to cancel does not exist, taskpool:: taskGroup is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass081
     * @tc.number TaskPoolTestClass081
     * @tc.desc   Cancel the executed taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate: boolean = false;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(printArgs, 10);
      taskGroup1.addTask(printArgs, 20);
      taskGroup1.addTask(printArgs, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);

      taskpool.execute(taskGroup1).then(() => {
        isTerminate = true;
      });;
      taskpool.execute(taskGroup2);

      while(!isTerminate) {
        await promiseCase();
      }

      try {
        taskpool.cancel(taskGroup1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task group to cancel does not exist, taskpool:: taskGroup is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0082
     * @tc.desc   add setclonelist of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let arr: Array<number> = [1, 2, 3, 4];
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
      let arrayInt: Int32Array = new Int32Array(arrayBuffer);
      for (let i: number = 0; i < arr.length; i++) {
        arrayInt[i] = arr[i];
      }
      let task: taskpool.Task = new taskpool.Task(setCloneListTest, arrayInt);
      task.setCloneList([arrayBuffer]);
      await taskpool.execute(task).then(() => {
        expect(arrayInt[0]).assertEqual(1);
      })
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0083
     * @tc.desc   taskGroup cannot add groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup2.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add groupTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0084
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0085
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0086
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0087
     * @tc.desc   dependent task not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        task1.addDependency(task2);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0088
     * @tc.desc   taskgroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskpool.execute(taskGroup).then((res) => {
          expect(res[0]).assertEqual(100);
        });
        taskGroup.addTask(task2);
        taskpool.execute(taskGroup).then((res) => {
          expect(res[1]).assertEqual(200);
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: executed taskGroup cannot addTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0089
     * @tc.desc   SequenceRunner cannot execute groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute groupTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0090
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0091
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0092
     * @tc.desc   dependent task not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        task1.addDependency(task2);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0093
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner1.execute(task).then(() => {
        });
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner2.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0094
     * @tc.desc   groupTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task.addDependency(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0095
     * @tc.desc   groupTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task1.addDependency(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0096
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task2);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0097
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task2);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0098
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task1);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0099
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100,task1);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0100
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task2).then(() => {
        });
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0101
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0102
     * @tc.desc   groupTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task1.addDependency(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0103
     * @tc.desc   groupTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task.addDependency(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0104
     * @tc.desc   seqRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
        taskpool.execute(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot execute outside");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0105
     * @tc.desc   groupTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        taskpool.execute(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot execute outside");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0106
     * @tc.desc   seqRunnerTask cannot executeDelayed outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
        taskpool.executeDelayed(100, task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot executeDelayed outside");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0107
     * @tc.desc   groupTask cannot executeDelayed outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        taskpool.executeDelayed(100, task)
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot executeDelayed outside");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0108
     * @tc.desc   cancel the executeDelay task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = 0;
      let task: taskpool.Task = new taskpool.Task(printArgs, 100);
      taskpool.executeDelayed(1000, task).then((ret)=>{
        result = ret as number;
      })
      let t = Date.now()
      while ((Date.now() - t) < 500) {
        continue;
      }
      taskpool.cancel(task)
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0109
     * @tc.desc   executedTask with dependency cannot executeDelayed again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      task1.addDependency(task2);
      taskpool.execute(task1).then(()=>{
      })
      taskpool.execute(task2).then(()=>{
      })
      try {
        taskpool.execute(task1)
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: executedTask with dependency cannot execute again");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0110
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20);
      try {
        task.name = "taskName1";
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("TypeError: Cannot set property when setter is undefined");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0111
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20);
      expect(task.name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0112
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let name: string = task.name;
      expect(name).assertEqual("Sum");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0113
     * @tc.desc   get name from taskInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task).then(()=>{
        console.info("task1 success");
      })
      let start: number = new Date().getTime();
      while (new Date().getTime() - start < 500) {
        continue;
      }
      let taskpoolInfo = taskpool.getTaskPoolInfo();
      let name = "";
      for (let taskInfo of taskpoolInfo.taskInfos) {
        name = taskInfo.name;
      }
      expect(name != "").assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0114
     * @tc.desc   get name from taskInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20)
      taskpool.execute(task).then(()=>{
        console.info("task1 success");
      })
      let start: number = new Date().getTime();
      while (new Date().getTime() - start < 500) {
        continue;
      }
      let taskpoolInfo = taskpool.getTaskPoolInfo();
      let name = "";
      for (let taskInfo of taskpoolInfo.taskInfos) {
        name = taskInfo.name;
      }
      expect(name != "").assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0115
     * @tc.desc   Register a callback of onEnqueued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs, 1);
      let onEnqueuedStr = "";
      task.onEnqueued(()=>{
        onEnqueuedStr = "onEnqueued";
      })

      let onStartExecutionStr = "";
      task.onStartExecution(()=>{
        onStartExecutionStr = "onStartExecution";
      })

      let onExecutionSucceededStr = "";
      task.onExecutionSucceeded(()=>{
        onExecutionSucceededStr = "onExecutionSucceeded";
      })

      taskpool.execute(task).then(()=> {
        isTerminate1 = true;
      });
      while (!isTerminate1) {
        await promiseCase()
      }
      expect(onEnqueuedStr).assertEqual("onEnqueued");
      expect(onStartExecutionStr).assertEqual("onStartExecution");
      expect(onExecutionSucceededStr).assertEqual("onExecutionSucceeded");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0116
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(testCancelDelayed);
      let task2: taskpool.Task = new taskpool.Task(testCancelDelayed);
      try {
        taskpool.cancel(task1);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }

      taskpool.execute(task2).then(()=>{
      }).catch((e:BusinessError)=>{
        isTerminate1 = true;
        expect((e as BusinessError).toString()).assertEqual("BusinessError: taskpool:: task has been canceled");
      })
      taskpool.cancel(task2);
      while (!isTerminate1) {
        await promiseCase()
      }

      taskpool.execute(task2).then(()=>{
        isTerminate2 = true;
      })
      while (!isTerminate2) {
        await promiseCase()
      }
      try {
        taskpool.cancel(task2);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0117
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs)
      taskpool.executeDelayed(1000, task).then(()=>{
      }).catch((e:BusinessError)=>{
        isTerminate1 = true;
        expect((e as BusinessError).toString()).assertEqual("BusinessError: taskpool:: task has been canceled");
      })
      taskpool.cancel(task);
