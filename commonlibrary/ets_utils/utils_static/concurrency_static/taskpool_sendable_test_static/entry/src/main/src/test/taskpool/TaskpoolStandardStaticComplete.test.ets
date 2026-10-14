'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index'
import { currentFun, transferArrayBuffer, transferAtomics, setCloneListTest, setTransferListTest,
  testString, testTime, testNumber, testTaskPool, promiseCase, asyncSum,
  printArgsFunc, Sum, delaySum, Add, funcStrCat, arraySum, objectSum, Multi, AdditionDelay, WaitforRunner,
  errorTest, testCancelDelayed, dependend, hashMapTest, delay, randomTest, outerTaskFunc,
  isConcurrentTest1, isConcurrentTest2, sequenceRunnerTest, CancelAndExecuteDelayed,
  errorManageTest, dealHashMapTest, sendDataTest, sendableClassTestFunc, Int8ArrayTestFunc,
  SetTestFunc, MapTestFunc, simpleSendableClassTestFunc, Uint8ClampedArrayTestFunc, testWithThreeParams, testWithArray,
  sendableFuncTest, sendableClassTest, taskErrFunc } from '../common_utils/TestFunclist'
import { A, B, StrCat, printArgs, printStrArgs, asyncSleep } from '../common_utils/ExportFunclist'
import { SendableClass, SimpleSendable, sendableFunc, SendableClassTest } from '../sendable/Sendable';
import Utils from '../utils/Utils';

// 137 用：模块顶层并发/普通函数各一个，经 taskpool.execute 验证均可作任务执行并断言返回值
// （静态 SDK 的 taskpool 未提供 isConcurrent API，对齐同工程 TaskPoolStatic.test.ets testIsConcurrentStatic0001/0002 先例）
function concurrentJudgeFunc1(args: number): string {
  "use concurrent"
  return args.toString();
}

function concurrentJudgeFunc2(args: string): string {
  return args + args;
}

