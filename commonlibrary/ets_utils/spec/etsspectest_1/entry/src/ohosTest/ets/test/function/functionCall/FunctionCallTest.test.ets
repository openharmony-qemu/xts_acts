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
  testMethodCallThis,
  testCallChangeThis,
  testApplyPassArgs,
  testBindFixedThis,
  testBindPartialArgs,
  testExtractMethodThis
} from './functionCallTsHelper'

function add(a: number, b: number): number {
  return a + b
}

let trackLog: number[] = []
function track(value: number): number {
  trackLog.push(value)
  return value
}

class Data {
  value: number = 0
}

function tag(strings: TemplateStringsArray, ...values: number[]): string {
  return strings[0] + values[0]
}

export default function FunctionCallTest() {
  describe('FunctionCallTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_CALL_0100
     * @tc.name      testFunctionCallReturn0001
     * @tc.desc      Verify function call returns correct value (§13.3.6.2 step 7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionCallReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(add(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0200
     * @tc.name      testMethodCallThis0001
     * @tc.desc      Verify method call binds this to receiver (§13.3.6.2 step 1a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodCallThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testMethodCallThis()).assertEqual(10)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0300
     * @tc.name      testCallChangeThis0001
     * @tc.desc      Verify call() changes this binding (§20.2.4.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallChangeThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testCallChangeThis()).assertEqual('from-obj')
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0400
     * @tc.name      testApplyPassArgs0001
     * @tc.desc      Verify apply() passes arguments as array (§20.2.4.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testApplyPassArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testApplyPassArgs()).assertEqual(7)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0500
     * @tc.name      testBindFixedThis0001
     * @tc.desc      Verify bind() fixes this and returns bound function (§20.2.4.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBindFixedThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testBindFixedThis()).assertEqual('bound')
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0600
     * @tc.name      testBindPartialArgs0001
     * @tc.desc      Verify bind() with partial applied arguments (§20.2.4.3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBindPartialArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testBindPartialArgs()).assertEqual(8)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0700
     * @tc.name      testEvalOrder0001
     * @tc.desc      Verify arguments are evaluated left-to-right (§13.3.6.2 step 3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEvalOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      trackLog = []
      let fn = (a: number, b: number): number => a + b
      let result = fn(track(1), track(2))
      expect(result).assertEqual(3)
      expect(trackLog.length).assertEqual(2)
      expect(trackLog[0]).assertEqual(1)
      expect(trackLog[1]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0800
     * @tc.name      testNewConstructor0001
     * @tc.desc      Verify new operator constructs instance (§13.3.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNewConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let d: Data = new Data()
      expect(d.value).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_0900
     * @tc.name      testExtractMethodThis0001
     * @tc.desc      Verify extracted method loses this binding (§13.3.6.2 step 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExtractMethodThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fn = testExtractMethodThis()
      let threw: boolean = false
      try {
        fn!()
      } catch (e) {
        threw = true
      }
      expect(threw).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_CALL_1000
     * @tc.name      testTaggedTemplate0001
     * @tc.desc      Verify tagged template call (§13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTaggedTemplate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tag`value: ${42}`).assertEqual('value: 42')
    })
  })
}
