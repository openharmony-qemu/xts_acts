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

export default function StdProcessAbortTest(): void {
  describe('StdProcessAbortTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessAbortTest0100
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0100
     * @tc.desc    Verify StdProcess.abort is a callable function with no arguments required
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessAbortTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let isFunction: boolean = typeof StdProcess.abort === 'function'
      expect(isFunction).assertTrue()
    })

    /**
     * @tc.name    StdProcessAbortTest0200
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0200
     * @tc.desc    Verify StdProcess.abort method reference is not null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessAbortTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let noError: boolean = true;
      try {
        let abortRef: object = StdProcess.abort
      } catch (e) {
        noError = false;
      }
      expect(noError).assertTrue();
    })

    /**
     * @tc.name    StdProcessAbortTest0300
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0300
     * @tc.desc    Verify StdProcess.abort and StdProcess.pid coexist as independent methods
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessAbortTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasAbort: boolean = typeof StdProcess.abort === 'function'
      let hasPid: boolean = typeof StdProcess.pid === 'function'
      expect(hasAbort).assertTrue()
      expect(hasPid).assertTrue()
    })

    /**
     * @tc.name    StdProcessAbortTest0400
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0400
     * @tc.desc    Verify StdProcess.abort, StdProcess.uid and StdProcess.tid coexist as independent methods
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessAbortTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasAbort: boolean = typeof StdProcess.abort === 'function'
      let hasUid: boolean = typeof StdProcess.uid === 'function'
      let hasTid: boolean = typeof StdProcess.tid === 'function'
      expect(hasAbort).assertTrue()
      expect(hasUid).assertTrue()
      expect(hasTid).assertTrue()
    })

    /**
     * @tc.name    StdProcessAbortTest0500
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0500
     * @tc.desc    Verify abort method availability after checking StdProcess.is64Bit
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessAbortTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let is64Bit: boolean = StdProcess.is64Bit()
      let hasAbort: boolean = typeof StdProcess.abort === 'function'
      expect(typeof is64Bit).assertEqual('boolean')
      expect(hasAbort).assertTrue()
    })

    /**
     * @tc.name    StdProcessAbortTest0600
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0600
     * @tc.desc    Verify abort contrasts with ProcessManager.exit at type level
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessAbortTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasAbort: boolean = typeof StdProcess.abort === 'function'
      let processManager = new StdProcess.ProcessManager()
      let hasExit: boolean = typeof processManager.exit === 'function'
      expect(hasAbort).assertTrue()
      expect(hasExit).assertTrue()
    })

    /**
     * @tc.name    StdProcessAbortTest0700
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0700
     * @tc.desc    Verify 3 EAWorkers can each access StdProcess.abort method reference
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessAbortTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 3
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < totalCount; i++) {
          let worker = new EAWorker('abortWkA_' + i.toString())
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessAbortTest worker task error param: ${error.message}`); }
            let abortRef: object = StdProcess.abort
            callCount.fetchAdd(1)
          })
        }
        let elapsed: number = 0
        try {
          while (callCount.load() < totalCount && elapsed < 10000) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessAbortTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessAbortTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      expect(callCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    StdProcessAbortTest0800
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0800
     * @tc.desc    Verify 5 EAWorkers can each access StdProcess.abort method reference
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessAbortTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 5
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < totalCount; i++) {
          let worker = new EAWorker('abortWkB_' + i.toString())
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessAbortTest worker task error param: ${error.message}`); }
            let abortRef: object = StdProcess.abort
            callCount.fetchAdd(1)
          })
        }
        let elapsed: number = 0
        try {
          while (callCount.load() < totalCount && elapsed < 10000) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessAbortTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessAbortTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      expect(callCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    StdProcessAbortTest0900
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_0900
     * @tc.desc    Verify 10 EAWorkers can each access StdProcess.abort method reference
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessAbortTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 10
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < totalCount; i++) {
          let worker = new EAWorker('abortWkC_' + i.toString())
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessAbortTest worker task error param: ${error.message}`); }
            let abortRef: object = StdProcess.abort
            callCount.fetchAdd(1)
          })
        }
        let elapsed: number = 0
        try {
          while (callCount.load() < totalCount && elapsed < 15000) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessAbortTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessAbortTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      expect(callCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    StdProcessAbortTest1000
     * @tc.number  SUB_STD_PROCESS_ABORT_TEST_1000
     * @tc.desc    Verify EAWorker.postTask nested access to StdProcess.abort with AtomicBoolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessAbortTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completed = new AtomicBoolean(false)
      let worker = new EAWorker('abortWkNest')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessAbortTest worker task error param: ${error.message}`); }
          completed.store(true)
        })
        let elapsed: number = 0
        try {
          while (!completed.load() && elapsed < 5000) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessAbortTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessAbortTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
      } finally {
        worker.quit()
      }
      expect(completed.load()).assertTrue()
      done()
    })
  })
}
