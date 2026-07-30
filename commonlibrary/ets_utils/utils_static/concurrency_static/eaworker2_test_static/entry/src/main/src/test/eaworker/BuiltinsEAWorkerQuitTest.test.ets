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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

export default function BuiltinsEAWorkerQuitTest(): void {
  describe('BuiltinsEAWorkerQuitTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0100
     * @tc.desc   Verify EAWorker.quit() returns void type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('quitType')
      eaWorker.start()
      let result: void = eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0200
     * @tc.desc   Verify EAWorker.quit() after start sets isAlive to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('quitAlive')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0300
     * @tc.desc   Verify EAWorker.quit() without start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerQuitTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('quitNoStart')
      let caught: boolean = false
      try {
        eaWorker.quit()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0400
     * @tc.desc   Verify EAWorker.quit() with no tasks completes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('quitNoTasks')
      eaWorker.start()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0500
     * @tc.desc   Verify EAWorker.quit() after run task waits for completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let taskCompleted: boolean = false
      let eaWorker = new EAWorker('quitAfterRun')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        taskCompleted = true
        return 42
      }).Await()
      expect(result).assertEqual(42)
      expect(taskCompleted).assertTrue()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0600
     * @tc.desc   Verify EAWorker.quit() after quit cannot run new tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerQuitTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('quitAfterQuit')
      eaWorker.start()
      eaWorker.quit()
      let caught: boolean = false
      try {
        eaWorker.run<number>((): number => 100).Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0700
     * @tc.desc   Verify EAWorker.quit() after quit cannot start again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerQuitTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('quitRestart')
      eaWorker.start()
      eaWorker.quit()
      let caught: boolean = false
      try {
        eaWorker.start()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0800
     * @tc.desc   Verify EAWorker.quit() with try-catch-finally executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerQuitTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let finallyExecuted: boolean = false
      let eaWorker = new EAWorker('quitTryCatch')
      eaWorker.start()
      try {
        eaWorker.quit()
      } catch (e) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_0900
     * @tc.desc   Verify EAWorker.quit() sequentially on 5 workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerQuitTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`quitSeq_${i}`)
        worker.start()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].quit()
      }
      let allDead: boolean = true
      for (let i = 0; i < workers.length; i++) {
        if (workers[i].isAlive()) {
          allDead = false
        }
      }
      expect(allDead).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1000
     * @tc.desc   Verify EAWorker.quit() concurrently on 3 workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerQuitTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 3; i++) {
        let worker = new EAWorker(`quitConc3_${i}`)
        worker.start()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].quit()
      }
      let deadCount: number = 0
      for (let i = 0; i < workers.length; i++) {
        if (!workers[i].isAlive()) {
          deadCount++
        }
      }
      expect(deadCount).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1100
     * @tc.desc   Verify EAWorker.quit() concurrently on 10 workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerQuitTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 10; i++) {
        let worker = new EAWorker(`quitConc10_${i}`)
        worker.start()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].quit()
      }
      let deadCount: number = 0
      for (let i = 0; i < workers.length; i++) {
        if (!workers[i].isAlive()) {
          deadCount++
        }
      }
      expect(deadCount).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1200
     * @tc.desc   Verify EAWorker.quit() vs join() difference: quit is synchronous
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker1 = new EAWorker('quitVsJoin1')
      let eaWorker2 = new EAWorker('quitVsJoin2')
      eaWorker1.start()
      eaWorker2.start()
      eaWorker1.quit()
      expect(eaWorker1.isAlive()).assertFalse()
      eaWorker2.join().Await()
      expect(eaWorker2.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1300
     * @tc.desc   Verify EAWorker.quit() after postTask terminates worker immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let executed: boolean = false
      let eaWorker = new EAWorker('quitPostTask')
      eaWorker.start()
      eaWorker.postTask((): void => { executed = true })
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1400
     * @tc.desc   Verify EAWorker.quit() with initial task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker('quitInitTask', (): void => { taskExecuted = true })
      eaWorker.start()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1500
     * @tc.desc   Verify EAWorker.quit() performance measurement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerQuitTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('quitPerf')
      eaWorker.start()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1600
     * @tc.desc   Verify EAWorker.quit() with needInterop=true completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerQuitTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('quitInterop', true)
      eaWorker.start()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1700
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1700
     * @tc.desc   Verify EAWorker.quit() multiple calls on same worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerQuitTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('quitMulti')
      eaWorker.start()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
      let caught: boolean = false
      try {
        eaWorker.quit()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1800
     * @tc.desc   Verify EAWorker.quit() concurrently on 5 workers all stop correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerQuitTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`quit5_${i}`)
        worker.start()
        workers.push(worker)
      }
      workers.forEach((w: EAWorker): void => { w.quit() })
      let allStopped: boolean = false
      let retryCount: number = 0
      while (!allStopped && retryCount < 10) {
        Utils.syncSleep(100)
        allStopped = true
        for (let i = 0; i < workers.length; i++) {
          if (workers[i].isAlive()) {
            allStopped = false
          }
        }
        retryCount++
      }
      expect(allStopped).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerQuitTest1900
     * @tc.number SUB_BUILTINS_EAWORKER_QUIT_TEST_1900
     * @tc.desc   Verify EAWorker.quit() nested EAWorker quits independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerQuitTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nestedCreated: boolean = false
      let eaWorker = new EAWorker('outerQuit')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        let nestedWorker = new EAWorker('nestedQuit')
        nestedWorker.start()
        nestedCreated = true
        return 100
      }).Await()
      expect(result).assertEqual(100)
      expect(nestedCreated).assertTrue()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })
  })
}
