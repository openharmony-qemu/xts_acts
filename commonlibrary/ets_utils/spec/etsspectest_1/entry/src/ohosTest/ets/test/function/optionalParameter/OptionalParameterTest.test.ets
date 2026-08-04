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
import {
  getOptional,
  nullNoTrigger,
  testDefaultEvalOrder
} from './optionalParameterTsHelper'

function greet(name: string, greeting: string = 'Hello'): string {
  return greeting + ', ' + name
}

function defaultWithUndefined(x: number = 42): number {
  return x
}

function referencePrevious(a: number, b: number = a + 1): number {
  return a + b
}

export default function OptionalParameterTest() {
  describe('OptionalParameterTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_OPTIONAL_0100
     * @tc.name      testOptionalUndefined0001
     * @tc.desc      Verify omitted optional parameter is undefined (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOptionalUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getOptional(1)).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FUNCTION_OPTIONAL_0200
     * @tc.name      testDefaultBasic0001
     * @tc.desc      Verify default parameter value used when argument omitted (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(greet('World')).assertEqual('Hello, World')
    })

    /**
     * @tc.number    SUB_FUNCTION_OPTIONAL_0300
     * @tc.name      testDefaultExplicitUndefined0001
     * @tc.desc      Verify explicit undefined triggers default parameter value (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultExplicitUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(defaultWithUndefined(undefined)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_FUNCTION_OPTIONAL_0400
     * @tc.name      testDefaultReferencePrevious0001
     * @tc.desc      Verify default parameter can reference previous parameter (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultReferencePrevious0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(referencePrevious(3)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_FUNCTION_OPTIONAL_0500
     * @tc.name      testDefaultEvalOrder0001
     * @tc.desc      Verify default parameters evaluated left-to-right (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultEvalOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testDefaultEvalOrder()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_OPTIONAL_0600
     * @tc.name      testNullNoTrigger0001
     * @tc.desc      Verify null does not trigger default parameter value (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullNoTrigger0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(nullNoTrigger(null)).assertEqual(null)
    })
  })
}
