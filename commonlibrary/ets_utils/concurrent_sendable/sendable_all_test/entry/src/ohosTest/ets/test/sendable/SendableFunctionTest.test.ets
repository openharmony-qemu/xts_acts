/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import {
  SinglePropSendableClass,
  sendableNoParamFunc,
  sendableSingleParamFunc,
  sendableMultiParamFunc,
  sendableReturnClassFunc
} from '../../workers/Sendable'
import Utils from '../utils'

@Concurrent
function callSendableFuncInTaskPool(): number {
  return sendableNoParamFunc()
}

export default function SendableFunctionTest(): void {
  describe('SendableFunctionTest', (): void => {
    /**
     * @tc.name   testSendableFunction0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FUNCTION_TEST_0100
     * @tc.desc   Verify @Sendable function with no parameters returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableFunction0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = sendableNoParamFunc()
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   testSendableFunction0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FUNCTION_TEST_0200
     * @tc.desc   Verify @Sendable function with single parameter returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableFunction0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = sendableSingleParamFunc(5)
      expect(result).assertEqual(10)
    })

    /**
     * @tc.name   testSendableFunction0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FUNCTION_TEST_0300
     * @tc.desc   Verify @Sendable function with multiple parameters returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableFunction0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = sendableMultiParamFunc(10, 'test')
      expect(result).assertEqual('test_10')
    })

    /**
     * @tc.name   testSendableFunction0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FUNCTION_TEST_0400
     * @tc.desc   Verify @Sendable function returning Sendable class instance works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableFunction0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = sendableReturnClassFunc()
      expect(result.count_).assertEqual(100)
    })

    /**
     * @tc.name   testSendableFunction0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FUNCTION_TEST_0500
     * @tc.desc   Verify @Sendable function can be called inside TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableFunction0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const task = new taskpool.Task(callSendableFuncInTaskPool)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(42)
    })
  })
}
