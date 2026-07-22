/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, collections } from '@kit.ArkTS';

@Sendable
class TestPerson {
  name: string = 'test'
  age: number = 0
}

export default function ASONTest(): void {
  describe('ASONTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   ASONTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0100
     * @tc.desc   Verify ASON.parse converts JSON string to Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let jsonStr: string = '{"name":"test","age":42}'
      // Concrete Sendable type (ArkTS forbids unknown; avoid Record<string, Object> + as field casts)
      let result: TestPerson = ArkTSUtils.ASON.parse(jsonStr) as TestPerson
      expect(result.name).assertEqual('test')
      expect(result.age).assertEqual(42)
      let jsonOut: string = ArkTSUtils.ASON.stringify(result)
      expect(jsonOut).assertEqual('{"name":"test","age":42}')
    })

    /**
     * @tc.name   ASONTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0200
     * @tc.desc   Verify ASON.stringify serializes Sendable object to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let person: TestPerson = new TestPerson()
      person.name = 'John'
      person.age = 30
      let jsonStr: string = ArkTSUtils.ASON.stringify(person)
      expect(jsonStr).assertEqual('{"name":"John","age":30}')
    })

    /**
     * @tc.name   ASONTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0300
     * @tc.desc   Verify ASON.stringify converts collections.Map to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let map: collections.Map<string, number> = new collections.Map<string, number>()
      map.set('one', 1)
      map.set('two', 2)
      let jsonStr: string = ArkTSUtils.ASON.stringify(map)
      expect(jsonStr).assertEqual('{"one":1,"two":2}')
    })

    /**
     * @tc.name   ASONTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0400
     * @tc.desc   Verify ASON.stringify converts collections.Set to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let set: collections.Set<number> = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let jsonStr: string = ArkTSUtils.ASON.stringify(set)
      expect(jsonStr).assertEqual('[1,2,3]')
    })

    /**
     * @tc.name   ASONTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0500
     * @tc.desc   Verify ASON.stringify converts native Map to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let map: Map<string, string> = new Map<string, string>()
      map.set('key1', 'value1')
      map.set('key2', 'value2')
      let jsonStr: string = ArkTSUtils.ASON.stringify(map)
      expect(jsonStr).assertEqual('{"key1":"value1","key2":"value2"}')
    })

    /**
     * @tc.name   ASONTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0600
     * @tc.desc   Verify ASON.stringify converts native Set to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let set: Set<number> = new Set<number>()
      set.add(10)
      set.add(20)
      let jsonStr: string = ArkTSUtils.ASON.stringify(set)
      expect(jsonStr).assertEqual('[10,20]')
    })

    /**
     * @tc.name   ASONTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0700
     * @tc.desc   Verify ASON.parse with ParseOptions bigIntMode configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let jsonStr: string = '{"value":112233445566778899}'
      let options: ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP
      }
      let result: collections.Map<string, bigint> =
        ArkTSUtils.ASON.parse(jsonStr, undefined, options) as collections.Map<string, bigint>
      expect(result.size).assertEqual(1)
      let bigVal: bigint | undefined = result.get('value')
      expect(bigVal !== undefined).assertTrue()
      if (bigVal !== undefined) {
        expect(bigVal).assertEqual(112233445566778899n)
      }
    })

    /**
     * @tc.name   ASONTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0800
     * @tc.desc   Verify ASON.parse throws error for invalid JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let invalidJson: string = '{invalid json}'
      let caughtError: boolean = false
      try {
        ArkTSUtils.ASON.parse(invalidJson)
        expect().assertFail()
      } catch (e) {
        caughtError = true
        // Device/runtime: invalid JSON throws SyntaxError (not BusinessError)
        expect(e instanceof SyntaxError).assertTrue()
        if (e instanceof SyntaxError) {
          // Core behavior: invalid JSON; substring avoids brittle full-message equality across engines
          expect(e.message).assertContain('JSON')
        }
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   ASONTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0900
     * @tc.desc   Verify ASON.stringify with collections.Array produces valid JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3)
      let jsonStr: string = ArkTSUtils.ASON.stringify(arr)
      expect(jsonStr).assertEqual('[1,2,3]')
    })
  })
}
