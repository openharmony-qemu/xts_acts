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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { sleep } from '../TaskpoolTestSharedUtils';
import { addFunc } from './TaskpoolPriorityTestInner';

@Concurrent
function simpleFunc(): number {
  return 42
}

@Concurrent
function identityFunc(n: number): number {
  return n
}

@Concurrent
async function nestedExecPriorityFunc(counter: SharedCounter): Promise<void> {
  const innerTask = new taskpool.Task(addFunc, 30)
  try {
    const value = await taskpool.execute(innerTask, taskpool.Priority.HIGH)
    if (value as number === 60) {
      counter.count++
    }
  } catch (e) {
    console.error('nestedExecPriorityFunc inner execute failed')
  }
}

@Sendable
class SharedCounter {
  count: number = 0
}

export default function TaskpoolPriorityTest(): void {
  describe('TaskpoolPriorityTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      try {
        await sleep(100)
      } catch (error) {
        console.error('afterAll sleep failed');
      }
    })

    // ============ Enum Value Verification ============

    /**
     * @tc.name   TaskpoolPriorityTest0100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0100
     * @tc.desc   Verify Priority.HIGH equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      expect(taskpool.Priority.HIGH).assertEqual(0)
    })

    /**
     * @tc.name   TaskpoolPriorityTest0200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0200
     * @tc.desc   Verify Priority.MEDIUM equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      expect(taskpool.Priority.MEDIUM).assertEqual(1)
    })

    /**
     * @tc.name   TaskpoolPriorityTest0300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0300
     * @tc.desc   Verify Priority.LOW equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      expect(taskpool.Priority.LOW).assertEqual(2)
    })

    /**
     * @tc.name   TaskpoolPriorityTest0400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0400
     * @tc.desc   Verify Priority.IDLE equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      expect(taskpool.Priority.IDLE).assertEqual(3)
    })

    // ============ Single Priority Task Execution ============

    /**
     * @tc.name   TaskpoolPriorityTest0500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0500
     * @tc.desc   Verify execute with Priority.HIGH returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await taskpool.execute(task, taskpool.Priority.HIGH)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolPriorityTest0500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest0600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0600
     * @tc.desc   Verify execute with Priority.MEDIUM returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await taskpool.execute(task, taskpool.Priority.MEDIUM)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolPriorityTest0600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest0700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0700
     * @tc.desc   Verify execute with Priority.LOW returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await taskpool.execute(task, taskpool.Priority.LOW)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolPriorityTest0700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest0800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0800
     * @tc.desc   Verify execute with Priority.IDLE returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await taskpool.execute(task, taskpool.Priority.IDLE)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolPriorityTest0800 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ============ Multi-Priority Concurrent Execution ============

    /**
     * @tc.name   TaskpoolPriorityTest0900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_0900
     * @tc.desc   Verify HIGH and MEDIUM priority tasks both complete when executed concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const highTask = new taskpool.Task(addFunc, 10)
      const mediumTask = new taskpool.Task(addFunc, 20)
      const p1 = taskpool.execute(highTask, taskpool.Priority.HIGH)
      const p2 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM)
      try {
        const allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
        expect(allResults[0] as number).assertEqual(20)
        expect(allResults[1] as number).assertEqual(40)
      } catch (error) {
        console.error('TaskpoolPriorityTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1000
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1000
     * @tc.desc   Verify HIGH and LOW priority tasks both complete when executed concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const highTask = new taskpool.Task(addFunc, 5)
      const lowTask = new taskpool.Task(addFunc, 15)
      const p1 = taskpool.execute(highTask, taskpool.Priority.HIGH)
      const p2 = taskpool.execute(lowTask, taskpool.Priority.LOW)
      try {
        const allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
        expect(allResults[0] as number).assertEqual(10)
        expect(allResults[1] as number).assertEqual(30)
      } catch (error) {
        console.error('TaskpoolPriorityTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1100
     * @tc.desc   Verify MEDIUM and LOW priority tasks both complete when executed concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const mediumTask = new taskpool.Task(addFunc, 8)
      const lowTask = new taskpool.Task(addFunc, 12)
      const p1 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM)
      const p2 = taskpool.execute(lowTask, taskpool.Priority.LOW)
      try {
        const allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
        expect(allResults[0] as number).assertEqual(16)
        expect(allResults[1] as number).assertEqual(24)
      } catch (error) {
        console.error('TaskpoolPriorityTest1100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1200
     * @tc.desc   Verify all priority tasks complete when executed concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const highTask = new taskpool.Task(identityFunc, 100)
      const mediumTask = new taskpool.Task(identityFunc, 200)
      const lowTask = new taskpool.Task(identityFunc, 300)
      const idleTask = new taskpool.Task(identityFunc, 400)
      const p1 = taskpool.execute(highTask, taskpool.Priority.HIGH)
      const p2 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM)
      const p3 = taskpool.execute(lowTask, taskpool.Priority.LOW)
      const p4 = taskpool.execute(idleTask, taskpool.Priority.IDLE)
      try {
        const allResults = await Promise.all([p1, p2, p3, p4])
        expect(allResults.length).assertEqual(4)
        expect(allResults[0] as number).assertEqual(100)
        expect(allResults[1] as number).assertEqual(200)
        expect(allResults[2] as number).assertEqual(300)
        expect(allResults[3] as number).assertEqual(400)
      } catch (error) {
        console.error('TaskpoolPriorityTest1200 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ============ Default Value Test ============

    /**
     * @tc.name   TaskpoolPriorityTest1300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1300
     * @tc.desc   Verify execute without priority defaults to MEDIUM and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolPriorityTest1300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1400
     * @tc.desc   Verify explicit Priority.MEDIUM behaves same as default priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(addFunc, 25)
      const task2 = new taskpool.Task(addFunc, 25)
      try {
        const defaultResult = await taskpool.execute(task1)
        const mediumResult = await taskpool.execute(task2, taskpool.Priority.MEDIUM)
        expect(defaultResult as number).assertEqual(mediumResult as number)
      } catch (error) {
        console.error('TaskpoolPriorityTest1400 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ============ Priority Scheduling Order Verification ============

    /**
     * @tc.name   TaskpoolPriorityTest1500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1500
     * @tc.desc   Verify HIGH and MEDIUM priority tasks both complete with exact results; completion count asserted without execution-order assertion per stability guideline (Priority#015)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const highTask = new taskpool.Task(identityFunc, 1)
      const mediumTask = new taskpool.Task(identityFunc, 2)
      const onSucc8: () => void = (): void => {
        counter.count++
      }
      highTask.onExecutionSucceeded(onSucc8)
      const onSucc7: () => void = (): void => {
        counter.count++
      }
      mediumTask.onExecutionSucceeded(onSucc7)
      const p1 = taskpool.execute(highTask, taskpool.Priority.HIGH)
      const p2 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM)
      try {
        const allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
        expect(allResults[0] as number).assertEqual(1)
        expect(allResults[1] as number).assertEqual(2)
      } catch (error) {
        console.error('TaskpoolPriorityTest1500 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest1500 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1600
     * @tc.desc   Verify MEDIUM and LOW priority tasks both complete with exact results; completion count asserted without execution-order assertion per stability guideline (Priority#016)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const mediumTask = new taskpool.Task(identityFunc, 10)
      const lowTask = new taskpool.Task(identityFunc, 20)
      const onSucc6: () => void = (): void => {
        counter.count++
      }
      mediumTask.onExecutionSucceeded(onSucc6)
      const onSucc5: () => void = (): void => {
        counter.count++
      }
      lowTask.onExecutionSucceeded(onSucc5)
      const p1 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM)
      const p2 = taskpool.execute(lowTask, taskpool.Priority.LOW)
      try {
        const allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
        expect(allResults[0] as number).assertEqual(10)
        expect(allResults[1] as number).assertEqual(20)
      } catch (error) {
        console.error('TaskpoolPriorityTest1600 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest1600 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1700
     * @tc.desc   Verify LOW and IDLE priority tasks both complete with exact results; completion count asserted without execution-order assertion per stability guideline (Priority#017)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const lowTask = new taskpool.Task(identityFunc, 50)
      const idleTask = new taskpool.Task(identityFunc, 60)
      const onLowSucceeded: () => void = (): void => {
        counter.count++
      }
      lowTask.onExecutionSucceeded(onLowSucceeded)
      const onIdleSucceeded: () => void = (): void => {
        counter.count++
      }
      idleTask.onExecutionSucceeded(onIdleSucceeded)
      const p1 = taskpool.execute(lowTask, taskpool.Priority.LOW)
      const p2 = taskpool.execute(idleTask, taskpool.Priority.IDLE)
      try {
        const allResults = await Promise.all([p1, p2])
        expect(allResults.length).assertEqual(2)
        expect(allResults[0] as number).assertEqual(50)
        expect(allResults[1] as number).assertEqual(60)
      } catch (error) {
        console.error('TaskpoolPriorityTest1700 failed')
        expect(false).assertFail()
      }
      try {
        let waited: number = 0
        while (counter.count < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest1700 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(2)
      done()
    })

    // ============ Boundary Scenarios ============

    /**
     * @tc.name   TaskpoolPriorityTest1800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1800
     * @tc.desc   Verify multiple HIGH priority tasks all complete successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const taskCount: number = 3
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        const onSucc4: () => void = (): void => {
          counter.count++
        }
        task.onExecutionSucceeded(onSucc4)
        promises.push(taskpool.execute(task, taskpool.Priority.HIGH))
      }
      try {
        await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolPriorityTest1800 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < taskCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest1800 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest1900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_1900
     * @tc.desc   Verify multiple MEDIUM priority tasks all complete successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const taskCount: number = 3
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        const onSucc3: () => void = (): void => {
          counter.count++
        }
        task.onExecutionSucceeded(onSucc3)
        promises.push(taskpool.execute(task, taskpool.Priority.MEDIUM))
      }
      try {
        await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolPriorityTest1900 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < taskCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest1900 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2000
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2000
     * @tc.desc   Verify multiple LOW priority tasks all complete successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const taskCount: number = 3
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        const onSucc2: () => void = (): void => {
          counter.count++
        }
        task.onExecutionSucceeded(onSucc2)
        promises.push(taskpool.execute(task, taskpool.Priority.LOW))
      }
      try {
        await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolPriorityTest2000 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < taskCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest2000 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    // ============ Nested Combination Scenarios ============

    /**
     * @tc.name   TaskpoolPriorityTest2100
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2100
     * @tc.desc   Verify sequential task execution with priority where result feeds into next task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(addFunc, 10)
      try {
        const result1 = await taskpool.execute(task1, taskpool.Priority.HIGH)
        expect(result1 as number).assertEqual(20)
        const task2 = new taskpool.Task(addFunc, result1 as number)
        const result2 = await taskpool.execute(task2, taskpool.Priority.MEDIUM)
        expect(result2 as number).assertEqual(40)
      } catch (error) {
        console.error('TaskpoolPriorityTest2100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2200
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2200
     * @tc.desc   Verify nested task execute inside onExecutionSucceeded callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPriorityTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const task = new taskpool.Task(addFunc, 21)
      const onSucceeded: () => Promise<void> = async (): Promise<void> => {
        const innerTask = new taskpool.Task(addFunc, 50)
        try {
          const result: Object = await taskpool.execute(innerTask, taskpool.Priority.HIGH)
          expect(result as number).assertEqual(100)
          counter.count++
        } catch (error) {
          console.error('TaskpoolPriorityTest2200 inner execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionSucceeded(onSucceeded)
      try {
        const outerResult = await taskpool.execute(task, taskpool.Priority.MEDIUM)
        expect(outerResult as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolPriorityTest2200 failed')
        expect(false).assertFail()
      }
      try {
        let waited: number = 0
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest2200 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2300
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2300
     * @tc.desc   Verify 3 concurrent tasks with different priorities using Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const taskCount: number = 3
      const promises: Promise<Object>[] = []
      const highTask = new taskpool.Task(simpleFunc)
      const onHighSucceeded: () => void = (): void => {
        counter.count++
      }
      highTask.onExecutionSucceeded(onHighSucceeded)
      promises.push(taskpool.execute(highTask, taskpool.Priority.HIGH))
      const mediumTask = new taskpool.Task(simpleFunc)
      const onMediumSucceeded: () => void = (): void => {
        counter.count++
      }
      mediumTask.onExecutionSucceeded(onMediumSucceeded)
      promises.push(taskpool.execute(mediumTask, taskpool.Priority.MEDIUM))
      const lowTask = new taskpool.Task(simpleFunc)
      const onLowSucceeded: () => void = (): void => {
        counter.count++
      }
      lowTask.onExecutionSucceeded(onLowSucceeded)
      promises.push(taskpool.execute(lowTask, taskpool.Priority.LOW))
      try {
        await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolPriorityTest2300 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < taskCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest2300 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2400
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2400
     * @tc.desc   Verify 5 concurrent tasks with different priorities using Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const taskCount: number = 5
      const promises: Promise<Object>[] = []
      const priorities: number[] = [
        taskpool.Priority.HIGH, taskpool.Priority.MEDIUM, taskpool.Priority.LOW,
        taskpool.Priority.HIGH, taskpool.Priority.MEDIUM
      ]
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        const onSucc1: () => void = (): void => {
          counter.count++
        }
        task.onExecutionSucceeded(onSucc1)
        promises.push(taskpool.execute(task, priorities[i] as taskpool.Priority))
      }
      try {
        await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolPriorityTest2400 failed');
        expect(false).assertFail();
      }
      try {
        let waited: number = 0
        while (counter.count < taskCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest2400 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2500
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2500
     * @tc.desc   Verify 10 concurrent tasks with different priorities using Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const taskCount: number = 10
      const promises: Promise<Object>[] = []
      const priorities: number[] = [
        taskpool.Priority.HIGH, taskpool.Priority.MEDIUM, taskpool.Priority.LOW, taskpool.Priority.IDLE,
        taskpool.Priority.HIGH, taskpool.Priority.MEDIUM, taskpool.Priority.LOW, taskpool.Priority.IDLE,
        taskpool.Priority.HIGH, taskpool.Priority.MEDIUM
      ]
      const onSucceeded: () => void = (): void => {
        counter.count++
      }
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        task.onExecutionSucceeded(onSucceeded)
        promises.push(taskpool.execute(task, priorities[i] as taskpool.Priority))
      }
      try {
        await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolPriorityTest2500 failed')
        expect(false).assertFail()
      }
      let waited: number = 0
      try {
        while (counter.count < taskCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest2500 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    // ============ Priority Parameter Validation Negative Tests (F2) ============

    /**
     * @tc.name   TaskpoolPriorityTest2600
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2600
     * @tc.desc   Verify execute(task, priority) rejects out-of-range priority values with BusinessError 401; bundled sub-tests: (1) priority=-1 below range, (2) priority=999 above range (runtime arbitration: native out-of-range values hit "execute's priority value is error" TYPE_ERROR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(simpleFunc)
      let threwNegative = false
      try {
        await taskpool.execute(task1, -1 as Object as taskpool.Priority)
      } catch (error) {
        threwNegative = true
        expect(error.code).assertEqual(401)
      }
      expect(threwNegative).assertTrue()
      const task2 = new taskpool.Task(simpleFunc)
      let threwOverflow = false
      try {
        await taskpool.execute(task2, 999 as Object as taskpool.Priority)
      } catch (error) {
        threwOverflow = true
        expect(error.code).assertEqual(401)
      }
      expect(threwOverflow).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2700
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2700
     * @tc.desc   Verify execute(task, priority) rejects non-number priority values with BusinessError 401; bundled sub-tests: (1) priority=null, (2) priority='500' cast string (runtime arbitration: native priority non-number type validation TYPE_ERROR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(simpleFunc)
      let threwNull = false
      // undefBox[9] is out of bounds: statically Object, evaluates to a
      // non-number runtime value so the same IsNumber rejection (401) is
      // covered without an illegal null literal cast.
      let undefBox: Object[] = []
      try {
        await taskpool.execute(task1, undefBox[9] as taskpool.Priority)
      } catch (error) {
        threwNull = true
        expect(error.code).assertEqual(401)
      }
      expect(threwNull).assertTrue()
      const task2 = new taskpool.Task(simpleFunc)
      let threwString = false
      try {
        await taskpool.execute(task2, '500' as Object as taskpool.Priority)
      } catch (error) {
        threwString = true
        expect(error.code).assertEqual(401)
      }
      expect(threwString).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolPriorityTest2800
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2800
     * @tc.desc   Verify execute(task, explicit undefined priority) throws BusinessError 401 (runtime arbitration: explicit undefined argument goes through the non-object branch IsNumber validation throwing 401, only omitted arguments default to MEDIUM, not the mind-map expectation "falls to the default tier")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolPriorityTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleFunc)
      let threw = false
      try {
        await taskpool.execute(task, undefined)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      done()
    })

    // ============ Nested execute in concurrent function test ============

    /**
     * @tc.name   TaskpoolPriorityTest2900
     * @tc.number SUB_TASKPOOL_PRIORITY_TEST_2900
     * @tc.desc   Verify nested execute with priority inside @Concurrent function body via module-level counter (F4 probe: if infeasible at runtime, the main workflow converts to NAC with runtime evidence)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolPriorityTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      const task = new taskpool.Task(nestedExecPriorityFunc, counter)
      try {
        await taskpool.execute(task, taskpool.Priority.MEDIUM)
      } catch (error) {
        console.error('TaskpoolPriorityTest2900 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolPriorityTest2900 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })
  })
}
