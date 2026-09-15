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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0205
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0206
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0207
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0208
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0209
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0210
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0211
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0212
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0213
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0214
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0215
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0216
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0217
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0218
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0219
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0220
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0221
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0222
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0223
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0224
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0225
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0226
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0227
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0228
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0229
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0230
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0231
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
      }).catch(() => { console.error('catch error'); }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0232
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0233
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0234
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0235
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0236
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0237
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0238
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
      }).catch(() => { console.error('catch error'); })

      let task2: taskpool.Task = new taskpool.Task(Sum, 30, 40);
      let result2: number = 0;
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0239
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
      }).catch(() => { console.error('catch error'); })

      let task2: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      let result2: number = 0;
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0240
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0241
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
      }).catch(() => { console.error('catch error'); })
      let task2: taskpool.Task = new taskpool.Task(Multi, 10, 20);
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      let task3: taskpool.Task = new taskpool.Task(Sum, 10, 30);
      taskpool.execute(task3).then((ret3) => {
        result3 = ret3 as number;
        isTerminate3 = true;
      }).catch(() => { console.error('catch error'); })
      let task4: taskpool.Task = new taskpool.Task(Multi, 20, 20);
      taskpool.execute(task4).then((ret4) => {
        result4 = ret4 as number;
        isTerminate4 = true;
      }).catch(() => { console.error('catch error'); })
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0242
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0243
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0244
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0245
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0246
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0247
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0248
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0249
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
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0250
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(Sum, 30, 40).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0251
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(Sum, 10, 20).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0252
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(Multi, 10, 20).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(Sum, 10, 30).then((ret3) => {
        result3 = ret3 as number;
        isTerminate3 = true;
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(Multi, 20, 20).then((ret4) => {
        result4 = ret4 as number;
        isTerminate4 = true;
      }).catch(() => { console.error('catch error'); })
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0253
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
        }).catch(() => { console.error('catch error'); });
      runner.execute(task2).then(() => {
        finalString += 'b';
      }).catch(() => { console.error('catch error'); });
      runner.execute(task3).then(() => {
        finalString += 'c';
      }).catch(() => { console.error('catch error'); });

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
      }).catch(() => { console.error('catch error'); });
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task2).then(() => {
        finalString += "b";
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      }).catch(() => { console.error('catch error'); })
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task2).then(() => {
        finalString += "b";
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      }).catch(() => { console.error('catch error'); })
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
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task2).then(()=>{
        console.info("task2 success");
      }).catch(() => { console.error('catch error'); })
      taskpool.execute(task3).then(()=>{
        console.info("task3 success");
      }).catch(() => { console.error('catch error'); })

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
      }).catch(() => { console.error('catch error'); });
      taskpool.executeDelayed(300, task2).then(() => {
        finalString += 'b';
        isTerminate2 = true;
      }).catch(() => { console.error('catch error'); });
      taskpool.executeDelayed(100, task3).then(() => {
        finalString += 'c';
        isTerminate3 = true;
      }).catch(() => { console.error('catch error'); });
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }

      expect(finalString).assertEqual("cba");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass057
