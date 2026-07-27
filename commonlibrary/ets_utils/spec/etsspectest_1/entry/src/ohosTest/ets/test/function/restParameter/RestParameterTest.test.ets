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
import { restLength, sumArrayViaApply, restDestruct } from './restParameterTsHelper'

function sumAll(...args: number[]): number {
  let total: number = 0
  for (let i: number = 0; i < args.length; i++) {
    total = total + args[i]
  }
  return total
}

function emptyRest(...args: number[]): number {
  return args.length
}

function mixed(a: number, b: number, ...rest: number[]): number {
  return a + b + rest.length
}

function first(...args: number[]): number {
  return args[0]
}

function last(...args: number[]): number {
  return args[args.length - 1]
}

export default function RestParameterTest() {
  describe('RestParameterTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_REST_0100
     * @tc.name      testRestCollect0001
     * @tc.desc      Verify rest parameter collects remaining arguments (§14.2.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(sumAll(1, 2, 3, 4, 5)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_FUNCTION_REST_0200
     * @tc.name      testRestEmpty0001
     * @tc.desc      Verify rest parameter is empty array when no extra arguments (§14.2.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(emptyRest()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FUNCTION_REST_0300
     * @tc.name      testRestMixed0001
     * @tc.desc      Verify rest collects only extra arguments beyond named params (§14.2.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(mixed(1, 2, 3, 4, 5)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_FUNCTION_REST_0400
     * @tc.name      testRestLength0001
     * @tc.desc      Verify rest parameter excluded from function.length (§15.2.4.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(restLength()).assertEqual(2)
    })

    /**
     * @tc.number    SUB_FUNCTION_REST_0500
     * @tc.name      testRestApply0001
     * @tc.desc      Verify rest parameters forwarded via apply (§15.3.4.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestApply0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: number[] = [1, 2, 3, 4, 5]
      expect(sumArrayViaApply(numbers)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_FUNCTION_REST_0600
     * @tc.name      testRestArrayUsage0001
     * @tc.desc      Verify rest parameter behaves as array with length and indexing (§14.2.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestArrayUsage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(first(10, 20, 30)).assertEqual(10)
      expect(last(10, 20, 30)).assertEqual(30)
    })

    /**
     * @tc.number    SUB_FUNCTION_REST_0700
     * @tc.name      testRestDestruct0001
     * @tc.desc      Verify rest parameter with destructuring pattern (§14.2.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRestDestruct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(restDestruct(10, 20, 30, 40)).assertEqual(30)
    })
  })
}
