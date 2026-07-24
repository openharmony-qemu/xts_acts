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
  makeMultiplier,
  testReassign,
  compose,
  add1,
  dbl
} from './functionTypeTsHelper'

function add(a: number, b: number): number {
  return a + b
}

function applyCallback(fn: (x: number) => number, value: number): number {
  return fn(value)
}

function double(x: number): number {
  return x * 2
}

function triple(x: number): number {
  return x * 3
}

function compute(): void {}

function twoParams(a: number, b: number): void {}

export default function FunctionTypeTest() {
  describe('FunctionTypeTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0100
     * @tc.name      testFunctionAsValue0001
     * @tc.desc      Verify function can be stored as variable value (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionAsValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fn: (a: number, b: number) => number = add
      expect(fn(1, 2)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0200
     * @tc.name      testFunctionAsParameter0001
     * @tc.desc      Verify function can be passed as argument (§13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionAsParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(applyCallback(double, 7)).assertEqual(14)
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0300
     * @tc.name      testFunctionAsReturnValue0001
     * @tc.desc      Verify function can be returned from another function (§9.2.13)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionAsReturnValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mult5 = makeMultiplier(5)
      expect(mult5(3)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0400
     * @tc.name      testFunctionReassign0001
     * @tc.desc      Verify function variable can be reassigned to different function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionReassign0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testReassign()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0500
     * @tc.name      testCallbackBasic0001
     * @tc.desc      Verify callback function works with array map (§13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3]
      let mapped: number[] = arr.map(triple)
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(3)
      expect(mapped[1]).assertEqual(6)
      expect(mapped[2]).assertEqual(9)
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0600
     * @tc.name      testNestedCallback0001
     * @tc.desc      Verify nested callback composition (§13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNestedCallback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(compose(dbl, add1, 5)).assertEqual(12)
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0700
     * @tc.name      testFunctionName0001
     * @tc.desc      Verify function declaration exposes correct name property (§15.2.4.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(compute.name).assertEqual('compute')
    })

    /**
     * @tc.number    SUB_FUNCTION_TYPE_0800
     * @tc.name      testFunctionLength0001
     * @tc.desc      Verify function length reflects number of formal parameters (§15.2.4.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(twoParams.length).assertEqual(2)
    })
  })
}
