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
  testExpressionAssign,
  testExpressionCallback,
  anonymousFunc,
  testNamedRecursive,
  calculator,
  testIIFEResult,
  testEvalThrow,
  objWithThis
} from './functionExpressionTsHelper'

export default function FunctionExpressionTest() {
  describe('FunctionExpressionTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0100
     * @tc.name      testExpressionAssignedCall0001
     * @tc.desc      Verify function expression assigned to variable and called (§15.2.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpressionAssignedCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testExpressionAssign()).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0300
     * @tc.name      testAnonymousName0001
     * @tc.desc      Verify anonymous function expression name inference (§15.2.4.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAnonymousName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(anonymousFunc.name).assertEqual('anonymousFunc')
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0500
     * @tc.name      testNamedRecursive0001
     * @tc.desc      Verify named function expression supports recursion via internal name (§15.2.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNamedRecursive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testNamedRecursive()).assertEqual(120)
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0600
     * @tc.name      testExpressionObjectProperty0001
     * @tc.desc      Verify function expression as object property value (§15.2.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpressionObjectProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(calculator.multiply(3, 4)).assertEqual(12)
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0700
     * @tc.name      testExpressionCallback0001
     * @tc.desc      Verify function expression used as callback argument (§13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpressionCallback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testExpressionCallback()).assertEqual(36)
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0800
     * @tc.name      testIIFE0001
     * @tc.desc      Verify IIFE evaluates and returns value (§15.2.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIIFE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testIIFEResult()).assertEqual(30)
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_0900
     * @tc.name      testExpressionEvalThrow0001
     * @tc.desc      Verify default parameter expression throw propagates to caller (§9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpressionEvalThrow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testEvalThrow()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_EXPRESSION_1000
     * @tc.name      testExpressionThisBinding0001
     * @tc.desc      Verify function expression this binding in object method (§15.2.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpressionThisBinding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(objWithThis.getValue()).assertEqual(42)
    })
  })
}
