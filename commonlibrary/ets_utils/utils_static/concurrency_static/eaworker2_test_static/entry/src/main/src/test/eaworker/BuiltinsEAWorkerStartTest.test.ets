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

export default function BuiltinsEAWorkerStartTest(): void {
  describe('BuiltinsEAWorkerStartTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0100
     * @tc.desc   Verify EAWorker.start() with no arguments makes worker alive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerStartTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('startTest')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0200
     * @tc.desc   Verify EAWorker.start() returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerStartTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('voidTest')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0300
     * @tc.desc   Verify EAWorker isAlive is false before start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerStartTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('beforeStart')
      expect(eaWorker.isAlive()).assertFalse()
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0400
     * @tc.desc   Verify EAWorker.start() enables run task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerStartTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runAfterStart')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0500
     * @tc.desc   Verify EAWorker.start() twice throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('doubleStart')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.start()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0600
     * @tc.desc   Verify EAWorker.start() with try-catch-finally executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let finallyExecuted: boolean = false
      let eaWorker = new EAWorker('tryTest')
      try {
        eaWorker.start()
      } catch (e) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0700
     * @tc.desc   Verify EAWorker.start() with initial task executes task on start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerStartTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker('initTask', (): void => { taskExecuted = true })
      eaWorker.start()
      eaWorker.join().Await()
      expect(taskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0800
     * @tc.desc   Verify EAWorker.start() sequentially starts multiple workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`worker_${i}`)
        worker.start()
        expect(worker.isAlive()).assertTrue()
        workers.push(worker)
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_0900
     * @tc.desc   Verify EAWorker.start() with multiple run tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('multiRun')
      eaWorker.start()
      let results: number[] = []
      for (let i = 0; i < 5; i++) {
        let idx: number = i
        let result: number = eaWorker.run<number>((): number => idx * 10).Await()
        results.push(result)
      }
      expect(results.length).assertEqual(5)
      expect(results[0]).assertEqual(0)
      expect(results[4]).assertEqual(40)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1000
     * @tc.desc   Verify EAWorker.start() with postTask executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let postTaskExecuted: boolean = false
      let eaWorker = new EAWorker('postTest')
      eaWorker.start()
      eaWorker.postTask((): void => { postTaskExecuted = true })
      eaWorker.join().Await()
      expect(postTaskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1100
     * @tc.desc   Verify EAWorker.start() concurrent start 3 workers run tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerStartTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 3; i++) {
        let worker = new EAWorker(`worker_${i}`)
        worker.start()
        workers.push(worker)
      }
      let results: number[] = []
      for (let i = 0; i < workers.length; i++) {
        let idx: number = i
        let result: number = workers[i].run<number>((): number => idx * 10).Await()
        results.push(result)
      }
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(0)
      expect(results[1]).assertEqual(10)
      expect(results[2]).assertEqual(20)
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1200
     * @tc.desc   Verify EAWorker.start() concurrent start 5 workers run tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerStartTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`worker_${i}`)
        worker.start()
        workers.push(worker)
      }
      let results: number[] = []
      for (let i = 0; i < workers.length; i++) {
        let idx: number = i
        let result: number = workers[i].run<number>((): number => idx * 10).Await()
        results.push(result)
      }
      expect(results.length).assertEqual(5)
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1300
     * @tc.desc   Verify EAWorker.start() concurrent start 10 workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerStartTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 10; i++) {
        let worker = new EAWorker(`worker_${i}`)
        worker.start()
        workers.push(worker)
      }
      let results: number[] = []
      for (let i = 0; i < workers.length; i++) {
        let idx: number = i
        let result: number = workers[i].run<number>((): number => idx).Await()
        results.push(result)
      }
      expect(results.length).assertEqual(10)
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1400
     * @tc.desc   Verify EAWorker.start() enables alternating postTask and run calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerStartTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let postTaskCount: number = 0
      let eaWorker = new EAWorker('alternate')
      eaWorker.start()
      eaWorker.postTask((): void => { postTaskCount++ })
      let result: number = eaWorker.run<number>((): number => 50).Await()
      expect(result).assertEqual(50)
      eaWorker.join().Await()
      expect(postTaskCount).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1500
     * @tc.desc   Verify EAWorker.start() performance measurement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerStartTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('perfTest')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1600
     * @tc.desc   Verify EAWorker.start() with needInterop=true starts successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('interopStart', true)
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      let result: number = eaWorker.run<number>((): number => 99).Await()
      expect(result).assertEqual(99)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1700
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1700
     * @tc.desc   Verify EAWorker.run() without start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerStartTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('noStartRun')
      let caught: boolean = false
      try {
        eaWorker.run<number>((): number => 1).Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerStartTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_START_TEST_1800
     * @tc.desc   Verify EAWorker.start() creates nested EAWorker inside run callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerStartTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nestedCreated: boolean = false
      let eaWorker = new EAWorker('outerStart')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        let nestedWorker = new EAWorker('nestedStart')
        nestedWorker.start()
        nestedCreated = true
        return 100
      }).Await()
      expect(result).assertEqual(100)
      expect(nestedCreated).assertTrue()
      eaWorker.join().Await()
    })
  })
}
