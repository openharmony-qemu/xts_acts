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

export default function StdProcessGetStartRealtimeTest(): void {
  describe('StdProcessGetStartRealtimeTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0100
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0100
     * @tc.desc    Verify StdProcess.getStartRealtime() with no arguments returns valid long value >=0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessGetStartRealtimeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let realtime: long = StdProcess.getStartRealtime()
      expect(realtime >= 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0200
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0200
     * @tc.desc    Verify return value is within long type valid range
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessGetStartRealtimeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let realtime: long = StdProcess.getStartRealtime()
      expect(realtime >= 0).assertTrue()
      let isFinite: boolean = realtime < 9007199254740991
      expect(isFinite).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0300
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0300
     * @tc.desc    Verify multiple consecutive calls return the same fixed process start time
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessGetStartRealtimeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let realtime1: long = StdProcess.getStartRealtime()
      let realtime2: long = StdProcess.getStartRealtime()
      let realtime3: long = StdProcess.getStartRealtime()
      expect(realtime1).assertEqual(realtime2)
      expect(realtime2).assertEqual(realtime3)
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0400
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0400
     * @tc.desc    Verify startRealtime in milliseconds is a non-negative value smaller than the system uptime in milliseconds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessGetStartRealtimeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let startRealtime: long = StdProcess.getStartRealtime()
      let uptimeMs: long = StdProcess.uptime()
      expect(startRealtime >= 0).assertTrue()
      expect(uptimeMs >= 0).assertTrue()
      // Both values are already in milliseconds; allow a tolerance window for scheduling overhead.
      let isReasonable: boolean = startRealtime <= uptimeMs + 10000
      expect(isReasonable).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0500
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0500
     * @tc.desc    Verify normal call does not throw exception inside try-catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessGetStartRealtimeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false
      try {
        let realtime: long = StdProcess.getStartRealtime()
        expect(realtime >= 0).assertTrue()
      } catch (error) {
        hasError = true
      }
      expect(hasError).assertFalse()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0600
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0600
     * @tc.desc    Verify getStartRealtime coexists with getPastCpuTime and both return valid values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessGetStartRealtimeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let startRealtime: long = StdProcess.getStartRealtime()
      let pastCpuTime: long = StdProcess.getPastCpuTime()
      // startRealtime is fixed (system boot to process start), pastCpuTime is cumulative
      expect(startRealtime >= 0).assertTrue()
      expect(pastCpuTime >= 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0700
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0700
     * @tc.desc    Verify high-frequency 1000 calls all return consistent non-negative values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allValid: boolean = true
      let firstValue: long = StdProcess.getStartRealtime()
      let allConsistent: boolean = true
      for (let i = 0; i < 1000; i++) {
        let realtime: long = StdProcess.getStartRealtime()
        if (realtime < 0) {
          allValid = false
          break
        }
        if (realtime !== firstValue) {
          allConsistent = false
        }
      }
      expect(allValid).assertTrue()
      expect(allConsistent).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0800
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0800
     * @tc.desc    Verify 3 EAWorkers concurrently call getStartRealtime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 3
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker('srtWkA_' + i.toString())
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessGetStartRealtimeTest worker task error param: ${error.message}`); }
            let realtime: long = StdProcess.getStartRealtime()
            callCount.fetchAdd(1)
          })
        }
        let startTime: number = Date.now()
        try {
          while (callCount.load() < totalCount && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessGetStartRealtimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetStartRealtimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest0900
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_0900
     * @tc.desc    Verify 5 EAWorkers concurrently call getStartRealtime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 5
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker('srtWkB_' + i.toString())
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessGetStartRealtimeTest worker task error param: ${error.message}`); }
            let realtime: long = StdProcess.getStartRealtime()
            callCount.fetchAdd(1)
          })
        }
        let startTime: number = Date.now()
        try {
          while (callCount.load() < totalCount && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessGetStartRealtimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetStartRealtimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest1000
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_1000
     * @tc.desc    Verify 10 EAWorkers concurrently call getStartRealtime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 10
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker('srtWkC_' + i.toString())
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessGetStartRealtimeTest worker task error param: ${error.message}`); }
            let realtime: long = StdProcess.getStartRealtime()
            callCount.fetchAdd(1)
          })
        }
        let startTime: number = Date.now()
        try {
          while (callCount.load() < totalCount && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessGetStartRealtimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetStartRealtimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest1100
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_1100
     * @tc.desc    Verify EAWorker.postTask nested call to getStartRealtime with AtomicBoolean completion
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let realtimeResult: long = -1
      let completed = new AtomicBoolean(false)
      let worker = new EAWorker('srtWkNest')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessGetStartRealtimeTest worker task error param: ${error.message}`); }
          realtimeResult = StdProcess.getStartRealtime()
          completed.store(true)
        })
        let startTime: number = Date.now()
        try {
          while (!completed.load() && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessGetStartRealtimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetStartRealtimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(completed.load()).assertTrue()
        expect(realtimeResult >= 0).assertTrue()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest1200
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_1200
     * @tc.desc    Verify getStartRealtime value remains unchanged after process runs for some time
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessGetStartRealtimeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let realtime1: long = StdProcess.getStartRealtime()
      // Wait to simulate process running for some time
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessGetStartRealtimeTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessGetStartRealtimeTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      let realtime2: long = StdProcess.getStartRealtime()
      // Process start time is fixed, should not change after running
      expect(realtime1).assertEqual(realtime2)
      done()
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest1300
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_1300
     * @tc.desc    Verify single call to getStartRealtime returns the same fixed start time as a baseline call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseline: long = StdProcess.getStartRealtime()
      let realtime: long = StdProcess.getStartRealtime()
      expect(realtime >= 0).assertTrue()
      // Process start time is fixed for the lifetime of the process; every call must agree.
      expect(realtime).assertEqual(baseline)
    })

    /**
     * @tc.name    StdProcessGetStartRealtimeTest1400
     * @tc.number  SUB_STD_PROCESS_GET_START_REALTIME_TEST_1400
     * @tc.desc    Verify 1000 consecutive calls to getStartRealtime all return the same fixed value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetStartRealtimeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseline: long = StdProcess.getStartRealtime()
      let allValid: boolean = true
      let allConsistent: boolean = true
      for (let i = 0; i < 1000; i++) {
        let realtime: long = StdProcess.getStartRealtime()
        if (realtime < 0) {
          allValid = false
          break
        }
        if (realtime !== baseline) {
          allConsistent = false
        }
      }
      expect(allValid).assertTrue()
      expect(allConsistent).assertTrue()
    })
  })
}
