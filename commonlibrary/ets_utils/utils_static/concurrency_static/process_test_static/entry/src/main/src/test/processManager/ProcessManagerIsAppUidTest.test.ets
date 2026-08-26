'use static'
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

export default function ProcessManagerIsAppUidTest(): void {
  describe('ProcessManagerIsAppUidTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0100
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0100
     * @tc.desc    Verify isAppUid method exists with required int param
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerIsAppUidTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let hasMethod: boolean = typeof processManager.isAppUid === 'function'
      expect(hasMethod).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0200
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0200
     * @tc.desc    Verify isAppUid compile-time type check requires int param
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerIsAppUidTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let hasMethod: boolean = typeof processManager.isAppUid === 'function'
      expect(hasMethod).assertTrue()
      let uid: int = StdProcess.uid()
      let result: boolean = processManager.isAppUid(uid)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0300
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0300
     * @tc.desc    Verify isAppUid with common UID range values 1001, 5000 and 9999 returns boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result1: boolean = processManager.isAppUid(1001)
      let result2: boolean = processManager.isAppUid(5000)
      let result3: boolean = processManager.isAppUid(9999)
      expect(result1).assertFalse()
      expect(result2).assertFalse()
      expect(result3).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0400
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0400
     * @tc.desc    Verify isAppUid with int max 2147483647 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(2147483647)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0500
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0500
     * @tc.desc    Verify isAppUid with int min -2147483648 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(-2147483648)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0600
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0600
     * @tc.desc    Verify isAppUid with zero UID returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(0)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0700
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0700
     * @tc.desc    Verify isAppUid with negative UID -1 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(-1)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0800
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0800
     * @tc.desc    Verify isAppUid with system UID 1000 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(1000)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest0900
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_0900
     * @tc.desc    Verify isAppUid with non-app system UID 999999 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1000
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1000
     * @tc.desc    Verify isAppUid with current app UID returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerIsAppUidTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: int = StdProcess.uid()
      let result: boolean = processManager.isAppUid(uid)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1100
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1100
     * @tc.desc    Verify isAppUid with non-app UID 99999 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerIsAppUidTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(99999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1200
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1200
     * @tc.desc    Verify isAppUid multiple calls with same uid return consistent result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerIsAppUidTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: int = StdProcess.uid()
      let result1: boolean = processManager.isAppUid(uid)
      let result2: boolean = processManager.isAppUid(uid)
      let result3: boolean = processManager.isAppUid(uid)
      expect(result1).assertEqual(result2)
      expect(result2).assertEqual(result3)
      expect(result1).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1300
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1300
     * @tc.desc    Verify isAppUid different ProcessManager instances return same result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pm1 = new StdProcess.ProcessManager()
      let pm2 = new StdProcess.ProcessManager()
      let uid: int = StdProcess.uid()
      let result1: boolean = pm1.isAppUid(uid)
      let result2: boolean = pm2.isAppUid(uid)
      expect(result1).assertEqual(result2)
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1400
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1400
     * @tc.desc    Verify isAppUid instance reusable after call with invalid uid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: int = StdProcess.uid()
      let validResult: boolean = processManager.isAppUid(uid)
      let invalidResult: boolean = processManager.isAppUid(-1)
      expect(invalidResult).assertFalse()
      let validResult2: boolean = processManager.isAppUid(uid)
      expect(validResult).assertEqual(validResult2)
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1500
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1500
     * @tc.desc    Verify isAppUid with super large value at type level returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(2147483647)
      expect(result).assertFalse()
      let processManager2 = new StdProcess.ProcessManager()
      expect(typeof processManager2.isAppUid === 'function').assertTrue()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1600
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1600
     * @tc.desc    Verify isAppUid multi-process UID judgment distinguishes app and non-app UIDs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let myUid: int = StdProcess.uid()
      let result: boolean = processManager.isAppUid(myUid)
      expect(result).assertTrue()
      let otherResult: boolean = processManager.isAppUid(0)
      expect(otherResult).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1700
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1700
     * @tc.desc    Verify isAppUid batch 10000 calls complete correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let currentUid: int = StdProcess.uid()
      let trueCount: number = 0
      let falseCount: number = 0
      let currentUidDetected: boolean = false
      for (let i = 0; i < 10000; i++) {
        let result: boolean = processManager.isAppUid(i)
        if (result) {
          trueCount++
        } else {
          falseCount++
        }
        if (i === currentUid && result) {
          currentUidDetected = true
        }
      }
      expect(trueCount + falseCount).assertEqual(10000)
      if (currentUid >= 0 && currentUid < 10000) {
        expect(currentUidDetected).assertTrue()
      }
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1800
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1800
     * @tc.desc    Verify isAppUid integration with getUidForName returns boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let rootUid: int = processManager.getUidForName("root")
      let result: boolean = processManager.isAppUid(rootUid)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest1900
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_1900
     * @tc.desc    Verify isAppUid API compatibility returns boolean for current uid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerIsAppUidTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.isAppUid(StdProcess.uid())
      expect(result).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest2000
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_2000
     * @tc.desc    Verify TaskPool nested isAppUid returns valid result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        let uid: int = StdProcess.uid()
        return pm.isAppUid(uid)
      }
      let task = new taskpool.Task(nestedTask)
      try {
        let rawResult = await taskpool.execute(task)
        let result: boolean = rawResult as boolean
        expect(result).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest2100
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_2100
     * @tc.desc    Verify onExecutionSucceeded callback nested isAppUid works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let callbackTask = (): number => { return 42 }
      let task = new taskpool.Task(callbackTask)
      const successCallback = (error?: Error): void => {
        try {
          let uid: int = StdProcess.uid()
          processManager.isAppUid(uid)
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
          }
        }
      }
      task.onExecutionSucceeded(successCallback as taskpool.CallbackFunction)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
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
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest2200
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_2200
     * @tc.desc    Verify onExecutionFailed callback nested isAppUid works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let errorTask = (): number => { throw new Error('fail') }
      let task = new taskpool.Task(errorTask)
      task.onExecutionFailed((error: Error): void => {
        try {
          let uid: int = StdProcess.uid()
          processManager.isAppUid(uid)
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
          }
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
      let deadline: number = Date.now() + 5000
      try {
        while (!callbackCalled.load() && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest2300
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_2300
     * @tc.desc    Verify 3 concurrent TaskPool tasks with isAppUid all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 3
      let concurrentTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        let uid: int = StdProcess.uid()
        completeCount.fetchAdd(1)
        return pm.isAppUid(uid)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(new taskpool.Task(concurrentTask))
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < tasks.length; i++) {
        let p: Promise<boolean> = (async (): Promise<boolean> => {
          try {
            let raw = await taskpool.execute(tasks[i])
            return raw as boolean
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return false;
        })()
        promises.push(p)
      }
      try {
        let results: boolean[] = await Promise.all(promises)
        expect(results.length).assertEqual(totalCount)
        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest2400
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_2400
     * @tc.desc    Verify 5 concurrent TaskPool tasks with isAppUid all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 5
      let concurrentTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        let uid: int = StdProcess.uid()
        completeCount.fetchAdd(1)
        return pm.isAppUid(uid)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(new taskpool.Task(concurrentTask))
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < tasks.length; i++) {
        let p: Promise<boolean> = (async (): Promise<boolean> => {
          try {
            let raw = await taskpool.execute(tasks[i])
            return raw as boolean
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return false;
        })()
        promises.push(p)
      }
      try {
        let results: boolean[] = await Promise.all(promises)
        expect(results.length).assertEqual(totalCount)
        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerIsAppUidTest2500
     * @tc.number  SUB_PROCESS_MANAGER_IS_APP_UID_TEST_2500
     * @tc.desc    Verify 10 concurrent TaskPool tasks with isAppUid all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerIsAppUidTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 10
      let concurrentTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        let uid: int = StdProcess.uid()
        completeCount.fetchAdd(1)
        return pm.isAppUid(uid)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(new taskpool.Task(concurrentTask))
      }
      let promises: Promise<boolean>[] = []
      for (let i = 0; i < tasks.length; i++) {
        let p: Promise<boolean> = (async (): Promise<boolean> => {
          try {
            let raw = await taskpool.execute(tasks[i])
            return raw as boolean
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return false;
        })()
        promises.push(p)
      }
      try {
        let results: boolean[] = await Promise.all(promises)
        expect(results.length).assertEqual(totalCount)
        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerIsAppUidTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerIsAppUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })
  })
}
