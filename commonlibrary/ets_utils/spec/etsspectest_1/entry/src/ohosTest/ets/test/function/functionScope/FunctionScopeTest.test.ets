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
import { getNestedValue, testShadowing, testCatchErrorCapture } from './functionScopeTsHelper'

function getLocalValue(): number {
  let x: number = 10
  return x
}

function getBlockValue(flag: boolean): number {
  let result: number = 0
  if (flag) {
    let blockVar: number = 10
    result = blockVar
  }
  return result
}

export default function FunctionScopeTest() {
  describe('FunctionScopeTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_SCOPE_0100
     * @tc.name      testLocalVariable0001
     * @tc.desc      Verify local variable is accessible inside function scope (§15.2.6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLocalVariable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getLocalValue()).assertEqual(10)
    })

    /**
     * @tc.number    SUB_FUNCTION_SCOPE_0200
     * @tc.name      testNestedScope0001
     * @tc.desc      Verify nested function accesses outer variable (§15.2.6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNestedScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getNestedValue()).assertEqual(8)
    })

    /**
     * @tc.number    SUB_FUNCTION_SCOPE_0300
     * @tc.name      testVariableShadowing0001
     * @tc.desc      Verify function local variable returns assigned value (§15.2.6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testVariableShadowing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testShadowing()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_SCOPE_0400
     * @tc.name      testBlockScope0001
     * @tc.desc      Verify block-scoped variable accessible inside block (§15.2.6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBlockScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getBlockValue(true)).assertEqual(10)
      expect(getBlockValue(false)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FUNCTION_SCOPE_0500
     * @tc.name      testParameterShadowing0001
     * @tc.desc      Verify parameter shadows outer variable with same name (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParameterShadowing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: number = 99
      let shadowing = (x: number): number => x
      expect(shadowing(5)).assertEqual(5)
      expect(x).assertEqual(99)
    })

    /**
     * @tc.number    SUB_FUNCTION_SCOPE_0600
     * @tc.name      testCatchErrorCapture0001
     * @tc.desc      Verify nested function inside catch captures error object (§13.15.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCatchErrorCapture0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testCatchErrorCapture()).assertEqual('caught')
    })
  })
}
