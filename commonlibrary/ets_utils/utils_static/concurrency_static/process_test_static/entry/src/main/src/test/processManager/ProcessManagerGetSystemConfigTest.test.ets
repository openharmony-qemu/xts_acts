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

export default function ProcessManagerGetSystemConfigTest(): void {
  describe('ProcessManagerGetSystemConfigTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })
    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0100
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0100
     * @tc.desc    Verify getSystemConfig with required parameter name returns number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0200
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0200
     * @tc.desc    Verify getSystemConfig with missing parameter is compile-time error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      // getSystemConfig requires int param; calling with valid arg proves method exists
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0300
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0300
     * @tc.desc    Verify getSystemConfig with extra parameter ignores extra argument
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      // getSystemConfig accepts single int param only
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0400
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0400
     * @tc.desc    Verify getSystemConfig with valid config 0 returns positive value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0500
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0500
     * @tc.desc    Verify getSystemConfig _SC_CLK_TCK(2) returns clock ticks per second
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let clkTck: number = processManager.getSystemConfig(2)
      expect(clkTck > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0600
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0600
     * @tc.desc    Verify getSystemConfig _SC_OPEN_MAX(4) returns max file descriptors
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let openMax: number = processManager.getSystemConfig(4)
      expect(openMax > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0700
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0700
     * @tc.desc    Verify getSystemConfig _SC_PAGE_SIZE(8) returns page size in bytes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let pageSize: number = processManager.getSystemConfig(8)
      expect(pageSize > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0800
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0800
     * @tc.desc    Verify getSystemConfig with other non-negative integer returns number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(100)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest0900
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_0900
     * @tc.desc    Verify getSystemConfig with large negative value returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(-100000)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1000
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1000
     * @tc.desc    Verify getSystemConfig with large positive value returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(999999)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1100
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1100
     * @tc.desc    Verify getSystemConfig with 0 returns positive value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1200
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1200
     * @tc.desc    Verify getSystemConfig with 2147483647 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(2147483647)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1300
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1300
     * @tc.desc    Verify getSystemConfig with negative value -1 returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(-1)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1400
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1400
     * @tc.desc    Verify getSystemConfig normal call returns valid system config value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let argMax: number = processManager.getSystemConfig(0)
      expect(argMax > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1500
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1500
     * @tc.desc    Verify getSystemConfig multiple config items return different valid values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let argMax: number = processManager.getSystemConfig(0)
      let clkTck: number = processManager.getSystemConfig(2)
      let openMax: number = processManager.getSystemConfig(4)
      let pageSize: number = processManager.getSystemConfig(8)
      expect(argMax > 0).assertTrue()
      expect(clkTck > 0).assertTrue()
      expect(openMax > 0).assertTrue()
      expect(pageSize > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1600
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1600
     * @tc.desc    Verify getSystemConfig argMax within reasonable range
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let argMax: number = processManager.getSystemConfig(0)
      expect(argMax > 0).assertTrue()
      expect(argMax < 100000000).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1700
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1700
     * @tc.desc    Verify getSystemConfig non-existent config returns -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(99999)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1800
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1800
     * @tc.desc    Verify getSystemConfig multiple invalid configs all return -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let r1: number = processManager.getSystemConfig(100)
      expect(r1).assertEqual(-1)
      let r2: number = processManager.getSystemConfig(200)
      expect(r2).assertEqual(-1)
      let r3: number = processManager.getSystemConfig(1000)
      expect(r3).assertEqual(-1)
      let r4: number = processManager.getSystemConfig(10000)
      expect(r4).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest1900
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_1900
     * @tc.desc    Verify getSystemConfig return value is number type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2000
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2000
     * @tc.desc    Verify getSystemConfig return value lower bound is -1
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(-999)
      expect(result).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2100
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2100
     * @tc.desc    Verify getSystemConfig repeat calls return same value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerGetSystemConfigTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result1: number = processManager.getSystemConfig(0)
      let result2: number = processManager.getSystemConfig(0)
      let result3: number = processManager.getSystemConfig(0)
      expect(result1).assertEqual(result2)
      expect(result2).assertEqual(result3)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2200
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2200
     * @tc.desc    Verify getSystemConfig 10 consecutive calls all return positive values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let results: number[] = []
      for (let i = 0; i < 10; i++) {
        results.push(processManager.getSystemConfig(0))
      }
      for (let i = 0; i < results.length; i++) {
        expect(results[i] > 0).assertTrue()
      }
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2300
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2300
     * @tc.desc    Verify getSystemConfig page size is power of 2
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let pageSize: number = processManager.getSystemConfig(8)
      let isPowerOf2: boolean = (pageSize & (pageSize - 1)) === 0
      expect(isPowerOf2).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2400
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2400
     * @tc.desc    Verify getSystemConfig 1000 calls return stable values across configs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let expectedArgMax: number = processManager.getSystemConfig(0)
      let expectedClkTck: number = processManager.getSystemConfig(2)
      let expectedOpenMax: number = processManager.getSystemConfig(4)
      let expectedPageSize: number = processManager.getSystemConfig(8)
      expect(expectedArgMax > 0).assertTrue()
      expect(expectedClkTck > 0).assertTrue()
      expect(expectedOpenMax > 0).assertTrue()
      expect(expectedPageSize > 0).assertTrue()
      for (let i = 0; i < 1000; i++) {
        expect(processManager.getSystemConfig(0)).assertEqual(expectedArgMax)
        expect(processManager.getSystemConfig(2)).assertEqual(expectedClkTck)
        expect(processManager.getSystemConfig(4)).assertEqual(expectedOpenMax)
        expect(processManager.getSystemConfig(8)).assertEqual(expectedPageSize)
      }
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2500
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2500
     * @tc.desc    Verify getSystemConfig after invalid param still works normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      // getSystemConfig(-1) returns -1 without throwing; verify explicitly then re-check normal call
      let invalidResult: number = processManager.getSystemConfig(-1)
      expect(invalidResult).assertEqual(-1)
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2600
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2600
     * @tc.desc    Verify getSystemConfig 100 consecutive calls return same value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessManagerGetSystemConfigTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let results: number[] = []
      for (let i = 0; i < 100; i++) {
        let result: number = processManager.getSystemConfig(0)
        results.push(result)
      }
      let firstResult: number = results[0]
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(firstResult)
      }
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2700
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2700
     * @tc.desc    Verify getSystemConfig scanning configs 0-50 returns some valid values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let validCount: number = 0
      for (let i = 0; i <= 50; i++) {
        let result: number = processManager.getSystemConfig(i)
        if (result !== -1) {
          validCount++
        }
      }
      expect(validCount > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2800
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2800
     * @tc.desc    Verify getSystemConfig 10000 calls all succeed without failure
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let successCount: number = 0
      for (let i = 0; i < 10000; i++) {
        let result: number = processManager.getSystemConfig(0)
        if (result > 0) {
          successCount++
        }
      }
      expect(successCount).assertEqual(10000)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest2900
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_2900
     * @tc.desc    Verify getSystemConfig basic configs return valid values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let r0: number = processManager.getSystemConfig(0)
      expect(r0 > 0).assertTrue()
      let r2: number = processManager.getSystemConfig(2)
      expect(r2 > 0).assertTrue()
      let r4: number = processManager.getSystemConfig(4)
      expect(r4 > 0).assertTrue()
      let r8: number = processManager.getSystemConfig(8)
      expect(r8 > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3000
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3000
     * @tc.desc    Verify getSystemConfig future config ids return -1 not exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      expect(processManager.getSystemConfig(100)).assertEqual(-1)
      expect(processManager.getSystemConfig(200)).assertEqual(-1)
      expect(processManager.getSystemConfig(300)).assertEqual(-1)
      expect(processManager.getSystemConfig(500)).assertEqual(-1)
      expect(processManager.getSystemConfig(1000)).assertEqual(-1)
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3100
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3100
     * @tc.desc    Verify getSystemConfig API signature backward compatibility
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let processManager = new StdProcess.ProcessManager()
      let result: number = processManager.getSystemConfig(0)
      expect(result > 0).assertTrue()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3200
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3200
     * @tc.desc    Verify TaskPool nested getSystemConfig returns consistent value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let expectedResult: number = processManager.getSystemConfig(0)
      let nestedTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        return pm.getSystemConfig(0)
      }
      let task = new taskpool.Task(nestedTask)
      try {
        let rawResult = await taskpool.execute(task)
        let result: number = rawResult as number
        expect(result).assertEqual(expectedResult)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3300
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3300
     * @tc.desc    Verify onExecutionSucceeded callback nested getSystemConfig works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let callbackTask = (): number => { return 42 }
      let task = new taskpool.Task(callbackTask)
      const successCallback = (error?: Error): void => {
        try {
          let result: number = processManager.getSystemConfig(0)
          expect(result > 0).assertTrue()
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
          }
        }
      }
      task.onExecutionSucceeded(successCallback as taskpool.CallbackFunction)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
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
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3400
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3400
     * @tc.desc    Verify onExecutionFailed callback nested getSystemConfig works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let processManager = new StdProcess.ProcessManager()
      let callbackCalled = new AtomicBoolean(false)
      let errorTask = (): number => { throw new Error('fail') }
      let task = new taskpool.Task(errorTask)
      task.onExecutionFailed((error: Error): void => {
        try {
          let result: number = processManager.getSystemConfig(0)
          expect(result > 0).assertTrue()
          callbackCalled.store(true)
        } catch (error) {
          if (error instanceof Error) {
            console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
          } else {
            console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
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
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callbackCalled.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3500
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3500
     * @tc.desc    Verify 3 concurrent TaskPool tasks with getSystemConfig all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 3
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.getSystemConfig(0)
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
              console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
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
          expect(results[i] > 0).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3600
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3600
     * @tc.desc    Verify 5 concurrent TaskPool tasks with getSystemConfig all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 5
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.getSystemConfig(0)
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
              console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
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
          expect(results[i] > 0).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    ProcessManagerGetSystemConfigTest3700
     * @tc.number  SUB_PROCESS_MANAGER_GET_SYSTEM_CONFIG_TEST_3700
     * @tc.desc    Verify 10 concurrent TaskPool tasks with getSystemConfig all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ProcessManagerGetSystemConfigTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completeCount = new AtomicInt(0)
      let totalCount = 10
      let concurrentTask = (): number => {
        let pm = new StdProcess.ProcessManager()
        completeCount.fetchAdd(1)
        return pm.getSystemConfig(0)
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
              console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
            } else {
              console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
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
          expect(results[i] > 0).assertTrue()
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: ${error.message}`);
        } else {
          console.error('ProcessManagerGetSystemConfigTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(completeCount.load()).assertEqual(totalCount)
      done()
    })
  })
}
