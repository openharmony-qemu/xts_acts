/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import { testNoReturnIsUndefined, testEarlyExitWithSideEffect, testThrowTypeAndMessage, returnASITest, testGeneratorReturn } from './returnTypeTsHelper'

function add(a: number, b: number): number {
  return a + b
}

function finallyOverride(): number {
  try {
    return 1
  } finally {
    return 2
  }
}

async function testAsyncReturn(): Promise<number> {
  return 42
}

export default function ReturnTypeTest() {
  describe('ReturnTypeTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0100
     * @tc.name      testNoReturnUndefined0001
     * @tc.desc      Verify function without return produces undefined (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNoReturnUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testNoReturnIsUndefined()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0200
     * @tc.name      testReturnValue0001
     * @tc.desc      Verify explicit return value (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReturnValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(add(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0300
     * @tc.name      testReturnEarlyExit0001
     * @tc.desc      Verify return stops execution (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReturnEarlyExit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testEarlyExitWithSideEffect()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0400
     * @tc.name      testReturnFinallyOverride0001
     * @tc.desc      Verify finally return overrides try return (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReturnFinallyOverride0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(finallyOverride()).assertEqual(2)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0500
     * @tc.name      testThrowPropagation0001
     * @tc.desc      Verify throw in function body propagates to caller (§14.2, §6.2.4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrowPropagation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testThrowTypeAndMessage()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0600
     * @tc.name      testAsyncReturn0001
     * @tc.desc      Verify async function returns promise resolving to return value (§14.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAsyncReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number = await testAsyncReturn()
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0700
     * @tc.name      testReturnASI0001
     * @tc.desc      Verify return followed by newline triggers ASI returning undefined (§14.2, §12.10.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReturnASI0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(returnASITest()).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FUNCTION_RETURN_0800
     * @tc.name      testGeneratorReturn0001
     * @tc.desc      Verify generator function yield/return behavior (§15.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGeneratorReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let gen = testGeneratorReturn()
      expect(gen.next().value).assertEqual(1)
      expect(gen.next().value).assertEqual(2)
      expect(gen.next().value).assertEqual(3)
      expect(gen.next().done).assertEqual(true)
    })
  })
}
