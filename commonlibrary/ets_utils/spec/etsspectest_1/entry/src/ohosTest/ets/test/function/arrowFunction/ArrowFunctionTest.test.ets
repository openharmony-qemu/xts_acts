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
import { captureArgs } from './arrowFunctionTsHelper'

class ThisCapture {
  public value: number = 42

  public getViaArrow(): number {
    let fn = () => {
      return this.value
    }
    return fn()
  }

  public getViaCallback(): number {
    let arr: number[] = [1, 2, 3]
    let result: number = 0
    arr.forEach((item: number) => {
      result = result + item
    })
    return result
  }
}

export default function ArrowFunctionTest() {
  describe('ArrowFunctionTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0100
     * @tc.name      testArrowExpressionBody0001
     * @tc.desc      Verify arrow expression body returns expression value (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowExpressionBody0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let double = (x: number): number => x * 2
      expect(double(5)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0200
     * @tc.name      testArrowBlockBody0001
     * @tc.desc      Verify arrow block body with explicit return (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowBlockBody0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let add = (a: number, b: number): number => {
        return a + b
      }
      expect(add(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0300
     * @tc.name      testArrowLexicalThis0001
     * @tc.desc      Verify arrow captures this from enclosing context (§14.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowLexicalThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ThisCapture = new ThisCapture()
      expect(obj.getViaArrow()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0400
     * @tc.name      testArrowNoOwnArguments0001
     * @tc.desc      Verify arrow has no own arguments, inherits from outer (§14.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowNoOwnArguments0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(captureArgs(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0500
     * @tc.name      testArrowCallback0001
     * @tc.desc      Verify arrow as callback preserves captured bindings (§14.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowCallback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3]
      let factor: number = 2
      let mapped: number[] = arr.map((x: number): number => x * factor)
      expect(mapped[0]).assertEqual(2)
      expect(mapped[1]).assertEqual(4)
      expect(mapped[2]).assertEqual(6)
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0600
     * @tc.name      testArrowNestedClosure0001
     * @tc.desc      Verify nested arrows capture variables from outer scopes (§14.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowNestedClosure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let outer = (x: number): number => {
        let inner = (y: number): number => x + y
        return inner(3)
      }
      expect(outer(10)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0700
     * @tc.name      testArrowDefaultParam0001
     * @tc.desc      Verify arrow with default parameter value (§14.2.1, §9.2.12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowDefaultParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let greet = (name: string, greeting: string = 'Hello'): string => greeting + ', ' + name
      expect(greet('World')).assertEqual('Hello, World')
      expect(greet('World', 'Hi')).assertEqual('Hi, World')
    })

    /**
     * @tc.number    SUB_FUNCTION_ARROW_0800
     * @tc.name      testArrowRestParam0001
     * @tc.desc      Verify arrow with rest parameter collects arguments (§14.2.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrowRestParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let join = (separator: string, ...parts: string[]): string => {
        let result: string = ''
        for (let i: number = 0; i < parts.length; i++) {
          if (i > 0) { result = result + separator }
          result = result + parts[i]
        }
        return result
      }
      expect(join(', ', 'a', 'b', 'c')).assertEqual('a, b, c')
      expect(join(', ', 'only')).assertEqual('only')
    })
  })
}
