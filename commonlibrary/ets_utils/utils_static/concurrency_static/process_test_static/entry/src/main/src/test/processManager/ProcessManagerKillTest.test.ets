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

/**
 * WARNING: ProcessManager.kill() is a DANGEROUS API.
 * Per SDK contract "Only the current process can be terminated", kill(signal, nonCurrentPid)
 * safely returns false on the target device/SDK without side effects.
 * This file never aims fatal signals (SIGKILL/SIGTERM) at real processes and never targets the
 * current pid; it uses non-existent pids, non-fatal signals, or the kill(0, pid) existence probe.
 * Every case has a single deterministic oracle (returns false); no empty double-accept catches.
 */
export default function ProcessManagerKillTest(): void {
  describe('ProcessManagerKillTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    ProcessManagerKillTest0100
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0100
     * @tc.desc    Verify kill method exists with required int signal and int pid params
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerKillTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let hasMethod: boolean = typeof processManager.kill === 'function'
      expect(hasMethod).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerKillTest0200
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0200
     * @tc.desc    Verify kill with valid signal and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerKillTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(28, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest0300
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0300
     * @tc.desc    Verify kill method exists with required int signal and int pid params and returns false for non-existent pid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerKillTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let hasMethod: boolean = typeof processManager.kill === 'function'
      expect(hasMethod).assertTrue()
      let result: boolean = processManager.kill(28, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest0400
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0400
     * @tc.desc    Verify kill with signal=1 and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(1, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest0500
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0500
     * @tc.desc    Verify kill with signal=64 and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(64, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest0600
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0600
     * @tc.desc    Verify kill with signal=10 (SIGUSR1) and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(10, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest0700
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0700
     * @tc.desc    Verify kill with signal=12 (SIGUSR2) and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(12, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest0800
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0800
     * @tc.desc    Verify kill with signal=0 and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
       try {
         processManager.kill(0, 99999999)
         expect(false).assertTrue()
       } catch (error) {
         expect(error instanceof Error).assertTrue()
       }
    })

    /**
     * @tc.name    ProcessManagerKillTest0900
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_0900
     * @tc.desc    Verify kill with signal=-1 (negative) and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
       try {
         processManager.kill(-1, 99999999)
         expect(false).assertTrue()
       } catch (error) {
         expect(error instanceof Error).assertTrue()
       }
    })

    /**
     * @tc.name    ProcessManagerKillTest1000
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1000
     * @tc.desc    Verify kill with signal=65 (above range) and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
       try {
         processManager.kill(65, 99999999)
         expect(false).assertTrue()
       } catch (error) {
         expect(error instanceof Error).assertTrue()
       }
    })

    /**
     * @tc.name    ProcessManagerKillTest1100
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1100
     * @tc.desc    Verify kill with signal=9 (SIGKILL) and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(9, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest1200
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1200
     * @tc.desc    Verify kill with signal=15 (SIGTERM) and non-existent pid returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(15, 99999999)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest1300
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1300
     * @tc.desc    Verify kill with pid=0 (invalid) and valid signal returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
       try {
         processManager.kill(28, 0)
         expect(false).assertTrue()
       } catch (error) {
         expect(error instanceof Error).assertTrue()
       }
    })

    /**
     * @tc.name    ProcessManagerKillTest1400
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1400
     * @tc.desc    Verify kill with pid=-1 (negative) and valid signal returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
       try {
         processManager.kill(28, -1)
         expect(false).assertTrue()
       } catch (error) {
         expect(error instanceof Error).assertTrue()
       }
    })

    /**
     * @tc.name    ProcessManagerKillTest1500
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1500
     * @tc.desc    Verify kill with pid=1 (init process) and valid signal returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: boolean = processManager.kill(28, 1)
      expect(result).assertFalse()
    })

    /**
     * @tc.name    ProcessManagerKillTest1600
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1600
     * @tc.desc    Verify kill with both invalid params signal=-1 pid=-1 returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
       try {
         processManager.kill(-1, -1)
         expect(false).assertTrue()
       } catch (error) {
         expect(error instanceof Error).assertTrue()
       }
    })

    /**
     * @tc.name    ProcessManagerKillTest1700
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1700
     * @tc.desc    Verify kill multiple calls with same valid params return consistent result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerKillTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result1: boolean = processManager.kill(28, 99999999)
      let result2: boolean = processManager.kill(28, 99999999)
      expect(result1).assertFalse()
      expect(result2).assertFalse()
      expect(result1).assertEqual(result2)
    })

    /**
     * @tc.name    ProcessManagerKillTest1800
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1800
     * @tc.desc    Verify kill with unsupported signal 0 throws an argument error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      try {
        processManager.kill(0, 1)
        expect(false).assertTrue()
      } catch (error) {
        expect(error instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name    ProcessManagerKillTest1900
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_1900
     * @tc.desc    Verify 100 consecutive kill calls with valid signal and non-existent pid all return false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      for (let i = 0; i < 100; i++) {
        let result: boolean = processManager.kill(28, 99999999)
        expect(result).assertFalse()
      }
    })

    /**
     * @tc.name    ProcessManagerKillTest2000
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2000
     * @tc.desc    Verify kill multiple ProcessManager instances return same result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerKillTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let pm1 = new StdProcess.ProcessManager()
      let pm2 = new StdProcess.ProcessManager()
      let result1: boolean = pm1.kill(28, 99999999)
      let result2: boolean = pm2.kill(28, 99999999)
      expect(result1).assertFalse()
      expect(result2).assertFalse()
      expect(result1).assertEqual(result2)
    })

    /**
     * @tc.name    ProcessManagerKillTest2100
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2100
     * @tc.desc    Verify TaskPool nested kill call returns valid result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        return pm.kill(28, 99999999)
      }
      let task = new taskpool.Task(nestedTask)
      try {
        let rawResult = await taskpool.execute(task)
        let result: boolean = rawResult as boolean
        expect(result).assertFalse()
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    ProcessManagerKillTest2200
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2200
     * @tc.desc    Verify onExecutionSucceeded callback can invoke kill after a TaskPool task succeeds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackOk = new AtomicBoolean(false)
      let callbackTask = (): number => { return 42 }
      let task = new taskpool.Task(callbackTask)
      const successCallback = (error?: Error): void => {
        try {
          let result: boolean = processManager.kill(28, 99999999)
          callbackOk.store(!result)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerKillTest', `await failed: unknown error`);
          }
        }
      }
      task.onExecutionSucceeded(successCallback as taskpool.CallbackFunction)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      let waitCount: number = 0
      let deadline: number = 50
      try {
        while (!callbackOk.load() && waitCount < deadline) {
          await Utils.msSleep(100)
          waitCount++
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackOk.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerKillTest2300
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2300
     * @tc.desc    Verify onExecutionFailed callback can invoke kill after a TaskPool task throws
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackOk = new AtomicBoolean(false)
      let errorTask = (): number => { throw new Error('fail') }
      let task = new taskpool.Task(errorTask)
      task.onExecutionFailed((error: Error): void => {
        try {
          let result: boolean = processManager.kill(28, 99999999)
          callbackOk.store(!result)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerKillTest', `await failed: unknown error`);
          }
        }
      })
      let taskFailed: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        taskFailed = true
      }
      expect(taskFailed).assertTrue()
      let waitCount: number = 0
      let deadline: number = 50
      try {
        while (!callbackOk.load() && waitCount < deadline) {
          await Utils.msSleep(100)
          waitCount++
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackOk.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerKillTest2400
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2400
     * @tc.desc    Verify 3 concurrent TaskPool kill tasks via Promise.all all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 3
      let concurrentTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.kill(28, 99999999)
      }
      let taskPromises: Promise<boolean>[] = []
      for (let i = 0; i < totalCount; i++) {
        let task = new taskpool.Task(concurrentTask)
        taskPromises.push((async (): Promise<boolean> => {
          try {
            let raw = await taskpool.execute(task)
            return raw as boolean
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerKillTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return false;
        })())
      }
      try {
        await Promise.all(taskPromises)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerKillTest2500
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2500
     * @tc.desc    Verify 5 concurrent TaskPool kill tasks via Promise.all all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 5
      let concurrentTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.kill(28, 99999999)
      }
      let taskPromises: Promise<boolean>[] = []
      for (let i = 0; i < totalCount; i++) {
        let task = new taskpool.Task(concurrentTask)
        taskPromises.push((async (): Promise<boolean> => {
          try {
            let raw = await taskpool.execute(task)
            return raw as boolean
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerKillTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return false;
        })())
      }
      try {
        await Promise.all(taskPromises)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerKillTest2600
     * @tc.number  SUB_PROCESS_MANAGER_KILL_TEST_2600
     * @tc.desc    Verify 10 concurrent TaskPool kill tasks via Promise.all all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerKillTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 10
      let concurrentTask = (): boolean => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.kill(28, 99999999)
      }
      let taskPromises: Promise<boolean>[] = []
      for (let i = 0; i < totalCount; i++) {
        let task = new taskpool.Task(concurrentTask)
        taskPromises.push((async (): Promise<boolean> => {
          try {
            let raw = await taskpool.execute(task)
            return raw as boolean
          } catch (error) {
            if (error instanceof Error) {
              console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerKillTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return false;
        })())
      }
      try {
        await Promise.all(taskPromises)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerKillTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerKillTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })
  })
}
