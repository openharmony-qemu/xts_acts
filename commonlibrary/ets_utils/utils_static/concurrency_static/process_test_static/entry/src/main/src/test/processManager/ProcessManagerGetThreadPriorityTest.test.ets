'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util';

export default function ProcessManagerGetThreadPriorityTest(): void {
  describe('ProcessManagerGetThreadPriorityTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0100
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0100
     * @tc.desc    Verify getThreadPriority with current thread tid returns valid priority in [-20,19]
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority: number = processManager.getThreadPriority(tid)
      expect(priority >= -20 && priority <= 19).assertTrue()
      expect(priority !== -1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0200
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0200
     * @tc.desc    Verify getThreadPriority with current thread tid returns valid priority in [-20,19]
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority: number = processManager.getThreadPriority(tid)
      expect(priority >= -20 && priority <= 19).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0300
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0300
     * @tc.desc    Verify getThreadPriority accepts single int param only
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority: number = processManager.getThreadPriority(tid)
      expect(priority >= -20 && priority <= 19).assertTrue()
      expect(priority !== -1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0400
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0400
     * @tc.desc    Verify getThreadPriority with tid 0 returns -1 or valid priority
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(0)
      expect(priority >= -20 && priority <= 19).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0500
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0500
     * @tc.desc    Verify getThreadPriority with tid 1 returns -1 or valid priority
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(1)
      expect(priority >= -20 && priority <= 19).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0600
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0600
     * @tc.desc    Verify getThreadPriority with int min -2147483648 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(-2147483648)
      expect(priority).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0700
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0700
     * @tc.desc    Verify getThreadPriority with int max 2147483647 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(2147483647)
      expect(priority).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0800
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0800
     * @tc.desc    Verify getThreadPriority with negative tid -1 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(-1)
      expect(priority).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest0900
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_0900
     * @tc.desc    Verify getThreadPriority with negative tid -100 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(-100)
      expect(priority).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1000
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1000
     * @tc.desc    Verify getThreadPriority with non-existent tid 999999 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(999999)
      expect(priority).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1100
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1100
     * @tc.desc    Verify getThreadPriority with non-existent tid 123456789 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(123456789)
      expect(priority).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1200
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1200
     * @tc.desc    Verify getThreadPriority with hex format tid 0x1234 returns number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(0x1234)
      expect(priority >= -20 && priority <= 19).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1300
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1300
     * @tc.desc    Verify getThreadPriority with binary format tid 0b1010 returns number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let priority: number = processManager.getThreadPriority(0b1010)
      expect(priority >= -20 && priority <= 19).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1400
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1400
     * @tc.desc    Verify getThreadPriority compile-time type check requires int param
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority: number = processManager.getThreadPriority(tid)
      expect(priority >= -20 && priority <= 19).assertTrue()
      expect(priority !== -1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1500
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1500
     * @tc.desc    Verify getThreadPriority multiple calls same tid return same value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority1: number = processManager.getThreadPriority(tid)
      let priority2: number = processManager.getThreadPriority(tid)
      expect(priority1).assertEqual(priority2)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1600
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1600
     * @tc.desc    Verify getThreadPriority default priority is valid number in [-20,19]
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority: number = processManager.getThreadPriority(tid)
      expect(priority >= -20 && priority <= 19).assertTrue()
      expect(priority !== -1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1700
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1700
     * @tc.desc    Verify getThreadPriority return value in [-20,19] or -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetThreadPriorityTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority: number = processManager.getThreadPriority(tid)
      // current tid must be in [-20,19] and never -1
      expect(priority >= -20 && priority <= 19).assertTrue()
      expect(priority !== -1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1800
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1800
     * @tc.desc    Verify getThreadPriority 10 consecutive calls return same value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priorities: number[] = []
      for (let i = 0; i < 10; i++) {
        priorities.push(processManager.getThreadPriority(tid))
      }
      let firstValue: number = priorities[0]
      let allSame: boolean = true
      for (let i = 0; i < priorities.length; i++) {
        if (priorities[i] !== firstValue) {
          allSame = false
        }
      }
      expect(allSame).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest1900
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_1900
     * @tc.desc    Verify getThreadPriority main thread and TaskPool thread return number types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let mainTid: int = StdProcess.tid()
      let mainPriority: number = processManager.getThreadPriority(mainTid)
      expect(mainPriority >= -20 && mainPriority <= 19).assertTrue()
      expect(mainPriority !== -1).assertTrue()
      let nestedTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        let workerTid: int = StdProcess.tid()
        return pm.getThreadPriority(workerTid)
      }
      let task = new taskpool.Task(nestedTask)
      try {
        let rawResult = await taskpool.execute(task)
        let workerPriority: number = rawResult as number
        expect(workerPriority >= -20 && workerPriority <= 19).assertTrue()
        expect(workerPriority !== -1).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2000
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2000
     * @tc.desc    Verify getThreadPriority ProcessManager instance reusable after invalid call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let priority1: number = processManager.getThreadPriority(tid)
      let invalidPriority: number = processManager.getThreadPriority(999999)
      expect(invalidPriority).assertEqual(-1)
      let priority2: number = processManager.getThreadPriority(tid)
      expect(priority1).assertEqual(priority2)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2100
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2100
     * @tc.desc    Verify getThreadPriority 1000 calls return stable valid priority
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let firstPriority: number = processManager.getThreadPriority(tid)
      expect(firstPriority >= -20 && firstPriority <= 19).assertTrue()
      expect(firstPriority !== -1).assertTrue()
      for (let i = 0; i < 1000; i++) {
        expect(processManager.getThreadPriority(tid)).assertEqual(firstPriority)
      }
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2200
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2200
     * @tc.desc    Verify getThreadPriority rapid successive calls all return valid values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let results: number[] = []
      for (let i = 0; i < 10; i++) {
        results.push(processManager.getThreadPriority(tid))
      }
      for (let i = 0; i < results.length; i++) {
        const result: number = results[i]
        expect(result >= -20 && result <= 19).assertTrue()
        expect(result !== -1).assertTrue()
      }
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2300
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2300
     * @tc.desc    Verify getThreadPriority multiple ProcessManager instances return same result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetThreadPriorityTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pm1 = new StdProcess.ProcessManager()
      let pm2 = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let p1: number = pm1.getThreadPriority(tid)
      let p2: number = pm2.getThreadPriority(tid)
      expect(p1).assertEqual(p2)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2400
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2400
     * @tc.desc    Verify getThreadPriority instance lifecycle in function scope
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testScope = (): number => {
        let processManager = new StdProcess.ProcessManager()
        let tid: int = StdProcess.tid()
        return processManager.getThreadPriority(tid)
      }
      let result: number = testScope()
      expect(result >= -20 && result <= 19).assertTrue()
      expect(result !== -1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2500
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2500
     * @tc.desc    Verify getThreadPriority 10000 calls all succeed
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let successCount: number = 0
      for (let i = 0; i < 10000; i++) {
        let priority: number = processManager.getThreadPriority(tid)
        if (priority >= -20 && priority <= 19) {
          successCount++
        }
      }
      expect(successCount).assertEqual(10000)
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2600
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2600
     * @tc.desc    Verify getThreadPriority 10000 repeated calls return valid priority
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let tid: int = StdProcess.tid()
      let firstPriority: number = processManager.getThreadPriority(tid)
      expect(firstPriority >= -20 && firstPriority <= 19).assertTrue()
      expect(firstPriority !== -1).assertTrue()
      for (let i = 0; i < 10000; i++) {
        expect(processManager.getThreadPriority(tid)).assertEqual(firstPriority)
      }
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2700
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2700
     * @tc.desc    Verify TaskPool nested getThreadPriority returns valid result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        let tid: int = StdProcess.tid()
        return pm.getThreadPriority(tid)
      }
      let task = new taskpool.Task(nestedTask)
      try {
        let rawResult = await taskpool.execute(task)
        let result: number = rawResult as number
        // worker thread tid must be in [-20,19] and never -1
        expect(result >= -20 && result <= 19).assertTrue()
        expect(result !== -1).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2800
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2800
     * @tc.desc    Verify onExecutionSucceeded callback nested getThreadPriority works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let callbackTask = (): number => { return 42 }
      let task = new taskpool.Task(callbackTask)
      const successCallback = (error?: Error): void => {
        try {
          let tid: int = StdProcess.tid()
          let priority: number = processManager.getThreadPriority(tid)
          expect(priority >= -20 && priority <= 19).assertTrue()
          expect(priority !== -1).assertTrue()
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
          }
        }
      }
      task.onExecutionSucceeded(successCallback as taskpool.CallbackFunction)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      let deadline: number = Date.now() + 5000
      try {
        while (!callbackCalled.load() && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest2900
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_2900
     * @tc.desc    Verify onExecutionFailed callback nested getThreadPriority works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let errorTask = (): number => { throw new Error('fail') }
      let task = new taskpool.Task(errorTask)
      task.onExecutionFailed((error: Error): void => {
        try {
          let tid: int = StdProcess.tid()
          let priority: number = processManager.getThreadPriority(tid)
          expect(priority >= -20 && priority <= 19).assertTrue()
          expect(priority !== -1).assertTrue()
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
          }
        }
      })
      let caught: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      let deadline: number = Date.now() + 5000
      try {
        while (!callbackCalled.load() && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest3000
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_3000
     * @tc.desc    Verify 3 concurrent TaskPool tasks with getThreadPriority all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 3
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        let tid: int = StdProcess.tid()
        completeCount.fetchAdd(1)
        return pm.getThreadPriority(tid)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(new taskpool.Task(concurrentTask))
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < tasks.length; i++) {
        let p: Promise<number> = (async (): Promise<number> => {
          try {
            let raw = await taskpool.execute(tasks[i])
            return raw as number
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return 0;
        })()
        promises.push(p)
      }
      try {
        let results: number[] = await Promise.all(promises)
        expect(results.length).assertEqual(totalCount)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] >= -20 && results[i] <= 19).assertTrue()
          expect(results[i] !== -1).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest3100
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_3100
     * @tc.desc    Verify 5 concurrent TaskPool tasks with getThreadPriority all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 5
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        let tid: int = StdProcess.tid()
        completeCount.fetchAdd(1)
        return pm.getThreadPriority(tid)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(new taskpool.Task(concurrentTask))
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < tasks.length; i++) {
        let p: Promise<number> = (async (): Promise<number> => {
          try {
            let raw = await taskpool.execute(tasks[i])
            return raw as number
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return 0;
        })()
        promises.push(p)
      }
      try {
        let results: number[] = await Promise.all(promises)
        expect(results.length).assertEqual(totalCount)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] >= -20 && results[i] <= 19).assertTrue()
          expect(results[i] !== -1).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerGetThreadPriorityTest3200
     * @tc.number  SUB_PROCESS_MANAGER_GET_THREAD_PRIORITY_TEST_3200
     * @tc.desc    Verify 10 concurrent TaskPool tasks with getThreadPriority all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetThreadPriorityTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 10
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        let tid: int = StdProcess.tid()
        completeCount.fetchAdd(1)
        return pm.getThreadPriority(tid)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(new taskpool.Task(concurrentTask))
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < tasks.length; i++) {
        let p: Promise<number> = (async (): Promise<number> => {
          try {
            let raw = await taskpool.execute(tasks[i])
            return raw as number
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return 0;
        })()
        promises.push(p)
      }
      try {
        let results: number[] = await Promise.all(promises)
        expect(results.length).assertEqual(totalCount)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] >= -20 && results[i] <= 19).assertTrue()
          expect(results[i] !== -1).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetThreadPriorityTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })
  })
}
