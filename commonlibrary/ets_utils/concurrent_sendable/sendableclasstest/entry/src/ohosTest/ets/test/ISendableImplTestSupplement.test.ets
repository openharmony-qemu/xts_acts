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
import { taskpool, worker, lang, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { jsSendableFunc } from './SendableJsFuncSource';

/**
 * @Sendable class with extension methods (calculate, isValid, formatValue).
 * Covers mind map §3.5 — custom class adding extra methods beyond ISendable.
 */
@Sendable
class ExtendedSendable {
  public value_: number = 0

  calculate(factor: number): number {
    return this.value_ * factor
  }

  isValid(): boolean {
    return this.value_ > 0
  }

  formatValue(): string {
    return 'Extended(' + this.value_ + ')'
  }
}

function readCalculated(data: ExtendedSendable, factor: number): number {
  'use concurrent'
  return data.calculate(factor)
}

function readIsValid(data: ExtendedSendable): boolean {
  'use concurrent'
  return data.isValid()
}

function readFormatValue(data: ExtendedSendable): string {
  'use concurrent'
  return data.formatValue()
}

function modifyAndCalculate(data: ExtendedSendable, newVal: number, factor: number): number {
  'use concurrent'
  data.value_ = newVal
  return data.calculate(factor)
}

export default function iSendableImplTestSupplement(): void {
  describe('ISendableImplTestSupplement', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   ISendableImplTestSupplement0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0100
     * @tc.desc   Verify custom @Sendable class calculate method multiplies value by factor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ExtendedSendable()
      instance.value_ = 10

      expect(instance.calculate(2)).assertEqual(20)
      expect(instance.calculate(5)).assertEqual(50)
      expect(instance.calculate(0)).assertEqual(0)
    })

    /**
     * @tc.name   ISendableImplTestSupplement0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0200
     * @tc.desc   Verify custom @Sendable class isValid method returns correct boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ExtendedSendable()

      expect(instance.isValid()).assertFalse()

      instance.value_ = 1
      expect(instance.isValid()).assertTrue()

      instance.value_ = -5
      expect(instance.isValid()).assertFalse()
    })

    /**
     * @tc.name   ISendableImplTestSupplement0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0300
     * @tc.desc   Verify custom @Sendable class formatValue method returns correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ExtendedSendable()

      expect(instance.formatValue()).assertEqual('Extended(0)')

      instance.value_ = 42
      expect(instance.formatValue()).assertEqual('Extended(42)')
    })

    /**
     * @tc.name   ISendableImplTestSupplement0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0400
     * @tc.desc   Verify custom @Sendable class extension methods work in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ExtendedSendable()
      instance.value_ = 10

      let task1 = new taskpool.Task(readCalculated, instance, 3.0)
      let result1 = await taskpool.execute(task1)

      expect(result1 as number).assertEqual(30)

      let task2 = new taskpool.Task(readIsValid, instance)
      let result2 = await taskpool.execute(task2)

      expect(result2 as boolean).assertTrue()
    })

    /**
     * @tc.name   ISendableImplTestSupplement0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0500
     * @tc.desc   Verify custom @Sendable class formatValue method works in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ExtendedSendable()
      instance.value_ = 99

      let task = new taskpool.Task(readFormatValue, instance)
      let result = await taskpool.execute(task)

      expect(result as string).assertEqual('Extended(99)')
    })

    /**
     * @tc.name   ISendableImplTestSupplement0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0600
     * @tc.desc   Verify custom @Sendable class modify and calculate in single TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTestSupplement0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance = new ExtendedSendable()

      let task = new taskpool.Task(modifyAndCalculate, instance, 7.0, 6.0)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(42)
      expect(instance.value_).assertEqual(7)
      expect(instance.calculate(6)).assertEqual(42)
    })

    /**
     * @tc.name   ISendableImplTestSupplement0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_SUPPLEMENT_0700
     * @tc.desc   Verify .ts sendable function called inside Worker processes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let inputValue: number = 50
      let receivedValue: number = -1
      let myWorker = new worker.ThreadWorker('../workers/SendableTsFuncWorker.ets')
      let timeoutId: number = -1
      try {
        await Promise.race([
          new Promise<void>((resolve, reject): void => {
            myWorker.onmessage = (e: MessageEvents): void => {
              receivedValue = e.data as number
              resolve()
            }
            myWorker.onerror = (e: ErrorEvent): void => {
              reject(e)
            }
            myWorker.postMessage(inputValue)
          }),
          new Promise<void>((resolve, reject): void => {
            timeoutId = setTimeout((): void => {
              reject(new Error('ISendableImplTestSupplement0700: worker reply timeout'))
            }, 5000)
          })
        ])
      } finally {
        if (timeoutId !== -1) {
          clearTimeout(timeoutId)
        }
        myWorker.terminate()
      }

      // sendableFuncInTsSource() returns 100, plus inputValue 50 = 150
      expect(receivedValue).assertEqual(150)
    })

    /**
     * @tc.name   ISendableImplTestSupplement0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify 'use concurrent' in .js file executed via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(jsSendableFunc, 21.0)
      let result = await taskpool.execute(task) as number

      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ISendableImplTestSupplement0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify .ets imports .js sendable function and executes concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTestSupplement0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(jsSendableFunc, 10.0)
      let task2 = new taskpool.Task(jsSendableFunc, 20.0)
      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2)
      ])

      expect(String(results[0])).assertEqual(String(20))
      expect(String(results[1])).assertEqual(String(40))
    })
  })
}
