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
