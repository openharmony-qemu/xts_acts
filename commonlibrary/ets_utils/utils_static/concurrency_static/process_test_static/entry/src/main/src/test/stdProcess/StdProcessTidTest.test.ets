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

export default function StdProcessTidTest(): void {
  describe('StdProcessTidTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessTidTest0100
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0100
     * @tc.desc    Verify StdProcess.tid() with no arguments returns positive integer
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessTidTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let tid: int = StdProcess.tid()
      expect(tid).assertLarger(0)
    })

    /**
     * @tc.name    StdProcessTidTest0200
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0200
     * @tc.desc    Verify StdProcess.tid() static no-arg signature returns a valid stable positive integer tid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessTidTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // tid() declares a fixed static no-arg signature (ArkTS rejects extra args at compile time),
      // so the documented signature is exercised directly here and the returned tid must be real and stable.
      let tid: int = StdProcess.tid()
      let tidAgain: int = StdProcess.tid()
      expect(tid).assertLarger(0)
      expect(Number.isInteger(tid)).assertTrue()
      expect(tid).assertEqual(tidAgain)
    })



    /**
     * @tc.name    StdProcessTidTest0300
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0300
     * @tc.desc    Verify StdProcess.tid() return type is int and integer
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessTidTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let tid: int = StdProcess.tid()
      expect(typeof tid).assertEqual('int')
      expect(Number.isInteger(tid)).assertTrue()
    })

    /**
     * @tc.name    StdProcessTidTest0400
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0400
     * @tc.desc    Verify StdProcess.tid() same thread multiple calls return same value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessTidTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let tid1: int = StdProcess.tid()
      let tid2: int = StdProcess.tid()
      let tid3: int = StdProcess.tid()
      expect(tid1).assertEqual(tid2)
      expect(tid2).assertEqual(tid3)
    })



    /**
     * @tc.name    StdProcessTidTest0500
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0500
     * @tc.desc    Verify StdProcess.tid() consistency within same async call chain
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessTidTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let asyncTask1 = async () => {
        return StdProcess.tid()
      }
      let tid1: int = StdProcess.tid()
      let tid2: int = 0
      try {
        tid2 = await asyncTask1()
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessTidTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessTidTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(tid1).assertEqual(tid2)
      expect(tid2 > 0).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessTidTest0600
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0600
     * @tc.desc    Verify StdProcess.tid() called in TaskPool tasks increments counter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessTidTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let completed: AtomicInt = new AtomicInt(0)
      for (let i = 1; i <= 3; i++) {
        let tracedTask = (c: AtomicInt) => {
          StdProcess.tid()
          c.fetchAdd(1)
        }
        let task = new taskpool.Task(tracedTask, completed)
        try {
          await taskpool.execute(task)
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessTidTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessTidTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
      }
      expect(completed.load()).assertEqual(3)
      done()
    })



    /**
     * @tc.name    StdProcessTidTest0700
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0700
     * @tc.desc    Verify TaskPool task calling StdProcess.tid() increments counter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessTidTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0)
      let nestedTidTask = (c: AtomicInt): number => {
        let result: int = StdProcess.tid()
        c.fetchAdd(1)
        return result
      }
      let task = new taskpool.Task(nestedTidTask, counter)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessTidTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessTidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(counter.load()).assertEqual(1)
      done()
    })

    /**
     * @tc.name    StdProcessTidTest0800
     * @tc.number  SUB_STD_PROCESS_TID_TEST_0800
     * @tc.desc    Verify 3 TaskPool tasks with AtomicInt counting all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessTidTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0)
      let totalCount: number = 3
      let concurrentTidTask = (c: AtomicInt): number => {
        let result: int = StdProcess.tid()
        c.fetchAdd(1)
        return result
      }
      for (let i = 0; i < totalCount; i++) {
        let task = new taskpool.Task(concurrentTidTask, counter)
        try {
          await taskpool.execute(task)
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessTidTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessTidTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
      }
      expect(counter.load()).assertEqual(totalCount)
      done()
    })

    })
}
