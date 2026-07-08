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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function BuiltinsEAWorkerIsAliveTest(): void {
  describe('BuiltinsEAWorkerIsAliveTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0100
     * @tc.desc   Verify EAWorker.isAlive() returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveType')
      let result: boolean = eaWorker.isAlive()
      expect(typeof result).assertEqual('boolean')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0200
     * @tc.desc   Verify EAWorker.isAlive() returns false before start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveBefore')
      expect(eaWorker.isAlive()).assertFalse()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0300
     * @tc.desc   Verify EAWorker.isAlive() returns true after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveAfter')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0400
     * @tc.desc   Verify EAWorker.isAlive() returns false after join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveJoin')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0500
     * @tc.desc   Verify EAWorker.isAlive() returns false after quit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveQuit')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.quit()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0600
     * @tc.desc   Verify EAWorker.isAlive() state transition: create→start→join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveTransition')
      expect(eaWorker.isAlive()).assertFalse()
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0700
     * @tc.desc   Verify EAWorker.isAlive() multiple calls return consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerIsAliveTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('aliveConsist')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      expect(eaWorker.isAlive()).assertTrue()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0800
     * @tc.desc   Verify EAWorker.isAlive() with try-catch-finally executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerIsAliveTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let finallyExecuted: boolean = false
      let eaWorker = new EAWorker('aliveTryCatch')
      try {
        let result: boolean = eaWorker.isAlive()
        expect(typeof result).assertEqual('boolean')
      } catch (e) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_0900
     * @tc.desc   Verify EAWorker.isAlive() returns true during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveDuringTask')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1000
     * @tc.desc   Verify EAWorker.isAlive() with 5 workers all return correct states
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerIsAliveTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`alive5_${i}`)
        worker.start()
        workers.push(worker)
      }
      let allAlive: boolean = true
      for (let i = 0; i < workers.length; i++) {
        if (!workers[i].isAlive()) {
          allAlive = false
        }
      }
      expect(allAlive).assertTrue()
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
     * @tc.name   BuiltinsEAWorkerIsAliveTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1100
     * @tc.desc   Verify EAWorker.isAlive() with 10 workers all return correct states
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerIsAliveTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 10; i++) {
        let worker = new EAWorker(`alive10_${i}`)
        worker.start()
        workers.push(worker)
      }
      let aliveCount: number = 0
      for (let i = 0; i < workers.length; i++) {
        if (workers[i].isAlive()) {
          aliveCount++
        }
      }
      expect(aliveCount).assertEqual(10)
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
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
     * @tc.name   BuiltinsEAWorkerIsAliveTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1200
     * @tc.desc   Verify EAWorker.isAlive() performance measurement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('alivePerf')
      eaWorker.start()
      let result: boolean = eaWorker.isAlive()
      expect(result).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1300
     * @tc.desc   Verify EAWorker.isAlive() with needInterop=true returns correct state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerIsAliveTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('aliveInterop', true)
      expect(eaWorker.isAlive()).assertFalse()
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1400
     * @tc.desc   Verify EAWorker.isAlive() checks before run operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('aliveCheck')
      if (!eaWorker.isAlive()) {
        eaWorker.start()
      }
      if (eaWorker.isAlive()) {
        let result: number = eaWorker.run<number>((): number => 42).Await()
        expect(result).assertEqual(42)
      }
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1500
     * @tc.desc   Verify EAWorker.isAlive() with initial task returns correct state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerIsAliveTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker('aliveInitTask', (): void => { taskExecuted = true })
      expect(eaWorker.isAlive()).assertFalse()
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
      expect(taskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerIsAliveTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_ISALIVE_TEST_1600
     * @tc.desc   Verify EAWorker.isAlive() nested EAWorker state is independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerIsAliveTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nestedCreated: boolean = false
      let eaWorker = new EAWorker('outerAlive')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        let nestedWorker = new EAWorker('nestedAlive')
        nestedWorker.start()
        nestedCreated = true
        return 100
      }).Await()
      expect(result).assertEqual(100)
      expect(nestedCreated).assertTrue()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
      expect(eaWorker.isAlive()).assertFalse()
    })
  })
}
