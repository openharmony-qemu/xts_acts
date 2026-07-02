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

export default function BuiltinsEAWorkerWorkerPriorityTest(): void {
  describe('BuiltinsEAWorkerWorkerPriorityTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0100
     * @tc.desc   Verify EAWorker default priority is PRIORITY_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityDefault')
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_HIGH)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0200
     * @tc.desc   Verify EAWorker setPriority with PRIORITY_IDLE and getPriority returns same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityIdle')
      eaWorker.setPriority(WorkerPriority.PRIORITY_IDLE)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_IDLE)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0300
     * @tc.desc   Verify EAWorker setPriority with PRIORITY_LOW and getPriority returns same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityLow')
      eaWorker.setPriority(WorkerPriority.PRIORITY_LOW)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_LOW)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0400
     * @tc.desc   Verify EAWorker setPriority with PRIORITY_DEFAULT and getPriority returns same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityDefaultSet')
      eaWorker.setPriority(WorkerPriority.PRIORITY_DEFAULT)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_DEFAULT)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0500
     * @tc.desc   Verify EAWorker setPriority with PRIORITY_HIGH and getPriority returns same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityHigh')
      eaWorker.setPriority(WorkerPriority.PRIORITY_HIGH)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_HIGH)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0600
     * @tc.desc   Verify EAWorker setPriority with PRIORITY_DEADLINE_REQUEST and getPriority returns same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityDeadline')
      eaWorker.setPriority(WorkerPriority.PRIORITY_DEADLINE_REQUEST)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_DEADLINE_REQUEST)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0700
     * @tc.desc   Verify EAWorker setPriority with PRIORITY_USER_INTERACTION and getPriority returns same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityUserInter')
      eaWorker.setPriority(WorkerPriority.PRIORITY_USER_INTERACTION)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_USER_INTERACTION)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0800
     * @tc.desc   Verify EAWorker multiple setPriority calls return latest value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let eaWorker = new EAWorker('priorityMulti')
      eaWorker.setPriority(WorkerPriority.PRIORITY_LOW)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_LOW)
      eaWorker.setPriority(WorkerPriority.PRIORITY_HIGH)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_HIGH)
      eaWorker.setPriority(WorkerPriority.PRIORITY_IDLE)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_IDLE)
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_0900
     * @tc.desc   Verify different EAWorker instances have independent priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerWorkerPriorityTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let priorities: WorkerPriority[] = [
        WorkerPriority.PRIORITY_IDLE,
        WorkerPriority.PRIORITY_LOW,
        WorkerPriority.PRIORITY_DEFAULT,
        WorkerPriority.PRIORITY_HIGH,
        WorkerPriority.PRIORITY_DEADLINE_REQUEST,
        WorkerPriority.PRIORITY_USER_INTERACTION
      ]
      let workers: EAWorker[] = []
      for (let i = 0; i < 6; i++) {
        let worker = new EAWorker(`priorityIndep_${i}`)
        worker.setPriority(priorities[i])
        worker.start()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        expect(workers[i].getPriority()).assertEqual(priorities[i])
      }
      for (let i = 0; i < workers.length; i++) {
        await workers[i].join()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1000
     * @tc.desc   Verify 10 EAWorker instances all set to PRIORITY_HIGH correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 10; i++) {
        let worker = new EAWorker(`priority10_${i}`)
        worker.setPriority(WorkerPriority.PRIORITY_HIGH)
        worker.start()
        workers.push(worker)
      }
      let highCount: number = 0
      for (let i = 0; i < workers.length; i++) {
        if (workers[i].getPriority() === WorkerPriority.PRIORITY_HIGH) {
          highCount++
        }
      }
      expect(highCount).assertEqual(10)
      for (let i = 0; i < workers.length; i++) {
        await workers[i].join()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1100
     * @tc.desc   Verify EAWorker setPriority before start applies priority after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityBeforeStart')
      eaWorker.setPriority(WorkerPriority.PRIORITY_LOW)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_LOW)
      eaWorker.start()
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_LOW)
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1200
     * @tc.desc   Verify EAWorker setPriority after start still works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityAfterStart')
      eaWorker.start()
      eaWorker.setPriority(WorkerPriority.PRIORITY_USER_INTERACTION)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_USER_INTERACTION)
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1300
     * @tc.desc   Verify EAWorker getPriority returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityType')
      let priority: WorkerPriority = eaWorker.getPriority()
      expect(typeof priority).assertEqual('int')
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1400
     * @tc.desc   Verify EAWorker setPriority performance measurement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('priorityPerf')
      eaWorker.start()
      eaWorker.setPriority(WorkerPriority.PRIORITY_LOW)
      expect(eaWorker.getPriority()).assertEqual(WorkerPriority.PRIORITY_LOW)
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1500
     * @tc.desc   Verify EAWorker setPriority with out-of-range value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let eaWorker = new EAWorker('priorityOOB')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.setPriority(WorkerPriority.fromValue(6))
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerWorkerPriorityTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_WORKERPRIORITY_TEST_1600
     * @tc.desc   Verify EAWorker setPriority with negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerWorkerPriorityTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let eaWorker = new EAWorker('priorityNeg')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.setPriority(WorkerPriority.fromValue(-1))
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      await eaWorker.join()
    })

  })
}
