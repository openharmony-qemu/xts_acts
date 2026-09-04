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

export default function StdProcessGetPastCpuTimeTest(): void {
  describe('StdProcessGetPastCpuTimeTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0100
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0100
     * @tc.desc    Verify StdProcess.getPastCpuTime() with no arguments returns valid long value >=0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessGetPastCpuTimeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cpuTime: long = StdProcess.getPastCpuTime()
      expect(cpuTime >= 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0200
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0200
     * @tc.desc    Verify return value is within long type valid range
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessGetPastCpuTimeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cpuTime: long = StdProcess.getPastCpuTime()
      expect(cpuTime >= 0).assertTrue()
      let isFinite: boolean = cpuTime < 9007199254740991
      expect(isFinite).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0300
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0300
     * @tc.desc    Verify CPU time is monotonically non-decreasing after a CPU-intensive loop
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessGetPastCpuTimeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cpuTime1: long = StdProcess.getPastCpuTime()
      let sum: number = 0
      for (let i = 0; i < 1000000; i++) {
        sum += i
      }
      let cpuTime2: long = StdProcess.getPastCpuTime()
      expect(cpuTime2 >= cpuTime1).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0400
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0400
     * @tc.desc    Verify 10 consecutive calls return monotonically non-decreasing values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessGetPastCpuTimeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let results: long[] = []
      for (let i = 0; i < 10; i++) {
        results.push(StdProcess.getPastCpuTime())
      }
      for (let i = 1; i < results.length; i++) {
        expect(results[i] >= results[i - 1]).assertTrue()
      }
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0500
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0500
     * @tc.desc    Verify normal call does not throw exception inside try-catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessGetPastCpuTimeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false
      try {
        let cpuTime: long = StdProcess.getPastCpuTime()
        expect(cpuTime >= 0).assertTrue()
      } catch (error) {
        hasError = true
      }
      expect(hasError).assertFalse()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0600
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0600
     * @tc.desc    Verify high-frequency 1000 calls all return valid non-negative values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allValid: boolean = true
      for (let i = 0; i < 1000; i++) {
        let cpuTime: long = StdProcess.getPastCpuTime()
        if (cpuTime < 0) {
          allValid = false
          break
        }
      }
      expect(allValid).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0700
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0700
     * @tc.desc    Verify CPU time and system uptime both return non-negative millisecond values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cpuTime: long = StdProcess.getPastCpuTime()
      let uptimeMs: long = StdProcess.uptime()
      expect(cpuTime >= 0).assertTrue()
      expect(uptimeMs >= 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest0800
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0800
     * @tc.desc    Verify 3 EAWorkers concurrently call getPastCpuTime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 3
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker('cpuWkA_' + i.toString())
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessGetPastCpuTimeTest worker task error param: ${error.message}`); }
            let cpuTime: long = StdProcess.getPastCpuTime()
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
            console.error('StdProcessGetPastCpuTimeTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: unknown error`);
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
     * @tc.name    StdProcessGetPastCpuTimeTest0900
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_0900
     * @tc.desc    Verify 5 EAWorkers concurrently call getPastCpuTime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 5
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker('cpuWkB_' + i.toString())
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessGetPastCpuTimeTest worker task error param: ${error.message}`); }
            let cpuTime: long = StdProcess.getPastCpuTime()
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
            console.error('StdProcessGetPastCpuTimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: unknown error`)
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
     * @tc.name    StdProcessGetPastCpuTimeTest1000
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_1000
     * @tc.desc    Verify 10 EAWorkers concurrently call getPastCpuTime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 10
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker('cpuWkC_' + i.toString())
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessGetPastCpuTimeTest worker task error param: ${error.message}`); }
            let cpuTime: long = StdProcess.getPastCpuTime()
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
            console.error('StdProcessGetPastCpuTimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: unknown error`)
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
     * @tc.name    StdProcessGetPastCpuTimeTest1100
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_1100
     * @tc.desc    Verify EAWorker.run returns a non-negative getPastCpuTime result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let worker = new EAWorker('cpuWkNest')
      try {
        worker.start()
        let job = worker.run<long>((error?: Error): long => {
          if (error !== undefined) { console.info(`StdProcessGetPastCpuTimeTest worker task error param: ${error.message}`); }
          return StdProcess.getPastCpuTime()
        })
        let cpuTimeResult: long = job.Await()
        expect(cpuTimeResult >= 0).assertTrue()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest1200
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_1200
     * @tc.desc    Verify getPastCpuTime combined with getStartRealtime returns consistent values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let startRealtime: long = StdProcess.getStartRealtime()
      let cpuTime: long = StdProcess.getPastCpuTime()
      expect(startRealtime >= 0).assertTrue()
      expect(cpuTime >= 0).assertTrue()
      // getStartRealtime is in milliseconds, both should be non-negative
      let bothValid: boolean = startRealtime >= 0 && cpuTime >= 0
      expect(bothValid).assertTrue()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest1300
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_1300
     * @tc.desc    Verify EAWorker.run callback nested getPastCpuTime returns non-negative value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let worker = new EAWorker('cpuWkNested2')
      try {
        worker.start()
        let job = worker.run<long>((error?: Error): long => {
          if (error !== undefined) { console.info(`StdProcessGetPastCpuTimeTest worker task error param: ${error.message}`); }
          let nested = (): long => StdProcess.getPastCpuTime()
          return nested()
        })
        let cpuTimeResult: long = job.Await()
        try {
          await Utils.msSleep(100)
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(cpuTimeResult >= 0).assertTrue()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessGetPastCpuTimeTest1400
     * @tc.number  SUB_STD_PROCESS_GET_PAST_CPU_TIME_TEST_1400
     * @tc.desc    Verify MessageHandler callback nested getPastCpuTime returns non-negative value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessGetPastCpuTimeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let cpuOk = new AtomicBoolean(false)
      let eaWorker = new EAWorker('cpuWkMsgNested')
      try {
        eaWorker.start()
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cpuTime: long = StdProcess.getPastCpuTime()
          cpuOk.store(cpuTime >= 0)
          callCount.fetchAdd(1)
        }, eaWorker)
        let msg = new concurrency.Message(messageHandler)
        msg.sendToTarget()
        let deadline: number = Date.now() + 5000
        try {
          while (callCount.load() < 1 && Date.now() < deadline) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessGetPastCpuTimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        let countDone: boolean = callCount.load() === 1
        let cpuValid: boolean = cpuOk.load()
        expect(countDone).assertTrue()
        expect(cpuValid).assertTrue()
      } finally {
        if (eaWorker.isAlive()) {
          eaWorker.quit()
        }
      }
      done()
    })
  })
}
