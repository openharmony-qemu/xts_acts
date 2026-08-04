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

function makeCounter(): () => number {
  let count: number = 0
  return (): number => {
    count = count + 1
    return count
  }
}

function makeClosure(): () => number {
  let x: number = 42
  return (): number => x
}

function makeAdder(base: number): (v: number) => number {
  return (v: number): number => base + v
}

function testClosureMultiEnv(): string {
  let add5 = makeAdder(5)
  let add10 = makeAdder(10)
  if (add5(3) !== 8) { return "add5-fail" }
  if (add10(3) !== 13) { return "add10-fail" }
  return "ok"
}

export default function ClosureTest() {
  describe('ClosureTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_CLOSURE_0100
     * @tc.name      testClosureCapture0001
     * @tc.desc      Verify inner function captures outer variable (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClosureCapture0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let outer: number = 10
      let fn = (): number => outer
      expect(fn()).assertEqual(10)
    })

    /**
     * @tc.number    SUB_FUNCTION_CLOSURE_0200
     * @tc.name      testClosureMutate0001
     * @tc.desc      Verify inner function can mutate captured outer variable (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClosureMutate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let counter = makeCounter()
      expect(counter()).assertEqual(1)
      expect(counter()).assertEqual(2)
      expect(counter()).assertEqual(3)
    })

    /**
     * @tc.number    SUB_FUNCTION_CLOSURE_0300
     * @tc.name      testClosureOutlives0001
     * @tc.desc      Verify closure survives after outer function returns (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClosureOutlives0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fn = makeClosure()
      expect(fn()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_FUNCTION_CLOSURE_0400
     * @tc.name      testClosureMultiEnv0001
     * @tc.desc      Verify each call to outer creates independent closure environment (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClosureMultiEnv0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClosureMultiEnv()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_FUNCTION_CLOSURE_0500
     * @tc.name      testClosureNested0001
     * @tc.desc      Verify nested closures capture variables at each scope level (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClosureNested0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a: number = 1
      let b: (y: number) => number = (y: number): number => {
        let c: (z: number) => number = (z: number): number => a + y + z
        return c(3)
      }
      expect(b(2)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_FUNCTION_CLOSURE_0600
     * @tc.name      testClosureAsCallback0001
     * @tc.desc      Verify closure works as callback capturing context (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClosureAsCallback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let threshold: number = 3
      let result: number[] = arr.filter((x: number): boolean => x > threshold)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(4)
      expect(result[1]).assertEqual(5)
    })
  })
}
