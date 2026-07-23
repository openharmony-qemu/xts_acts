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

let constructorHelperFlag: boolean = false

let constructorHelperTask = (): void => {
  constructorHelperFlag = true
}

export default function BuiltinsEAWorkerConstructorTest(): void {
  describe('BuiltinsEAWorkerConstructorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify EAWorker constructor with no arguments creates default EAWorker with default name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker()
      expect(eaWorker.getName()).assertEqual('EAWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify EAWorker constructor with name parameter creates named EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('myWorker')
      expect(eaWorker.getName()).assertEqual('myWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify EAWorker constructor with name and task parameters sets initial task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      constructorHelperFlag = false
      let eaWorker = new EAWorker('taskWorker', constructorHelperTask)
      expect(eaWorker.getName()).assertEqual('taskWorker')
      eaWorker.start()
      eaWorker.join().Await()
      expect(constructorHelperFlag).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify EAWorker constructor with name, task and needInterop=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker('interopWorker', (): void => { taskExecuted = true }, true)
      expect(eaWorker.getName()).assertEqual('interopWorker')
      eaWorker.start()
      eaWorker.join().Await()
      expect(taskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify EAWorker constructor with needInterop=true creates interop EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker(true)
      expect(eaWorker.getName()).assertEqual('EAWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify EAWorker constructor with needInterop=false creates static EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker(false)
      expect(eaWorker.getName()).assertEqual('EAWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify EAWorker constructor with special characters name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('worker-test_v1.0')
      expect(eaWorker.getName()).assertEqual('worker-test_v1.0')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify EAWorker constructor with Chinese name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('工作线程')
      expect(eaWorker.getName()).assertEqual('工作线程')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify EAWorker constructor with task function only creates EAWorker with task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker((): void => { taskExecuted = true })
      eaWorker.start()
      eaWorker.join().Await()
      expect(taskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify EAWorker constructor with name and needInterop=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('interopWorker2', true)
      expect(eaWorker.getName()).assertEqual('interopWorker2')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify EAWorker constructor with name and needInterop=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('staticWorker', false)
      expect(eaWorker.getName()).assertEqual('staticWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify EAWorker constructor returns EAWorker with correct name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('testName')
      expect(eaWorker.getName()).assertEqual('testName')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify EAWorker isAlive returns false before start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('notStarted')
      expect(eaWorker.isAlive()).assertFalse()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify EAWorker created then started immediately becomes alive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('started')
      eaWorker.start()
      expect(eaWorker.isAlive()).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify EAWorker constructor with task and needInterop=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker((): void => { taskExecuted = true }, true)
      eaWorker.start()
      eaWorker.join().Await()
      expect(taskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1700
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify EAWorker constructor normal creation in try block executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let finallyExecuted: boolean = false
      try {
        let eaWorker = new EAWorker('tryTest')
        eaWorker.start()
        eaWorker.join().Await()
      } catch (e) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify EAWorker constructor creates multiple workers sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`worker_${i}`)
        workers.push(worker)
      }
      expect(workers.length).assertEqual(5)
      for (let i = 0; i < workers.length; i++) {
        workers[i].start()
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest1900
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify EAWorker constructor with create then start and run task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('taskWorker')
      eaWorker.start()
      let result: number = eaWorker.run<number>((n: number): number => n * 2, 21.0).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2000
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify EAWorker constructor with needInterop=false pure static mode runs task correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('staticOnly', false)
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2100
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify EAWorker constructor concurrent creation of 3 workers runs tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name   BuiltinsEAWorkerConstructorTest2200
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify EAWorker constructor concurrent creation of 5 workers runs tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name   BuiltinsEAWorkerConstructorTest2300
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2300
     * @tc.desc   Verify EAWorker constructor with void function as task executes task on start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      constructorHelperFlag = false
      let eaWorker = new EAWorker(constructorHelperTask)
      eaWorker.start()
      eaWorker.join().Await()
      expect(constructorHelperFlag).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2400
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2400
     * @tc.desc   Verify EAWorker constructor with name and task returns correct name via getName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('namedWorker', (): void => {})
      expect(eaWorker.getName()).assertEqual('namedWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2500
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2500
     * @tc.desc   Verify EAWorker constructor with needInterop=true supports interop and runs task correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('interopWorker3', (): void => {}, true)
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 100).Await()
      expect(result).assertEqual(100)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2600
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2600
     * @tc.desc   Verify EAWorker constructor with postTask submits task correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let postTaskExecuted: boolean = false
      let eaWorker = new EAWorker('postWorker')
      eaWorker.start()
      eaWorker.postTask((): void => { postTaskExecuted = true })
      eaWorker.join().Await()
      expect(postTaskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2700
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2700
     * @tc.desc   Verify EAWorker constructor single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('perfTest')
      expect(eaWorker.getName()).assertEqual('perfTest')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2800
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2800
     * @tc.desc   Verify EAWorker constructor join without start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('noStartJoin')
      let caught: boolean = false
      try {
        eaWorker.join().Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest2900
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_2900
     * @tc.desc   Verify EAWorker constructor start twice throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('doubleStart')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.start()
      } catch (e) {
        caught = true
      }
      eaWorker.join().Await()
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3000
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3000
     * @tc.desc   Verify EAWorker constructor concurrent creation of 10 workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name   BuiltinsEAWorkerConstructorTest3100
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3100
     * @tc.desc   Verify EAWorker constructor batch creation performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BuiltinsEAWorkerConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let workers: EAWorker[] = []
      for (let i = 0; i < 5; i++) {
        let worker = new EAWorker(`batch_${i}`)
        workers.push(worker)
      }
      expect(workers.length).assertEqual(5)
      for (let i = 0; i < workers.length; i++) {
        workers[i].start()
      }
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3200
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3200
     * @tc.desc   Verify EAWorker constructor with task function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let taskExecuted: boolean = false
      let eaWorker = new EAWorker('taskW', (): void => {
        taskExecuted = true
      })
      eaWorker.start()
      eaWorker.join().Await()
      expect(taskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3300
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3300
     * @tc.desc   Verify EAWorker constructor creates nested EAWorker inside run callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerConstructorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nestedCreated: boolean = false
      let eaWorker = new EAWorker('outerCons')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        let nestedWorker = new EAWorker('nestedCons')
        nestedWorker.start()
        nestedCreated = true
        return 100
      }).Await()
      expect(result).assertEqual(100)
      expect(nestedCreated).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3400
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3400
     * @tc.desc   Verify EAWorker constructor with undefined name uses default name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker(undefined)
      expect(eaWorker.getName()).assertEqual('EAWorker')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3500
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3500
     * @tc.desc   Verify EAWorker constructor with undefined task does not set initial task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('undefinedTask', undefined)
      expect(eaWorker.getName()).assertEqual('undefinedTask')
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3600
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3600
     * @tc.desc   Verify EAWorker constructor with async function as task executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let asyncTaskCompleted: boolean = false
      let eaWorker = new EAWorker('asyncInit', (): void => {
        asyncTaskCompleted = true
      })
      eaWorker.start()
      eaWorker.join().Await()
      expect(asyncTaskCompleted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3700
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3700
     * @tc.desc   Verify EAWorker constructor with null name throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught: boolean = false
      let finallyExecuted: boolean = false
      try {
        let eaWorker = new EAWorker(null as string)
        eaWorker.start()
        eaWorker.join().Await()
      } catch (e) {
        caught = true
      } finally {
        finallyExecuted = true
      }
      expect(caught).assertTrue()
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerConstructorTest3800
     * @tc.number SUB_BUILTINS_EAWORKER_CONSTRUCTOR_TEST_3800
     * @tc.desc   Verify EAWorker constructor with null task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerConstructorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught: boolean = false
      try {
        let eaWorker = new EAWorker('nullTask', null as () => void)
        eaWorker.start()
        eaWorker.join().Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })
  })
}
