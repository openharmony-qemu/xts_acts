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

export default function StdProcessUptimeTest(): void {
  describe('StdProcessUptimeTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessUptimeTest0100
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0100
     * @tc.desc    Verify StdProcess.uptime() with no arguments returns non-negative long value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessUptimeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let uptime: long = StdProcess.uptime()
      expect(uptime >= 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessUptimeTest0200
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0200
     * @tc.desc    Verify StdProcess.uptime() return value is integer milliseconds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessUptimeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let uptime: long = StdProcess.uptime()
      expect(Number.isInteger(uptime)).assertTrue()
      expect(uptime >= 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessUptimeTest0300
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0300
     * @tc.desc    Verify StdProcess.uptime() consecutively returns non-decreasing values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessUptimeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let uptime1: long = StdProcess.uptime()
      let uptime2: long = StdProcess.uptime()
      expect(uptime2 >= uptime1).assertTrue()
      expect(uptime1 >= 0).assertTrue()
    })



    /**
     * @tc.name    StdProcessUptimeTest0400
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0400
     * @tc.desc    Verify StdProcess.uptime() return is not NaN
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessUptimeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let uptime: long = StdProcess.uptime()
      expect(Number.isNaN(uptime)).assertFalse()
    })

    /**
     * @tc.name    StdProcessUptimeTest0500
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0500
     * @tc.desc    Verify StdProcess.uptime() increases by approximately 2000ms after waiting 2000ms
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessUptimeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let uptime1: long = StdProcess.uptime()
      try {
        await Utils.msSleep(2000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessUptimeTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessUptimeTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      let uptime2: long = StdProcess.uptime()
      let delta: long = uptime2 - uptime1
      expect(uptime2 > uptime1).assertTrue()
      // uptime() returns milliseconds; 2000ms wait should advance uptime by at least 2000ms.
      // Allow a small tolerance (100ms) for scheduler / measurement jitter.
      expect(delta >= 1900).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest0600
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0600
     * @tc.desc    Verify StdProcess.uptime() return value is an integer number of milliseconds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessUptimeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let uptime: long = StdProcess.uptime()
      expect(Math.floor(uptime)).assertEqual(uptime)
    })

    /**
     * @tc.name    StdProcessUptimeTest0700
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0700
     * @tc.desc    Verify StdProcess.uptime() called in TaskPool returns valid uptime
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskFunc = (): number => {
        return StdProcess.uptime()
      }
      let task = new taskpool.Task(taskFunc)
      try {
        let workerUptime = await taskpool.execute(task)
        expect(workerUptime as number >= 0).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessUptimeTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessUptimeTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest0800
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0800
     * @tc.desc    Verify 5 concurrent TaskPool tasks calling uptime all return valid values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskFunc = (): number => {
        return StdProcess.uptime()
      }
      let completed: AtomicInt = new AtomicInt(0)
      for (let i = 0; i < 5; i++) {
        let task = new taskpool.Task(taskFunc)
        try {
          let result = await taskpool.execute(task)
          expect(result as number >= 0).assertTrue()
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessUptimeTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessUptimeTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
        completed.fetchAdd(1)
      }
      expect(completed.load()).assertEqual(5)
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest0900
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_0900
     * @tc.desc    Verify StdProcess.uptime() called in EAWorker.postTask callback returns valid uptime
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount: AtomicInt = new AtomicInt(0)
      let uptimeResult: number = -1
      let eaWorker: EAWorker = new EAWorker('uptWkA')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          uptimeResult = StdProcess.uptime()
          callCount.fetchAdd(1)
        })
        let startTime: number = Date.now()
        try {
          while (callCount.load() < 1 && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessUptimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessUptimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(1)
        expect(uptimeResult >= 0).assertTrue()
      } finally {
        eaWorker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest1000
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_1000
     * @tc.desc    Verify 5 EAWorkers concurrently call uptime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount: AtomicInt = new AtomicInt(0)
      let totalCount: number = 5
      let w0: EAWorker = new EAWorker('uptWkC_0')
      let w1: EAWorker = new EAWorker('uptWkC_1')
      let w2: EAWorker = new EAWorker('uptWkC_2')
      let w3: EAWorker = new EAWorker('uptWkC_3')
      let w4: EAWorker = new EAWorker('uptWkC_4')
      try {
        w0.start(); w1.start(); w2.start(); w3.start(); w4.start()
        w0.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w1.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w2.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w3.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w4.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        let startTime: number = Date.now()
        try {
          while (callCount.load() < totalCount && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessUptimeTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessUptimeTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        w0.quit(); w1.quit(); w2.quit(); w3.quit(); w4.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest1100
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_1100
     * @tc.desc    Verify 10 EAWorkers concurrently call uptime with AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount: AtomicInt = new AtomicInt(0)
      let totalCount: number = 10
      let w0: EAWorker = new EAWorker('uptWkD_0'); w0.start()
      let w1: EAWorker = new EAWorker('uptWkD_1'); w1.start()
      let w2: EAWorker = new EAWorker('uptWkD_2'); w2.start()
      let w3: EAWorker = new EAWorker('uptWkD_3'); w3.start()
      let w4: EAWorker = new EAWorker('uptWkD_4'); w4.start()
      let w5: EAWorker = new EAWorker('uptWkD_5'); w5.start()
      let w6: EAWorker = new EAWorker('uptWkD_6'); w6.start()
      let w7: EAWorker = new EAWorker('uptWkD_7'); w7.start()
      let w8: EAWorker = new EAWorker('uptWkD_8'); w8.start()
      let w9: EAWorker = new EAWorker('uptWkD_9'); w9.start()
      try {
        w0.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w1.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w2.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w3.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w4.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w5.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w6.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w7.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w8.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        w9.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          StdProcess.uptime(); callCount.fetchAdd(1)
        })
        let startTime: number = Date.now()
        try {
          while (callCount.load() < totalCount && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessUptimeTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessUptimeTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        w0.quit(); w1.quit(); w2.quit(); w3.quit(); w4.quit()
        w5.quit(); w6.quit(); w7.quit(); w8.quit(); w9.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest1200
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_1200
     * @tc.desc    Verify EAWorker.postTask nested uptime call with AtomicBoolean completion
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let uptimeResult: long = -1
      let completed: AtomicBoolean = new AtomicBoolean(false)
      let worker: EAWorker = new EAWorker('uptWkNest')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessUptimeTest worker task error param: ${error.message}`); }
          uptimeResult = StdProcess.uptime()
          completed.store(true)
        })
        let startTime: number = Date.now()
        try {
          while (!completed.load() && (Date.now() - startTime) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessUptimeTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessUptimeTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(completed.load()).assertTrue()
        expect(uptimeResult >= 0).assertTrue()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest1300
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_1300
     * @tc.desc    Verify StdProcess.uptime() in async function returns valid uptime
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let getUptime = async (): Promise<long> => {
        return StdProcess.uptime()
      }
      let uptime: long = 0
      try {
        uptime = await getUptime()
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessUptimeTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessUptimeTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(uptime >= 0).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessUptimeTest1400
     * @tc.number  SUB_STD_PROCESS_UPTIME_TEST_1400
     * @tc.desc    Verify StdProcess.uptime() TaskPool nested uptime call and counter increments
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUptimeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0)
      let nestedUptimeTask = (c: AtomicInt): number => {
        let result: long = StdProcess.uptime()
        c.fetchAdd(1)
        return result
      }
      let task = new taskpool.Task(nestedUptimeTask, counter)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessUptimeTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessUptimeTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(counter.load()).assertEqual(1)
      done()
    })
  })
}
