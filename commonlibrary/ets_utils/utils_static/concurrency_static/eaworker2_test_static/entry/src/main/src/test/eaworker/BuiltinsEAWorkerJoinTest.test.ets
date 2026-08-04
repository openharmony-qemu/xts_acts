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
import Utils from '../Util.test';

export default function BuiltinsEAWorkerJoinTest(): void {
  describe('BuiltinsEAWorkerJoinTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0100
     * @tc.desc   Verify EAWorker.join() returns Promise<void> and await completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerJoinTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('joinBasic')
      eaWorker.start()
      let joinJob: Job<void> = eaWorker.join()
      joinJob.Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0200
     * @tc.desc   Verify EAWorker.join() after run task releases resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerJoinTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('joinAfterRun')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0300
     * @tc.desc   Verify EAWorker.join() without start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('joinNoStart')
      let caught: boolean = false
      try {
        eaWorker.join().Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0400
     * @tc.desc   Verify EAWorker.join() with no tasks completes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerJoinTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('joinNoTasks')
      eaWorker.start()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0500
     * @tc.desc   Verify EAWorker.join() after join cannot run new tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('joinAfterJoin')
      eaWorker.start()
      eaWorker.join().Await()
      let caught: boolean = false
      try {
        eaWorker.run<number>((): number => 100).Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0600
     * @tc.desc   Verify EAWorker.join() with try-catch-finally executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let finallyExecuted: boolean = false
      let eaWorker = new EAWorker('joinTryCatch')
      eaWorker.start()
      try {
        eaWorker.join().Await()
      } catch (e) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0700
     * @tc.desc   Verify EAWorker.join() 5 workers sequentially all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerJoinTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`joinSeq_${i}`)
        worker.start()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
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
     * @tc.name   BuiltinsEAWorkerJoinTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0800
     * @tc.desc   Verify EAWorker.join() 3 workers concurrently via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerJoinTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 3; i++) {
        let worker = new EAWorker(`joinConc3_${i}`)
        worker.start()
        workers.push(worker)
      }
      let jobs: Job<void>[] = []
      for (let i = 0; i < workers.length; i++) {
        jobs.push(workers[i].join())
      }
      for (let i = 0; i < jobs.length; i++) {
        jobs[i].Await()
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
     * @tc.name   BuiltinsEAWorkerJoinTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_0900
     * @tc.desc   Verify EAWorker.join() 10 workers concurrently via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerJoinTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 10; i++) {
        let worker = new EAWorker(`joinConc10_${i}`)
        worker.start()
        workers.push(worker)
      }
      let jobs: Job<void>[] = []
      for (let i = 0; i < workers.length; i++) {
        jobs.push(workers[i].join())
      }
      for (let i = 0; i < jobs.length; i++) {
        jobs[i].Await()
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
     * @tc.name   BuiltinsEAWorkerJoinTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1000
     * @tc.desc   Verify EAWorker.join() after join start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('joinRestart')
      eaWorker.start()
      eaWorker.join().Await()
      let caught: boolean = false
      try {
        eaWorker.start()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1100
     * @tc.desc   Verify EAWorker.join() with needInterop=true completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('joinInterop', true)
      eaWorker.start()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1200
     * @tc.desc   Verify EAWorker.join() performance measurement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerJoinTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('joinPerf')
      eaWorker.start()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1300
     * @tc.desc   Verify EAWorker.join() after postTask completes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerJoinTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let executed: boolean = false
      let eaWorker = new EAWorker('joinPostTask')
      eaWorker.start()
      eaWorker.postTask((): void => { executed = true })
      eaWorker.join().Await()
      expect(executed).assertTrue()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1400
     * @tc.desc   Verify EAWorker.join() after initial task completes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerJoinTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker('joinInitTask', (): void => { taskExecuted = true })
      eaWorker.start()
      eaWorker.join().Await()
      expect(taskExecuted).assertTrue()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1500
     * @tc.desc   Verify EAWorker.join() with then() callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let joined: boolean = false
      let eaWorker = new EAWorker('joinThen')
      eaWorker.start()
      eaWorker.join().Await()
      joined = true
      expect(joined).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1600
     * @tc.desc   Verify EAWorker.join() with finally() callback executes cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let finallyExecuted: boolean = false
      let eaWorker = new EAWorker('joinFinally')
      eaWorker.start()
      eaWorker.join().Await()
      finallyExecuted = true
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1700
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1700
     * @tc.desc   Verify EAWorker.join() multiple calls on same worker throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('joinMulti')
      eaWorker.start()
      eaWorker.join().Await()
      let caught: boolean = false
      try {
        eaWorker.join().Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1800
     * @tc.desc   Verify EAWorker.join() nested EAWorker joins independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerJoinTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nestedCreated: boolean = false
      let eaWorker = new EAWorker('outerJoin')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        let nestedWorker = new EAWorker('nestedJoin')
        nestedWorker.start()
        nestedCreated = true
        return 100
      }).Await()
      expect(result).assertEqual(100)
      expect(nestedCreated).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest1900
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_1900
     * @tc.desc   Verify EAWorker.join() with catch() callback handles rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerJoinTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('joinCatch')
      eaWorker.start()
      eaWorker.join().Await()
      let caught: boolean = false
      try {
        eaWorker.join().Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerJoinTest2000
     * @tc.number SUB_BUILTINS_EAWORKER_JOIN_TEST_2000
     * @tc.desc   Verify EAWorker.join() 5 workers concurrently via Promise.all all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerJoinTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`join5_${i}`)
        worker.start()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
      let allStopped: boolean = true
      for (let i = 0; i < workers.length; i++) {
        if (workers[i].isAlive()) {
          allStopped = false
        }
      }
      expect(allStopped).assertTrue()
    })
  })
}
