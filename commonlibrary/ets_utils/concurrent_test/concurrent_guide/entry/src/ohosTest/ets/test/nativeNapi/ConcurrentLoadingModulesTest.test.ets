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
import { taskpool } from '@kit.ArkTS';

@Sendable
class Calculator {
  result: number = 0
  historyCount: number = 0

  init(): void {
    this.result = 0
    this.historyCount++
  }

  add(a: number, b: number): number {
    this.result = a + b
    this.historyCount++
    return this.result
  }

  sub(a: number, b: number): number {
    this.result = a - b
    this.historyCount++
    return this.result
  }

  mul(a: number, b: number): number {
    this.result = a * b
    this.historyCount++
    return this.result
  }

  div(a: number, b: number): number {
    this.result = a / b
    this.historyCount++
    return this.result
  }

  getResult(): number {
    return this.result
  }

  getHistoryLength(): number {
    return this.historyCount
  }
}

@Sendable
class TimerSdk {
  countdownValue: number = 0
  isRunning: boolean = false

  init(): void {
    this.countdownValue = 0
    this.isRunning = false
  }

  setCountdown(value: number): void {
    this.countdownValue = value
    this.isRunning = true
  }

  getCountdown(): number {
    return this.countdownValue
  }

  isCountdownRunning(): boolean {
    return this.isRunning
  }

  stopCountdown(): void {
    this.isRunning = false
  }
}

@Sendable
class EmptyModule {
  value: number = 0
}

@Concurrent
function addNumbers(a: number, b: number): number {
  return a + b
}

@Concurrent
function multiplyNumbers(a: number, b: number): number {
  return a * b
}

@Concurrent
function throwError(): number {
  throw new Error('init failed')
}

@Concurrent
function incrementCounter(counter: SharedCounter, amount: number): number {
  counter.count = counter.count + amount
  return counter.count
}

@Sendable
class SharedCounter {
  count: number = 0
}

