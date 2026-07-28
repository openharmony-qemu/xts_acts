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
  defaultParamWithNull
} from './FunctionParamReturnHelper.js'

// Module: FunctionParamReturn
// 函数可选参数/默认参数/返回值中的 null/undefined 行为。
// void→expect() 和 null as string 操作放在 FunctionParamReturnHelper.js 中。
// ECMA-262 FunctionDeclarationInstantiation §10.2.11, ClassFieldDefinitionEvaluation §15.7.10

let defaultFnCallCount: number = 0

function defaultFnTracker(): number {
  defaultFnCallCount++
  return 42
}

let evalOrderStr: string = ''

function evalWriteA(): number {
  evalOrderStr += 'A';
  return 0
}

function evalWriteB(): number {
  evalOrderStr += 'B';
  return 0
}

function orderedParams(a: number = evalWriteA(), b: number = evalWriteB()): void {
}

function defaultWithFnCall(a: number = defaultFnTracker()): number {
  return a
}

function restLength(...args: (string | null)[]): number {
  return args.length
}

function restFirst(...args: (string | null)[]): string | null {
  return args[0]
}

function restSecond(...args: (string | null)[]): string | null {
  return args[1]
}

function restThird(...args: (string | null)[]): string | null {
  return args[2]
}

function optionalParam(name: string, greeting?: string): string {
  if (greeting === undefined) {
    return 'Hello ' + name
  }
  return greeting + ' ' + name
}

export default function FunctionParamReturnTest() {
  describe('FunctionParamReturnTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_FUNC_0500
     * @tc.name      testOptionalParamExplicitUndefined0005
     * @tc.desc      Verify optional parameter passed undefined is treated as omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testOptionalParamExplicitUndefined0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(optionalParam('Bob', undefined)).assertEqual('Hello Bob')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_FUNC_0700
     * @tc.name      testDefaultParamNullDoesNotTriggerDefault0007
     * @tc.desc      Verify null argument does not trigger default; becomes "null" [JS-RUNTIME-ONLY: null as string]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDefaultParamNullDoesNotTriggerDefault0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(defaultParamWithNull('hello')).assertEqual('hellonull')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_FUNC_0800
     * @tc.name      testDefaultParamFunctionCall0008
     * @tc.desc      Verify default triggers function call only when argument is undefined (ECMA-262 FunctionDeclarationInstantiation §10.2.11)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDefaultParamFunctionCall0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      defaultFnCallCount = 0
      expect(defaultWithFnCall(10)).assertEqual(10)
      expect(defaultFnCallCount).assertEqual(0)
      expect(defaultWithFnCall(undefined)).assertEqual(42)
      expect(defaultFnCallCount).assertEqual(1)
      expect(defaultWithFnCall()).assertEqual(42)
      expect(defaultFnCallCount).assertEqual(2)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_FUNC_0900
     * @tc.name      testDefaultParamEvalOrder0009
     * @tc.desc      Verify default parameters are evaluated left-to-right (ECMA-262 FunctionDeclarationInstantiation §10.2.11)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDefaultParamEvalOrder0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      evalOrderStr = ''
      orderedParams()
      expect(evalOrderStr).assertEqual('AB')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_FUNC_1100
     * @tc.name      testRestParamsWithNull0011
     * @tc.desc      Verify rest parameter preserves null values at correct positions (ECMA-262 FunctionDeclarationInstantiation §10.2.11)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRestParamsWithNull0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(restLength(null)).assertEqual(1)
      expect(restFirst(null)).assertEqual(null)
      expect(restLength('a', null, 'b')).assertEqual(3)
      expect(restFirst('a', null, 'b')).assertEqual('a')
      expect(restSecond('a', null, 'b')).assertEqual(null)
      expect(restThird('a', null, 'b')).assertEqual('b')
    })
  })
}
