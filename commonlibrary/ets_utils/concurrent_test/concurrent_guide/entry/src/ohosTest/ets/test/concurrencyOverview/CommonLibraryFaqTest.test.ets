/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function CommonLibraryFaqTest(): void {
  describe('CommonLibraryFaqTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   CommonLibraryFaqTest0100
     * @tc.number SUB_COMMON_LIBRARY_FAQ_TEST_0100
     * @tc.desc   Verify setTimeout and setInterval create timers that execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CommonLibraryFaqTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let timeoutExecuted: boolean = false
      let intervalCount: number = 0
      let timeoutResolve: Function = (): void => {}
      let timeoutPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        timeoutResolve = resolve
      })

      let timeoutId: number = setTimeout((): void => {
        timeoutExecuted = true
        timeoutResolve()
      }, 500)

      let intervalId: number = setInterval((): void => {
        intervalCount++
      }, 200)

      // Wait for timeout to execute and at least 3 intervals
      let intervalPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        let checkInterval: number = setInterval((): void => {
          if (intervalCount >= 3) {
            clearInterval(checkInterval)
            resolve()
          }
        }, 50)
      })

      await Promise.all([timeoutPromise, intervalPromise])

      clearTimeout(timeoutId)
      clearInterval(intervalId)

      expect(timeoutExecuted).assertTrue()
      expect(intervalCount >= 3).assertTrue()
    })

    /**
     * @tc.name   CommonLibraryFaqTest0200
     * @tc.number SUB_COMMON_LIBRARY_FAQ_TEST_0200
     * @tc.desc   Verify clearTimeout and clearInterval prevent timer execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CommonLibraryFaqTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let executed: boolean = false

      let timeoutId: number = setTimeout((): void => {
        executed = true
      }, 500)

      clearTimeout(timeoutId)

      // Wait beyond the timer delay to confirm it does not execute
      await new Promise<void>((resolve: Function) => setTimeout(resolve, 600))

      expect(executed).assertFalse()
    })

    /**
     * @tc.name   CommonLibraryFaqTest0300
     * @tc.number SUB_COMMON_LIBRARY_FAQ_TEST_0300
     * @tc.desc   Verify timer ID initial value does not cause accidental clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CommonLibraryFaqTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timeoutId: number = 0
      let executed: boolean = false

      timeoutId = setTimeout((): void => {
        executed = true
      }, 500)

      if (timeoutId !== 0) {
        clearTimeout(timeoutId)
      }

      // Wait beyond the timer delay to confirm it does not execute
      await new Promise<void>((resolve: Function) => setTimeout(resolve, 600))

      if (timeoutId !== 0) {
        expect(executed).assertFalse()
      }
    })
  })
}