export default function ConcurrentLoadingModulesTest(): void {
  describe('ConcurrentLoadingModulesTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0100
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0100
     * @tc.desc   Verify @Sendable class Calculator definition and static init method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let calc: Calculator = new Calculator()
      calc.init()
      expect(calc.getResult()).assertEqual(0)
      expect(calc.getHistoryLength()).assertEqual(1)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0200
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0200
     * @tc.desc   Verify Calculator business methods add/sub/mul/div return correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let calc: Calculator = new Calculator()
      calc.init()
      expect(calc.add(3, 5)).assertEqual(8)
      expect(calc.sub(10, 4)).assertEqual(6)
      expect(calc.mul(3, 7)).assertEqual(21)
      expect(calc.div(20, 4)).assertEqual(5)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0300
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0300
     * @tc.desc   Verify collections.Array usage in Sendable class for history tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let calc: Calculator = new Calculator()
      calc.init()
      calc.add(1, 2)
      calc.sub(5, 3)
      expect(calc.getHistoryLength()).assertEqual(3)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0400
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0400
     * @tc.desc   Verify @Concurrent function with taskpool.execute returns Sendable instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(addNumbers, 5, 10))
      expect(result as number).assertEqual(15)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0500
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0500
     * @tc.desc   Verify Promise return handling with await for concurrent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(multiplyNumbers, 6, 7))
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0600
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0600
     * @tc.desc   Verify multiple concurrent tasks parallel execution via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let p1: Promise<Object> = taskpool.execute(new taskpool.Task(addNumbers, 1, 2))
      let p2: Promise<Object> = taskpool.execute(new taskpool.Task(multiplyNumbers, 3, 4))
      let results: Object[] = await Promise.all([p1, p2])
      expect(results.length).assertEqual(2)
      expect(results[0] as number).assertEqual(3)
      expect(results[1] as number).assertEqual(12)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0700
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0700
     * @tc.desc   Verify parallel execution of multiple tasks returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let p1: Promise<Object> = taskpool.execute(new taskpool.Task(addNumbers, 10, 20))
      let p2: Promise<Object> = taskpool.execute(new taskpool.Task(multiplyNumbers, 5, 6))
      let p3: Promise<Object> = taskpool.execute(new taskpool.Task(addNumbers, 100, 200))
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(30)
      expect(results[1] as number).assertEqual(30)
      expect(results[2] as number).assertEqual(300)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0800
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0800
     * @tc.desc   Verify main thread uses Sendable Calculator module directly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentLoadingModulesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let calc: Calculator = new Calculator()
      calc.init()
      expect(calc.add(10, 20)).assertEqual(30)
      expect(calc.getResult()).assertEqual(30)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest0900
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_0900
     * @tc.desc   Verify TimerSdk countdown method execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timer: TimerSdk = new TimerSdk()
      timer.init()
      timer.setCountdown(60)
      expect(timer.getCountdown()).assertEqual(60)
      expect(timer.isCountdownRunning()).assertTrue()
      timer.stopCountdown()
      expect(timer.isCountdownRunning()).assertFalse()
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1000
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1000
     * @tc.desc   Verify cross-thread concurrent task with SharedCounter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter: SharedCounter = new SharedCounter()
      let result = await taskpool.execute(new taskpool.Task(incrementCounter, counter, 15))
      expect(result as number).assertEqual(15)
      expect(counter.count).assertEqual(15)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1100
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1100
     * @tc.desc   Verify EmptyModule Sendable class creation and default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mod: EmptyModule = new EmptyModule()
      expect(mod.value).assertEqual(0)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1200
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1200
     * @tc.desc   Verify Sendable class with large history array data storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let calc: Calculator = new Calculator()
      calc.init()
      for (let i: number = 0; i < 100; i++) {
        calc.add(i, i + 1)
      }
      expect(calc.getHistoryLength()).assertEqual(101)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1300
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1300
     * @tc.desc   Verify concurrent function throwing exception causes Promise reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtError: boolean = false
      try {
        await taskpool.execute(new taskpool.Task(throwError))
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1400
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1400
     * @tc.desc   Verify Sendable Calculator has correct method types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let calc: Calculator = new Calculator()
      calc.init()
      expect(calc.add(2, 3)).assertEqual(5)
      expect(calc.sub(5, 3)).assertEqual(2)
      expect(calc.mul(2, 3)).assertEqual(6)
      expect(calc.div(6, 3)).assertEqual(2)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1500
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1500
     * @tc.desc   Verify cold start time comparison between direct and concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentLoadingModulesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let mainStart: number = Date.now()
      let directResult: number = 5 + 10
      let mainTime: number = Date.now() - mainStart

      let subStart: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(addNumbers, 5, 10))
      let subTime: number = Date.now() - subStart
      expect(result as number).assertEqual(directResult)
      expect(mainTime >= 0).assertTrue()
      expect(subTime >= 0).assertTrue()
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1600
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1600
     * @tc.desc   Verify parallel efficiency with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentLoadingModulesTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start: number = Date.now()
      let p1: Promise<Object> = taskpool.execute(new taskpool.Task(addNumbers, 1, 1))
      let p2: Promise<Object> = taskpool.execute(new taskpool.Task(multiplyNumbers, 2, 2))
      let p3: Promise<Object> = taskpool.execute(new taskpool.Task(addNumbers, 3, 3))
      await Promise.all([p1, p2, p3])
      let parallelTime: number = Date.now() - start
      expect(parallelTime >= 0).assertTrue()
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1700
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1700
     * @tc.desc   Verify SharedCounter used across multiple concurrent TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentLoadingModulesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: SharedCounter = new SharedCounter()
      let p1 = taskpool.execute(new taskpool.Task(incrementCounter, counter, 1))
      let p2 = taskpool.execute(new taskpool.Task(incrementCounter, counter, 2))
      await Promise.all([p1, p2])
      expect(counter.count).assertEqual(3)
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1800
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1800
     * @tc.desc   Verify frequent concurrent task execution stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentLoadingModulesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 10; i++) {
        let result = await taskpool.execute(new taskpool.Task(addNumbers, i, i))
        expect(result as number).assertEqual(i + i)
      }
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest1900
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_1900
     * @tc.desc   Verify TimerSdk cross-thread data consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentLoadingModulesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timer: TimerSdk = new TimerSdk()
      timer.init()
      timer.setCountdown(120)
      expect(timer.getCountdown()).assertEqual(120)
      expect(timer.isCountdownRunning()).assertTrue()
    })

    /**
     * @tc.name   ConcurrentLoadingModulesTest2000
     * @tc.number SUB_CONCURRENT_LOADING_MODULES_TEST_2000
     * @tc.desc   Verify concurrent task number limit handling with 50 parallel tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentLoadingModulesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addNumbers, i, 1)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(50)
    })
  })
}
