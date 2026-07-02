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

let postTaskHelperExecuted: boolean = false
let postTaskHelperCallback = (): void => {
  postTaskHelperExecuted = true
}

export default function BuiltinsEAWorkerPostTaskTest(): void {
  describe('BuiltinsEAWorkerPostTaskTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0100
     * @tc.desc   Verify EAWorker.postTask() with arrow function callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let executed: boolean = false
      let eaWorker = new EAWorker('postArrow')
      eaWorker.start()
      eaWorker.postTask((): void => { executed = true })
      await eaWorker.join()
      expect(executed).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0200
     * @tc.desc   Verify EAWorker.postTask() with named function callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let namedExecuted: boolean = false
      let namedCallback = (): void => { namedExecuted = true }
      let eaWorker = new EAWorker('postNamed')
      eaWorker.start()
      eaWorker.postTask(namedCallback)
      await eaWorker.join()
      expect(namedExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0300
     * @tc.desc   Verify EAWorker.postTask() returns void (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      postTaskHelperExecuted = false
      let eaWorker = new EAWorker('postVoid')
      eaWorker.start()
      let result: void = eaWorker.postTask(postTaskHelperCallback)
      await eaWorker.join()
      expect(postTaskHelperExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0400
     * @tc.desc   Verify EAWorker.postTask() updates shared variable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedResult: string = ''
      let eaWorker = new EAWorker('postShared')
      eaWorker.start()
      eaWorker.postTask((): void => { sharedResult = 'task completed' })
      await eaWorker.join()
      expect(sharedResult).assertEqual('task completed')
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0500
     * @tc.desc   Verify EAWorker.postTask() sequential 3 tasks execute in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let val1: number = 0
      let val2: number = 0
      let val3: number = 0
      let eaWorker = new EAWorker('postSeq3')
      eaWorker.start()
      eaWorker.postTask((): void => { val1 = 1 })
      eaWorker.postTask((): void => { val2 = val1 + 1 })
      eaWorker.postTask((): void => { val3 = val2 + 1 })
      await eaWorker.join()
      expect(val1).assertEqual(1)
      expect(val2).assertEqual(2)
      expect(val3).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0600
     * @tc.desc   Verify EAWorker.postTask() 10 concurrent tasks all execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerPostTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: number = 0
      let eaWorker = new EAWorker('postConc10')
      eaWorker.start()
      for (let i = 0; i < 10; i++) {
        eaWorker.postTask((): void => { counter++ })
      }
      await eaWorker.join()
      expect(counter).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0700
     * @tc.desc   Verify EAWorker.postTask() without start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let eaWorker = new EAWorker('postNoStart')
      let caught: boolean = false
      try {
        eaWorker.postTask(postTaskHelperCallback)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.start()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0800
     * @tc.desc   Verify EAWorker.postTask() nested postTask executes inner task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerPostTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let outerExecuted: boolean = false
      let eaWorker = new EAWorker('postNested')
      eaWorker.start()
      eaWorker.postTask((): void => {
        outerExecuted = true
        eaWorker.postTask((): void => { outerExecuted = true })
      })
      await eaWorker.join()
      expect(outerExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_0900
     * @tc.desc   Verify EAWorker.postTask() with try-catch-finally executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let finallyExecuted: boolean = false
      let eaWorker = new EAWorker('postTryCatch')
      eaWorker.start()
      try {
        eaWorker.postTask((): void => {})
      } catch (e) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1000
     * @tc.desc   Verify EAWorker.postTask() vs run() difference: postTask returns void, run returns Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let postTaskExecuted: boolean = false
      let eaWorker = new EAWorker('postVsRun')
      eaWorker.start()
      eaWorker.postTask((): void => { postTaskExecuted = true })
      let runResult: number = await eaWorker.run<number>((): number => 42)
      expect(runResult).assertEqual(42)
      await eaWorker.join()
      expect(postTaskExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1100
     * @tc.desc   Verify EAWorker.postTask() with setUncaughtExceptionHandler catches callback error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let handlerCalled: boolean = false
      let eaWorker = new EAWorker('postHandler')
      eaWorker.setUncaughtExceptionHandler((error: Error): void => {
        handlerCalled = true
      })
      eaWorker.start()
      eaWorker.postTask((): void => { throw new Error('callback error') })
      await eaWorker.join()
      expect(handlerCalled).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1200
     * @tc.desc   Verify EAWorker.postTask() 3 concurrent tasks all execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerPostTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: number = 0
      let eaWorker = new EAWorker('postConc3')
      eaWorker.start()
      for (let i = 0; i < 3; i++) {
        eaWorker.postTask((): void => { counter++ })
      }
      await eaWorker.join()
      expect(counter).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1300
     * @tc.desc   Verify EAWorker.postTask() 5 concurrent tasks all execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerPostTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: number = 0
      let eaWorker = new EAWorker('postConc5')
      eaWorker.start()
      for (let i = 0; i < 5; i++) {
        eaWorker.postTask((): void => { counter++ })
      }
      await eaWorker.join()
      expect(counter).assertEqual(5)
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1400
     * @tc.desc   Verify EAWorker.postTask() with needInterop=true executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let interopExecuted: boolean = false
      let eaWorker = new EAWorker('postInterop', true)
      eaWorker.start()
      eaWorker.postTask((): void => { interopExecuted = true })
      await eaWorker.join()
      expect(interopExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1500
     * @tc.desc   Verify EAWorker.postTask() executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let eaWorker = new EAWorker('postPerf')
      eaWorker.start()
      let taskCompleted: boolean = false
      eaWorker.postTask((): void => {
        taskCompleted = true
      })
      await eaWorker.join()
      expect(taskCompleted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1600
     * @tc.desc   Verify EAWorker.postTask() alternating with run() both execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let postTaskCount: number = 0
      let eaWorker = new EAWorker('postAltRun')
      eaWorker.start()
      eaWorker.postTask((): void => { postTaskCount++ })
      let result: number = await eaWorker.run<number>((): number => 50)
      expect(result).assertEqual(50)
      await eaWorker.join()
      expect(postTaskCount).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1700
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1700
     * @tc.desc   Verify EAWorker.postTask() batch 50 sequential tasks all execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BuiltinsEAWorkerPostTaskTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let counter: number = 0
      let eaWorker = new EAWorker('postBatch50')
      eaWorker.start()
      for (let i = 0; i < 50; i++) {
        eaWorker.postTask((): void => { counter++ })
      }
      await eaWorker.join()
      expect(counter).assertEqual(50)
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1800
     * @tc.desc   Verify EAWorker.postTask() multiple workers postTask concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerPostTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let worker0Executed: boolean = false
      let worker1Executed: boolean = false
      let worker2Executed: boolean = false
      let worker0 = new EAWorker('multiPost_0')
      let worker1 = new EAWorker('multiPost_1')
      let worker2 = new EAWorker('multiPost_2')
      worker0.start()
      worker1.start()
      worker2.start()
      worker0.postTask((): void => { worker0Executed = true })
      worker1.postTask((): void => { worker1Executed = true })
      worker2.postTask((): void => { worker2Executed = true })
      await worker0.join()
      await worker1.join()
      await worker2.join()
      expect(worker0Executed).assertTrue()
      expect(worker1Executed).assertTrue()
      expect(worker2Executed).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest1900
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_1900
     * @tc.desc   Verify EAWorker.postTask() callback error does not kill worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let afterErrorExecuted: boolean = false
      let eaWorker = new EAWorker('postErrContinue')
      eaWorker.start()
      eaWorker.postTask((): void => { throw new Error('callback error') })
      eaWorker.postTask((): void => { afterErrorExecuted = true })
      await eaWorker.join()
      expect(afterErrorExecuted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2000
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2000
     * @tc.desc   Verify EAWorker.postTask() postTask after run completes executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let postAfterRun: boolean = false
      let eaWorker = new EAWorker('postAfterRun')
      eaWorker.start()
      let result: number = await eaWorker.run<number>((): number => 42)
      expect(result).assertEqual(42)
      eaWorker.postTask((): void => { postAfterRun = true })
      await eaWorker.join()
      expect(postAfterRun).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2100
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2100
     * @tc.desc   Verify EAWorker.postTask() with async callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskCompleted: boolean = false
      let eaWorker = new EAWorker('postAsync')
      eaWorker.start()
      eaWorker.postTask((): void => {
        taskCompleted = true
      })
      await eaWorker.join()
      expect(taskCompleted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2300
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2300
     * @tc.desc   Verify EAWorker.postTask() with anonymous function callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerPostTaskTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let executed: boolean = false
      let eaWorker = new EAWorker('postAnon')
      eaWorker.start()
      eaWorker.postTask((): void => {
        executed = true
      })
      await eaWorker.join()
      expect(executed).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2400
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2400
     * @tc.desc   Verify EAWorker.postTask() with async function callback executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let asyncCompleted: boolean = false
      let eaWorker = new EAWorker('postAsyncCb')
      eaWorker.start()
      eaWorker.postTask((): void => {
        asyncCompleted = true
      })
      await eaWorker.join()
      expect(asyncCompleted).assertTrue()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2500
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2500
     * @tc.desc   Verify EAWorker.postTask() with null callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let eaWorker = new EAWorker('postNullCb')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.postTask(null as () => void)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2600
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2600
     * @tc.desc   Verify EAWorker.postTask() with undefined callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerPostTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let eaWorker = new EAWorker('postUndefCb')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.postTask(undefined as () => void)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      await eaWorker.join()
    })

    /**
     * @tc.name   BuiltinsEAWorkerPostTaskTest2700
     * @tc.number SUB_BUILTINS_EAWORKER_POSTTASK_TEST_2700
     * @tc.desc   Verify EAWorker.postTask() with shared variable increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerPostTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: number = 0
      let eaWorker = new EAWorker('postLock')
      eaWorker.start()
      for (let i = 0; i < 5; i++) {
        eaWorker.postTask((): void => {
          counter++
        })
      }
      await eaWorker.join()
      expect(counter).assertEqual(5)
    })
  })
}
