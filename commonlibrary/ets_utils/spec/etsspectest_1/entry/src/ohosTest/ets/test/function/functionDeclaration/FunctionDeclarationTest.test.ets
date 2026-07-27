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
import { testHoistedCall } from './functionDeclarationTsHelper'

function factorial(n: number): number {
  if (n <= 1) return 1
  return n * factorial(n - 1)
}

function apply(value: number, fn: (x: number) => number): number {
  return fn(value)
}

function triple(x: number): number {
  return x * 3
}

function compute(): void {}

export default function FunctionDeclarationTest() {
  describe('FunctionDeclarationTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_DECLARATION_0100
     * @tc.name      testHoistedCall0001
     * @tc.desc      Verify function declaration is hoisted and callable before definition (§15.2.6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHoistedCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testHoistedCall()).assertEqual(3)
    })

    /**
     * @tc.number    SUB_FUNCTION_DECLARATION_0200
     * @tc.name      testRecursiveDeclaration0001
     * @tc.desc      Verify recursive function declaration computes correctly (§15.2.6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRecursiveDeclaration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(factorial(5)).assertEqual(120)
    })

    /**
     * @tc.number    SUB_FUNCTION_DECLARATION_0300
     * @tc.name      testCallbackDeclaration0001
     * @tc.desc      Verify function declaration can be used as callback (§13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackDeclaration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(apply(5, triple)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_FUNCTION_DECLARATION_0400
     * @tc.name      testFunctionName0001
     * @tc.desc      Verify function declaration exposes correct name property (§15.2.4.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(compute.name).assertEqual('compute')
    })
  })
}