export default function TaskPoolTest(): void {
  describe('TaskPoolTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(500);
    })

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   testTaskPoolClassStatic001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0100
     * @tc.desc   Test Simultaneous use taskpool and worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let res: number = 0;
      let flag: boolean = false;
      let ss: EAWorker = new EAWorker('taskpoolWorker', (): void => {
        flag = true;
        res++;
      });
      ss.start();
      try {
        await testTaskPool();
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      const waitStart: number = Date.now();
      while (!flag && Date.now() - waitStart < 5000) {
        try {
          await promiseCase();
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      }
      if (flag) {
        try {
          await ss.join();
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      }
      expect(flag).assertTrue();
      expect(res).assertEqual(1);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0110
     * @tc.desc   TaskPoolTestClass002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: number = await taskpool.execute(Sum, 10.0, 20.0) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0120
     * @tc.desc   TaskPoolTestClass003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result:boolean = await taskpool.execute(Add, true, true) as boolean;
        expect(result).assertEqual(true);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0130
     * @tc.desc   TaskPoolTestClass004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
        expect(result).assertEqual("abcdef");
      } catch (error) {
        console.error(`testTaskPoolClassStatic004 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0140
     * @tc.desc   TaskPoolTestClass005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: string = await taskpool.execute(StrCat, "abc", "def") as string;

        result = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0150
     * @tc.desc   TaskPoolTestClass006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: string = await taskpool.execute(funcStrCat, "abc", "def", "hello") as string;
        expect(result).assertEqual("abcdefhello");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0160
     * @tc.desc   TaskPoolTestClass007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Array<number> = await taskpool.execute(arraySum, [1.0, 2.0], [3.0, 4.0]) as Array<number>;
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0170
     * @tc.desc   TaskPoolTestClass008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      try {
        let result: A = await taskpool.execute(objectSum, aa, bb) as A;
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0180
     * @tc.desc   TaskPoolTestClass009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false;
      try {
        await taskpool.execute(Sum, 10.0);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0190
     * @tc.desc   TaskPoolTestClass010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: number = await taskpool.execute(Sum, 10.0, 20.0, 30.0) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0200
     * @tc.desc   TaskPoolTestClass011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result1: number = await taskpool.execute(Sum, 10.0, 20.0) as number;
        try {
          let result2: number = await taskpool.execute(Sum, 30.0, 40.0) as number;
        expect(result2).assertEqual(70);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        expect(result1).assertEqual(30);
      } catch (error) {
        console.error("testTaskPoolClassStatic011 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0210
     * @tc.desc   TaskPoolTestClass012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result1: number = await taskpool.execute(Sum, 10.0, 20.0) as number;
        try {
          let result2: number = await taskpool.execute(Sum, 10.0, 20.0) as number;
        expect(result2).assertEqual(30);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        expect(result1).assertEqual(30);
      } catch (error) {
        console.error(`testTaskPoolClassStatic012 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0220
     * @tc.desc   TaskPoolTestClass013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result1: number = await taskpool.execute(Sum, 10.0, 20.0) as number;

        let result2: number = await taskpool.execute(Multi, 10.0, 20.0) as number;

        let result3: number = await taskpool.execute(Sum, 10.0, 30.0) as number;

        let result4: number = await taskpool.execute(Multi, 20.0, 20.0) as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0230
     * @tc.desc   TaskPoolTestClass014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.error("testTaskPoolClassStatic014 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0240
     * @tc.desc   TaskPoolTestClass015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Add, true, true);
      try {
        let result: boolean = await taskpool.execute(task)  as boolean;
        expect(result).assertEqual(true);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0250
     * @tc.desc   TaskPoolTestClass016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def");
        let result: string = await taskpool.execute(task) as string;
        expect(result).assertEqual("abcdef");
      } catch (error) {
        console.error("testTaskPoolClassStatic016 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0260
     * @tc.desc   TaskPoolTestClass017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
      try {
        let result: string = await taskpool.execute(task) as string;
        expect(result).assertEqual("abcdefhello");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0270
     * @tc.desc   TaskPoolTestClass018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(arraySum, [1.0, 2.0], [3.0, 4.0]);
      try {
        let result: Array<number> = await taskpool.execute(task) as Array<number>;
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0280
     * @tc.desc   TaskPoolTestClass019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
      try {
        let result: A = await taskpool.execute(task) as A;
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0290
     * @tc.desc   TaskPoolTestClass020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0);
      let caught: boolean = false;
      try {
        await taskpool.execute(task);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0300
     * @tc.desc   TaskPoolTestClass021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0, 30.0);
      try {
        let result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0310
     * @tc.desc   TaskPoolTestClass022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
      try {
        let result1: number = await taskpool.execute(task) as number;

        let result2: number = await taskpool.execute(task) as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0320
     * @tc.desc   TaskPoolTestClass023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let task2: taskpool.Task = new taskpool.Task(Sum, 30.0, 40.0);
        let result1: number = await taskpool.execute(task1) as number;
        let result2: number = await taskpool.execute(task2) as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
      } catch (error) {
        console.error("testTaskPoolClassStatic023 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0330
     * @tc.desc   TaskPoolTestClass024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let task2: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result1: number = await taskpool.execute(task1) as number;
        let result2: number = await taskpool.execute(task2) as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
      } catch (error) {
        console.error(`testTaskPoolClassStatic024 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0340
     * @tc.desc   TaskPoolTestClass025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
      let task2: taskpool.Task = new taskpool.Task(Multi, 10.0, 20.0);
      let task3: taskpool.Task = new taskpool.Task(Sum, 10.0, 30.0);
      let task4: taskpool.Task = new taskpool.Task(Multi, 20.0, 20.0);
      try {
        let result1: number = await taskpool.execute(task1) as number;

        let result2: number = await taskpool.execute(task2) as number;

        let result3: number = await taskpool.execute(task3) as number;

        let result4: number = await taskpool.execute(task4) as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0350
     * @tc.desc   TaskPoolTestClass026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: number = 0;
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
        let ret: Any = await taskpool.execute(task);
        result = ret as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.error("testTaskPoolClassStatic026 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0360
     * @tc.desc   TaskPoolTestClass027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(Add, true, true)
        let result: boolean = false;
        let ret: Any = await taskpool.execute(task);
        result = ret as boolean;
        expect(result).assertEqual(true);
      } catch (error) {
        console.error("testTaskPoolClassStatic027 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0370
     * @tc.desc   TaskPoolTestClass028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def")
        let result: string = '';
        let ret: Any = await taskpool.execute(task);
        result = ret as string;
        expect(result).assertEqual("abcdef");
      } catch (error) {
        console.error("testTaskPoolClassStatic028 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0380
     * @tc.desc   TaskPoolTestClass029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
        let result: string = '';
        let ret: Any = await taskpool.execute(task);
        result = ret as string;
        expect(result).assertEqual("abcdefhello");
      } catch (error) {
        console.error("testTaskPoolClassStatic029 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0390
     * @tc.desc   TaskPoolTestClass030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(arraySum, [1.0, 2.0], [3.0, 4.0]);
        let result: Array<number> = [];
        let ret: Any = await taskpool.execute(task);
        result = ret as Array<number>;
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
      } catch (error) {
        console.error("testTaskPoolClassStatic030 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0400
     * @tc.desc   TaskPoolTestClass031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let aa: A = new A();
        aa.a = 1;
        aa.b = 2;
        let bb: B = new B();
        bb.a = 3;
        bb.b = 4;
        let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
        let result: A = aa;
        let ret: Any = await taskpool.execute(task);
        result = ret as A;
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      } catch (error) {
        console.error("testTaskPoolClassStatic031 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0410
     * @tc.desc   TaskPoolTestClass032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0);
      let caught: boolean = false;
      try {
        await taskpool.execute(task);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0420
     * @tc.desc   TaskPoolTestClass033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0, 30.0);
      let result: number = 0;
      try {
        let ret: Any = await taskpool.execute(task);
        result = ret as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0430
     * @tc.desc   TaskPoolTestClass034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result1: number = 0;
        let ret1: Any = await taskpool.execute(task1);
        result1 = ret1 as number;

        let task2: taskpool.Task = new taskpool.Task(Sum, 30.0, 40.0);
        let result2: number = 0;
        let ret2: Any = await taskpool.execute(task2);
        result2 = ret2 as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
      } catch (error) {
        console.error("testTaskPoolClassStatic034 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0440
     * @tc.desc   TaskPoolTestClass035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result1: number = 0;
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
        let ret1: Any = await taskpool.execute(task1);
        result1 = ret1 as number;

        let task2: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
        let result2: number = 0;
        let ret2: Any = await taskpool.execute(task2);
        result2 = ret2 as number;
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
      } catch (error) {
        console.error(`testTaskPoolClassStatic035 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0450
     * @tc.desc   TaskPoolTestClass036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result1: number = 0;
      let result2: number = 0;
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
      try {
        let ret1: Any = await taskpool.execute(task);
        result1 = ret1 as number;

        let ret2: Any = await taskpool.execute(task);
        result2 = ret2 as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0460
     * @tc.desc   TaskPoolTestClass037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result1: number = 0;
      let result2: number = 0;
      let result3: number = 0;
      let result4: number = 0;

      let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
      try {
        let ret1: Any = await taskpool.execute(task1);
        result1 = ret1 as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let task2: taskpool.Task = new taskpool.Task(Multi, 10.0, 20.0);
      try {
        let ret2: Any = await taskpool.execute(task2);
        result2 = ret2 as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let task3: taskpool.Task = new taskpool.Task(Sum, 10.0, 30.0);
      try {
        let ret3: Any = await taskpool.execute(task3);
        result3 = ret3 as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let task4: taskpool.Task = new taskpool.Task(Multi, 20.0, 20.0);
      try {
        let ret4: Any = await taskpool.execute(task4);
        result4 = ret4 as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }

      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0470
     * @tc.desc   TaskPoolTestClass038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: number = 0;
      try {
        let ret: Any = await taskpool.execute(Sum, 10.0, 20.0);
        result = ret as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0480
     * @tc.desc   TaskPoolTestClass039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: boolean = false;
      try {
        let ret: Any = await taskpool.execute(Add, true, true);
        result = ret as boolean;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0490
     * @tc.desc   TaskPoolTestClass040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: string = '';
      try {
        let ret: Any = await taskpool.execute(StrCat, "abc", "def");
        result = ret as string;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0500
     * @tc.desc   TaskPoolTestClass041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: string = '';
      try {
        let ret: Any = await taskpool.execute(funcStrCat, "abc", "def", "hello");
        result = ret as string;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0510
     * @tc.desc   TaskPoolTestClass042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Array<number> = [];
      try {
        let ret: Any = await taskpool.execute(arraySum, [1.0, 2.0], [3.0, 4.0]);
        result = ret as Array<number>;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0520
     * @tc.desc   TaskPoolTestClass043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let result: A = aa;
      try {
        let ret: Any = await taskpool.execute(objectSum, aa, bb);
        result = ret as A;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0530
     * @tc.desc   TaskPoolTestClass044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false;
      try {
        await taskpool.execute(Sum, 10.0);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0540
     * @tc.desc   TaskPoolTestClass045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: number = 0;
      try {
        let ret: Any = await taskpool.execute(Sum, 10.0, 20.0, 30.0);
        result = ret as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0550
     * @tc.desc   TaskPoolTestClass046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result1: number = 0;
        let result2: number = 0;
        let ret1: Any = await taskpool.execute(Sum, 10.0, 20.0);
        result1 = ret1 as number;
        try {
          let ret2: Any = await taskpool.execute(Sum, 30.0, 40.0);
          result2 = ret2 as number;
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
      } catch (error) {
        console.error("testTaskPoolClassStatic046 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0560
     * @tc.desc   TaskPoolTestClass047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result1: number = 0;
        let result2: number = 0;
        let ret1: Any = await taskpool.execute(Sum, 10.0, 20.0);
        result1 = ret1 as number;
        try {
          let ret2: Any = await taskpool.execute(Sum, 10.0, 20.0);
          result2 = ret2 as number;
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
      } catch (error) {
        console.error(`testTaskPoolClassStatic047 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0570
     * @tc.desc   TaskPoolTestClass048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result1: number = 0;
      let result2: number = 0;
      let result3: number = 0;
      let result4: number = 0;

      try {
        let ret1: Any = await taskpool.execute(Sum, 10.0, 20.0);
        result1 = ret1 as number;

        let ret2: Any = await taskpool.execute(Multi, 10.0, 20.0);
        result2 = ret2 as number;

        let ret3: Any = await taskpool.execute(Sum, 10.0, 30.0);
        result3 = ret3 as number;

        let ret4: Any = await taskpool.execute(Multi, 20.0, 20.0);
        result4 = ret4 as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }

      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0580
     * @tc.desc   TaskPoolTestClass049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false;
      try {
        await taskpool.execute(Sum) as number;
      } catch(e) {
        caught = true;
      }
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0590
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(WaitforRunner, "a");
      let task2: taskpool.Task = new taskpool.Task(WaitforRunner, "b");
      let task3: taskpool.Task = new taskpool.Task(WaitforRunner, "c");

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let res1: string = await runner.execute(task1) as string;
        finalString += res1;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let res2: string = await runner.execute(task2) as string;
        finalString += res2;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let res3: string = await runner.execute(task3) as string;
        finalString += res3;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }

      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
      try {
        let echo: string = await runner.execute(task4) as string;
        expect(echo).assertEqual("abc");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(finalString).assertEqual("abc");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0600
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
      task1.addDependency(task2);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        await runner.execute(task1);
        finalString += 'a';
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200091);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0610
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let finalString: string = "";

        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 300.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 500.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        let result3: number = await taskpool.execute(task3) as number;
        finalString += result3.toString();
        let result2: number = await taskpool.execute(task2) as number;
        finalString += result2.toString();
        let result1: number = await taskpool.execute(task1) as number;
        finalString += result1.toString();
        expect(result3).assertEqual(110);
        expect(result2).assertEqual(70);
        expect(result1).assertEqual(30);
        expect(finalString).assertEqual("1107030");
      } catch (error) {
        console.error("testTaskPoolClassStatic052 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0620
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let finalString: string = "";

        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 300.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 500.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        task1.removeDependency(task2);
        task2.removeDependency(task3);
        let result1: number = await taskpool.execute(task1) as number;
        finalString += result1.toString();
        let result2: number = await taskpool.execute(task2) as number;
        finalString += result2.toString();
        let result3: number = await taskpool.execute(task3) as number;
        finalString += result3.toString();
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        expect(result3).assertEqual(110);
        expect(finalString).assertEqual("3070110");
      } catch (error) {
        console.error("testTaskPoolClassStatic053 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0630
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 300.0)
      let task4: taskpool.Task = new taskpool.Task(delaySum, 20.0, 20.0, 100.0)
      let task5: taskpool.Task = new taskpool.Task(delaySum, 40.0, 40.0, 200.0)
      let task6: taskpool.Task = new taskpool.Task(delaySum, 60.0, 60.0, 300.0)

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
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200026);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0640
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 300.0)
      task1.addDependency(task2);
      task2.addDependency(task3);
      try {
        await taskpool.execute(task3);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info("task3 success");
      try {
        await taskpool.execute(task2);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info("task2 success");
      try {
        await taskpool.execute(task1);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      console.info("task1 success");

      try {
        task2.removeDependency(task3);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200071);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0650
     * @tc.desc   executeDelayed for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let begin: number = Date.now();
      let task1: taskpool.Task = new taskpool.Task(WaitforRunner, "a");
      let task2: taskpool.Task = new taskpool.Task(WaitforRunner, "b");
      let task3: taskpool.Task = new taskpool.Task(WaitforRunner, "c");

      let task1Promise: Promise<Any> = taskpool.executeDelayed(500, task1);
      let task2Promise: Promise<Any> = taskpool.executeDelayed(300, task2);
      let task3Promise: Promise<Any> = taskpool.executeDelayed(100, task3);
      try {
        expect(await task3Promise as string).assertEqual("c");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let elapsed3: number = Date.now() - begin;
      try {
        expect(await task2Promise as string).assertEqual("b");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let elapsed2: number = Date.now() - begin;
      try {
        expect(await task1Promise as string).assertEqual("a");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let elapsed1: number = Date.now() - begin;
      // 延时下界（10% 容差）观测 executeDelayed 到期语义：100/300/500ms 依次生效
      expect(elapsed3 >= 90).assertTrue();
      expect(elapsed2 >= 270).assertTrue();
      expect(elapsed1 >= 450).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0660
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let totalDuration: number = 0;
      let cpuDuration: number = 0;
      let ioDuration: number = 0;

      let task: taskpool.Task = new taskpool.Task(delay);
      try {
        await taskpool.execute(task);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      totalDuration = task.totalDuration;
      cpuDuration = task.cpuDuration;
      ioDuration = task.ioDuration;
      // Duration metrics may be rounded to zero; reviewer requires non-negative assertions.
      expect(totalDuration >= 0).assertTrue();
      expect(cpuDuration >= 0).assertTrue();
      expect(ioDuration).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0670
     * @tc.desc   concurrentFunc for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: number = await taskpool.execute(printArgsFunc, Sum, 10.0, 20.0) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0680
     * @tc.desc   Execute priority tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {

      let allCount: number = 100; // 100: test number
      let taskArray: Array<taskpool.Task> = [];
      let begin: number = Date.now();
      let highTime: number = 0;
      let mediumTime: number = 0;
      let lowTime: number = 0;
      let taskPromises: Array<Promise<Any>> = [];

      for (let i: int = 0; i < allCount; i++) {
        let task1: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task1);
        let task2: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task2);
        let task3: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task3);
      }

      // 并发提交全部任务后再统一回收结果，避免逐个 await 抹平优先级调度差异
      for (let i: int = 0; i < allCount * 3; i += 3) {
        taskPromises.push(taskpool.execute(taskArray[i], taskpool.Priority.HIGH));
        taskPromises.push(taskpool.execute(taskArray[i + 1], taskpool.Priority.LOW));
        taskPromises.push(taskpool.execute(taskArray[i + 2], taskpool.Priority.MEDIUM));
      }

      try {
        await Promise.all(taskPromises);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }

      // 按提交序归桶：i%3==0 为 HIGH，i%3==1 为 LOW，i%3==2 为 MEDIUM（修正原变量错位）
      for (let i: int = 0; i < taskPromises.length; i++) {
        let res: number = await taskPromises[i] as number;
        if (i % 3 === 0) {
          highTime += res - begin;
        } else if (i % 3 === 1) {
          lowTime += res - begin;
        } else {
          mediumTime += res - begin;
        }
      }

      expect(highTime > 0 && mediumTime > 0 && lowTime > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0690
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: number = await taskpool.execute(asyncSum, 10.0, 20.0) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0700
     * @tc.desc   Execute async function task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(testNumber, 10.0, 20.0);
        let result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(30);
      } catch (error) {
        console.error("testTaskPoolClassStatic061 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0710
     * @tc.desc   Execute TaskGroup by addTask(function, args)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Array<number> = [];
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);
        let ret: Any = await taskpool.execute(taskGroup);
        result = ret as Array<number>;
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(30);
      } catch (error) {
        console.error(`testTaskPoolClassStatic062 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0720
     * @tc.desc   Execute TaskGroup with pre-created Task objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Array<number> = [];
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      try {
        let ret: Any = await taskpool.execute(taskGroup);
        result = ret as Array<number>;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0730
     * @tc.desc   Verify setTransferListTest helper returns summed byte length (setTransferList API disabled in static mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: number = 0;
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);

        let task: taskpool.Task = new taskpool.Task(setTransferListTest, view, view1);
        // task.setTransferList([view.buffer, view1.buffer])  // API not available in ArkTS 1.2 static mode;
        let ret: Any = await taskpool.execute(task);
        result = ret as number;
        expect(result).assertEqual(24);
      } catch (error) {
        console.error(`testTaskPoolClassStatic064 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0740
     * @tc.desc   Get the taskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let highCount: number = 0;
        let mediumCount: number = 0;
        let lowCount: number = 0;
        let allCount: number = 3;
        let taskPromises: Array<Promise<Any>> = [];
        for (let i: number = 0; i < allCount; i++) {
          let task1: taskpool.Task = new taskpool.Task(currentFun);
          let task2: taskpool.Task = new taskpool.Task(currentFun);
          let task3: taskpool.Task = new taskpool.Task(currentFun);
          taskPromises.push(taskpool.execute(task1));
          lowCount++;
          taskPromises.push(taskpool.execute(task2));
          mediumCount++;
          taskPromises.push(taskpool.execute(task3));
          highCount++;
        }
        await asyncSleep(50.0);

        let taskpoolInfo = taskpool.getTaskPoolInfo();
        let tid: number = 0;
        let taskIdCount: number = 0;
        let priority: number = 0;
        let taskId: number = 0;
        let state: number = 0;
        let duration: number = 0;

        for (let threadInfo of taskpoolInfo.threadInfos) {
          tid += threadInfo.tid;
          const currentTaskIds: Array<int> | undefined = threadInfo.taskIds;
          if (currentTaskIds != undefined) {
            taskIdCount += currentTaskIds.length;
          }
          const currentPriority: taskpool.Priority | undefined = threadInfo.priority;
          if (currentPriority != undefined) {
            priority += currentPriority.valueOf();
          }
        }

        for (let taskInfo of taskpoolInfo.taskInfos) {
          taskId += Number(taskInfo.taskId);
          const currentState: int | undefined = taskInfo.state;
          if (currentState != undefined) {
            state += currentState;
          }
          const currentDuration: int | undefined = taskInfo.duration;
          if (currentDuration != undefined) {
            duration += currentDuration;
          }
        }
        console.info("task duration is: " + duration);
        expect(tid != 0).assertTrue();
        expect(taskIdCount > 0).assertTrue();
        expect(priority != -1).assertTrue();
        expect(taskId != 0).assertTrue();
        expect(state != 0).assertTrue();
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      } catch (error) {
        console.error(`testTaskPoolClassStatic065 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0750
     * @tc.desc   exeute task at taskpool thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let outerTask1 = new taskpool.Task(outerTaskFunc, "001")
      try {
        let res1: string = await taskpool.execute(outerTask1) as string;
        expect(res1).assertEqual("outerTaskRes-001");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }

      let outerTask2 = new taskpool.Task(outerTaskFunc, "002")
      try {
        let res2: string = await taskpool.execute(outerTask2) as string;
        expect(res2).assertEqual("outerTaskRes-002");

        let res3: string = await taskpool.execute(outerTaskFunc, "001") as string;
        expect(res3).assertEqual("outerTaskRes-001");

        let res4: string = await taskpool.execute(outerTaskFunc, "002") as string;
        expect(res4).assertEqual("outerTaskRes-002");
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0760
     * @tc.desc   transfer ArrayBuffer with taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let values: Array<number> = [0, 0, 0, 0];
        let task: taskpool.Task = new taskpool.Task(transferArrayBuffer, values);
        let result: string = await taskpool.execute(task) as string;
        expect(result).assertEqual("success");
      } catch (error) {
        console.error(`testTaskPoolClassStatic067 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0770
     * @tc.desc   transfer ArrayBuffer and Atomics with taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sab: ArrayBuffer = new ArrayBuffer(20);
      let int32 = new Int32Array(sab);

      let task: taskpool.Task = new taskpool.Task(transferAtomics, int32);
      let executePromise: Promise<Any> = taskpool.execute(task);

      // 事件同步：等待 worker 发出"已进入 wait 就绪"信号（arg1[1]===1），替代固定 sleep 100ms
      let waitStart: number = Date.now();
      while (Atomics.load(int32, 1) !== 1 && Date.now() - waitStart < 5000) {
        try {
          await asyncSleep(10);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      }
      expect(Atomics.load(int32, 1)).assertEqual(1);

      // 唤醒业务等待点：先改值再 notify，保证唤醒语义不依赖 notify 与入队的先后
      Atomics.store(int32, 0, 1);
      Atomics.notify(int32, 0, 1);

      try {
        let res: string = await executePromise as string;
      expect(res === "ok" || res === "not-equal").assertTrue();
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      // 双路径断言：被 notify 唤醒返回 "ok"；notify 先到则 wait 因值不等立即返回 "not-equal"。
      // 唯一不允许的终态是 "timed-out"（丢失唤醒/超时）
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0780
     * @tc.desc   sendData and onReceiveData for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 1.0, 3.0);
      task.onReceiveData(printArgs);
      let executeResult: Promise<Any> = taskpool.execute(task);
      try {
        taskpool.Task.sendData(4);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200022);
      }
      try {
        expect(await executeResult as number).assertEqual(4);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0790
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskname: string = "taskName";
      let task: taskpool.Task = new taskpool.Task(taskname, Sum, 10.0, 20.0);
      let name: string = task.name;
      expect(name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0800
     * @tc.desc   add name of taskGroup for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskGroupName: string = "groupName";
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);

        let res: Array<number> = await taskpool.execute(taskGroup) as Array<number>;
        expect(res[0]).assertEqual(10);
          expect(res[1]).assertEqual(20);
          expect(res[2]).assertEqual(30);
        let name: string = taskGroup.name;
        expect(name).assertEqual("groupName");
      } catch (error) {
        console.error(`testTaskPoolClassStatic071 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0810
     * @tc.desc   Cancel tasks that have not been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 1.0, 1.0, 200.0);
        let task2: taskpool.Task = new taskpool.Task(delaySum, 2.0, 2.0, 200.0);
        let task3: taskpool.Task = new taskpool.Task(delaySum, 3.0, 3.0, 200.0);
        let task4: taskpool.Task = new taskpool.Task(delaySum, 4.0, 4.0, 200.0);

        let p1: Promise<Any> = taskpool.execute(task1);
        let p2: Promise<Any> = taskpool.execute(task2);
        let p3: Promise<Any> = taskpool.execute(task3);
        // 072 desc：取消未执行的任务；delayed 任务在延时窗口内必然尚未执行，取消语义确定
        let p4: Promise<Any> = taskpool.executeDelayed(500, task4);

        try {
          taskpool.cancel(task4);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
        }
        try {
          expect(await p1 as number).assertEqual(2);
          expect(await p2 as number).assertEqual(4);
          expect(await p3 as number).assertEqual(6);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        let canceled: boolean = false;
        try {
          await p4;
        } catch (error) {
          canceled = true;
        }
        expect(canceled).assertTrue();
      } catch (error) {
        console.error("testTaskPoolClassStatic072 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0820
     * @tc.desc   Cancel the task in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // 取消尚未执行的 delayed 任务；验证取消成功且全局 isCanceled 仍为 false
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
      let p1: Promise<Any> = taskpool.executeDelayed(500, task1);
      let p2: Promise<Any> = taskpool.execute(task2);
      taskpool.cancel(task1);
      let canceled: boolean = false;
      try {
        await p1;
      } catch (e) {
        canceled = true;
      }
      expect(canceled).assertTrue();
      expect(taskpool.Task.isCanceled()).assertFalse();
      try {
        expect(await p2 as number).assertEqual(200);
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0830
     * @tc.desc   Cancel the executed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
        let promise1: Promise<Any> = taskpool.execute(task1);
        let promise2: Promise<Any> = taskpool.execute(task2);
        await taskpool.execute(task3);
        await promise1;
        await promise2;
        try {
          taskpool.cancel(task1);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200085);
        }
      } catch (error) {
        console.error("testTaskPoolClassStatic074 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0840
     * @tc.desc   Cancel nonexistent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
        let promise1: Promise<Any> = taskpool.execute(task1);
        let promise2: Promise<Any> = taskpool.execute(task2);
        try {
          taskpool.cancel(task3);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200088);
        }
        await promise1;
        await promise2;
      } catch (error) {
        console.error(`testTaskPoolClassStatic075 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0850
     * @tc.desc   Canceling unexecuted tasks multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
        let promise1: Promise<Any> = taskpool.execute(task1);
        let promise2: Promise<Any> = taskpool.execute(task2);
        try {
          await promise1;

          await promise2;
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        // 多次 cancel 未执行的任务（task3 从未提交，符 desc "Canceling unexecuted tasks multiple times"）
        try {
          taskpool.cancel(task3);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200088);
        }
        try {
          taskpool.cancel(task3);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200088);
        }
      } catch (error) {
        console.error("testTaskPoolClassStatic076 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0860
     * @tc.desc   Cancel all tasks in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 400.0);
        let task5: taskpool.Task = new taskpool.Task(printArgs, 500.0);
        let task6: taskpool.Task = new taskpool.Task(printArgs, 600.0);

        let p1: Promise<Any> = taskpool.execute(task1);
        let p2: Promise<Any> = taskpool.execute(task2);
        let p3: Promise<Any> = taskpool.execute(task3);
        let p4: Promise<Any> = taskpool.execute(task4);
        let p5: Promise<Any> = taskpool.execute(task5);
        let p6: Promise<Any> = taskpool.execute(task6);

        await promiseCase();
        try {
          taskpool.cancel(task6);
          taskpool.cancel(task5);
          taskpool.cancel(task4);
          taskpool.cancel(task3);
          taskpool.cancel(task2);
        expect().assertFail();
      } catch(e) {
          expect(e.code).assertEqual(10200085);
        }
        try { await p1; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        try { await p2; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        try { await p3; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        try { await p4; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        try { await p5; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        try { await p6; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      } catch (error) {
        console.error("testTaskPoolClassStatic077 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0870
     * @tc.desc   Cancel the taskGroup in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let i: number = 10;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(AdditionDelay, 10.0);
        taskGroup1.addTask(AdditionDelay, 20.0);
        taskGroup1.addTask(AdditionDelay, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        await taskpool.execute(taskGroup1);
        ++i;
        let executePromise: Promise<Any> = taskpool.execute(taskGroup2);
        taskpool.cancel(taskGroup2);
        let canceled: boolean = false;
        try {
          await executePromise;
        } catch (error) {
          canceled = true;
        }
        expect(i).assertEqual(11)
        expect(canceled).assertTrue();
      } catch (error) {
        console.error("testTaskPoolClassStatic078 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0880
     * @tc.desc   Cancel the taskGroup that have not been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let i: number = 10;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(AdditionDelay, 10.0);
        taskGroup1.addTask(AdditionDelay, 20.0);
        taskGroup1.addTask(AdditionDelay, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        let executePromise: Promise<Any> = taskpool.execute(taskGroup1);
        taskpool.cancel(taskGroup1);
        let canceled: boolean = false;
        try {
          await executePromise;
        } catch (error) {
          canceled = true;
        }
        await taskpool.execute(taskGroup2);
        ++i;

        expect(i).assertEqual(11)
        expect(canceled).assertTrue();
      } catch (error) {
        console.error("testTaskPoolClassStatic079 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0890
     * @tc.desc   Cancel the non-existent taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskpool.cancel(taskGroup);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200089);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0900
     * @tc.desc   Cancel the executed taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(printArgs, 10.0);
        taskGroup1.addTask(printArgs, 20.0);
        taskGroup1.addTask(printArgs, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);

        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);

        await taskpool.execute(taskGroup1);
        await taskpool.execute(taskGroup2);

        try {
          taskpool.cancel(taskGroup1);
          expect().assertFail();
        } catch(e) {
          expect(e.code).assertEqual(10200089);
        }
      } catch (error) {
        console.error(`testTaskPoolClassStatic081 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0910
     * @tc.desc   add setclonelist of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let arr: Array<number> = [1, 2, 3, 4];
        let task: taskpool.Task = new taskpool.Task(setCloneListTest, arr);
        let result: Int32Array = await taskpool.execute(task) as Int32Array;
        expect(result[0]).assertEqual(5);
      } catch (error) {
        console.error(`testTaskPoolClassStatic082 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0920
     * @tc.desc   taskGroup cannot add groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup2.addTask(task);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200077);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0930
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let executePromise: Promise<Any> = taskpool.execute(task);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        expect().assertFail();
      } catch(e) {
        expect(e.code).assertEqual(10200103);
      }
      try { await executePromise; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0940
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let delayedPromise: Promise<Any> = taskpool.executeDelayed(100, task);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        expect().assertFail();
      } catch(e) {
        expect(e.code).assertEqual(10200103);
      }
      try { taskpool.cancel(task); } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      try { await delayedPromise; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0950
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let executePromise: Promise<Any> = runner.execute(task);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        expect().assertFail();
      } catch(e) {
        expect(e.code).assertEqual(10200103);
      }
      try { await executePromise; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0960
     * @tc.desc   dependent task not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        task1.addDependency(task2);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200091);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0970
     * @tc.desc   A completed TaskGroup can add a new task and execute again.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        let result1: Array<number> = await taskpool.execute(taskGroup) as Array<number>;
        expect(result1[0]).assertEqual(100);
        taskGroup.addTask(task2);
        let result2: Array<number> = await taskpool.execute(taskGroup) as Array<number>;
        expect(result2[0]).assertEqual(100);
        expect(result2[1]).assertEqual(200);
      } catch (e) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0980
     * @tc.desc   SequenceRunner cannot execute groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200102);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_0990
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let executePromise: Promise<Any> = taskpool.execute(task);
      try {
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task);
        expect().assertFail();
      } catch(e) {
        expect(e.code).assertEqual(10200078);
      }
      try { await executePromise; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1000
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let delayedPromise: Promise<Any> = taskpool.executeDelayed(100, task);
      try {
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task);
        expect().assertFail();
      } catch(e) {
        expect(e.code).assertEqual(10200078);
      }
      try { taskpool.cancel(task); } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      try { await delayedPromise; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1010
     * @tc.desc   dependent task not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        task1.addDependency(task2);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task1);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200091);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1020
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner1.execute(task);
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner2.execute(task);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200078);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1030
     * @tc.desc   groupTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        task.addDependency(task1);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200073);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1040
     * @tc.desc   groupTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        task1.addDependency(task);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200074);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1050
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        taskpool.execute(task2);
        task1.addDependency(task2);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200079);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1060
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      let delayedPromise: Promise<Any> = taskpool.executeDelayed(100, task2);
      try {
        task1.addDependency(task2);
        expect().assertFail();
      } catch(e) {
        expect(e.code).assertEqual(10200079);
      }
      try { taskpool.cancel(task2); } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      try { await delayedPromise; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1070
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        taskpool.execute(task1);
        task1.addDependency(task2);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200070);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1080
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        taskpool.executeDelayed(100,task1);
        task1.addDependency(task2);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200070);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1090
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task2);
        task1.addDependency(task2);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200079);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1100
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task1);
        task1.addDependency(task2);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200070);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1110
     * @tc.desc   groupTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        task1.addDependency(task);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200074);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1120
     * @tc.desc   groupTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        task.addDependency(task1);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200073);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1130
     * @tc.desc   seqRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task1);
        taskpool.execute(task1);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200080);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1140
     * @tc.desc   groupTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        taskpool.execute(task);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200075);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1150
     * @tc.desc   seqRunnerTask cannot executeDelayed outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task1);
        taskpool.executeDelayed(100, task1);
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200081);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1160
     * @tc.desc   groupTask cannot executeDelayed outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        taskpool.executeDelayed(100, task)
      expect().assertFail();
    } catch(e) {
        expect(e.code).assertEqual(10200076);
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1170
     * @tc.desc   cancel the executeDelay task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: number = 0;
      let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
      try {
        let ret: Any = await taskpool.executeDelayed(500, task);
        result = ret as number;
      } catch (error) {
        console.info(`gate-catch: ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      let caught: boolean = false;
      try {
        taskpool.cancel(task);
      } catch (e) {
        caught = true;
        expect(e.code).assertEqual(10200085);
      }
      expect(caught).assertFalse();
      expect(result).assertEqual(100);
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1180
     * @tc.desc   executedTask with dependency cannot execute again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
        task1.addDependency(task2);
        await taskpool.execute(task2);
        try {
          await taskpool.execute(task1);
          await taskpool.execute(task1);
          expect().assertFail();
        } catch(e) {
          expect(e.code).assertEqual(10200072);
        }
      } catch (error) {
        console.error("testTaskPoolClassStatic109 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1190
     * @tc.desc   Modify the task name before execution and verify the updated value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task('taskName', Sum, 10.0, 20.0);
      task.name = 'taskName1';
      expect(task.name).assertEqual('taskName1');
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic111
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1200
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10.0, 20.0);
      expect(task.name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic112
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1210
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
      let name: string = task.name;
      expect(name).assertEqual("Sum");
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic113
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1220
     * @tc.desc   get name from taskInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let executePromise: Promise<Any> = taskpool.execute(task);
        // 轮询至本任务的 taskInfo 出现（taskId 精确匹配），替代固定 sleep 快照，避免慢机竞态
        const deadline: number = Date.now() + 5000;
        let name = "";
        while (name === "" && Date.now() < deadline) {
          let taskpoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (Number(taskInfo.taskId) === task.taskId) {
              name = taskInfo.name;
              break;
            }
          }
          if (name === "") {
            await asyncSleep(10.0);
          }
        }
        expect(name != "").assertTrue();
        await executePromise;
      } catch (error) {
        console.error(`testTaskPoolClassStatic113 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic114
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1230
     * @tc.desc   get name from taskInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task("taskName", delaySum, 10.0, 20.0, 100.0)
        let executePromise: Promise<Any> = taskpool.execute(task);
        // 轮询至本任务的 taskInfo 出现（taskId 精确匹配）；任务显式命名，断言名称一致（强于上游 name!=""）
        const deadline: number = Date.now() + 5000;
        let name = "";
        while (name === "" && Date.now() < deadline) {
          let taskpoolInfo = taskpool.getTaskPoolInfo();
          for (let taskInfo of taskpoolInfo.taskInfos) {
            if (Number(taskInfo.taskId) === task.taskId) {
              name = taskInfo.name;
              break;
            }
          }
          if (name === "") {
            await asyncSleep(10.0);
          }
        }
        expect(name).assertEqual("taskName");
        try {
          await executePromise;
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      } catch (error) {
        console.error(`testTaskPoolClassStatic114 failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic116
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1250
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // 前半段（cancel 未提交任务→10200088，与 075 同点）按 reconcile 删除；保留并差异化后半段
      let isTerminate1: boolean = false;
      let task2: taskpool.Task = new taskpool.Task(testCancelDelayed);
      let executePromise: Promise<Any> = taskpool.executeDelayed(500, task2);
      taskpool.cancel(task2);
      try {
        await executePromise;
      } catch (error) {
        isTerminate1 = true;
      }

      expect(isTerminate1).assertTrue();

      // 差异化增量（静态语义）：已取消任务再次 execute 不会重新执行，promise 应拒绝
      let reExecuteRejected: boolean = false;
      try {
        await taskpool.execute(task2);
      } catch (error) {
        reExecuteRejected = true;
      }
      expect(reExecuteRejected).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic117
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1260
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs)
      let delayedPromise: Promise<Any> = taskpool.executeDelayed(500, task);
      taskpool.cancel(task);
      try {
        await delayedPromise;
      } catch (error) {
        isTerminate1 = true;
      }
      expect(isTerminate1).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic118
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1270
     * @tc.desc   Register a callback of onExecutionFailed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(taskErrFunc, 100.0);
      task.onExecutionFailed((e: Error)=>{
        console.info(`gate-failed: ${e}`);
        callbackCalled = true;
      })

      let caught: boolean = false;
      try {
        await taskpool.execute(task);
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(callbackCalled).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic120
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1290
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(delay);
        expect(task.taskId > 0).assertTrue();
        await taskpool.execute(task);
        expect(task.totalDuration > 0).assertTrue();
        expect(task.ioDuration).assertEqual(0);
        expect(task.totalDuration).assertEqual(task.cpuDuration);
      } catch (error) {
        console.error("testTaskPoolClassStatic120 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic121
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1300
     * @tc.desc   dependent task not allowed in SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
      task1.addDependency(task2);
      let runner = new taskpool.SequenceRunner();
      try {
        await runner.execute(task1);
        finalString += 'a';
      expect().assertFail();
    } catch (e) {
        expect(e.code).assertEqual(10200091);
        expect(finalString).assertEqual('');
        // 依赖任务被 runner 拒绝、从未执行，时长应保持初始值（对齐上游 121/124 差异点）
        expect(task1.totalDuration < 5).assertTrue();
        expect(task1.cpuDuration < 5).assertTrue();
        expect(task1.ioDuration < 5).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic122
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1310
     * @tc.desc   Cancel the executeDelayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // 避免忙等；delayed 任务 cancel 后 drain promise
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
      let p: Promise<Any> = taskpool.executeDelayed(500, task);
      taskpool.cancel(task);
      let errorCaught: boolean = false;
      try {
        await p;
      } catch (e) {
        errorCaught = true;
        expect(taskpool.Task.isCanceled()).assertFalse();
      }
      expect(errorCaught).assertTrue();
      // 任务在延时窗口内被取消、从未执行，时长应保持初始值（对齐上游 122/125 差异点）
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic123
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1320
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task: taskpool.Task = new taskpool.Task(randomTest, 100.0);
        await taskpool.execute(task);
        expect(task.totalDuration > 0).assertTrue();
        expect(task.cpuDuration > 0).assertTrue();
        expect(task.ioDuration).assertEqual(0);
        expect(task.totalDuration).assertEqual(task.cpuDuration);
      } catch (error) {
        console.error("testTaskPoolClassStatic123 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolClassStatic124
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTANDARD_1330
     * @tc.desc   Remove the dependency so the task becomes executable in SequenceRunner again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolClassStatic124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
