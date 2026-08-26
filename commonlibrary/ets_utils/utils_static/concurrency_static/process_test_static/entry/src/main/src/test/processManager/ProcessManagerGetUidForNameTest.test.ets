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

export default function ProcessManagerGetUidForNameTest(): void {
  describe('ProcessManagerGetUidForNameTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0100
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0100
     * @tc.desc    Verify getUidForName with required param "root" returns 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetUidForNameTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("root")
      expect(uid).assertEqual(0)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0200
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0200
     * @tc.desc    Verify getUidForName with empty string returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0300
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0300
     * @tc.desc    Verify getUidForName with whitespace string returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("   ")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0400
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0400
     * @tc.desc    Verify getUidForName with special characters username returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("user-name_test")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0500
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0500
     * @tc.desc    Verify getUidForName with Unicode characters username returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("\u7528\u6237\u540d")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0600
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0600
     * @tc.desc    Verify getUidForName with zero-width space username returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("user\u200Bname")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0700
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0700
     * @tc.desc    Verify getUidForName with XSS attack string and tab-char special username returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("<script>alert(1)</script>")
      expect(uid).assertEqual(-1)
      let tabUid: number = processManager.getUidForName("user\tname")
      expect(tabUid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0800
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0800
     * @tc.desc    Verify getUidForName with long string username returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let longName: string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      let uid: number = processManager.getUidForName(longName)
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest0900
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_0900
     * @tc.desc    Verify getUidForName with numeric string "12345" returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("12345")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1000
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1000
     * @tc.desc    Verify getUidForName with string containing quotes returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("user'name")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1100
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1100
     * @tc.desc    Verify getUidForName multiple calls same user return same uid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetUidForNameTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid1: number = processManager.getUidForName("root")
      let uid2: number = processManager.getUidForName("root")
      expect(uid1).assertEqual(uid2)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1200
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1200
     * @tc.desc    Verify getUidForName non-existent user returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetUidForNameTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid: number = processManager.getUidForName("nonexistent_user_12345")
      expect(uid).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1300
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1300
     * @tc.desc    Verify getUidForName 10 rapid successive calls all return same value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let results: number[] = []
      for (let i = 0; i < 10; i++) {
        results.push(processManager.getUidForName("root"))
      }
      let firstValue: number = results[0]
      let allSame: boolean = true
      for (let i = 0; i < results.length; i++) {
        if (results[i] !== firstValue) {
          allSame = false
        }
      }
      expect(allSame).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1400
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1400
     * @tc.desc    Verify getUidForName common system users: root=0, nobody=-1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid1: number = processManager.getUidForName("root")
      expect(uid1).assertEqual(0)
      let uid2: number = processManager.getUidForName("nobody")
      expect(uid2).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1500
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1500
     * @tc.desc    Verify getUidForName case sensitivity: root=0, ROOT/Root invalid=-1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid1: number = processManager.getUidForName("root")
      expect(uid1).assertEqual(0)
      let uid2: number = processManager.getUidForName("ROOT")
      expect(uid2).assertEqual(-1)
      let uid3: number = processManager.getUidForName("Root")
      expect(uid3).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1600
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1600
     * @tc.desc    Verify getUidForName leading/trailing spaces: root=0, variants invalid=-1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetUidForNameTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let uid1: number = processManager.getUidForName("root")
      expect(uid1).assertEqual(0)
      let uid2: number = processManager.getUidForName(" root")
      expect(uid2).assertEqual(-1)
      let uid3: number = processManager.getUidForName("root ")
      expect(uid3).assertEqual(-1)
      let uid4: number = processManager.getUidForName(" root ")
      expect(uid4).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1700
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1700
     * @tc.desc    Verify TaskPool nested getUidForName returns valid result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetUidForNameTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        return pm.getUidForName("root")
      }
      let task = new taskpool.Task(nestedTask)
      try {
        let rawResult = await taskpool.execute(task)
        let result: number = rawResult as number
        expect(result).assertEqual(0)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1800
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1800
     * @tc.desc    Verify onExecutionSucceeded callback nested getUidForName works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetUidForNameTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let callbackTask = (): number => { return 42 }
      let task = new taskpool.Task(callbackTask)
      const successCallback = (error?: Error): void => {
        try {
          let uid: number = processManager.getUidForName("root")
          expect(uid).assertEqual(0)
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
          }
        }
      }
      task.onExecutionSucceeded(successCallback as taskpool.CallbackFunction)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
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
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest1900
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_1900
     * @tc.desc    Verify onExecutionFailed callback nested getUidForName works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetUidForNameTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let errorTask = (): number => { throw new Error('fail') }
      let task = new taskpool.Task(errorTask)
      task.onExecutionFailed((error: Error): void => {
        try {
          let uid: number = processManager.getUidForName("root")
          expect(uid).assertEqual(0)
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
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
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest2000
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_2000
     * @tc.desc    Verify 3 concurrent TaskPool tasks with getUidForName all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetUidForNameTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 3
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.getUidForName("root")
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
              console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
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
          expect(results[i]).assertEqual(0)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest2100
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_2100
     * @tc.desc    Verify 5 concurrent TaskPool tasks with getUidForName all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetUidForNameTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 5
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.getUidForName("root")
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
              console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
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
          expect(results[i]).assertEqual(0)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerGetUidForNameTest2200
     * @tc.number  SUB_PROCESS_MANAGER_GET_UID_FOR_NAME_TEST_2200
     * @tc.desc    Verify 10 concurrent TaskPool tasks with getUidForName all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetUidForNameTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 10
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.getUidForName("root")
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
              console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
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
          expect(results[i]).assertEqual(0)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetUidForNameTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetUidForNameTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })
  })
}
